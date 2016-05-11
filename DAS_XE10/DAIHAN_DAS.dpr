program DAIHAN_DAS;

{%File '..\Test\func_DBCONNECT'}

uses
  Forms,
  utDAIHAN_MAIN in 'utDAIHAN_MAIN.pas' {frmDAIHAN_MAIN},
  Common in '������\Common.pas',
  Common_DLL in '������\Common_DLL.pas',
  Common_Frm in '������\Common_Frm.pas',
  Common_Grid in '������\Common_Grid.pas',
  Common_Opt in '������\Common_Opt.pas',
  Common_Xls in '������\Common_Xls.pas',
  utAbout in '������\utAbout.pas' {fmAbout},
  utDM in '������\utDM.pas' {dmDMS: TDataModule},
  utHanConv in '������\utHanConv.pas',
  utMsgBox in '������\utMsgBox.pas' {fmMsgBox},
  utOPTION in '������\utOPTION.pas' {fmOPTION},
  utOPTSUB in '������\utOPTSUB.pas' {fmOPTSUB},
  frmOrdRcv in 'frmOrdRcv.pas' {FPITest},
  frmLogIn in 'frmLogIn.pas' {FOrderGet},
  utPrint in 'utPrint.pas' {frmPrint: TQuickRep},
  utPassItem in 'utPassItem.pas' {frmPassItem},
  utMonitor in 'utMonitor.pas' {frmMonitor},
  utPassItemPRT in 'utPassItemPRT.pas' {frmPassItemPRT: TQuickRep},
  utNotPicking in 'utNotPicking.pas' {frmNotPicking},
  utRePrint in 'utRePrint.pas' {frmRePrint},
  UVersionInfo in '������\UVersionInfo.pas',
  utPi in 'utPi.pas' {frmPi};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TdmDMS, dmDMS);
  Application.CreateForm(TFOrderGet, FOrderGet);
  Application.CreateForm(TfrmPrint, frmPrint);
  Application.CreateForm(TfmOPTSUB, fmOPTSUB);
  Application.CreateForm(TfmOPTION, fmOPTION);
  Application.Run;
end.
