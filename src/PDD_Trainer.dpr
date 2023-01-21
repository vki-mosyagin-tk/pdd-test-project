program PDD_Trainer;

uses
  Forms,
  UConfigBase in 'UConfigBase.pas',
  UConfigClient in 'UConfigClient.pas',
  UMainMenu in 'Forms\UMainMenu.pas' {FMainMenu},
  UResults in 'Forms\UResults.pas' {FResults},
  UTrainer in 'Forms\UTrainer.pas' {FTrainer},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  UStatistics in 'UStatistics.pas',
  UDBResults in 'Forms\UDBResults.pas' {FDBResults};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ПДД Тренажёр';
  Config := TAccessToFiles.Create();
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFResults, FResults);
  Application.Run;
end.
