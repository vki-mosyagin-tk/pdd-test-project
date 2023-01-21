unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient,UTrainer,jpeg,System.Hash;

type
  TDataModule1 = class(TDataModule)
  ADOQuery1: TADOQuery;
  ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
  procedure BilQuery();
  function LoadQuestion():string;
  function ExamQuery():integer;
  function LoadAnswers():string;
  function LoadRightAnswer():string;
  function LoadHelp():string;
  function ShowResults(user_id:integer):TDataSet;
  function IsUserExist(email:string;pass:string):integer;
  function InsertNewUser(firstName:string;lastName:string;email:string;pass:string;bdayDate:TDateTime):boolean;
  function InsertUserResults(user_id:integer;spentTime:string;ticketNum:integer;InvalidAns:string;TrueAns:string;rejim:string):boolean;
  procedure LoadPicure();


    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Trainer:TFTrainer;
  end;

var
  DataModule1: TDataModule1;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UMainMenu;

procedure TDataModule1.BilQuery();  //Процедура,выводящая билеты в ComboBox
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets';
    Open;
    First;
    WHile not(eof) do
    begin
      FMainMenu.ComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
end;

function TDataModule1.LoadQuestion():string; //Функция, передающая текст вопроса
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='Select bil_text FROM bils where number_question='+IntToStr(index_vopr)+' and number_bil='+InttoStr(number_bil);
    Open;
    First;
    Result:=Fields[0].AsString;
  end;
end;


function TDataModule1.LoadAnswers():string; //Функция, передающая текст ответов
begin
   with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='Select ans_text FROM bils where number_question='+IntToStr(index_vopr)+' and number_bil='+InttoStr(number_bil);
    Open;
    First;
    Result:=Fields[0].AsString;
  end;
end;

function TDataModule1.LoadHelp():string; //Функция, передающая текст помощи
begin
   with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='Select help_text FROM bils where number_question='+IntToStr(index_vopr)+' and number_bil='+InttoStr(number_bil);
    Open;
    First;
    Result:=Fields[0].AsString;
  end;
end;

procedure TDataModule1.LoadPicure();
var
 jpg : TJPEGImage;
 Blob:TMemoryStream;
 bmp:TBitmap;
