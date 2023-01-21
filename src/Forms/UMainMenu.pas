unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UConfigClient, Vcl.ComCtrls;

type
  TFMainMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Button6: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button7: TButton;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button8: TButton;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    DateTimePicker1: TDateTimePicker;
    Button9: TButton;
    Label9: TLabel;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainMenu: TFMainMenu;
  number_bil:integer;
  rejim,kol_bilets,user_id:Integer;
  flag_ex:boolean;


implementation

uses UTrainer,DataModule, UDBResults;

{$R *.dfm}

procedure TFMainMenu.Button10Click(Sender: TObject);
begin
FMainMenu.Hide;
Application.CreateForm(TFDBResults,FDBResults);
FDBResults.ShowModal;
end;

procedure TFMainMenu.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Хотите выйти из программы ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    FMainMenu.Close;
end;

procedure TFMainMenu.Button2Click(Sender: TObject);
begin
  ComboBox1.Clear;
  DataModule1.BilQuery();
  GroupBox1.Visible:=True;
end;

procedure TFMainMenu.Button3Click(Sender: TObject);
begin
 kol_bilets:=DataModule1.ExamQuery();
 rejim:=Ord(Exam);
 flag_ex:=True;
 FTrainer:= TFTrainer.Create(Application);
 FTrainer.Show();
 FMainMenu.Hide;
end;

procedure TFMainMenu.Button4Click(Sender: TObject);
begin
  button1.Visible:= False;
  button2.Visible:= False;
  button3.Visible:= False;
  button4.Visible:= False;
  button10.Visible:= False;
  Panel1.Visible := True;
end;

procedure TFMainMenu.Button5Click(Sender: TObject);
begin
  Panel1.Visible:=False;
  button1.Visible:= True;
  button2.Visible:= True;
  button3.Visible:= True;
  button4.Visible:= True;
  button10.Visible:= True;
end;

procedure TFMainMenu.Button6Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;

procedure TFMainMenu.Button7Click(Sender: TObject);
begin
  if(ComboBox1.ItemIndex <> -1)then
  begin
    number_bil:=StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
    FMainMenu.Hide;
    FTrainer:=TFTrainer.Create(Self);
    rejim:=Ord(Education);
    flag_ex:=False;
    FTrainer.Show();
  end else
    ShowMessage('Вы не выбрали билет!');
end;

procedure TFMainMenu.Button8Click(Sender: TObject);  //Кнопка авторизации
begin
user_id:=DataModule1.IsUserExist(Edit1.Text,Edit2.Text);
if(user_id<>-1) then
GroupBox2.Visible:=False;
end;


procedure TFMainMenu.Button9Click(Sender: TObject); //Кнопка "зарегистрироваться"
begin
if(DataModule1.InsertNewUser(Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,DateTimePicker1.Date)=TRUE) then
begin
GroupBox3.Visible:=False;
end;
end;

procedure TFMainMenu.Label9Click(Sender: TObject); // Переход к регистрации
begin
GroupBox3.Visible:=True;
GroupBox2.Visible:=False;
end;
end.
