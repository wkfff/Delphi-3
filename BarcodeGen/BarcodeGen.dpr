program BarcodeGen;

uses
  Vcl.Forms, Vcl.Dialogs,
  FMain in 'FMain.pas' {MainForm},
  UDM in 'UDM.pas' {DM: TDataModule},
  UQReport in 'UQReport.pas' {UQRep: TUQRep},
  FDBLogin in 'FDBLogin.pas' {DBLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  if DM.fn_SetDBConnect then
  begin
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  end
  else
    ShowMessage('Cannot Connect DB Server!');
end.
