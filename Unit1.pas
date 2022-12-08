unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Button6: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Form1: TForm1;
  number_bil:integer;
  rejim,kol_bilets:Integer;
  flag_ex:boolean;


implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Хотите выйти из программы ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    Form1.Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ComboBox1.Clear;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets';
    Open;
    First;
    WHile not(eof) do
    begin
      ComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
  GroupBox1.Visible:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
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
      rejim:=2;
      flag_ex:=True;
      Form2 := TForm2.Create(Self);
      Form2.Show();
      Form1.Hide;
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  mem:Tmemo;
begin
  Panel1.Visible:=True;
  if(FileExists('data_app/zaglavie.txt'))then
  begin
    mem:=Tmemo.Create(self);
    mem.Parent:=Form1;
    mem.Visible:=False;
    mem.Lines.LoadFromFile('data_app/zaglavie.txt');
    Label1.Caption:=mem.Lines.Text;
    mem.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if(ComboBox1.ItemIndex <> -1)then
  begin
    number_bil:=StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
    Form1.Hide;
    Form2:=TForm2.Create(Self);
    rejim:=1;
    flag_ex:=False;
    Form2.Show();
  end else
    ShowMessage('Вы не выбрали билет !');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  str_connect:String;
begin
  str_connect:='data_app/pdd_db.mdb';
  ADOQuery1.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;'+
        'User ID=Admin;'+
        'Data Source='+str_connect+';'+
        'Mode=Share Deny None;'+
        'Extended Properties="";'+
        'Jet OLEDB:System database="";'+
        'Jet OLEDB:Registry Path="";'+
        'Jet OLEDB:Database Password="1";'+
        'Jet OLEDB:Engine Type=5;'+
        'Jet OLEDB:Database Locking Mode=1;'+
        'Jet OLEDB:Global Partial Bulk Ops=2;'+
        'Jet OLEDB:Global Bulk Transactions=1;'+
        'Jet OLEDB:New Database Password="";'+
        'Jet OLEDB:Create System Database=False;'+
        'Jet OLEDB:Encrypt Database=False;'+
        'Jet OLEDB:Don'+'''t Copy Locale on Compact=False;'+
        'Jet OLEDB:Compact Without Replica Repair=False;'+
        'Jet OLEDB:SFP=False';
end;

end.
