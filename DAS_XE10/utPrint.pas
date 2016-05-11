//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utPrint
//  파일내용  : 거래처별 분배내역서 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TfrmPrint = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRSysData3: TQRSysData;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    qrPrint: TQuery;
    qrPrintORDER_TYPE: TStringField;
    qrPrintORDER_NO: TStringField;
    qrPrintITEM_CODE: TStringField;
    qrPrintORDER_UNIT: TStringField;
    qrPrintEXP_DATE: TStringField;
    qrPrintORDER_DT: TStringField;
    qrPrintORDER_STAT: TStringField;
    qrPrintPICK_QTY: TFloatField;
    qrPrintCUST_CODE: TStringField;
    qrPrintCELL_RESTORE: TStringField;
    qrPrintCUST_NAME: TStringField;
    qrPrintKAN_CODE: TStringField;
    qrPrintITEM_NAME: TStringField;
    qrPrintCATNO: TStringField;
    qrPrintORD_UNIT: TStringField;
    PageFooterBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    qrPrintREMARKS: TStringField;
    qrPrintQTY: TFloatField;
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure WinControlFormClose(Sender: TObject;
      var Action: TCloseAction);
  private

  public

  end;

var
  frmPrint: TfrmPrint;

implementation

{$R *.DFM}

procedure TfrmPrint.QRDBText11Print(sender: TObject; var Value: String);

function xTrim(cString : string): string;
var
  i : integer;
begin
  result := '';
  for i := 1 to length(cString) do
  begin
    if copy(cString, i, 1) <> ' ' then result := result + copy(cString, i, 1);
  end;
end;

begin
  if copy(value,1,5)='+H659' then
  begin
    VALUE :='*'+ uppercase(value) + '00'+'*';
  end
  else
  begin
    value := '*' +xTrim(uppercase(value))+ '*';
  end;
end;

procedure TfrmPrint.QuickRepAfterPrint(Sender: TObject);
begin
  qrPrint.Close;
end;

procedure TfrmPrint.WinControlFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
