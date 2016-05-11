program DAIHAN_DAS;

{%File '..\Test\func_DBCONNECT'}

uses
  Forms,
  utDAIHAN_MAIN in 'utDAIHAN_MAIN.pas' {frmDAIHAN_MAIN},
  Common in '공통모듈\Common.pas',
  Common_DLL in '공통모듈\Common_DLL.pas',
  Common_Frm in '공통모듈\Common_Frm.pas',
  Common_Grid in '공통모듈\Common_Grid.pas',
  Common_Opt in '공통모듈\Common_Opt.pas',
  Common_Xls in '공통모듈\Common_Xls.pas',
  utAbout in '공통모듈\utAbout.pas' {fmAbout},
  utDM in '공통모듈\utDM.pas' {dmDMS: TDataModule},
  utHanConv in '공통모듈\utHanConv.pas',
  utMsgBox in '공통모듈\utMsgBox.pas' {fmMsgBox},
  utOPTION in '공통모듈\utOPTION.pas' {fmOPTION},
  utOPTSUB in '공통모듈\utOPTSUB.pas' {fmOPTSUB},
  frmOrdRcv in 'frmOrdRcv.pas' {FPITest},
  frmLogIn in 'frmLogIn.pas' {FOrderGet},
  utPrint in 'utPrint.pas' {frmPrint: TQuickRep},
  utPassItem in 'utPassItem.pas' {frmPassItem},
  utMonitor in 'utMonitor.pas' {frmMonitor},
  utPassItemPRT in 'utPassItemPRT.pas' {frmPassItemPRT: TQuickRep},
  utNotPicking in 'utNotPicking.pas' {frmNotPicking},
  utRePrint in 'utRePrint.pas' {frmRePrint},
  UVersionInfo in '공통모듈\UVersionInfo.pas',
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
