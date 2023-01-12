object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 376
  Width = 504
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 48
  end
  object ADOConnection1: TADOConnection
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 48
  end
end
