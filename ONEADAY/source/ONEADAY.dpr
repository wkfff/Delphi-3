program ONEADAY;

uses
  Forms,
  Controls,
  UAbout in 'UAbout.pas' {FAbout},
  UDM in 'UDM.pas' {DM: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  USD130 in 'USD130.pas' {FSD130},
  UBBlankFrm in 'UBBlankFrm.pas' {FBBlankFrm},
  ULib in '..\common\ULib.pas',
  UPMSG in '..\common\UPMSG.pas' {FPMSG},
  DateSet in '..\common\DateSet.pas' {frmDateSet},
  UIItem in 'UIItem.pas' {FIItem},
  UVersionInfo in '..\common\UVersionInfo.pas',
  UUser in 'UUser.pas' {FUser},
  UOneADay in 'UOneADay.pas',
  USD130Exp in 'USD130Exp.pas' {FSD130Exp},
  UPopup in 'UPopup.pas' {FPopup},
  USM200Exp in 'USM200Exp.pas' {FSM200Exp},
  USM200Stock in 'USM200Stock.pas' {FSM200Stock},
  USM100Exp in 'USM100Exp.pas' {FSM100Exp},
  USM100 in 'USM100.pas' {FSM100},
  UQMain in 'UQMain.pas' {FQMain},
  USD220 in 'USD220.pas' {FSD220},
  USD220Reg in 'USD220Reg.pas' {FSD220Reg},
  USM200 in 'USM200.pas' {FSM200},
  USD110 in 'USD110.pas' {FSD110},
  UDash in 'UDash.pas' {FDash},
  USM200Month in 'USM200Month.pas' {FSM200Month},
  UBarcodePrint in 'UBarcodePrint.pas' {FBarcodePrint},
  USM200Cust in 'USM200Cust.pas' {FSM200Cust};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFLogin, FLogin);
  if FLogin.ShowModal = mrOk then
  Begin
     fLogin.Free;
     Application.CreateForm(TFQMain, FQMain);
     Application.Run;
  end
  else
  begin
     fLogin.Free;
  end;
end.
