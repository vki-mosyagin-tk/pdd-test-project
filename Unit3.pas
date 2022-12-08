unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  im_valid:array[1..20]of TImage;
  kol_error:integer;
  zanovo:boolean;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Желаете выйти в главное меню ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
  begin
    Form3.close;
    Form1.Show;
    Form1.GroupBox1.Visible:=False;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if(flag_ex)then
    rejim:=2;

  if(rejim = 2)then
  begin
    if(application.MessageBox(PChar('Хотите пройти заново экзамен ?'),'Внимание!.',mb_YesNo or mb_iconquestion)=mrYes)then
    begin
      Form2 := TForm2.Create(nil);
      rejim:=2;
      Form2.Show();
      Form3.Close;
      zanovo:=true;
    end;
  end else
  begin
    if(application.MessageBox(PChar('Хотите пройти заново билет№'+IntToStr(number_bil)+' ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    begin
      Form2 := TForm2.Create(nil);
      rejim:=1;
      Form2.Show();
      Form3.Close;
    end;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= cafree;
  Form3:=nil;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  i:Integer;
begin
  kol_error:=0;
  for i:=1 to 20 do
    Listbox1.Items.Add('Вопрос№'+IntToStr(i));
  i:=0;

  for i:=1 to 20 do
  begin
    im_valid[i]:=Timage.Create(Form3);
    im_valid[i].Parent:=Form3;
    im_valid[i].Visible:=True;
    im_valid[i].Height:=19;
    im_valid[i].Width:=19;
    im_valid[i].Top:=30+(i*22);
    im_valid[i].Left:=201;
    if(res_[i] = 1)then
      im_valid[i].Picture.LoadFromFile('data_app/true.bmp');
    if(res_[i] = 0)then
    begin
      im_valid[i].Picture.LoadFromFile('data_app/false.bmp');
      inc(kol_error);
    end;
    im_valid[i].Center:=True;
    im_valid[i].Stretch:=True;
    im_valid[i].Refresh;
  end;
  if(rejim = 2)or(flag_ex)then
  begin
    memo1.Visible:=true;
    if(kol_error > 2)then
      Memo1.Lines.LoadFromFile('data_app/finish1.txt');
    if(kol_error <= 2)then
      Memo1.Lines.LoadFromFile('data_app/finish2.txt');
  end;
end;

procedure TForm3.ListBox1DblClick(Sender: TObject);
begin
  if(ListBox1.ItemIndex <> -1)then
  begin
    Form3.Close;
    Form2 := TForm2.Create(nil);
    rejim:=3;
    Form2.Show();
    index_vopr:=Listbox1.ItemIndex+1;
    Form2.load_tets();
    Form2.Timer1.Enabled:=false;
  end;
end;

end.
