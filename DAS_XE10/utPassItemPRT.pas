//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utPassItemPRT
//  파일내용  : DAS통과 제상품 분배내역서 출력
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utPassItemPRT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TfrmPassItemPRT = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRDBText2: TQRDBText;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRSysData3: TQRSysData;
    QRDBText12: TQRDBText;
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  frmPassItemPRT: TfrmPassItemPRT;

implementation

{$R *.DFM}

uses utPassItem;

procedure TfrmPassItemPRT.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if copy(value,1,5)='+H659' THEN
  BEGIN
    VALUE :='*'+ uppercase(value) + '00'+'*';
  END
  ELSE
  BEGIN
    value := '*' +uppercase(value)+ '*';
  END;
end;

end.
