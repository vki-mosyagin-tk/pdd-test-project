unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient,UTrainer;

type
  TDataModule1 = class(TDataModule)
  ADOQuery1: TADOQuery;
  ADOConnection1: TADOConnection;
  procedure BilQuery();
  procedure ExamQuery();
  function LoadAnswer():string;
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

procedure TDataModule1.ExamQuery(); //Запуск экзамена
begin
    with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT COUNT(*) FROM bilets';
    Open;
    if(Fields[0].AsString <> '')then
    begin
      kol_bilets:=Fields[0].AsInteger;
      rejim:=Ord(Exam);
      flag_ex:=True;
      FTrainer:= TFTrainer.Create(Application);
      FTrainer.Show();
      FMainMenu.Hide;
    end;
  end;
end;

function TDataModule1.LoadAnswer():string; //Функция,получения ответа на билет из БД
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
end.
