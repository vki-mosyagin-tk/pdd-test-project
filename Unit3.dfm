object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
  ClientHeight = 512
  ClientWidth = 635
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 19
    Width = 91
    Height = 23
    Caption = #1042#1086#1087#1088#1086#1089#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 1
    Top = 8
    Width = 17
    Height = 17
    Visible = False
  end
  object ListBox1: TListBox
    Left = 24
    Top = 48
    Width = 169
    Height = 449
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ItemHeight = 22
    ParentFont = False
    TabOrder = 0
    OnDblClick = ListBox1DblClick
  end
  object Button1: TButton
    Left = 434
    Top = 456
    Width = 193
    Height = 41
    Caption = #1042' '#1075#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 434
    Top = 392
    Width = 193
    Height = 41
    Caption = #1055#1088#1086#1081#1090#1080' '#1079#1072#1085#1086#1074#1086
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 304
    Top = 48
    Width = 323
    Height = 209
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
  end
end
