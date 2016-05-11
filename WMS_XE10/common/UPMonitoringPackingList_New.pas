unit UPMonitoringPackingList_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBBlankFrm, QRCtrls, QuickRpt, ExtCtrls, Barcode, Clipbrd;

type
  TFPMonitoringPackingList_New = class(TFBBlankFrm)
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    LTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    LVBELN: TQRLabel;
    LCUST_CD: TQRLabel;
    LDLV_CUST_NM: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    LPage: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    LOUT_QTY: TQRLabel;
    QRImage1: TQRImage;
    QRLabel7: TQRLabel;
    LMATNR: TQRLabel;
    LMAKTX: TQRLabel;
    LXB_BOX_PCS_QTY: TQRLabel;
    QRImage2: TQRImage;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations } 
    Barcode1 : TAsBarcode;
    
    giRow : Integer;
  public
    { Public declarations }
  end;

var
  FPMonitoringPackingList_New: TFPMonitoringPackingList_New;

implementation

uses UDM, UIMonitoring;

{$R *.dfm}

procedure TFPMonitoringPackingList_New.FormDestroy(Sender: TObject);
begin
  inherited;
  FPMonitoringPackingList_New := nil;
end;

procedure TFPMonitoringPackingList_New.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFPMonitoringPackingList_New.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  giRow := 1;
  PrintReport := FIMonitoring.sgPrint.RowCount >= 1;
end;

procedure TFPMonitoringPackingList_New.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    if giRow < FIMonitoring.sgPrint.RowCount then begin
      LMATNR.Caption          := FIMonitoring.sgPrint.Cells[4,giRow];
      LMAKTX.Caption          := FIMonitoring.sgPrint.Cells[5,giRow];
      LXB_BOX_PCS_QTY.Caption := FIMonitoring.sgPrint.Cells[6,giRow];


      // 출력을 위한 바코드 세팅           

      Barcode1.Text := FIMonitoring.sgPrint.Cells[4,giRow];

      QRImage2.Picture := nil;
      Barcode1.DrawBarcode(QRImage2.Canvas);
      Sleep(70);
      //Clipboard.Assign(QRImage2.Picture.Bitmap);
      //QRImage2.Picture.LoadFromClipboardFormat(CF_BITMAP, ClipBoard.GetAsHandle(CF_BITMAP), 0);


    end;
    Inc(giRow);
    MoreData := giRow < FIMonitoring.sgPrint.RowCount+1;
end;

procedure TFPMonitoringPackingList_New.FormCreate(Sender: TObject);
begin
  inherited;

  
  Barcode1 := TAsBarcode.Create(self);
  Barcode1.Top := 0;
  Barcode1.Left := 0;
  Barcode1.Typ := bcCode39;
  Barcode1.Modul := 1;
  Barcode1.Ratio := 2;
  Barcode1.Height := QRImage2.Height;

  //Barcode1.OnChange := Self.Barcode1Change;
end;



end.
