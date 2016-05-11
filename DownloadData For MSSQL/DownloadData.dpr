program DownloadData;

uses
  Forms, Dialogs,
  UDM in 'UDM.pas' {DM: TDataModule},
  FMain in 'FMain.pas' {MainForm},
  FQueries in 'FQueries.pas' {QueryForm},
  UVersionInfo in 'UVersionInfo.pas',
  FDBLogin in 'FDBLogin.pas' {DBLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  if DM.fn_SetDBConnect then
  begin
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  end
  else
    ShowMessage('Cannot Connect DB Server!');
end.
