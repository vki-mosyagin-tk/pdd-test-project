unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient;

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
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainMenu: TFMainMenu;
  number_bil:integer;
  rejim,kol_bilets:Integer;
  flag_ex:boolean;


implementation

uses UTrainer,DataModule;

{$R *.dfm}

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
 DataModule1.ExamQuery();
end;

procedure TFMainMenu.Button4Click(Sender: TObject);
begin
  Panel1.Visible := True;
end;

procedure TFMainMenu.Button5Click(Sender: TObject);
begin
  Panel1.Visible:=False;
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

end.
