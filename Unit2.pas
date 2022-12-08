unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, JPEG;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Timer1: TTimer;
    Panel1: TPanel;
    Memo6: TMemo;
    Button6: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure load_tets();
    procedure Timer1Timer(Sender: TObject);
    procedure valid_test();
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  index_vopr:Integer;
  res:array[1..20]of string;
  res_:array[1..20]of Integer;
  im:array[1..20]of TImage;
  sec,min:Integer;



implementation

uses Unit1, Unit3;

{$R *.dfm}


procedure Tform2.load_tets();
var
  i:Integer;
  tmp_str,tmp_otv,tmp_otv2,tmp_otv3,tmp_otv4:String;
  kol_otv:Integer;
  pyt1:String;
begin
  kol_otv:=0;
  if(rejim = 2)and(zanovo = false)then
    number_bil:=Random(kol_bilets)+1;
  pyt1:='data_app/Bilets/'+IntToStr(number_bil)+'_bilet/';
  if(DirectoryExists(pyt1))then
  begin
    memo1.Lines.LoadFromFile(pyt1+IntToStr(index_vopr)+'_text.txt');
    memo6.Lines.LoadFromFile(pyt1+IntToStr(index_vopr)+'_help.txt');
    if(FileExists(pyt1+IntToStr(index_vopr)+'_pic.jpg'))then
      Image1.Picture.LoadFromFile(pyt1+IntToStr(index_vopr)+'_pic.jpg') else
      Image1.Picture.Graphic:=nil;
    memo2.Lines.LoadFromFile(pyt1+IntToStr(index_vopr)+'_otv.txt');
    tmp_str:=memo2.lines.text;
    memo2.Clear;
    while (pos('#',tmp_str) > 0) do
    begin
      if(pos('#',tmp_str) > 0)then
      begin
        tmp_otv:=Copy(tmp_str,pos('#',tmp_str)+2,pos(#13#10,tmp_str)-2);
        inc(kol_otv);
        Delete(tmp_str,pos('#',tmp_str),pos(#13#10,tmp_str));
        if(kol_otv = 1)then
          memo2.Text:=tmp_otv;
        if(kol_otv = 2)then
          memo3.Text:=tmp_otv;
        if(kol_otv = 3)then
          memo4.Text:=tmp_otv;
        if(kol_otv = 4)then
          memo5.Text:=tmp_otv;
      end;
    end;
    case kol_otv of
      2:begin RadioButton3.Visible:=False; RadioButton4.Visible:=False; memo4.Visible:=False; memo5.Visible:=False; end;
      3:begin RadioButton4.Visible:=False; memo5.Visible:=False; memo4.Visible:=true;RadioButton3.Visible:=true;  end;
      4:begin RadioButton3.Visible:=true; RadioButton4.Visible:=true; memo4.Visible:=true; memo5.Visible:=True;end;
    end;
    if(rejim = 2)then
      StatusBar1.Panels[1].Text:='     Вопрос '+IntToStr(index_vopr)+' из 20'
    else
      StatusBar1.Panels[1].Text:='Билет№'+IntToStr(number_bil)+'        Вопрос '+IntToStr(index_vopr)+' из 20';
  end;
end;


procedure TForm2.Timer1Timer(Sender: TObject);
var
  sec_,min_:String;
begin
      sec:=sec+1;
      if (sec=60) then
        begin
          min:=min+1;
          sec:=0;
        end;
      sec_:=IntToStr(sec);
      min_:=IntToStr(min);
      if (sec<10) then
        sec_:='0'+sec_;
      if (min<10) then
        min_:='0'+min_;
      StatusBar1.Panels[0].Text:='    '+min_+':'+sec_;
  if(min = 20)and(rejim = 2)then
  begin
    Timer1.Enabled:=false;
    ShowMessage('Время вышло! Вы не сдали экзамен!');
    Button1.Enabled:=False;
    Button5.Visible:=True;
    flag_ex:=true;
    kol_error:=3;
  end;

end;


procedure TForm2.valid_test();
var
  true_otv:String;
begin
    if(RadioButton1.Checked)then
      res[index_vopr]:='№1';
    if(RadioButton2.Checked)then
      res[index_vopr]:='№2';
    if(RadioButton3.Checked)then
      res[index_vopr]:='№3';
    if(RadioButton4.Checked)then
      res[index_vopr]:='№4';
  with Form1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets WHERE id=:i';
    Parameters.ParamByName('i').Value:=number_bil;
    Open;
    true_otv:=Fields[index_vopr].AsString;
  end;
  if(true_otv = res[index_vopr])then
  begin
    im[index_vopr].Picture.LoadFromFile('data_app/true.bmp');
    res_[index_vopr]:=1;
  end else
  begin
    im[index_vopr].Picture.LoadFromFile('data_app/false.bmp');
    res_[index_vopr]:=0;
  end;
end;



procedure TForm2.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Желаете выйти в главное меню ?'),'Внимание!.',mb_YesNo or mb_iconquestion)=mrYes)then
  begin
    Form2.Close;
    Form1.Show;
    Form1.GroupBox1.Visible:=False;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    if((index_vopr-1) > 0)then
    begin
      index_vopr:=index_vopr-1;
      load_tets();
      Button5.Visible:=False;
      button3.Enabled:=True;
    end else
      ShowMessage('Вы находитесь на первом вопросе !');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if((RadioButton1.Visible)and(RadioButton1.Checked))or((RadioButton2.Visible)and(RadioButton2.Checked))or((RadioButton3.Visible)and(RadioButton3.Checked))or((RadioButton4.Visible)and(RadioButton4.Checked))then
  begin
   if((index_vopr+1) <= 20)then
   begin
     valid_test();
     inc(index_vopr);
     load_tets();
   end else begin valid_test(); Button5.Visible:=True; button3.Enabled:=False; end;
  end else ShowMessage('Выбирете вариант ответа !');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Panel1.Visible:=True;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Form3 := TForm3.Create(nil);
  Form3.Show();
  Form2.Close;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
  Form2:=nil;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to 20 do
  begin
    im[i]:=Timage.Create(Form2);
    im[i].Parent:=Form2;
    im[i].Visible:=True;
    im[i].Height:=23;
    im[i].Width:=23;
    im[i].Top:=26;
    im[i].Left:=i*38;
    im[i].Picture.LoadFromFile('data_app/def.bmp');
    im[i].Center:=True;
    im[i].Stretch:=True;
    im[i].Refresh;
  end;

  index_vopr:=1;
  if(rejim = 1)then
  begin
    load_tets();
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[2].text:='Обучение.';
  end;
  if(rejim = 2)then
  begin
    load_tets();
    Button4.Enabled:=False;
    Button2.Enabled:=False;
    StatusBar1.Panels[2].text:='Экзамен.';
    Timer1.Enabled:=True;
  end;
  if(rejim = 3)then
  begin
    Panel1.Visible:=True;
    Button1.Visible:=False;
    Button5.Visible:=True;
    Button6.Enabled:=False;
  end;
end;

end.
