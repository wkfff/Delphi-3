program DAIHAN;

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
  UPM100CUST in 'UPM100CUST.pas' {FPM100CUST},
  UVersionInfo in '..\common\UVersionInfo.pas',
  UMT200 in 'UMT200.pas' {FMT200},
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
  USM200Cust in 'USM200Cust.pas' {FSM200Cust},
  UPM100Prt in 'UPM100Prt.pas' {FPM100Prt},
  UIItem in 'UIItem.pas' {FIItem},
  UIItemPackage in 'UIItemPackage.pas' {FIItemPackage},
  UPD710 in 'UPD710.pas' {FPD710},
  UPD710Qry in 'UPD710Qry.pas' {FPD710Qry},
  UPM100Qry in 'UPM100Qry.pas' {FPM100Qry},
  UPM100LOC in 'UPM100LOC.pas' {FPM100LOC},
  UPM100Ret in 'UPM100Ret.pas' {FPM100Ret},
  UPM700ActualStock in 'UPM700ActualStock.pas' {FPM700ActualStock},
  Com_Print in '..\common\Com_Print.pas',
  UPM700_INI in 'UPM700_INI.pas' {FPM700_INI},
  UPD720 in 'UPD720.pas' {FPD720},
  UPM700LOC in 'UPM700LOC.pas' {FPM700LOC},
  UPM700Stock in 'UPM700Stock.pas' {FPM700Stock},
  UPM100CatnoOut in 'UPM100CatnoOut.pas' {FPM100CatnoOut},
  UPM100LOCOUT in 'UPM100LOCOUT.pas' {FPM100LocOut},
  UPM100OutLGST_NO in 'UPM100OutLGST_NO.pas' {FPM100OutLGST_NO},
  UPM100PeriodCatnoOut in 'UPM100PeriodCatnoOut.pas' {FPM100PeriodCatnoOut},
  UPM100PeriodCustOut in 'UPM100PeriodCustOut.pas' {FPM100PeriodCustOut},
  UPM100CatnoOutPre in 'UPM100CatnoOutPre.pas' {FPM100CatnoOutPre},
  UPM100CatnoRetPre in 'UPM100CatnoRetPre.pas' {FPM100CatnoRetPre},
  UPM100CatnoReturn in 'UPM100CatnoReturn.pas' {FPM100CatnoReturn},
  UPM100PeriodCatnoReturn in 'UPM100PeriodCatnoReturn.pas' {FPM100PeriodCatnoReturn},
  UPM100PeriodCustReturn in 'UPM100PeriodCustReturn.pas' {FPM100PeriodCustReturn},
  UPM100CustReturn in 'UPM100CustReturn.pas' {FPM100CustReturn},
  UPM100CustRetPre in 'UPM100CustRetPre.pas' {FPM100CustRetPre},
  UPM100LocReturn in 'UPM100LocReturn.pas' {FPM100LocReturn},
  UPM100OutOrderNo in 'UPM100OutOrderNo.pas' {FPM100OutOrderNo},
  UPM100CustOut in 'UPM100CustOut.pas' {FPM100CustOut},
  UPM100CustInPre in 'UPM100CustInPre.pas' {FPM100CustInPre},
  UPM100LOCIn in 'UPM100LOCIn.pas' {FPM100LOCIn},
  UPM100PeriodCatnoIn in 'UPM100PeriodCatnoIn.pas' {FPM100PeriodCatnoIn},
  UPM100PeriodCustIn in 'UPM100PeriodCustIn.pas' {FPM100PeriodCustIn},
  UPM100CatnoIn in 'UPM100CatnoIn.pas' {FPM100CatnoIn},
  UPM100CatnoInPre in 'UPM100CatnoInPre.pas' {FPM100CatnoInPre},
  UPM100CUSTIN in 'UPM100CUSTIN.pas' {FPM100CUSTIN},
  UPrintBarcode in 'UPrintBarcode.pas' {FPMPRINTBARCODE},
  UUser in 'UUser.pas' {FUser},
  UPM700ITEM in 'UPM700ITEM.pas' {FPM700ITEM},
  UPD122 in 'UPD122.pas' {FPD122},
  UPM100CustOutReq in 'UPM100CustOutReq.pas' {FPM100CustOutReq};

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
