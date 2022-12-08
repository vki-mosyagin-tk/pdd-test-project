object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
  ClientHeight = 493
  ClientWidth = 539
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 192
    Top = 340
    Width = 153
    Height = 47
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 88
    Width = 185
    Height = 49
    Caption = #1054#1073#1091#1095#1077#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 159
    Width = 185
    Height = 49
    Caption = #1069#1082#1079#1072#1084#1077#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 176
    Top = 232
    Width = 185
    Height = 49
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 31
    Top = 68
    Width = 473
    Height = 377
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 471
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = 'Label1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Georgia'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 55
    end
    object Button5: TButton
      Left = 152
      Top = 337
      Width = 185
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button5Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 49
    Top = 104
    Width = 432
    Height = 249
    Caption = #1041#1080#1083#1077#1090#1099
    Color = clGradientInactiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 25
      Top = 66
      Width = 229
      Height = 25
      Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1073#1080#1083#1077#1090' ('#8470')'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Georgia'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button6: TButton
      Left = 3
      Top = 210
      Width = 118
      Height = 36
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button6Click
    end
    object ComboBox1: TComboBox
      Left = 260
      Top = 66
      Width = 149
      Height = 30
      Style = csDropDownList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Button7: TButton
      Left = 260
      Top = 107
      Width = 149
      Height = 43
      Caption = #1053#1072#1095#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button7Click
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 16
    Top = 8
  end
end
