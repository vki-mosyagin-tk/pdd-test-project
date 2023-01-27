object FDBResults: TFDBResults
  Left = 0
  Top = 0
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 373
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 120
    Width = 245
    Height = 39
    Caption = #1053#1077#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 328
    Width = 75
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 585
    Height = 281
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'SpentTimeInSeconds'
        Title.Caption = #1042#1088#1077#1084#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ticketNum'
        Title.Caption = #1041#1080#1083#1077#1090
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalInvalidAnswers'
        Title.Caption = #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1090#1074#1077#1090#1086#1074
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalTrueAnswers'
        Title.Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1077' '#1086#1090#1074#1077#1090#1099
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rejim'
        Title.Caption = #1056#1077#1078#1080#1084
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Timespan'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 624
    Top = 32
  end
end