begin
with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='Select bil_pic FROM bils where number_question='+IntToStr(index_vopr)+' and number_bil='+InttoStr(number_bil)+' and bil_pic <> "" ';
    Open;
    First;
    bmp:=TBitmap.Create;
    jpg:=TJPEGImage.Create;
    try
    Blob:=TADOBlobStream.Create(TBlobField(ADOQuery1.FieldByName('bil_pic')),bmRead);
    jpg.LoadFromStream(Blob);
    FTrainer.Image1.Picture.Assign(jpg);
    Blob.Free();
    bmp.Free();
    jpg.Free();
    except
    on e:Exception do
    begin
    jpg.Free;
    Blob.Free;
    bmp.Free;
    end;
    end;
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);  //Подключение к БД
begin
  var PASSWORD_TO_DB := EmptyStr;
  try
    ADOConnection1.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;'+
        'User ID=Admin;'+
        'Data Source='+Config.PathDataBase+';'+
        'Mode=Share Deny None;'+
        'Extended Properties="";'+
        'Jet OLEDB:System database="";'+
        'Jet OLEDB:Registry Path="";'+
        'Jet OLEDB:Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Engine Type=5;'+
        'Jet OLEDB:Database Locking Mode=1;'+
        'Jet OLEDB:Global Partial Bulk Ops=2;'+
        'Jet OLEDB:Global Bulk Transactions=1;'+
        'Jet OLEDB:New Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Create System Database=False;'+
        'Jet OLEDB:Encrypt Database=False;'+
        'Jet OLEDB:Don'+'''t Copy Locale on Compact=False;'+
        'Jet OLEDB:Compact Without Replica Repair=False;'+
        'Jet OLEDB:SFP=False';

    ADOConnection1.Connected := true;
  except on E : Exception do
    begin
      ShowMessage(Format('Ошибка при подключении к БД. %s', [E.Message]));
      Application.Terminate;
    end;
  end;
end;

function TDataModule1.ExamQuery():integer; //Запуск экзамена
begin
    with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT COUNT(*) FROM bilets';
    Open;
    if(Fields[0].AsString <> '')then
    begin
      Result:=Fields[0].AsInteger;
    end;
  end;
end;

function TDataModule1.LoadRightAnswer():string; //Функция,получения ответа на билет из БД
begin
with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets WHERE id=:i';
    Parameters.ParamByName('i').Value:=number_bil;
    Open;
    Result:=Fields[index_vopr].AsString;
  end;
end;

function TDataModule1.InsertNewUser(firstName:string;lastName:string;email:string;pass:string;bdayDate:TDateTime):boolean; //Внесение данных пользователя в БД (Регистрация)
begin
  if ((firstName<>'') and (lastName<>'') and (email<>'') and (pass<>''))  then // Проверка на введение всех данных
  begin
    with DataModule1.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT * FROM users WHERE email=:p1';
      Parameters.ParamByName('p1').Value := email;
      Open;
      if eof then   // Если такой email не зарегистрирован, данные вносятся в БД
        begin
          Close;
          SQL.Clear;
          try
          SQL.Add('INSERT INTO users (first_name,second_name,email,passw,bday_date)');
          SQL.Add('VALUES (:p1,:p2,:p3,:p4,:p5);');
          Parameters.ParamByName('p1').Value := firstName;
          Parameters.ParamByName('p2').Value :=lastName;
          Parameters.ParamByName('p3').Value := email;
          Parameters.ParamByName('p4').Value :=System.Hash.THashMD5.GetHashString(pass);
          Parameters.ParamByName('p5').Value := FormatDateTime('dd-mm-yyyy',bdayDate);
          ExecSQL;
          Close;
          Result:=TRUE;
          except
          ShowMessage('Что-то пошло не так');
          Result:=FALSE;
          end;
        end
        else
        ShowMessage('Пользователь с таким e-mail уже существует');
    end;
  end
  else
  ShowMessage('Введены не все данные');
end;

function TDataModule1.InsertUserResults(user_id: Integer; spentTime: string; ticketNum: Integer; InvalidAns: string; TrueAns: string; rejim: string): Boolean; //Внесение результатов в БД
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Add('INSERT INTO results (id_users,SpentTimeInSeconds,ticketNum,TotalInvalidAnswers,TotalTrueAnswers,rejim,Timespan)');
    SQL.Add('VALUES (:p1,:p2,:p3,:p4,:p5,:p6,Date())');
    Parameters.ParamByName('p1').Value := user_id;
    Parameters.ParamByName('p2').Value :=spentTime;
    Parameters.ParamByName('p3').Value := ticketNum;
    Parameters.ParamByName('p4').Value :=InvalidAns;
    Parameters.ParamByName('p5').Value := TrueAns;
    Parameters.ParamByName('p6').Value := rejim;
    ExecSQL;
    Close;
    Result:=True;
    except
    begin
      ShowMessage('Что-то пошло не так');
      Result:=False;
    end;
    end;
  end;
end;

function TDataModule1.ShowResults(user_id:integer):TDataSet;
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Text:='SELECT SpentTimeInSeconds,ticketNum,TotalInvalidAnswers,TotalTrueAnswers,rejim,Timespan FROM results WHERE id_users=:i';
    Parameters.ParamByName('i').Value:=user_id;
    Open;
    Result:=ADOQuery1;
    except
     ShowMessage('Что-то пошло не так');
    end;
  end;
end;

function TDataModule1.IsUserExist(email:string;pass:string):Integer; // Проверка, существует ли такой пользователь
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT id FROM users WHERE email=:p1 and passw=:p2';
    Parameters.ParamByName('p1').Value := email;
    Parameters.ParamByName('p2').Value :=System.Hash.THashMD5.GetHashString(pass);
    Open;
    if eof then
    begin
     ShowMessage('Неверный логин или пароль');
     Result:=-1;
    end
    else
    Result:=Fields[0].AsInteger;
  end;
end;
end.
