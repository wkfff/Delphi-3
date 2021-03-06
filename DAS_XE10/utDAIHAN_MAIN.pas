//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utDAIHAN_MAIN
//  파일내용  : DAS 메인화면 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utDAIHAN_MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, ExtCtrls, DB, DBTables, ComCtrls, jpeg, frmLogIn,
  Grids, TFlatGaugeUnit;

type
  TfrmDAIHAN_MAIN = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    timBCU: TTimer;
    Button9: TButton;
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    qrItemKan: TQuery;
    qrOrder: TQuery;
    Edit4: TEdit;
    L0Cust1: TLabel;
    L0Unit1: TLabel;
    L0Qty1: TLabel;
    L0Unit2: TLabel;
    L0Qty2: TLabel;
    L0: TLabel;
    qrltemPickQty: TQuery;
    L1Unit1: TLabel;
    L1Qty1: TLabel;
    L1Cust1: TLabel;
    L1Unit2: TLabel;
    L1Qty2: TLabel;
    L2Unit1: TLabel;
    L2Cust1: TLabel;
    L2Qty1: TLabel;
    L2Qty2: TLabel;
    L2Unit2: TLabel;
    L3Unit1: TLabel;
    L3Cust1: TLabel;
    L3Qty1: TLabel;
    L3Qty2: TLabel;
    L3Unit2: TLabel;
    L4Unit1: TLabel;
    L4Cust1: TLabel;
    L4Qty1: TLabel;
    L4Qty2: TLabel;
    L4Unit2: TLabel;
    R0Unit1: TLabel;
    R0Unit2: TLabel;
    R0Qty1: TLabel;
    R0Qty2: TLabel;
    R1Unit1: TLabel;
    R1Unit2: TLabel;
    R1Qty1: TLabel;
    R1Qty2: TLabel;
    R2Unit2: TLabel;
    R2Unit1: TLabel;
    R2Qty1: TLabel;
    R2Qty2: TLabel;
    R3Unit1: TLabel;
    R3Unit2: TLabel;
    R3Qty1: TLabel;
    R3Qty2: TLabel;
    R4Unit2: TLabel;
    R4Unit1: TLabel;
    R4Qty1: TLabel;
    R4Qty2: TLabel;
    R0Cust1: TLabel;
    R1Cust1: TLabel;
    R2Cust1: TLabel;
    R3Cust1: TLabel;
    R4Cust1: TLabel;
    L5Cust1: TLabel;
    L5Unit1: TLabel;
    L5Qty1: TLabel;
    L5Qty2: TLabel;
    L5Unit2: TLabel;
    L6Cust1: TLabel;
    L6Unit1: TLabel;
    L6Unit2: TLabel;
    L6Qty2: TLabel;
    L6Qty1: TLabel;
    L7Cust1: TLabel;
    L7Unit1: TLabel;
    L7Qty1: TLabel;
    L7Qty2: TLabel;
    L8Unit2: TLabel;
    L8Unit1: TLabel;
    L8Cust1: TLabel;
    L8Qty1: TLabel;
    L8Qty2: TLabel;
    L9Unit1: TLabel;
    L9Cust1: TLabel;
    L9Unit2: TLabel;
    L9Qty2: TLabel;
    L9Qty1: TLabel;
    R5Cust1: TLabel;
    R5Unit1: TLabel;
    R5Unit2: TLabel;
    R5Qty2: TLabel;
    R5Qty1: TLabel;
    R6Unit1: TLabel;
    R6Cust1: TLabel;
    R6Unit2: TLabel;
    R6Qty2: TLabel;
    R6Qty1: TLabel;
    R7Cust1: TLabel;
    R7Unit1: TLabel;
    R7Unit2: TLabel;
    R7Qty2: TLabel;
    R7Qty1: TLabel;
    R8Unit1: TLabel;
    R8Cust1: TLabel;
    R8Unit2: TLabel;
    R8Qty2: TLabel;
    R8Qty1: TLabel;
    R9Cust1: TLabel;
    R9Unit1: TLabel;
    R9Unit2: TLabel;
    R9Qty1: TLabel;
    R9Qty2: TLabel;
    L7Unit2: TLabel;
    L10Cust1: TLabel;
    L11Cust1: TLabel;
    L12Cust1: TLabel;
    L13Cust1: TLabel;
    L14Cust1: TLabel;
    R10Cust1: TLabel;
    R11Cust1: TLabel;
    R12Cust1: TLabel;
    R13Cust1: TLabel;
    R14Cust1: TLabel;
    L10Unit1: TLabel;
    L10Qty1: TLabel;
    L11Unit1: TLabel;
    L11Qty1: TLabel;
    L12Unit1: TLabel;
    L12Qty1: TLabel;
    L13Unit1: TLabel;
    L13Qty1: TLabel;
    L14Unit1: TLabel;
    L14Qty1: TLabel;
    R10Unit1: TLabel;
    R10Qty1: TLabel;
    R11Unit1: TLabel;
    R11Qty1: TLabel;
    R12Unit1: TLabel;
    R12Qty1: TLabel;
    R13Unit1: TLabel;
    R13Qty1: TLabel;
    R14Unit1: TLabel;
    R14Qty1: TLabel;
    L10Unit2: TLabel;
    L10Qty2: TLabel;
    L11Unit2: TLabel;
    L11Qty2: TLabel;
    L12Unit2: TLabel;
    L12Qty2: TLabel;
    L13Unit2: TLabel;
    L13Qty2: TLabel;
    L14Unit2: TLabel;
    L14Qty2: TLabel;
    R10Unit2: TLabel;
    R10Qty2: TLabel;
    R11Unit2: TLabel;
    R11Qty2: TLabel;
    R12Unit2: TLabel;
    R12Qty2: TLabel;
    R13Unit2: TLabel;
    R13Qty2: TLabel;
    R14Unit2: TLabel;
    R14Qty2: TLabel;
    L15Cust1: TLabel;
    L16Cust1: TLabel;
    L17Cust1: TLabel;
    L18Cust1: TLabel;
    L19Cust1: TLabel;
    R15Cust1: TLabel;
    R16Cust1: TLabel;
    R17Cust1: TLabel;
    R18Cust1: TLabel;
    R19Cust1: TLabel;
    L15Unit1: TLabel;
    L15Qty1: TLabel;
    L16Unit1: TLabel;
    L16Qty1: TLabel;
    L17Unit1: TLabel;
    L17Qty1: TLabel;
    L18Unit1: TLabel;
    L18Qty1: TLabel;
    L19Unit1: TLabel;
    L19Qty1: TLabel;
    R15Unit1: TLabel;
    R15Qty1: TLabel;
    R16Unit1: TLabel;
    R16Qty1: TLabel;
    R17Unit1: TLabel;
    R17Qty1: TLabel;
    R18Unit1: TLabel;
    R18Qty1: TLabel;
    R19Unit1: TLabel;
    R19Qty1: TLabel;
    L15Unit2: TLabel;
    L15Qty2: TLabel;
    L16Unit2: TLabel;
    L16Qty2: TLabel;
    L17Unit2: TLabel;
    L17Qty2: TLabel;
    L18Unit2: TLabel;
    L18Qty2: TLabel;
    L19Unit2: TLabel;
    L19Qty2: TLabel;
    R15Unit2: TLabel;
    R15Qty2: TLabel;
    R16Unit2: TLabel;
    R16Qty2: TLabel;
    R17Unit2: TLabel;
    R17Qty2: TLabel;
    R18Unit2: TLabel;
    R18Qty2: TLabel;
    R19Unit2: TLabel;
    R19Qty2: TLabel;
    L20Cust1: TLabel;
    L21Cust1: TLabel;
    L22Cust1: TLabel;
    L23Cust1: TLabel;
    L24Cust1: TLabel;
    R20Cust1: TLabel;
    R21Cust1: TLabel;
    R22Cust1: TLabel;
    R23Cust1: TLabel;
    R24Cust1: TLabel;
    L20Unit1: TLabel;
    L20Qty1: TLabel;
    L21Unit1: TLabel;
    L21Qty1: TLabel;
    L22Unit1: TLabel;
    L22Qty1: TLabel;
    L23Unit1: TLabel;
    L23Qty1: TLabel;
    L24Unit1: TLabel;
    L24Qty1: TLabel;
    R20Unit1: TLabel;
    R20Qty1: TLabel;
    R21Unit1: TLabel;
    R21Qty1: TLabel;
    R22Unit1: TLabel;
    R22Qty1: TLabel;
    R23Unit1: TLabel;
    R23Qty1: TLabel;
    R24Unit1: TLabel;
    R24Qty1: TLabel;
    L20Unit2: TLabel;
    L20Qty2: TLabel;
    L21Unit2: TLabel;
    L21Qty2: TLabel;
    L22Unit2: TLabel;
    L22Qty2: TLabel;
    L23Unit2: TLabel;
    L23Qty2: TLabel;
    L24Unit2: TLabel;
    L24Qty2: TLabel;
    R20Unit2: TLabel;
    R20Qty2: TLabel;
    R21Unit2: TLabel;
    R21Qty2: TLabel;
    R22Unit2: TLabel;
    R22Qty2: TLabel;
    R23Unit2: TLabel;
    R23Qty2: TLabel;
    R24Unit2: TLabel;
    R24Qty2: TLabel;
    qryItemScan: TQuery;
    L0C: TLabel;
    L1C: TLabel;
    L3C: TLabel;
    L2C: TLabel;
    L4C: TLabel;
    L5C: TLabel;
    L6C: TLabel;
    L7C: TLabel;
    L8C: TLabel;
    L9C: TLabel;
    L19C: TLabel;
    L18C: TLabel;
    L17C: TLabel;
    L16C: TLabel;
    L15C: TLabel;
    L10C: TLabel;
    L11C: TLabel;
    L12C: TLabel;
    L13C: TLabel;
    L14C: TLabel;
    L20C: TLabel;
    L21C: TLabel;
    L22C: TLabel;
    L23C: TLabel;
    L24C: TLabel;
    R0C: TLabel;
    R1C: TLabel;
    R2C: TLabel;
    R3C: TLabel;
    R4C: TLabel;
    R9C: TLabel;
    R8C: TLabel;
    R7C: TLabel;
    R6C: TLabel;
    R5C: TLabel;
    R10C: TLabel;
    R11C: TLabel;
    R12C: TLabel;
    R13C: TLabel;
    R14C: TLabel;
    R15C: TLabel;
    R16C: TLabel;
    R17C: TLabel;
    R18C: TLabel;
    R19C: TLabel;
    R20C: TLabel;
    R21C: TLabel;
    R22C: TLabel;
    R23C: TLabel;
    R24C: TLabel;
    L0W: TLabel;
    L1W: TLabel;
    L2W: TLabel;
    L3W: TLabel;
    L4W: TLabel;
    L5W: TLabel;
    L6W: TLabel;
    L7W: TLabel;
    L8W: TLabel;
    L9W: TLabel;
    L10W: TLabel;
    L11W: TLabel;
    L12W: TLabel;
    L13W: TLabel;
    L14W: TLabel;
    L15W: TLabel;
    L16W: TLabel;
    L17W: TLabel;
    L18W: TLabel;
    L19W: TLabel;
    L20W: TLabel;
    L21W: TLabel;
    L22W: TLabel;
    L23W: TLabel;
    L24W: TLabel;
    R0W: TLabel;
    R1W: TLabel;
    R2W: TLabel;
    R3W: TLabel;
    R4W: TLabel;
    R5W: TLabel;
    R6W: TLabel;
    R7W: TLabel;
    R8W: TLabel;
    R9W: TLabel;
    R10W: TLabel;
    R11W: TLabel;
    R12W: TLabel;
    R13W: TLabel;
    R14W: TLabel;
    R15W: TLabel;
    R16W: TLabel;
    R17W: TLabel;
    R18W: TLabel;
    R19W: TLabel;
    R20W: TLabel;
    R21W: TLabel;
    R22W: TLabel;
    R23W: TLabel;
    R24W: TLabel;
    qryItemUnit: TQuery;
    Button11: TButton;
    Button12: TButton;
    qryPassUpdate: TQuery;
    qryPassCount: TQuery;
    PanelMessage: TPanel;
    LabelMessage: TLabel;
    Panel4: TPanel;
    pnCount: TPanel;
    pnTotal: TPanel;
    Button10: TButton;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L4: TLabel;
    L6: TLabel;
    L7: TLabel;
    L8: TLabel;
    L9: TLabel;
    L5: TLabel;
    L11: TLabel;
    L12: TLabel;
    L13: TLabel;
    L14: TLabel;
    L10: TLabel;
    L16: TLabel;
    L17: TLabel;
    L18: TLabel;
    L19: TLabel;
    L15: TLabel;
    L21: TLabel;
    L22: TLabel;
    L23: TLabel;
    L24: TLabel;
    L20: TLabel;
    R0: TLabel;
    R1: TLabel;
    R2: TLabel;
    R3: TLabel;
    R4: TLabel;
    R5: TLabel;
    R6: TLabel;
    R7: TLabel;
    R8: TLabel;
    R9: TLabel;
    R10: TLabel;
    R11: TLabel;
    R12: TLabel;
    R13: TLabel;
    R14: TLabel;
    R15: TLabel;
    R16: TLabel;
    R17: TLabel;
    R18: TLabel;
    R19: TLabel;
    R20: TLabel;
    R21: TLabel;
    R22: TLabel;
    R23: TLabel;
    R24: TLabel;
    qryStatusProgress: TQuery;
    fgDas: TFlatGauge;
    btnClose: TButton;
    Button14: TButton;
    btnPass: TButton;
    LabelPicker: TLabel;
    qrPicker: TQuery;
    Button13: TButton;
    qrDASLOG: TQuery;
    qrltemPickQty_Cust: TQuery;
    Memo1: TRichEdit;
    memRcv: TRichEdit;
    qryPassRecall: TQuery;
    Button15: TButton;
    Button16: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure timBCUTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnCloseKeyPress(Sender: TObject; var Key: Char);
    procedure Button13Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);

  private
    { Private declarations }
    PrintOutCust, stItem_Code, stWorkItem : string;

    function fn_PI_Color(Cell : integer): integer;

    procedure ShowProgress;
    procedure MainDraw(isFirst : Boolean);
    procedure pr_Comm_HDSCAN_RX(Sender: TObject; Count: Integer);
    procedure pr_Clear_Board;
    procedure Set_log;
    procedure Write_Set_log(cCondition : string);
    procedure pr_Show_Board(cMessage : string);
    procedure LetsPassUpdate;
    procedure LetsPassRecall;
  public
    { Public declarations }
    procedure proc_print(CustCode : String);
  end;
  
  var
    Wcell : integer;
    Wcust_Count : integer;
    Wqty : integer;
    Wunit : String;
    Wcust_code : String;
    Wpick_qty : String;
    WOrder_unit : String;
    WCust_name : String;
    WConfirm   : String;
    WResend   : String;
    WItem_Gubun   : String;
    WItem_Unit :String;

  //function  Cust_Item_Update(data : String; Count : integer) : integer;
const    // CONST = STATIC
  OFF = $40;
  REDON = $41;
  GREENON = $42;
  REDGREENON = $43;
  REDFLASH = $45;
  GREENFLASH = $46;
  REDGREENFLASH = $47;
// 경광등용
  LEFTGREEN = $31;
  LEFTRED = $32;
  RIGHTGREEN = $34;
  RIGHTRED = $38;
  CLEARLAMP = $30;

var
  frmDAIHAN_MAIN: TfrmDAIHAN_MAIN;

implementation

uses Common, Common_Frm, Common_Opt, Common_Xls, utDM, utPrint, utPassItem,
     utNotPicking, utRePrint, utPi;

{$R *.dfm}

function TfrmDAIHAN_MAIN.fn_PI_Color(Cell : integer): integer;
begin
  if Cell in [  7,  9, 11, 13, 15, 17, 19, 21, 23, 25,
               32, 34, 36, 38, 40, 42, 44, 46, 48, 50 ] then
        result := GREENON
  else  result := REDON;
end;

procedure TfrmDAIHAN_MAIN.pr_Clear_Board;
begin
  pnCount.Caption := '0';
  pnTotal.Caption := '0';

  L0Unit1.Caption:='';  L0Unit2.Caption:='';  L0Qty1.Caption:='';  L0Qty2.Caption:='';
  L1Unit1.Caption:='';  L1Unit2.Caption:='';  L1Qty1.Caption:='';  L1Qty2.Caption:='';
  L2Unit1.Caption:='';  L2Unit2.Caption:='';  L2Qty1.Caption:='';  L2Qty2.Caption:='';
  L3Unit1.Caption:='';  L3Unit2.Caption:='';  L3Qty1.Caption:='';  L3Qty2.Caption:='';
  L4Unit1.Caption:='';  L4Unit2.Caption:='';  L4Qty1.Caption:='';  L4Qty2.Caption:='';
  L5Unit1.Caption:='';  L5Unit2.Caption:='';  L5Qty1.Caption:='';  L5Qty2.Caption:='';
  L6Unit1.Caption:='';  L6Unit2.Caption:='';  L6Qty1.Caption:='';  L6Qty2.Caption:='';
  L7Unit1.Caption:='';  L7Unit2.Caption:='';  L7Qty1.Caption:='';  L7Qty2.Caption:='';
  L8Unit1.Caption:='';  L8Unit2.Caption:='';  L8Qty1.Caption:='';  L8Qty2.Caption:='';
  L9Unit1.Caption:='';  L9Unit2.Caption:='';  L9Qty1.Caption:='';  L9Qty2.Caption:='';

  L10Unit1.Caption:='';  L10Unit2.Caption:='';  L10Qty1.Caption:='';  L10Qty2.Caption:='';
  L11Unit1.Caption:='';  L11Unit2.Caption:='';  L11Qty1.Caption:='';  L11Qty2.Caption:='';
  L12Unit1.Caption:='';  L12Unit2.Caption:='';  L12Qty1.Caption:='';  L12Qty2.Caption:='';
  L13Unit1.Caption:='';  L13Unit2.Caption:='';  L13Qty1.Caption:='';  L13Qty2.Caption:='';
  L14Unit1.Caption:='';  L14Unit2.Caption:='';  L14Qty1.Caption:='';  L14Qty2.Caption:='';
  L15Unit1.Caption:='';  L15Unit2.Caption:='';  L15Qty1.Caption:='';  L15Qty2.Caption:='';
  L16Unit1.Caption:='';  L16Unit2.Caption:='';  L16Qty1.Caption:='';  L16Qty2.Caption:='';
  L17Unit1.Caption:='';  L17Unit2.Caption:='';  L17Qty1.Caption:='';  L17Qty2.Caption:='';
  L18Unit1.Caption:='';  L18Unit2.Caption:='';  L18Qty1.Caption:='';  L18Qty2.Caption:='';
  L19Unit1.Caption:='';  L19Unit2.Caption:='';  L19Qty1.Caption:='';  L19Qty2.Caption:='';
  L20Unit1.Caption:='';  L20Unit2.Caption:='';  L20Qty1.Caption:='';  L20Qty2.Caption:='';
  L21Unit1.Caption:='';  L21Unit2.Caption:='';  L21Qty1.Caption:='';  L21Qty2.Caption:='';
  L22Unit1.Caption:='';  L22Unit2.Caption:='';  L22Qty1.Caption:='';  L22Qty2.Caption:='';
  L23Unit1.Caption:='';  L23Unit2.Caption:='';  L23Qty1.Caption:='';  L23Qty2.Caption:='';
  L24Unit1.Caption:='';  L24Unit2.Caption:='';  L24Qty1.Caption:='';  L24Qty2.Caption:='';

  R0Unit1.Caption:='';  R0Unit2.Caption:='';  R0Qty1.Caption:='';  R0Qty2.Caption:='';
  R1Unit1.Caption:='';  R1Unit2.Caption:='';  R1Qty1.Caption:='';  R1Qty2.Caption:='';
  R2Unit1.Caption:='';  R2Unit2.Caption:='';  R2Qty1.Caption:='';  R2Qty2.Caption:='';
  R3Unit1.Caption:='';  R3Unit2.Caption:='';  R3Qty1.Caption:='';  R3Qty2.Caption:='';
  R4Unit1.Caption:='';  R4Unit2.Caption:='';  R4Qty1.Caption:='';  R4Qty2.Caption:='';
  R5Unit1.Caption:='';  R5Unit2.Caption:='';  R5Qty1.Caption:='';  R5Qty2.Caption:='';
  R6Unit1.Caption:='';  R6Unit2.Caption:='';  R6Qty1.Caption:='';  R6Qty2.Caption:='';
  R7Unit1.Caption:='';  R7Unit2.Caption:='';  R7Qty1.Caption:='';  R7Qty2.Caption:='';
  R8Unit1.Caption:='';  R8Unit2.Caption:='';  R8Qty1.Caption:='';  R8Qty2.Caption:='';
  R9Unit1.Caption:='';  R9Unit2.Caption:='';  R9Qty1.Caption:='';  R9Qty2.Caption:='';

  R10Unit1.Caption:='';  R10Unit2.Caption:='';  R10Qty1.Caption:='';  R10Qty2.Caption:='';
  R11Unit1.Caption:='';  R11Unit2.Caption:='';  R11Qty1.Caption:='';  R11Qty2.Caption:='';
  R12Unit1.Caption:='';  R12Unit2.Caption:='';  R12Qty1.Caption:='';  R12Qty2.Caption:='';
  R13Unit1.Caption:='';  R13Unit2.Caption:='';  R13Qty1.Caption:='';  R13Qty2.Caption:='';
  R14Unit1.Caption:='';  R14Unit2.Caption:='';  R14Qty1.Caption:='';  R14Qty2.Caption:='';
  R15Unit1.Caption:='';  R15Unit2.Caption:='';  R15Qty1.Caption:='';  R15Qty2.Caption:='';
  R16Unit1.Caption:='';  R16Unit2.Caption:='';  R16Qty1.Caption:='';  R16Qty2.Caption:='';
  R17Unit1.Caption:='';  R17Unit2.Caption:='';  R17Qty1.Caption:='';  R17Qty2.Caption:='';
  R18Unit1.Caption:='';  R18Unit2.Caption:='';  R18Qty1.Caption:='';  R18Qty2.Caption:='';
  R19Unit1.Caption:='';  R19Unit2.Caption:='';  R19Qty1.Caption:='';  R19Qty2.Caption:='';
  R20Unit1.Caption:='';  R20Unit2.Caption:='';  R20Qty1.Caption:='';  R20Qty2.Caption:='';
  R21Unit1.Caption:='';  R21Unit2.Caption:='';  R21Qty1.Caption:='';  R21Qty2.Caption:='';
  R22Unit1.Caption:='';  R22Unit2.Caption:='';  R22Qty1.Caption:='';  R22Qty2.Caption:='';
  R23Unit1.Caption:='';  R23Unit2.Caption:='';  R23Qty1.Caption:='';  R23Qty2.Caption:='';
  R24Unit1.Caption:='';  R24Unit2.Caption:='';  R24Qty1.Caption:='';  R24Qty2.Caption:='';

  Label7.Caption :='';  Label8.Caption :='';  Label9.Caption :=''; Label10.Caption :='';
  Label11.Caption :=''; Label12.Caption :=''; Label13.Caption :=''; Label14.Caption :='';
  Label15.Caption :=''; Label16.Caption :=''; Label17.Caption :=''; Label18.Caption :='';

  LabelPicker.Caption := '';
end;

procedure TfrmDAIHAN_MAIN.pr_Comm_HDSCAN_RX(Sender: TObject; Count: Integer);
var
  tBuff, strScanBuff : String;
  iCnt : Integer;

  procedure DelayUntill(Time :Word);
  var
    BeginCount :Longint;
  begin
    BeginCount := GetTickCount;
    repeat
      if pnTotal.Caption <= pnCount.Caption then BeginCount := 0;
      Application.ProcessMessages;
    until (GetTickCount-BeginCount) >= Time;
  end;

begin
  gcCOMM[giHDSCAN].ReadStr(tBuff, Count);
  for iCnt := 1 to Length(tBuff) do
  begin
    if Pos(Char(LF), tBuff[iCnt]) = 1 then
    begin
// 바코드 뒤에 공백이 있으셔...
      strScanBuff := Trim(gsSCAN_BAR_CD);
//      strScanBuff := gsSCAN_BAR_CD;
// 2011.07.21 S/W적인 Flag
//
      if stWorkItem <> '' then
      begin
        if trim(Edit4.Text) = stWorkItem then
        begin
          if pnTotal.Caption <= pnCount.Caption then
          begin
            try
              try
// 2011.10.14 ...먼저 전산처리을 해 놓고 ...
// 결과를 기다리시다..
                LetsPassUpdate;
              except
                strScanBuff := '';
                gsSCAN_BAR_CD := '';
                pr_Show_Board('RX_SCAN을 다시 하십시오.');
                exit;
              end;
            finally
// 2011.07.21 ... S/W적인 Flag
//
              stWorkItem := '';
              Set_log;
            end;
          end
          else
          begin
// 2012.04.02 ... OK 추가
//
            if (strScanBuff <> 'OFF') and (strScanBuff <> 'OK') then
            begin
              strScanBuff := '';
              gsSCAN_BAR_CD := '';
              pr_Show_Board('DAS 작업중인 상품이 있습니다.');
              exit;
            end;
          end;
        end
        else
        begin
// 2012.04.02 ... OK 추가
//
          if (strScanBuff <> 'OFF') and (strScanBuff <> 'OK')  then
          begin
            if strtoint(pnTotal.Caption) - strtoint(pnCount.Caption) <= 1 then DelayUntill(3000);
            if stWorkItem <> '' then
            begin
              strScanBuff := '';
              gsSCAN_BAR_CD := '';
              pr_Show_Board('RX_DAS 작업중인 상품이 있습니다.');
              exit;
            end;
          end;
        end;
      end;
// 2012.04.02 ... Ok 면 아이템은 찾지마라
//
      if (strScanBuff = 'OK') and (not PanelMessage.Visible) then
      begin
        Edit1.Text :='';
        strScanBuff := '';
        gsSCAN_BAR_CD := '';
        exit;
      end;
      Edit1.Text :='';
      Edit1.Text := strScanBuff;
      strScanBuff := '';
      gsSCAN_BAR_CD := '';
      BUTTON1.Click;
    end
    else
    begin
      gsSCAN_BAR_CD := gsSCAN_BAR_CD + tBuff[iCnt];
    end;
  end;

  Button16.SetFocus;
end;

procedure TfrmDAIHAN_MAIN.pr_Show_Board(cMessage : string);
begin
  beep;
  sleep(100);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, $41);
  LabelMessage.Caption := cMessage;
  PanelMessage.Visible := true;
  btnClose.SetFocus;
end;

procedure TfrmDAIHAN_MAIN.proc_print(CustCode : String);
begin
// 여기다 색을 입히자
// 이번에 프린트 해줄때마다  pos리턴값이 50->0보다 큰것으로 정함
       if pos(CustCode, L0Cust1.Caption) > 0 then L0Cust1.Transparent := false
  else if pos(CustCode, L1Cust1.Caption) > 0 then L1Cust1.Transparent := false
  else if pos(CustCode, L2Cust1.Caption) > 0 then L2Cust1.Transparent := false
  else if pos(CustCode, L3Cust1.Caption) > 0 then L3Cust1.Transparent := false
  else if pos(CustCode, L4Cust1.Caption) > 0 then L4Cust1.Transparent := false
  else if pos(CustCode, L5Cust1.Caption) > 0 then L5Cust1.Transparent := false
  else if pos(CustCode, L6Cust1.Caption) > 0 then L6Cust1.Transparent := false
  else if pos(CustCode, L7Cust1.Caption) > 0 then L7Cust1.Transparent := false
  else if pos(CustCode, L8Cust1.Caption) > 0 then L8Cust1.Transparent := false
  else if pos(CustCode, L9Cust1.Caption) > 0 then L9Cust1.Transparent := false
  else if pos(CustCode, L10Cust1.Caption) > 0 then L10Cust1.Transparent := false
  else if pos(CustCode, L11Cust1.Caption) > 0 then L11Cust1.Transparent := false
  else if pos(CustCode, L12Cust1.Caption) > 0 then L12Cust1.Transparent := false
  else if pos(CustCode, L13Cust1.Caption) > 0 then L13Cust1.Transparent := false
  else if pos(CustCode, L14Cust1.Caption) > 0 then L14Cust1.Transparent := false
  else if pos(CustCode, L15Cust1.Caption) > 0 then L15Cust1.Transparent := false
  else if pos(CustCode, L16Cust1.Caption) > 0 then L16Cust1.Transparent := false
  else if pos(CustCode, L17Cust1.Caption) > 0 then L17Cust1.Transparent := false
  else if pos(CustCode, L18Cust1.Caption) > 0 then L18Cust1.Transparent := false
  else if pos(CustCode, L19Cust1.Caption) > 0 then L19Cust1.Transparent := false
  else if pos(CustCode, L20Cust1.Caption) > 0 then L20Cust1.Transparent := false
  else if pos(CustCode, L21Cust1.Caption) > 0 then L21Cust1.Transparent := false
  else if pos(CustCode, L22Cust1.Caption) > 0 then L22Cust1.Transparent := false
  else if pos(CustCode, L23Cust1.Caption) > 0 then L23Cust1.Transparent := false
  else if pos(CustCode, L24Cust1.Caption) > 0 then L24Cust1.Transparent := false
  else if pos(CustCode, R0Cust1.Caption) > 0 then R0Cust1.Transparent := false
  else if pos(CustCode, R1Cust1.Caption) > 0 then R1Cust1.Transparent := false
  else if pos(CustCode, R2Cust1.Caption) > 0 then R2Cust1.Transparent := false
  else if pos(CustCode, R3Cust1.Caption) > 0 then R3Cust1.Transparent := false
  else if pos(CustCode, R4Cust1.Caption) > 0 then R4Cust1.Transparent := false
  else if pos(CustCode, R5Cust1.Caption) > 0 then R5Cust1.Transparent := false
  else if pos(CustCode, R6Cust1.Caption) > 0 then R6Cust1.Transparent := false
  else if pos(CustCode, R7Cust1.Caption) > 0 then R7Cust1.Transparent := false
  else if pos(CustCode, R8Cust1.Caption) > 0 then R8Cust1.Transparent := false
  else if pos(CustCode, R9Cust1.Caption) > 0 then R9Cust1.Transparent := false
  else if pos(CustCode, R10Cust1.Caption) > 0 then R10Cust1.Transparent := false
  else if pos(CustCode, R11Cust1.Caption) > 0 then R11Cust1.Transparent := false
  else if pos(CustCode, R12Cust1.Caption) > 0 then R12Cust1.Transparent := false
  else if pos(CustCode, R13Cust1.Caption) > 0 then R13Cust1.Transparent := false
  else if pos(CustCode, R14Cust1.Caption) > 0 then R14Cust1.Transparent := false
  else if pos(CustCode, R15Cust1.Caption) > 0 then R15Cust1.Transparent := false
  else if pos(CustCode, R16Cust1.Caption) > 0 then R16Cust1.Transparent := false
  else if pos(CustCode, R17Cust1.Caption) > 0 then R17Cust1.Transparent := false
  else if pos(CustCode, R18Cust1.Caption) > 0 then R18Cust1.Transparent := false
  else if pos(CustCode, R19Cust1.Caption) > 0 then R19Cust1.Transparent := false
  else if pos(CustCode, R20Cust1.Caption) > 0 then R20Cust1.Transparent := false
  else if pos(CustCode, R21Cust1.Caption) > 0 then R21Cust1.Transparent := false
  else if pos(CustCode, R22Cust1.Caption) > 0 then R22Cust1.Transparent := false
  else if pos(CustCode, R23Cust1.Caption) > 0 then R23Cust1.Transparent := false
  else if pos(CustCode, R24Cust1.Caption) > 0 then R24Cust1.Transparent := false;

  if Pos(CustCode, PrintOutCust) = 0 then
  begin
// 2011.09.30 ... Printing 중에 Scan을 시도하다
//
    stWorkItem := '';

    frmPrint := TfrmPrint.Create(Self);
    try
      frmPrint.qrPrint.Close;
      frmPrint.qrPrint.Params[0].AsString := Label6.Caption;
      frmPrint.qrPrint.Params[1].AsString := CustCode;
      frmPrint.qrPrint.Open;
      frmPrint.Print;
      ShowProgress;
// 2011.07.06 ... 두번 인쇄되는 현상 방지
//
      PrintOutCust := PrintOutCust+ CustCode+ '^';
    finally
      frmPrint.Free;
    end;
  end;
end;

procedure TfrmDAIHAN_MAIN.MainDraw(isFirst : Boolean);
VAR
  cell : integer;

  procedure DisplayLabel(lblCust, lblCount, lblWork: TLabel; isFirst : Boolean);
  var
    tmpChar : String;
  begin
    if isFirst then
    begin
//      lblCust.Caption := format('%-50s', [qrltemPickQty.FieldValues['CUST_NAME']]) + ' ' + qrltemPickQty.FieldValues['CUST_CODE'];
      tmpChar := qrltemPickQty.FieldValues['CUST_NAME'];
      // 2016-02-03 dyddyd 자동줄바꿈 추가 2줄까지만 출력하도록함 - 이규택요청
      // 기본 width 76 height 18
      if Length(tmpChar) > 12 then
      begin
        lblCust.Caption := Copy(tmpChar,0,6) + #13#10 + Copy(tmpChar,7,12) + #13#10 + qrltemPickQty.FieldValues['CUST_CODE'];
        lblCust.Height := 24;
        lblCust.Layout := tlTop;
      end
      else if Length(tmpChar) > 6 then
      begin
        lblCust.Caption := Copy(tmpChar,0,6) + #13#10 + Copy(tmpChar,7,Length(tmpChar)) + #13#10 + qrltemPickQty.FieldValues['CUST_CODE'];
        lblCust.Height := 24;
        lblCust.Layout := tlTop;
      end
      else
      begin
        lblCust.Caption := Copy(tmpChar,0,6) + #13#10#13#10 + qrltemPickQty.FieldValues['CUST_CODE'];
        lblCust.Layout := tlTop;
      end;
    end;
    lblCount.Caption := qrltemPickQty.FieldValues['ITEM_COUNT'];
    lblWork.Caption := qrltemPickQty.FieldValues['DONE_COUNT'];
  // 여기다 색을 입히자
    if lblCount.Caption = lblWork.Caption then
    begin
  // 2011.06.07
  // 이전에 안바뀐거지...
  //
      if (not isFirst) and (lblCust.Transparent) then proc_print(qrltemPickQty.FieldValues['CUST_CODE']);

      lblCust.Transparent := false;
  // 2011.07.06
  // isFisrt면 누적해놔야지
      if (isFirst) and (lblCust.Transparent = false) then PrintOutCust := PrintOutCust+ qrltemPickQty.FieldValues['CUST_CODE']+ '^';
    end;
  end;

begin
//  RichEdit1.Lines.Add('qrltemPickQty_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qrltemPickQty.Close;
  qrltemPickQty.Params[0].AsString := frmLogIn.order_dt;
  qrltemPickQty.Open;

  if gcCOMM[giHDSCAN].Connected = True then gcCOMM[giHDSCAN].OnRxChar := pr_Comm_HDSCAN_RX;

  Application.ProcessMessages;
//  RichEdit1.Lines.Add('qrltemPickQty_Wh: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  while not qrltemPickQty.Eof do
  begin
    cell := qrltemPickQty.FieldValues['CELL_RESTORE'];
    CASE cell of
    01: DisplayLabel(L0Cust1, L0C, L0W, isFirst);
    02: DisplayLabel(L1Cust1, L1C, L1W, isFirst);
    03: DisplayLabel(L2Cust1, L2C, L2W, isFirst);
    04: DisplayLabel(L3Cust1, L3C, L3W, isFirst);
    05: DisplayLabel(L4Cust1, L4C, L4W, isFirst);
    06: DisplayLabel(L5Cust1, L5C, L5W, isFirst);
    07: DisplayLabel(L6Cust1, L6C, L6W, isFirst);
    08: DisplayLabel(L7Cust1, L7C, L7W, isFirst);
    09: DisplayLabel(L8Cust1, L8C, L8W, isFirst);
    10: DisplayLabel(L9Cust1, L9C, L9W, isFirst);
    11: DisplayLabel(L10Cust1, L10C, L10W, isFirst);
    12: DisplayLabel(L11Cust1, L11C, L11W, isFirst);
    13: DisplayLabel(L12Cust1, L12C, L12W, isFirst);
    14: DisplayLabel(L13Cust1, L13C, L13W, isFirst);
    15: DisplayLabel(L14Cust1, L14C, L14W, isFirst);
    16: DisplayLabel(L15Cust1, L15C, L15W, isFirst);
    17: DisplayLabel(L16Cust1, L16C, L16W, isFirst);
    18: DisplayLabel(L17Cust1, L17C, L17W, isFirst);
    19: DisplayLabel(L18Cust1, L18C, L18W, isFirst);
    20: DisplayLabel(L19Cust1, L19C, L19W, isFirst);
    21: DisplayLabel(L20Cust1, L20C, L20W, isFirst);
    22: DisplayLabel(L21Cust1, L21C, L21W, isFirst);
    23: DisplayLabel(L22Cust1, L22C, L22W, isFirst);
    24: DisplayLabel(L23Cust1, L23C, L23W, isFirst);
    25: DisplayLabel(L24Cust1, L24C, L24W, isFirst);
    26: DisplayLabel(R0Cust1, R0C, R0W, isFirst);
    27: DisplayLabel(R1Cust1, R1C, R1W, isFirst);
    28: DisplayLabel(R2Cust1, R2C, R2W, isFirst);
    29: DisplayLabel(R3Cust1, R3C, R3W, isFirst);
    30: DisplayLabel(R4Cust1, R4C, R4W, isFirst);
    31: DisplayLabel(R5Cust1, R5C, R5W, isFirst);
    32: DisplayLabel(R6Cust1, R6C, R6W, isFirst);
    33: DisplayLabel(R7Cust1, R7C, R7W, isFirst);
    34: DisplayLabel(R8Cust1, R8C, R8W, isFirst);
    35: DisplayLabel(R9Cust1, R9C, R9W, isFirst);
    36: DisplayLabel(R10Cust1, R10C, R10W, isFirst);
    37: DisplayLabel(R11Cust1, R11C, R11W, isFirst);
    38: DisplayLabel(R12Cust1, R12C, R12W, isFirst);
    39: DisplayLabel(R13Cust1, R13C, R13W, isFirst);
    40: DisplayLabel(R14Cust1, R14C, R14W, isFirst);
    41: DisplayLabel(R15Cust1, R15C, R15W, isFirst);
    42: DisplayLabel(R16Cust1, R16C, R16W, isFirst);
    43: DisplayLabel(R17Cust1, R17C, R17W, isFirst);
    44: DisplayLabel(R18Cust1, R18C, R18W, isFirst);
    45: DisplayLabel(R19Cust1, R19C, R19W, isFirst);
    46: DisplayLabel(R20Cust1, R20C, R20W, isFirst);
    47: DisplayLabel(R21Cust1, R21C, R21W, isFirst);
    48: DisplayLabel(R22Cust1, R22C, R22W, isFirst);
    49: DisplayLabel(R23Cust1, R23C, R23W, isFirst);
    50: DisplayLabel(R24Cust1, R24C, R24W, isFirst);
    END;
    qrltemPickQty.Next;
  end;
  qrltemPickQty.Close;
//  RichEdit1.Lines.Add('qrltemPickQty_E: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );

  ShowProgress;
end;

procedure TfrmDAIHAN_MAIN.ShowProgress;
begin
  qryStatusProgress.Close;
  qryStatusProgress.Params[0].AsString := frmLogin.order_dt;
  qryStatusProgress.Open;
  if qryStatusProgress.RecordCount < 1 then
    fgDas.MaxValue := 0
  else
  begin
    fgDas.MaxValue := qryStatusProgress.FieldValues['TCOUNT'];
    fgDas.Progress := qryStatusProgress.FieldValues['SCOUNT'];
  end;
  qryStatusProgress.Close;
  Application.ProcessMessages;
end;

procedure TfrmDAIHAN_MAIN.FormCreate(Sender: TObject);
var
  i : integer;
begin
  Left := 0;
  Top := 0;

  pr_Clear_Board;
  PanelMessage.Visible := false;
  fgDas.Progress := 0;
  PrintOutCust := '';

  for i := PISTART to PIEND do
  begin
    func_GetPiOff(gcCOMM[giBCU1], 1,  i);
  end;
  sleep(200);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);
  Application.ProcessMessages;

  MainDraw(true);

  stWorkItem := '';

  if dmDMS.Database1.Params.Values['SERVER NAME'] = '52.79.56.98' then Button16.Visible := True;
end;

procedure TfrmDAIHAN_MAIN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Inherited;
  Action := caFree;
end;

procedure TfrmDAIHAN_MAIN.FormDestroy(Sender: TObject);
begin
  if pnTotal.Caption <> '0' then Write_Set_log('CLOSE');
end;

procedure TfrmDAIHAN_MAIN.Write_Set_log(cCondition : string);
VAR
  ORDER_UNIT_EA : STRING;
begin
// 현재(2011.07.21)로서는 삭제하는 것이 옳은 듯...
//
  exit;

  IF Label12.Caption = '' THEN
    ORDER_UNIT_EA := Label13.Caption
  ELSE IF  Label13.Caption = '' THEN
    ORDER_UNIT_EA := Label12.Caption;

  qrDASLOG.Close;
  if cCondition = 'CLOSE' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :=Wcust_code;
    qrDASLOG.Params[2].AsString :=IntToStr(Wcell);
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :='닫기';
    qrDASLOG.Params[7].AsString :=Wunit;
    qrDASLOG.Params[8].AsInteger:=Wqty;
    qrDASLOG.Params[9].AsString :=pnCount.Caption+'/'+pnTotal.Caption;
    qrDASLOG.Params[10].AsString:='Y';
    qrDASLOG.ExecSQL;
  end
  else if cCondition = 'NORMAL' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :=Wcust_code;
    qrDASLOG.Params[2].AsString :=IntToStr(Wcell);
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :=Wunit;
    qrDASLOG.Params[8].AsInteger:=Wqty;
    qrDASLOG.Params[9].AsString :=ORDER_UNIT_EA;
    qrDASLOG.Params[10].AsString:='Y';
    qrDASLOG.ExecSQL;
  end
  else if cCondition = 'CANCEL' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :='';
    qrDASLOG.Params[2].AsString :='';
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :='';
    qrDASLOG.Params[8].AsInteger:=0;
    qrDASLOG.Params[9].AsString :=Label12.Caption;
    qrDASLOG.Params[10].AsString:='C';
    qrDASLOG.ExecSQL;
  end
  else if cCondition = 'NO-DAS' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :='';
    qrDASLOG.Params[2].AsString :='';
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :='';
    qrDASLOG.Params[8].AsInteger:=0;
    qrDASLOG.Params[9].AsString :=Label12.Caption;
    qrDASLOG.Params[10].AsString:='N';
    qrDASLOG.ExecSQL;
 end
  else if cCondition = 'NO-ORDER' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :='';
    qrDASLOG.Params[2].AsString :='';
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :='';
    qrDASLOG.Params[8].AsInteger:=0;
    qrDASLOG.Params[9].AsString :=Label12.Caption;
    qrDASLOG.Params[10].AsString:='N';
    qrDASLOG.ExecSQL;
  end
  else if cCondition = 'NOT-PICK' then
  begin
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :='';
    qrDASLOG.Params[2].AsString :='';
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :='';
    qrDASLOG.Params[8].AsInteger:=0;
    qrDASLOG.Params[9].AsString :=Label12.Caption;
    qrDASLOG.Params[10].AsString:='N';
    qrDASLOG.ExecSQL;
  end
  else if copy(cCondition,1,7) = 'DISPLAY' then
  begin
    ORDER_UNIT_EA := copy(cCondition,9,100);
    qrDASLOG.Params[0].AsString :=Label6.Caption;
    qrDASLOG.Params[1].AsString :='';
    qrDASLOG.Params[2].AsString :=IntToStr(Wcell);
    qrDASLOG.Params[3].AsString :=Edit1.Text;
    qrDASLOG.Params[4].AsString :=Edit2.Text;
    qrDASLOG.Params[5].AsString :=Edit4.Text;
    qrDASLOG.Params[6].AsString :=Edit3.Text;
    qrDASLOG.Params[7].AsString :=copy(ORDER_UNIT_EA,1,pos('|',ORDER_UNIT_EA)-1);
    ORDER_UNIT_EA := copy(ORDER_UNIT_EA,pos('|',ORDER_UNIT_EA)+1,100);
    qrDASLOG.Params[8].AsInteger:=strtoint(copy(ORDER_UNIT_EA,1,pos('|',ORDER_UNIT_EA)-1));
    qrDASLOG.Params[9].AsString :=Label12.Caption;
    qrDASLOG.Params[10].AsString:='D';
    qrDASLOG.ExecSQL;
  end;
end;

procedure TfrmDAIHAN_MAIN.Set_log;
begin
  Write_Set_log('NORMAL');
end;

procedure TfrmDAIHAN_MAIN.Button2Click(Sender: TObject);
var
  i : Integer;
begin
  Write_Set_log('CANCEL');

// 2011.10.14 ...먼저 전산처리을 해 놓고 ...
// 결과를 기다리시다..
  LetsPassRecall;

  for i := PISTART to PIEND do
  begin
    func_GetPiOff(gcCOMM[giBCU1], 1,  i);
  end;
  sleep(200);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);

  btnPass.Click;
  stItem_Code := '';
  stWorkItem := '';
end;

procedure TfrmDAIHAN_MAIN.Button3Click(Sender: TObject);
var
  i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDON, 'C    1');
  end;
end; // 조금 자다가 5시에 올게요 졸려서 암것도 안보여요

procedure TfrmDAIHAN_MAIN.Button4Click(Sender: TObject);
var
  i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', GREENON, 'C    1');
  end;
end;

procedure TfrmDAIHAN_MAIN.Button5Click(Sender: TObject);
var
  i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDGREENON, 'S    1');
  end;
end;

procedure TfrmDAIHAN_MAIN.Button6Click(Sender: TObject);
var
    i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDFLASH, 'E    1');
  end;
end;

procedure TfrmDAIHAN_MAIN.Button7Click(Sender: TObject);
var
  i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', GREENFLASH, '1    1');
  end;
end;

procedure TfrmDAIHAN_MAIN.Button8Click(Sender: TObject);
var
  i : Integer;
begin
  for i := PISTART to  PIEND do
  begin
    func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDGREENFLASH, '2    1');
  end;
end;

procedure TfrmDAIHAN_MAIN.LetsPassUpdate;
begin
  qryPassUpdate.Close;
  qryPassUpdate.Params[0].AsString := trim(copy(Label4.Caption, 1, 10));
  qryPassUpdate.Params[1].AsString := Label6.Caption;
  qryPassUpdate.Params[2].AsString := trim(Edit4.Text);
  qryPassUpdate.ExecSQL;
  Application.ProcessMessages;
end;

procedure TfrmDAIHAN_MAIN.LetsPassRecall;
begin
  if ( trim(Label4.Caption) = '' ) or ( trim(Label6.Caption) = '' ) or
     ( trim(Edit4.Text) = '' ) then
    exit;
    
  qryPassRecall.Close;
  qryPassRecall.Params[0].AsString := trim(copy(Label4.Caption, 1, 10));
  qryPassRecall.Params[1].AsString := Label6.Caption;
  qryPassRecall.Params[2].AsString := trim(Edit4.Text);
  qryPassRecall.ExecSQL;
  Application.ProcessMessages;
end;

procedure TfrmDAIHAN_MAIN.timBCUTimer(Sender: TObject);
var
  buff : Array[0..45] of Byte;

  procedure PassUpdate(lblCust, lblMast, lblCount : TLabel);
  begin
  // 2011.10.14 ...먼저 전산처리을 해 놓고 ...
  // 결과를 기다리시다..
    LetsPassUpdate;

  // 마지막 분류후에 입수내역서 인쇄를 위해
  //
    if lblMast.Caption = lblCount.Caption then
    begin
      Wcust_Count:=Wcust_Count-1;
      Application.ProcessMessages;
      // 2016-04-29 dyddyd  Cust1.Caption 에서 줄바꿈처리하여 생긴 문자로 고객번호를 잘라넣기때문에수정함  proc_print(copy( L0Cust1.Caption, 51, 20));
      if ( L0C.Caption =  L0W.Caption) and ( L0C.Caption <> '') and ( L0Cust1.Transparent) then proc_print(copy( L0Cust1.Caption, LastDelimiter(#13#10,  L0Cust1.Caption)+1, 20));
      if ( L1C.Caption =  L1W.Caption) and ( L1C.Caption <> '') and ( L1Cust1.Transparent) then proc_print(copy( L1Cust1.Caption, LastDelimiter(#13#10,  L1Cust1.Caption)+1, 20));
      if ( L2C.Caption =  L2W.Caption) and ( L2C.Caption <> '') and ( L2Cust1.Transparent) then proc_print(copy( L2Cust1.Caption, LastDelimiter(#13#10,  L2Cust1.Caption)+1, 20));
      if ( L3C.Caption =  L3W.Caption) and ( L3C.Caption <> '') and ( L3Cust1.Transparent) then proc_print(copy( L3Cust1.Caption, LastDelimiter(#13#10,  L3Cust1.Caption)+1, 20));
      if ( L4C.Caption =  L4W.Caption) and ( L4C.Caption <> '') and ( L4Cust1.Transparent) then proc_print(copy( L4Cust1.Caption, LastDelimiter(#13#10,  L4Cust1.Caption)+1, 20));
      if ( L5C.Caption =  L5W.Caption) and ( L5C.Caption <> '') and ( L5Cust1.Transparent) then proc_print(copy( L5Cust1.Caption, LastDelimiter(#13#10,  L5Cust1.Caption)+1, 20));
      if ( L6C.Caption =  L6W.Caption) and ( L6C.Caption <> '') and ( L6Cust1.Transparent) then proc_print(copy( L6Cust1.Caption, LastDelimiter(#13#10,  L6Cust1.Caption)+1, 20));
      if ( L7C.Caption =  L7W.Caption) and ( L7C.Caption <> '') and ( L7Cust1.Transparent) then proc_print(copy( L7Cust1.Caption, LastDelimiter(#13#10,  L7Cust1.Caption)+1, 20));
      if ( L8C.Caption =  L8W.Caption) and ( L8C.Caption <> '') and ( L8Cust1.Transparent) then proc_print(copy( L8Cust1.Caption, LastDelimiter(#13#10,  L8Cust1.Caption)+1, 20));
      if ( L9C.Caption =  L9W.Caption) and ( L9C.Caption <> '') and ( L9Cust1.Transparent) then proc_print(copy( L9Cust1.Caption, LastDelimiter(#13#10,  L9Cust1.Caption)+1, 20));
      if (L10C.Caption = L10W.Caption) and (L10C.Caption <> '') and (L10Cust1.Transparent) then proc_print(copy(L10Cust1.Caption, LastDelimiter(#13#10, L10Cust1.Caption)+1, 20));
      if (L11C.Caption = L11W.Caption) and (L11C.Caption <> '') and (L11Cust1.Transparent) then proc_print(copy(L11Cust1.Caption, LastDelimiter(#13#10, L11Cust1.Caption)+1, 20));
      if (L12C.Caption = L12W.Caption) and (L12C.Caption <> '') and (L12Cust1.Transparent) then proc_print(copy(L12Cust1.Caption, LastDelimiter(#13#10, L12Cust1.Caption)+1, 20));
      if (L13C.Caption = L13W.Caption) and (L13C.Caption <> '') and (L13Cust1.Transparent) then proc_print(copy(L13Cust1.Caption, LastDelimiter(#13#10, L13Cust1.Caption)+1, 20));
      if (L14C.Caption = L14W.Caption) and (L14C.Caption <> '') and (L14Cust1.Transparent) then proc_print(copy(L14Cust1.Caption, LastDelimiter(#13#10, L14Cust1.Caption)+1, 20));
      if (L15C.Caption = L15W.Caption) and (L15C.Caption <> '') and (L15Cust1.Transparent) then proc_print(copy(L15Cust1.Caption, LastDelimiter(#13#10, L15Cust1.Caption)+1, 20));
      if (L16C.Caption = L16W.Caption) and (L16C.Caption <> '') and (L16Cust1.Transparent) then proc_print(copy(L16Cust1.Caption, LastDelimiter(#13#10, L16Cust1.Caption)+1, 20));
      if (L17C.Caption = L17W.Caption) and (L17C.Caption <> '') and (L17Cust1.Transparent) then proc_print(copy(L17Cust1.Caption, LastDelimiter(#13#10, L17Cust1.Caption)+1, 20));
      if (L18C.Caption = L18W.Caption) and (L18C.Caption <> '') and (L18Cust1.Transparent) then proc_print(copy(L18Cust1.Caption, LastDelimiter(#13#10, L18Cust1.Caption)+1, 20));
      if (L19C.Caption = L19W.Caption) and (L19C.Caption <> '') and (L19Cust1.Transparent) then proc_print(copy(L19Cust1.Caption, LastDelimiter(#13#10, L19Cust1.Caption)+1, 20));
      if (L20C.Caption = L20W.Caption) and (L20C.Caption <> '') and (L20Cust1.Transparent) then proc_print(copy(L20Cust1.Caption, LastDelimiter(#13#10, L20Cust1.Caption)+1, 20));
      if (L21C.Caption = L21W.Caption) and (L21C.Caption <> '') and (L21Cust1.Transparent) then proc_print(copy(L21Cust1.Caption, LastDelimiter(#13#10, L21Cust1.Caption)+1, 20));
      if (L22C.Caption = L22W.Caption) and (L22C.Caption <> '') and (L22Cust1.Transparent) then proc_print(copy(L22Cust1.Caption, LastDelimiter(#13#10, L22Cust1.Caption)+1, 20));
      if (L23C.Caption = L23W.Caption) and (L23C.Caption <> '') and (L23Cust1.Transparent) then proc_print(copy(L23Cust1.Caption, LastDelimiter(#13#10, L23Cust1.Caption)+1, 20));
      if (L24C.Caption = L24W.Caption) and (L24C.Caption <> '') and (L24Cust1.Transparent) then proc_print(copy(L24Cust1.Caption, LastDelimiter(#13#10, L24Cust1.Caption)+1, 20));
      if ( R0C.Caption =  R0W.Caption) and ( R0C.Caption <> '') and ( R0Cust1.Transparent) then proc_print(copy( R0Cust1.Caption, LastDelimiter(#13#10,  R0Cust1.Caption)+1, 20));
      if ( R1C.Caption =  R1W.Caption) and ( R1C.Caption <> '') and ( R1Cust1.Transparent) then proc_print(copy( R1Cust1.Caption, LastDelimiter(#13#10,  R1Cust1.Caption)+1, 20));
      if ( R2C.Caption =  R2W.Caption) and ( R2C.Caption <> '') and ( R2Cust1.Transparent) then proc_print(copy( R2Cust1.Caption, LastDelimiter(#13#10,  R2Cust1.Caption)+1, 20));
      if ( R3C.Caption =  R3W.Caption) and ( R3C.Caption <> '') and ( R3Cust1.Transparent) then proc_print(copy( R3Cust1.Caption, LastDelimiter(#13#10,  R3Cust1.Caption)+1, 20));
      if ( R4C.Caption =  R4W.Caption) and ( R4C.Caption <> '') and ( R4Cust1.Transparent) then proc_print(copy( R4Cust1.Caption, LastDelimiter(#13#10,  R4Cust1.Caption)+1, 20));
      if ( R5C.Caption =  R5W.Caption) and ( R5C.Caption <> '') and ( R5Cust1.Transparent) then proc_print(copy( R5Cust1.Caption, LastDelimiter(#13#10,  R5Cust1.Caption)+1, 20));
      if ( R6C.Caption =  R6W.Caption) and ( R6C.Caption <> '') and ( R6Cust1.Transparent) then proc_print(copy( R6Cust1.Caption, LastDelimiter(#13#10,  R6Cust1.Caption)+1, 20));
      if ( R7C.Caption =  R7W.Caption) and ( R7C.Caption <> '') and ( R7Cust1.Transparent) then proc_print(copy( R7Cust1.Caption, LastDelimiter(#13#10,  R7Cust1.Caption)+1, 20));
      if ( R8C.Caption =  R8W.Caption) and ( R8C.Caption <> '') and ( R8Cust1.Transparent) then proc_print(copy( R8Cust1.Caption, LastDelimiter(#13#10,  R8Cust1.Caption)+1, 20));
      if ( R9C.Caption =  R9W.Caption) and ( R9C.Caption <> '') and ( R9Cust1.Transparent) then proc_print(copy( R9Cust1.Caption, LastDelimiter(#13#10,  R9Cust1.Caption)+1, 20));
      if (R10C.Caption = R10W.Caption) and (R10C.Caption <> '') and (R10Cust1.Transparent) then proc_print(copy(R10Cust1.Caption, LastDelimiter(#13#10, R10Cust1.Caption)+1, 20));
      if (R11C.Caption = R11W.Caption) and (R11C.Caption <> '') and (R11Cust1.Transparent) then proc_print(copy(R11Cust1.Caption, LastDelimiter(#13#10, R11Cust1.Caption)+1, 20));
      if (R12C.Caption = R12W.Caption) and (R12C.Caption <> '') and (R12Cust1.Transparent) then proc_print(copy(R12Cust1.Caption, LastDelimiter(#13#10, R12Cust1.Caption)+1, 20));
      if (R13C.Caption = R13W.Caption) and (R13C.Caption <> '') and (R13Cust1.Transparent) then proc_print(copy(R13Cust1.Caption, LastDelimiter(#13#10, R13Cust1.Caption)+1, 20));
      if (R14C.Caption = R14W.Caption) and (R14C.Caption <> '') and (R14Cust1.Transparent) then proc_print(copy(R14Cust1.Caption, LastDelimiter(#13#10, R14Cust1.Caption)+1, 20));
      if (R15C.Caption = R15W.Caption) and (R15C.Caption <> '') and (R15Cust1.Transparent) then proc_print(copy(R15Cust1.Caption, LastDelimiter(#13#10, R15Cust1.Caption)+1, 20));
      if (R16C.Caption = R16W.Caption) and (R16C.Caption <> '') and (R16Cust1.Transparent) then proc_print(copy(R16Cust1.Caption, LastDelimiter(#13#10, R16Cust1.Caption)+1, 20));
      if (R17C.Caption = R17W.Caption) and (R17C.Caption <> '') and (R17Cust1.Transparent) then proc_print(copy(R17Cust1.Caption, LastDelimiter(#13#10, R17Cust1.Caption)+1, 20));
      if (R18C.Caption = R18W.Caption) and (R18C.Caption <> '') and (R18Cust1.Transparent) then proc_print(copy(R18Cust1.Caption, LastDelimiter(#13#10, R18Cust1.Caption)+1, 20));
      if (R19C.Caption = R19W.Caption) and (R19C.Caption <> '') and (R19Cust1.Transparent) then proc_print(copy(R19Cust1.Caption, LastDelimiter(#13#10, R19Cust1.Caption)+1, 20));
      if (R20C.Caption = R20W.Caption) and (R20C.Caption <> '') and (R20Cust1.Transparent) then proc_print(copy(R20Cust1.Caption, LastDelimiter(#13#10, R20Cust1.Caption)+1, 20));
      if (R21C.Caption = R21W.Caption) and (R21C.Caption <> '') and (R21Cust1.Transparent) then proc_print(copy(R21Cust1.Caption, LastDelimiter(#13#10, R21Cust1.Caption)+1, 20));
      if (R22C.Caption = R22W.Caption) and (R22C.Caption <> '') and (R22Cust1.Transparent) then proc_print(copy(R22Cust1.Caption, LastDelimiter(#13#10, R22Cust1.Caption)+1, 20));
      if (R23C.Caption = R23W.Caption) and (R23C.Caption <> '') and (R23Cust1.Transparent) then proc_print(copy(R23Cust1.Caption, LastDelimiter(#13#10, R23Cust1.Caption)+1, 20));
      if (R24C.Caption = R24W.Caption) and (R24C.Caption <> '') and (R24Cust1.Transparent) then proc_print(copy(R24Cust1.Caption, LastDelimiter(#13#10, R24Cust1.Caption)+1, 20));
    end;
  // Test 용
    if Memo1.Visible then Button11Click(sender);
  end;

  function RetQty(wPick : string): string;
  begin
    if length(trim(wPick)) = 1      then Result := '    '+ wPick
    else if length(trim(wPick)) = 2 then Result := '   '+ wPick
    else if length(trim(wPick)) = 3 then Result := '  '+ wPick
    else if length(trim(wPick)) = 4 then Result := ' '+ wPick
    else if length(trim(wPick)) = 5 then Result :=   wPick;
  end;

  procedure PassOut(Cell : integer; lblCust, lblMast, lblCount, lblUnit1, lblTop, lblUnit2, lblBottom : TLabel);
  begin
  // 첫번째 신호인지 확인하고..

    if (lblTop.Caption <> '') AND (POS('*', lblTop.Caption) < 1) THEN
    begin
      Wcust_code := lblCust.Caption;
      Wunit := lblUnit1.Caption;
      Wqty := StrToInt(lblTop.Caption);
      lblTop.Caption := lblTop.Caption + '*';
      //if (POS('**', lblTop.Caption) > 0)  then exit;
      lblCount.Caption := IntToStr(strToInt(lblCount.Caption)+1);
      pnCount.Caption := inttostr(strtoint(pnCount.Caption) + 1);
      Application.ProcessMessages;
      if (lblBottom.Caption <> '') and (POS('*', lblBottom.Caption) < 1) THEN
      begin
        Wcust_code := lblCust.Caption;
        Wunit := lblUnit2.Caption;
        Wqty := StrToInt(lblBottom.Caption);
  //      Button3.Click;
        func_GetPiOff(gcCOMM[giBCU1], 1,  wcell);
        sleep(100);
        func_PutDataPi(gcCOMM[giBCU1], 1,  wcell,  1,  '0', fn_PI_Color(Cell), copy(lblUnit2.caption,1,1)+ RetQty(lblBottom.Caption));
        sleep(30);
        func_PutDataPi(gcCOMM[giBCU1], 1,  wcell,  1,  '0', fn_PI_Color(Cell), copy(lblUnit2.caption,1,1)+ RetQty(lblBottom.Caption));
        Application.ProcessMessages;
        exit;
      end
      else
      begin
        if pnTotal.Caption <= pnCount.Caption then
        begin
          PassUpdate(lblCust, lblMast, lblCount);
  // 2011.07.21 S/W적인 Flag
  //
          stWorkItem := '';
          Set_log;
        end;
      end;
    end;
  // 아니네... 쩝 그니까 아래 신호군요.
  //else
    if (lblBottom.Caption <> '') AND (POS('*', lblBottom.Caption) < 1) THEN
    begin
      Wcust_code := lblCust.Caption;
      Wunit := lblUnit2.Caption;
      Wqty :=StrToInt(lblBottom.Caption);
      lblBottom.Caption := lblBottom.Caption+ '*';
  // if (POS('*', lblBottom.Caption) > 1)  then exit;
  //이따가 보자
  //
      lblCount.Caption := IntToStr(strToInt(lblCount.Caption)+1);
      pnCount.Caption := inttostr(strtoint(pnCount.Caption) + 1);
      Application.ProcessMessages;
      if pnTotal.Caption <= pnCount.Caption then
      begin
        PassUpdate(lblCust, lblMast, lblCount);
  // 2011.07.21 S/W적인 Flag
  //
        stWorkItem := '';
        Set_log;
      end;
    end;

  //else
    if (lblTop.Caption <> '') AND (POS('*', lblTop.Caption) < 1) THEN
    begin
      Wcust_code := lblCust.Caption;
      Wunit := lblUnit1.Caption;
      Wqty := StrToInt(lblTop.Caption);
      lblTop.Caption := lblTop.Caption+ '*';
  // if (POS('*', lblBottom.Caption) > 1)  then exit;
  //이따가 보자
  //
      lblCount.Caption := IntToStr(strToInt(lblCount.Caption)+1);
      pnCount.Caption := inttostr(strtoint(pnCount.Caption) + 1);
      Application.ProcessMessages;
      if pnTotal.Caption <= pnCount.Caption then
      begin
        PassUpdate(lblCust, lblMast, lblCount);
  // 2011.07.21 S/W적인 Flag
  //
          stWorkItem := '';
        Set_log;
      end;
    end ;
    Application.ProcessMessages;
  end;

begin
  timBCU.Enabled := False;
  if func_GetPiSts( gcCOMM[giBCU1], 1, giPI_CNT, Buff) then
  begin
    // 2016-04-27 dyddyd 테스트시 giPI_CNT 를 넣기 위해 Button11.Caption 에 PI번호를 넣어줌
    // if (Buff[6] = 49) then
    if (Buff[6] = 49) or ((giPI_CNT = StrToInt(Button11.Caption)) and (StrToInt(Button11.Caption) <> 0)) then
    begin
//      proc_MemoLog(memRcv,'PI 상태',IntToStr(1) + '번 BCU ID ' + IntToStr(giPI_CNT) + '번 PI 눌림', 'log_bcu');
      Wcell := giPI_CNT;

      CASE giPI_CNT OF
       01: PassOut(giPI_CNT, L0Cust1, L0C, L0W, L0Unit1, L0Qty1, L0Unit2, L0Qty2);
       02: PassOut(giPI_CNT, L1Cust1, L1C, L1W, L1Unit1, L1Qty1, L1Unit2, L1Qty2);
       03: PassOut(giPI_CNT, L2Cust1, L2C, L2W, L2Unit1, L2Qty1, L2Unit2, L2Qty2);
       04: PassOut(giPI_CNT, L3Cust1, L3C, L3W, L3Unit1, L3Qty1, L3Unit2, L3Qty2);
       05: PassOut(giPI_CNT, L4Cust1, L4C, L4W, L4Unit1, L4Qty1, L4Unit2, L4Qty2);
       06: PassOut(giPI_CNT, L5Cust1, L5C, L5W, L5Unit1, L5Qty1, L5Unit2, L5Qty2);
       07: PassOut(giPI_CNT, L6Cust1, L6C, L6W, L6Unit1, L6Qty1, L6Unit2, L6Qty2);
       08: PassOut(giPI_CNT, L7Cust1, L7C, L7W, L7Unit1, L7Qty1, L7Unit2, L7Qty2);
       09: PassOut(giPI_CNT, L8Cust1, L8C, L8W, L8Unit1, L8Qty1, L8Unit2, L8Qty2);
       10: PassOut(giPI_CNT, L9Cust1, L9C, L9W, L9Unit1, L9Qty1, L9Unit2, L9Qty2);
       11: PassOut(giPI_CNT, L10Cust1, L10C, L10W, L10Unit1, L10Qty1, L10Unit2, L10Qty2);
       12: PassOut(giPI_CNT, L11Cust1, L11C, L11W, L11Unit1, L11Qty1, L11Unit2, L11Qty2);
       13: PassOut(giPI_CNT, L12Cust1, L12C, L12W, L12Unit1, L12Qty1, L12Unit2, L12Qty2);
       14: PassOut(giPI_CNT, L13Cust1, L13C, L13W, L13Unit1, L13Qty1, L13Unit2, L13Qty2);
       15: PassOut(giPI_CNT, L14Cust1, L14C, L14W, L14Unit1, L14Qty1, L14Unit2, L14Qty2);
       16: PassOut(giPI_CNT, L15Cust1, L15C, L15W, L15Unit1, L15Qty1, L15Unit2, L15Qty2);
       17: PassOut(giPI_CNT, L16Cust1, L16C, L16W, L16Unit1, L16Qty1, L16Unit2, L16Qty2);
       18: PassOut(giPI_CNT, L17Cust1, L17C, L17W, L17Unit1, L17Qty1, L17Unit2, L17Qty2);
       19: PassOut(giPI_CNT, L18Cust1, L18C, L18W, L18Unit1, L18Qty1, L18Unit2, L18Qty2);
       20: PassOut(giPI_CNT, L19Cust1, L19C, L19W, L19Unit1, L19Qty1, L19Unit2, L19Qty2);
       21: PassOut(giPI_CNT, L20Cust1, L20C, L20W, L20Unit1, L20Qty1, L20Unit2, L20Qty2);
       22: PassOut(giPI_CNT, L21Cust1, L21C, L21W, L21Unit1, L21Qty1, L21Unit2, L21Qty2);
       23: PassOut(giPI_CNT, L22Cust1, L22C, L22W, L22Unit1, L22Qty1, L22Unit2, L22Qty2);
       24: PassOut(giPI_CNT, L23Cust1, L23C, L23W, L23Unit1, L23Qty1, L23Unit2, L23Qty2);
       25: PassOut(giPI_CNT, L24Cust1, L24C, L24W, L24Unit1, L24Qty1, L24Unit2, L24Qty2);
       26: PassOut(giPI_CNT, R0Cust1, R0C, R0W, R0Unit1, R0Qty1, R0Unit2, R0Qty2);
       27: PassOut(giPI_CNT, R1Cust1, R1C, R1W, R1Unit1, R1Qty1, R1Unit2, R1Qty2);
       28: PassOut(giPI_CNT, R2Cust1, R2C, R2W, R2Unit1, R2Qty1, R2Unit2, R2Qty2);
       29: PassOut(giPI_CNT, R3Cust1, R3C, R3W, R3Unit1, R3Qty1, R3Unit2, R3Qty2);
       30: PassOut(giPI_CNT, R4Cust1, R4C, R4W, R4Unit1, R4Qty1, R4Unit2, R4Qty2);
       31: PassOut(giPI_CNT, R5Cust1, R5C, R5W, R5Unit1, R5Qty1, R5Unit2, R5Qty2);
       32: PassOut(giPI_CNT, R6Cust1, R6C, R6W, R6Unit1, R6Qty1, R6Unit2, R6Qty2);
       33: PassOut(giPI_CNT, R7Cust1, R7C, R7W, R7Unit1, R7Qty1, R7Unit2, R7Qty2);
       34: PassOut(giPI_CNT, R8Cust1, R8C, R8W, R8Unit1, R8Qty1, R8Unit2, R8Qty2);
       35: PassOut(giPI_CNT, R9Cust1, R9C, R9W, R9Unit1, R9Qty1, R9Unit2, R9Qty2);
       36: PassOut(giPI_CNT, R10Cust1, R10C, R10W, R10Unit1, R10Qty1, R10Unit2, R10Qty2);
       37: PassOut(giPI_CNT, R11Cust1, R11C, R11W, R11Unit1, R11Qty1, R11Unit2, R11Qty2);
       38: PassOut(giPI_CNT, R12Cust1, R12C, R12W, R12Unit1, R12Qty1, R12Unit2, R12Qty2);
       39: PassOut(giPI_CNT, R13Cust1, R13C, R13W, R13Unit1, R13Qty1, R13Unit2, R13Qty2);
       40: PassOut(giPI_CNT, R14Cust1, R14C, R14W, R14Unit1, R14Qty1, R14Unit2, R14Qty2);
       41: PassOut(giPI_CNT, R15Cust1, R15C, R15W, R15Unit1, R15Qty1, R15Unit2, R15Qty2);
       42: PassOut(giPI_CNT, R16Cust1, R16C, R16W, R16Unit1, R16Qty1, R16Unit2, R16Qty2);
       43: PassOut(giPI_CNT, R17Cust1, R17C, R17W, R17Unit1, R17Qty1, R17Unit2, R17Qty2);
       44: PassOut(giPI_CNT, R18Cust1, R18C, R18W, R18Unit1, R18Qty1, R18Unit2, R18Qty2);
       45: PassOut(giPI_CNT, R19Cust1, R19C, R19W, R19Unit1, R19Qty1, R19Unit2, R19Qty2);
       46: PassOut(giPI_CNT, R20Cust1, R20C, R20W, R20Unit1, R20Qty1, R20Unit2, R20Qty2);
       47: PassOut(giPI_CNT, R21Cust1, R21C, R21W, R21Unit1, R21Qty1, R21Unit2, R21Qty2);
       48: PassOut(giPI_CNT, R22Cust1, R22C, R22W, R22Unit1, R22Qty1, R22Unit2, R22Qty2);
       49: PassOut(giPI_CNT, R23Cust1, R23C, R23W, R23Unit1, R23Qty1, R23Unit2, R23Qty2);
       50: PassOut(giPI_CNT, R24Cust1, R24C, R24W, R24Unit1, R24Qty1, R24Unit2, R24Qty2);
      end;
      // 2016-04-29 dyddyd  테스트 위한 코드 추가
      button11.Caption := '0';

      memRcv.Refresh;
      ShowProgress;
    end;
  end;
  giPI_CNT := giPI_CNT + 1;
  if giPI_CNT = PIEND + 1 then giPI_CNT := 0;

  timBCU.Enabled := True;
end;

procedure TfrmDAIHAN_MAIN.Button9Click(Sender: TObject);
begin
  if (pnCount.Caption <> pnTotal.Caption) AND (pnTotal.Caption <> '0') then
  begin
    BEEP;
// Start
    sleep(100);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, $41);
    pr_Show_Board('DAS 작업중인 상품을 완료하거나'+#13+'소등 후 종료 가능합니다.');
    exit;
  end;
// End
//
//  memRcv.Lines.SaveToFile('LOG\'+ Label6.Caption+ '-'+ FormatDateTime('HHNNSSZZZ', now)+ '.Txt');
  Close;
end;

procedure TfrmDAIHAN_MAIN.Button1Click(Sender: TObject);
VAR
  cell : integer;

  pick_qty : integer;
  Order_unit : String;

  procedure DisplayTitle(lblCust, lblUnit1, lblQty1, lblUnit2, lblQty2 : TLabel);
  begin
    if  Panel1.Caption=qryItemScan.FieldValues['ORDER_UNIT'] then
    begin
      lblUnit2.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
      lblQty2.Caption  := qryItemScan.FieldValues['PICK_QTY'];
    end
    ELSE
    BEGIN
      IF lblUnit1.Caption<>'' THEN
      BEGIN
        lblUnit2.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
        lblQty2.Caption  := qryItemScan.FieldValues['PICK_QTY'];
      END
      ELSE
      BEGIN
        lblUnit1.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
        lblQty1.Caption  := qryItemScan.FieldValues['PICK_QTY'];
      END;
    END;
  end;

  procedure DisplayLED(nCell : integer; lblCust, lblUnit1, lblQty1, lblUnit2, lblQty2 : TLabel);

  function RetQty(wPick : string): string;
  begin
    if length(trim(wPick)) = 1      then Result := '    '+ wPick
    else if length(trim(wPick)) = 2 then Result := '   '+ wPick
    else if length(trim(wPick)) = 3 then Result := '  '+ wPick
    else if length(trim(wPick)) = 4 then Result := ' '+ wPick
    else if length(trim(wPick)) = 5 then Result :=   wPick;
  end;

  begin
    if (lblQty1.Caption <> '') and (lblQty2.Caption <> '') then
    begin
      func_PutDataPi(gcCOMM[giBCU1], 1,  nCell,  1,  '0', fn_PI_Color(nCell), '2'+ RetQty(lblQty1.Caption));
    end
    else
    begin
      if (lblQty1.Caption <> '') then
      begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  nCell,  1,  '0', fn_PI_Color(nCell), copy(lblUnit1.caption,1,1)+ RetQty(lblQty1.Caption));
      end
      else
      begin
        if (lblQty2.Caption <> '') then
        begin
          func_PutDataPi(gcCOMM[giBCU1], 1,  nCell,  1,  '0', fn_PI_Color(nCell), copy(lblUnit2.caption,1,1)+ RetQty(lblQty2.Caption));
        end;
      end;
    end;
    Application.ProcessMessages;
  end;

begin
//  RichEdit1.Lines.Add('Start: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  // 2016-04-27 dyddyd 
//  Edit1.Text := Trim(Edit1.Text);

  if Edit1.Text = '' then
  begin
    pr_Show_Board('분배 작업할 상품이 존재하지 않습니다.');
    exit;
  end;

// Ok
  if (Edit1.Text = 'OK') and (PanelMessage.Visible) then
  begin
    btnCloseClick(SENDER);
    Edit1.Text := Edit4.Text;
    exit;
  end;
// Clear Lamps
  if (Edit1.Text = 'OFF') and (not PanelMessage.Visible) then
  begin
    Button2Click(SENDER);
    Edit1.Text := '';
    exit;
  end;

  if (pnCount.Caption <> pnTotal.Caption) AND (pnTotal.Caption <> '0') then
  begin
    BEEP;
// Start
    sleep(100);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, $41);
    pr_Show_Board('DAS 작업중인 상품이 있습니다.');
    Edit1.Text := Edit4.Text;
    exit;
  end;

// 2011.06.07
// 취소버튼이 눌리는 이유를 알지 못하겠음...
// 일단은 막아봅니다.
//
//  Button2.Click;
//  RichEdit1.Lines.Add('pr_Clear_Board: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  pr_Clear_Board;

  {
  qryCustCount.Close;
  qryCustCount.Params[0].AsString :=Label6.Caption;
  qryCustCount.Params[1].AsString :=Edit1.Text;
  qryCustCount.Open;
  Wcust_Count := qryCustCount.RecordCount;
  IF (Wcust_Count<>0) and (Wcust_Count<>1)  THEN
    BEGIN
      BEEP;
      PanelMessage.Visible :=True;
      qryCustCount.Close;
      Screen.Cursor := crDefault;
      exit;
    END;
    }

//  RichEdit1.Lines.Add('ItemKan_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qrItemKan.close;
// 웹톤바코드
  if (length(Edit1.Text) > 7) and (copy(Edit1.Text, 1, 5) = '+H659') then
  begin
    qrItemKan.SQL[1] := 'Where KAN_CODE = '+ ''''+ copy(Edit1.Text, 1, length(Edit1.Text)-2)+ '''';
    qrItemKan.Open;
  end
// 다른 상품인인지 봅시다...
  else
  begin
    qrItemKan.SQL[1] := 'Where KAN_CODE = '+ ''''+ Edit1.Text+ '''';
//    ShowMessage(qrItemKan.SQL.Text);
    qrItemKan.Open;
    if qrItemKan.RecordCount < 1 then
    begin
// 다음 상품이나 제품인지를 보면 됩니다.
      qrItemKan.close;
      qrItemKan.SQL[1] := 'Where ITEM_CODE = '+ ''''+ copy(Edit1.Text, 1, 7)+ ''''+
                          '   Or KAN_CODE = '+ ''''+ Edit1.Text+ '''';
      qrItemKan.Open;
    end;
  end;
// Start
//  RichEdit1.Lines.Add('ItemKan_E: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  sleep(100);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);
  if qrItemKan.RecordCount < 1 then
  begin
    pr_Show_Board('해당하는 아이템(제상품)이 없습니다.');
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    exit;
  end;
  Edit2.Text := qrItemKan.FieldValues['CATNO'];
  Edit4.Text := qrItemKan.FieldValues['ITEM_CODE'];
  Edit3.Text := qrItemKan.FieldValues['ITEM_NAME'];
  Panel1.Caption := qrItemKan.FieldValues['QTY_UNIT'];
  Panel2.Caption := floattostr(qrItemKan.FieldValues['QTY']);
  qrItemKan.close;
  Screen.Cursor := crDefault;
  qrOrder.Close;
  qrOrder.Params[0].AsString := Label6.Caption;
  qrOrder.Params[1].AsString := Edit4.Text;
//  RichEdit1.Lines.Add('Picking_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qrOrder.Open;
// 피킹완료 검사
  if qrOrder.RecordCount = 0 then
  begin
    pr_Show_Board('분류(DAS) 대상이 아닙니다.');
    Write_Set_log('NO-DAS');

    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    exit;
  end;
  if qrOrder.FieldValues['ORDER_CNT'] = 0 then
  begin
    pr_Show_Board('분류(DAS) 오더대상이 아닙니다.');
    Write_Set_log('NO-ORDER');

    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    exit;
  end;
//  RichEdit1.Lines.Add('Picking_Wh: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  while not qrOrder.Eof do
  begin
    if qrOrder.FieldValues['ORDER_CNT'] <> qrOrder.FieldValues['PICK_CNT'] then
    begin
// Start
      btnClose.Left := 224;
      Button15.Visible := true;
      pr_Show_Board('피킹이 완료되지 않았거나'+#13+'이미 분배 작업이 끝난 아이템입니다.');
      Write_Set_log('NOT-PICK');

      qrOrder.Close;
      Screen.Cursor := crDefault;
      exit;
    end;
    qrOrder.Next;
  end;

// Start
  sleep(100);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, $35);
  stItem_Code := Edit1.Text;

// 2011.06.07 ... 아이템이 끝날때마다 그리드를 새로 표시합니다.
// DAS-3 건이 주요합니다.
//
//  RichEdit1.Lines.Add('Draw_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  MainDraw(False);

// 피커가 누군지 알고
//  RichEdit1.Lines.Add('Picker_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qrPicker.Close;
  qrPicker.Params[0].AsString :=Label6.Caption;
  qrPicker.Params[1].AsString :=Edit4.Text;
  qrPicker.Open;
  LabelPicker.Caption := '피킹: ';
  while not qrPicker.Eof do
  begin
    LabelPicker.Caption := LabelPicker.Caption + qrPicker .FieldValues['NAME']+ ' ';
    qrPicker.Next;
  end;
  qrPicker.Close;
//  RichEdit1.Lines.Add('Picker_E: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );

  qrOrder.First;
  qryItemScan.Close;
  qryItemScan.Params[0].AsString := Label6.Caption;
  qryItemScan.Params[1].AsString := Edit4.Text;
//  RichEdit1.Lines.Add('ItemScan_S: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qryItemScan.Open;

//  RichEdit1.Lines.Add('ItemScan_Wh: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  while not qryItemScan.Eof do
  begin
    cell := StrToInt(qryItemScan.FieldValues['CELL_RESTORE']);
    if cell < 90 then pnTotal.Caption := inttostr(strtoint(pnTotal.Caption) + 1);

    qryItemScan.Next;
  end;

//  RichEdit1.Lines.Add('ItemScan_Wh-1: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
  qryItemScan.First;
  while not qryItemScan.Eof do
  begin
    cell := StrToInt(qryItemScan.FieldValues['CELL_RESTORE']);
    Wcell :=cell;
    Order_unit :=qryItemScan.FieldValues['ORDER_UNIT'];
    WOrder_unit :=  Order_unit;
    pick_qty :=qryItemScan.FieldValues['PICK_QTY'];
    Wpick_qty := IntToStr(pick_qty);

    if Wcell < 90 then Write_Set_log('DISPLAY|'+Order_unit+'|'+floattostr(pick_qty)+'|');

    CASE cell of
    91:
       if (Panel1.Caption=qryItemScan.FieldValues['ORDER_UNIT']) then
       begin
         //Label14 .Caption := qryItemScan.FieldValues['ORDER_EA_UNIT'];
         Label13.Caption  := qryItemScan.FieldValues['ORDER_EA_UNIT'];
         Label14.Caption  := qryItemScan.FieldValues['PICK_QTY'];
       end
       ELSE
       BEGIN
         //Label11.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
         Label12.Caption  := qryItemScan.FieldValues['ORDER_EA_UNIT'];
         Label11.Caption  := qryItemScan.FieldValues['PICK_QTY'];
       END;

    92: if (Panel1.Caption=qryItemScan.FieldValues['ORDER_UNIT']) then
       begin
         Label10 .Caption := qryItemScan.FieldValues['ORDER_UNIT'];
         Label9.Caption  := qryItemScan.FieldValues['PICK_QTY'];
       end
       ELSE
       BEGIN
         Label8.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
         Label7.Caption  := qryItemScan.FieldValues['PICk_QTY'];
       END;

    93: if (Panel1.Caption=qryItemScan.FieldValues['ORDER_UNIT']) then
       begin
         Label18 .Caption := qryItemScan.FieldValues['ORDER_UNIT'];
         Label17.Caption  := qryItemScan.FieldValues['PICK_QTY'];
       end
       ELSE
       BEGIN
         Label15.Caption := qryItemScan.FieldValues['ORDER_UNIT'];
         Label16.Caption  := qryItemScan.FieldValues['PICK_QTY'];
       END;

    01: DisplayTitle(L0Cust1, L0Unit1, L0Qty1, L0Unit2, L0Qty2);
    02: DisplayTitle(L1Cust1, L1Unit1, L1Qty1, L1Unit2, L1Qty2);
    03: DisplayTitle(L2Cust1, L2Unit1, L2Qty1, L2Unit2, L2Qty2);
    04: DisplayTitle(L3Cust1, L3Unit1, L3Qty1, L3Unit2, L3Qty2);
    05: DisplayTitle(L4Cust1, L4Unit1, L4Qty1, L4Unit2, L4Qty2);
    06: DisplayTitle(L5Cust1, L5Unit1, L5Qty1, L5Unit2, L5Qty2);
    07: DisplayTitle(L6Cust1, L6Unit1, L6Qty1, L6Unit2, L6Qty2);
    08: DisplayTitle(L7Cust1, L7Unit1, L7Qty1, L7Unit2, L7Qty2);
    09: DisplayTitle(L8Cust1, L8Unit1, L8Qty1, L8Unit2, L8Qty2);
    10: DisplayTitle(L9Cust1, L9Unit1, L9Qty1, L9Unit2, L9Qty2);
    11: DisplayTitle(L10Cust1, L10Unit1, L10Qty1, L10Unit2, L10Qty2);
    12: DisplayTitle(L11Cust1, L11Unit1, L11Qty1, L11Unit2, L11Qty2);
    13: DisplayTitle(L12Cust1, L12Unit1, L12Qty1, L12Unit2, L12Qty2);
    14: DisplayTitle(L13Cust1, L13Unit1, L13Qty1, L13Unit2, L13Qty2);
    15: DisplayTitle(L14Cust1, L14Unit1, L14Qty1, L14Unit2, L14Qty2);
    16: DisplayTitle(L15Cust1, L15Unit1, L15Qty1, L15Unit2, L15Qty2);
    17: DisplayTitle(L16Cust1, L16Unit1, L16Qty1, L16Unit2, L16Qty2);
    18: DisplayTitle(L17Cust1, L17Unit1, L17Qty1, L17Unit2, L17Qty2);
    19: DisplayTitle(L18Cust1, L18Unit1, L18Qty1, L18Unit2, L18Qty2);
    20: DisplayTitle(L19Cust1, L19Unit1, L19Qty1, L19Unit2, L19Qty2);
    21: DisplayTitle(L20Cust1, L20Unit1, L20Qty1, L20Unit2, L20Qty2);
    22: DisplayTitle(L21Cust1, L21Unit1, L21Qty1, L21Unit2, L21Qty2);
    23: DisplayTitle(L22Cust1, L22Unit1, L22Qty1, L22Unit2, L22Qty2);
    24: DisplayTitle(L23Cust1, L23Unit1, L23Qty1, L23Unit2, L23Qty2);
    25: DisplayTitle(L24Cust1, L24Unit1, L24Qty1, L24Unit2, L24Qty2);
    26: DisplayTitle(R0Cust1, R0Unit1, R0Qty1, R0Unit2, R0Qty2);
    27: DisplayTitle(R1Cust1, R1Unit1, R1Qty1, R1Unit2, R1Qty2);
    28: DisplayTitle(R2Cust1, R2Unit1, R2Qty1, R2Unit2, R2Qty2);
    29: DisplayTitle(R3Cust1, R3Unit1, R3Qty1, R3Unit2, R3Qty2);
    30: DisplayTitle(R4Cust1, R4Unit1, R4Qty1, R4Unit2, R4Qty2);
    31: DisplayTitle(R5Cust1, R5Unit1, R5Qty1, R5Unit2, R5Qty2);
    32: DisplayTitle(R6Cust1, R6Unit1, R6Qty1, R6Unit2, R6Qty2);
    33: DisplayTitle(R7Cust1, R7Unit1, R7Qty1, R7Unit2, R7Qty2);
    34: DisplayTitle(R8Cust1, R8Unit1, R8Qty1, R8Unit2, R8Qty2);
    35: DisplayTitle(R9Cust1, R9Unit1, R9Qty1, R9Unit2, R9Qty2);
    36: DisplayTitle(R10Cust1, R10Unit1, R10Qty1, R10Unit2, R10Qty2);
    37: DisplayTitle(R11Cust1, R11Unit1, R11Qty1, R11Unit2, R11Qty2);
    38: DisplayTitle(R12Cust1, R12Unit1, R12Qty1, R12Unit2, R12Qty2);
    39: DisplayTitle(R13Cust1, R13Unit1, R13Qty1, R13Unit2, R13Qty2);
    40: DisplayTitle(R14Cust1, R14Unit1, R14Qty1, R14Unit2, R14Qty2);
    41: DisplayTitle(R15Cust1, R15Unit1, R15Qty1, R15Unit2, R15Qty2);
    42: DisplayTitle(R16Cust1, R16Unit1, R16Qty1, R16Unit2, R16Qty2);
    43: DisplayTitle(R17Cust1, R17Unit1, R17Qty1, R17Unit2, R17Qty2);
    44: DisplayTitle(R18Cust1, R18Unit1, R18Qty1, R18Unit2, R18Qty2);
    45: DisplayTitle(R19Cust1, R19Unit1, R19Qty1, R19Unit2, R19Qty2);
    46: DisplayTitle(R20Cust1, R20Unit1, R20Qty1, R20Unit2, R20Qty2);
    47: DisplayTitle(R21Cust1, R21Unit1, R21Qty1, R21Unit2, R21Qty2);
    48: DisplayTitle(R22Cust1, R22Unit1, R22Qty1, R22Unit2, R22Qty2);
    49: DisplayTitle(R23Cust1, R23Unit1, R23Qty1, R23Unit2, R23Qty2);
    50: DisplayTitle(R24Cust1, R24Unit1, R24Qty1, R24Unit2, R24Qty2);
    END;
     qryItemScan.Next;
  end;
//  RichEdit1.Lines.Add('ItemScan_Wh-2: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );

// 다끝내 노호고 하는게 맞는거 같아
// 왜냐면 이때까지는 2줄인지 아닌지 구분이 안되니까..
// 하지만 표시가 다끝나면 알잖아
//
  DisplayLED(01, L0Cust1, L0Unit1, L0Qty1, L0Unit2, L0Qty2);
  DisplayLED(02, L1Cust1, L1Unit1, L1Qty1, L1Unit2, L1Qty2);
  DisplayLED(03, L2Cust1, L2Unit1, L2Qty1, L2Unit2, L2Qty2);
  DisplayLED(04, L3Cust1, L3Unit1, L3Qty1, L3Unit2, L3Qty2);
  DisplayLED(05, L4Cust1, L4Unit1, L4Qty1, L4Unit2, L4Qty2);
  DisplayLED(06, L5Cust1, L5Unit1, L5Qty1, L5Unit2, L5Qty2);
  DisplayLED(07, L6Cust1, L6Unit1, L6Qty1, L6Unit2, L6Qty2);
  DisplayLED(08, L7Cust1, L7Unit1, L7Qty1, L7Unit2, L7Qty2);
  DisplayLED(09, L8Cust1, L8Unit1, L8Qty1, L8Unit2, L8Qty2);
  DisplayLED(10, L9Cust1, L9Unit1, L9Qty1, L9Unit2, L9Qty2);
  DisplayLED(11, L10Cust1, L10Unit1, L10Qty1, L10Unit2, L10Qty2);
  DisplayLED(12, L11Cust1, L11Unit1, L11Qty1, L11Unit2, L11Qty2);
  DisplayLED(13, L12Cust1, L12Unit1, L12Qty1, L12Unit2, L12Qty2);
  DisplayLED(14, L13Cust1, L13Unit1, L13Qty1, L13Unit2, L13Qty2);
  DisplayLED(15, L14Cust1, L14Unit1, L14Qty1, L14Unit2, L14Qty2);
  DisplayLED(16, L15Cust1, L15Unit1, L15Qty1, L15Unit2, L15Qty2);
  DisplayLED(17, L16Cust1, L16Unit1, L16Qty1, L16Unit2, L16Qty2);
  DisplayLED(18, L17Cust1, L17Unit1, L17Qty1, L17Unit2, L17Qty2);
  DisplayLED(19, L18Cust1, L18Unit1, L18Qty1, L18Unit2, L18Qty2);
  DisplayLED(20, L19Cust1, L19Unit1, L19Qty1, L19Unit2, L19Qty2);
  DisplayLED(21, L20Cust1, L20Unit1, L20Qty1, L20Unit2, L20Qty2);
  DisplayLED(22, L21Cust1, L21Unit1, L21Qty1, L21Unit2, L21Qty2);
  DisplayLED(23, L22Cust1, L22Unit1, L22Qty1, L22Unit2, L22Qty2);
  DisplayLED(24, L23Cust1, L23Unit1, L23Qty1, L23Unit2, L23Qty2);
  DisplayLED(25, L24Cust1, L24Unit1, L24Qty1, L24Unit2, L24Qty2);
  DisplayLED(26, R0Cust1, R0Unit1, R0Qty1, R0Unit2, R0Qty2);
  DisplayLED(27, R1Cust1, R1Unit1, R1Qty1, R1Unit2, R1Qty2);
  DisplayLED(28, R2Cust1, R2Unit1, R2Qty1, R2Unit2, R2Qty2);
  DisplayLED(29, R3Cust1, R3Unit1, R3Qty1, R3Unit2, R3Qty2);
  DisplayLED(30, R4Cust1, R4Unit1, R4Qty1, R4Unit2, R4Qty2);
  DisplayLED(31, R5Cust1, R5Unit1, R5Qty1, R5Unit2, R5Qty2);
  DisplayLED(32, R6Cust1, R6Unit1, R6Qty1, R6Unit2, R6Qty2);
  DisplayLED(33, R7Cust1, R7Unit1, R7Qty1, R7Unit2, R7Qty2);
  DisplayLED(34, R8Cust1, R8Unit1, R8Qty1, R8Unit2, R8Qty2);
  DisplayLED(35, R9Cust1, R9Unit1, R9Qty1, R9Unit2, R9Qty2);
  DisplayLED(36, R10Cust1, R10Unit1, R10Qty1, R10Unit2, R10Qty2);
  DisplayLED(37, R11Cust1, R11Unit1, R11Qty1, R11Unit2, R11Qty2);
  DisplayLED(38, R12Cust1, R12Unit1, R12Qty1, R12Unit2, R12Qty2);
  DisplayLED(39, R13Cust1, R13Unit1, R13Qty1, R13Unit2, R13Qty2);
  DisplayLED(40, R14Cust1, R14Unit1, R14Qty1, R14Unit2, R14Qty2);
  DisplayLED(41, R15Cust1, R15Unit1, R15Qty1, R15Unit2, R15Qty2);
  DisplayLED(42, R16Cust1, R16Unit1, R16Qty1, R16Unit2, R16Qty2);
  DisplayLED(43, R17Cust1, R17Unit1, R17Qty1, R17Unit2, R17Qty2);
  DisplayLED(44, R18Cust1, R18Unit1, R18Qty1, R18Unit2, R18Qty2);
  DisplayLED(45, R19Cust1, R19Unit1, R19Qty1, R19Unit2, R19Qty2);
  DisplayLED(46, R20Cust1, R20Unit1, R20Qty1, R20Unit2, R20Qty2);
  DisplayLED(47, R21Cust1, R21Unit1, R21Qty1, R21Unit2, R21Qty2);
  DisplayLED(48, R22Cust1, R22Unit1, R22Qty1, R22Unit2, R22Qty2);
  DisplayLED(49, R23Cust1, R23Unit1, R23Qty1, R23Unit2, R23Qty2);
  DisplayLED(50, R24Cust1, R24Unit1, R24Qty1, R24Unit2, R24Qty2);
//  RichEdit1.Lines.Add('ItemScan_Wh-3: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );

// 2011.07.21 S/W적인 Flag
//
  stWorkItem := Edit1.Text;

// 2011.10.14 ...먼저 전산처리을 해 놓고 ...
// 결과를 기다리시다..
  LetsPassUpdate;
//  RichEdit1.Lines.Add('LetsPassUpdate: '+ FormatDateTime('HH:NN:SS.ZZZ', now) );
end;

procedure TfrmDAIHAN_MAIN.Button11Click(Sender: TObject);
begin
// Test 용
  if Memo1.Visible then else exit;
  if Memo1.Lines.Count <= strtoint(Button11.Caption) then
  begin
    beep;
    ShowMessage('Testing is over !!!');
    exit;
  end;
  edit1.Text := Memo1.Lines[strtoint(Button11.Caption)];
  Button1Click(sender);
  Application.ProcessMessages;
  Button11.Caption := inttostr(strtoint(Button11.Caption)+1);
end;

procedure TfrmDAIHAN_MAIN.Button12Click(Sender: TObject);
begin
  frmPassItem := TfrmPassItem.Create(Self);
  try
      frmPassItem.ShowModal;
  finally
      frmPassItem.Free;
  end;
end;

procedure TfrmDAIHAN_MAIN.btnCloseClick(Sender: TObject);
begin
// Start
  sleep(100);
  func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);
  PanelMessage.Visible := false;
  btnClose.Left := 264;
  Button15.Visible := false;
end;

procedure TfrmDAIHAN_MAIN.Button15Click(Sender: TObject);
begin
// 2011.10.14 ... 불행한 프로그램 종료시에는
// 강제로 재처리가 필요합니다.
//
// 1.먼저 되돌리고
  LetsPassRecall;

// 2.처음인양 스캔데이터 뿌리고
  Button1.Click;

// 3.창닫고 끝.
  btnClose.Click;
end;

procedure TfrmDAIHAN_MAIN.Button10Click(Sender: TObject);
  function RetQty(wPick : string): string;
  begin
    if length(trim(wPick)) = 1      then Result := '    '+ wPick
    else if length(trim(wPick)) = 2 then Result := '   '+ wPick
    else if length(trim(wPick)) = 3 then Result := '  '+ wPick
    else if length(trim(wPick)) = 4 then Result := ' '+ wPick
    else if length(trim(wPick)) = 5 then Result :=   wPick;
  end;
  PROCEDURE Resend(Cust, lblMast, lblCount, Cell, UnitTop, QtyTop, UnitBottom, QtyBottom : TLabel);
  begin
    if (pos('*',QtyTop.Caption)>0) and (QtyBottom.Caption<>'') then
    begin
      func_PutDataPi(gcCOMM[giBCU1], 1,  strtoint(cell.Caption),  1,  '0', fn_PI_Color(strtoint(cell.Caption)), copy(UnitBottom.caption,1,1)+ RetQty(QtyBottom.Caption));
    end;
  end;
begin
  Resend(L0Cust1, L0C, L0W, L0, L0Unit1, L0Qty1, L0Unit2, L0Qty2);
  Resend(L1Cust1, L1C, L1W, L1, L1Unit1, L1Qty1, L1Unit2, L1Qty2);
  Resend(L2Cust1, L2C, L2W, L2, L2Unit1, L2Qty1, L2Unit2, L2Qty2);
  Resend(L3Cust1, L3C, L3W, L3, L3Unit1, L3Qty1, L3Unit2, L3Qty2);
  Resend(L4Cust1, L4C, L4W, L4, L4Unit1, L4Qty1, L4Unit2, L4Qty2);
  Resend(L5Cust1, L5C, L5W, L5, L5Unit1, L5Qty1, L5Unit2, L5Qty2);
  Resend(L6Cust1, L6C, L6W, L6, L6Unit1, L6Qty1, L6Unit2, L6Qty2);
  Resend(L7Cust1, L7C, L7W, L7, L7Unit1, L7Qty1, L7Unit2, L7Qty2);
  Resend(L8Cust1, L8C, L8W, L8, L8Unit1, L8Qty1, L8Unit2, L8Qty2);
  Resend(L9Cust1, L9C, L9W, L9, L9Unit1, L9Qty1, L9Unit2, L9Qty2);
  Resend(L10Cust1, L10C, L10W, L10, L10Unit1, L10Qty1, L10Unit2, L10Qty2);
  Resend(L11Cust1, L11C, L11W, L10, L11Unit1, L11Qty1, L11Unit2, L11Qty2);
  Resend(L12Cust1, L12C, L12W, L10, L12Unit1, L12Qty1, L12Unit2, L12Qty2);
  Resend(L13Cust1, L13C, L13W, L10, L13Unit1, L13Qty1, L13Unit2, L13Qty2);
  Resend(L14Cust1, L14C, L14W, L10, L14Unit1, L14Qty1, L14Unit2, L14Qty2);
  Resend(L15Cust1, L15C, L15W, L10, L15Unit1, L15Qty1, L15Unit2, L15Qty2);
  Resend(L16Cust1, L16C, L16W, L10, L16Unit1, L16Qty1, L16Unit2, L16Qty2);
  Resend(L17Cust1, L17C, L17W, L10, L17Unit1, L17Qty1, L17Unit2, L17Qty2);
  Resend(L18Cust1, L18C, L18W, L10, L18Unit1, L18Qty1, L18Unit2, L18Qty2);
  Resend(L19Cust1, L19C, L19W, L10, L19Unit1, L19Qty1, L19Unit2, L19Qty2);
  Resend(L20Cust1, L20C, L20W, L10, L20Unit1, L20Qty1, L20Unit2, L20Qty2);
  Resend(L21Cust1, L21C, L21W, L10, L21Unit1, L21Qty1, L21Unit2, L21Qty2);
  Resend(L22Cust1, L22C, L22W, L10, L22Unit1, L22Qty1, L22Unit2, L22Qty2);
  Resend(L23Cust1, L23C, L23W, L10, L23Unit1, L23Qty1, L23Unit2, L23Qty2);
  Resend(L24Cust1, L24C, L24W, L10, L24Unit1, L24Qty1, L24Unit2, L24Qty2);

  Resend(R0Cust1, R0C, R0W, R0, R0Unit1, R0Qty1, R0Unit2, R0Qty2);
  Resend(R1Cust1, R1C, R1W, R1, R1Unit1, R1Qty1, R1Unit2, R1Qty2);
  Resend(R2Cust1, R2C, R2W, R2, R2Unit1, R2Qty1, R2Unit2, R2Qty2);
  Resend(R3Cust1, R3C, R3W, R3, R3Unit1, R3Qty1, R3Unit2, R3Qty2);
  Resend(R4Cust1, R4C, R4W, R4, R4Unit1, R4Qty1, R4Unit2, R4Qty2);
  Resend(R5Cust1, R5C, R5W, R5, R5Unit1, R5Qty1, R5Unit2, R5Qty2);
  Resend(R6Cust1, R6C, R6W, R6, R6Unit1, R6Qty1, R6Unit2, R6Qty2);
  Resend(R7Cust1, R7C, R7W, R7, R7Unit1, R7Qty1, R7Unit2, R7Qty2);
  Resend(R8Cust1, R8C, R8W, R8, R8Unit1, R8Qty1, R8Unit2, R8Qty2);
  Resend(R9Cust1, R9C, R9W, R9, R9Unit1, R9Qty1, R9Unit2, R9Qty2);
  Resend(R10Cust1, R10C, R10W, R10, R10Unit1, R10Qty1, R10Unit2, R10Qty2);
  Resend(R11Cust1, R11C, R11W, R10, R11Unit1, R11Qty1, R11Unit2, R11Qty2);
  Resend(R12Cust1, R12C, R12W, R10, R12Unit1, R12Qty1, R12Unit2, R12Qty2);
  Resend(R13Cust1, R13C, R13W, R10, R13Unit1, R13Qty1, R13Unit2, R13Qty2);
  Resend(R14Cust1, R14C, R14W, R10, R14Unit1, R14Qty1, R14Unit2, R14Qty2);
  Resend(R15Cust1, R15C, R15W, R10, R15Unit1, R15Qty1, R15Unit2, R15Qty2);
  Resend(R16Cust1, R16C, R16W, R10, R16Unit1, R16Qty1, R16Unit2, R16Qty2);
  Resend(R17Cust1, R17C, R17W, R10, R17Unit1, R17Qty1, R17Unit2, R17Qty2);
  Resend(R18Cust1, R18C, R18W, R10, R18Unit1, R18Qty1, R18Unit2, R18Qty2);
  Resend(R19Cust1, R19C, R19W, R10, R19Unit1, R19Qty1, R19Unit2, R19Qty2);
  Resend(R20Cust1, R20C, R20W, R10, R20Unit1, R20Qty1, R20Unit2, R20Qty2);
  Resend(R21Cust1, R21C, R21W, R10, R21Unit1, R21Qty1, R21Unit2, R21Qty2);
  Resend(R22Cust1, R22C, R22W, R10, R22Unit1, R22Qty1, R22Unit2, R22Qty2);
  Resend(R23Cust1, R23C, R23W, R10, R23Unit1, R23Qty1, R23Unit2, R23Qty2);
  Resend(R24Cust1, R24C, R24W, R10, R24Unit1, R24Qty1, R24Unit2, R24Qty2);
end;

procedure TfrmDAIHAN_MAIN.Button14Click(Sender: TObject);
begin
  frmNotPicking := TfrmNotPicking.Create(Self);
  try
      frmNotPicking.ShowModal;
  finally
      frmNotPicking.Free;
  end;
end;

procedure TfrmDAIHAN_MAIN.btnPassClick(Sender: TObject);
  PROCEDURE ITEM_CLEAR(lblCust,lCount,lWrite,Lunit1,Lqty1,Lunit2,Lqty2 : TLabel);
  begin
    Lunit1.Caption :='';
    Lqty1.Caption :='';
    Lunit2.Caption :='';
    Lqty2.Caption :='';
  end;
begin
  pnCount.Caption :='0';
  pnTotal.Caption :='0';

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';

  Label7.Caption := '';
  Label8.Caption := '';
  Label9.Caption := '';
  Label10.Caption := '';
  Label11.Caption := '';
  Label12.Caption := '';
  Label13.Caption := '';
  Label14.Caption := '';
  Label15.Caption := '';
  Label16.Caption := '';
  Label17.Caption := '';
  Label18.Caption := '';

  ITEM_CLEAR(L0Cust1, L0C, L0W,L0Unit1, L0Qty1, L0Unit2, L0Qty2);
  ITEM_CLEAR(L1Cust1, L1C, L1W,L1Unit1, L1Qty1, L1Unit2, L1Qty2);
  ITEM_CLEAR(L2Cust1, L2C, L2W,L2Unit1, L2Qty1, L2Unit2, L2Qty2);
  ITEM_CLEAR(L3Cust1, L3C, L3W,L3Unit1, L3Qty1, L3Unit2, L3Qty2);
  ITEM_CLEAR(L4Cust1, L4C, L4W,L4Unit1, L4Qty1, L4Unit2, L4Qty2);
  ITEM_CLEAR(L5Cust1, L5C, L5W,L5Unit1, L5Qty1, L5Unit2, L5Qty2);
  ITEM_CLEAR(L6Cust1, L6C, L6W,L6Unit1, L6Qty1, L6Unit2, L6Qty2);
  ITEM_CLEAR(L7Cust1, L7C, L7W,L7Unit1, L7Qty1, L7Unit2, L7Qty2);
  ITEM_CLEAR(L8Cust1, L8C, L8W,L8Unit1, L8Qty1, L8Unit2, L8Qty2);
  ITEM_CLEAR(L9Cust1, L9C, L9W,L9Unit1, L9Qty1, L9Unit2, L9Qty2);
  ITEM_CLEAR(L10Cust1, L10C, L10, L10Unit1, L10Qty1, L10Unit2, L10Qty2);
  ITEM_CLEAR(L11Cust1, L11C, L10, L11Unit1, L11Qty1, L11Unit2, L11Qty2);
  ITEM_CLEAR(L12Cust1, L12C, L10, L12Unit1, L12Qty1, L12Unit2, L12Qty2);
  ITEM_CLEAR(L13Cust1, L13C, L10, L13Unit1, L13Qty1, L13Unit2, L13Qty2);
  ITEM_CLEAR(L14Cust1, L14C, L10, L14Unit1, L14Qty1, L14Unit2, L14Qty2);
  ITEM_CLEAR(L15Cust1, L15C, L10, L15Unit1, L15Qty1, L15Unit2, L15Qty2);
  ITEM_CLEAR(L16Cust1, L16C, L10, L16Unit1, L16Qty1, L16Unit2, L16Qty2);
  ITEM_CLEAR(L17Cust1, L17C, L10, L17Unit1, L17Qty1, L17Unit2, L17Qty2);
  ITEM_CLEAR(L18Cust1, L18C, L10, L18Unit1, L18Qty1, L18Unit2, L18Qty2);
  ITEM_CLEAR(L19Cust1, L19C, L10, L19Unit1, L19Qty1, L19Unit2, L19Qty2);
  ITEM_CLEAR(L20Cust1, L20C, L10, L20Unit1, L20Qty1, L20Unit2, L20Qty2);
  ITEM_CLEAR(L21Cust1, L21C, L10, L21Unit1, L21Qty1, L21Unit2, L21Qty2);
  ITEM_CLEAR(L22Cust1, L22C, L10, L22Unit1, L22Qty1, L22Unit2, L22Qty2);
  ITEM_CLEAR(L23Cust1, L23C, L10, L23Unit1, L23Qty1, L23Unit2, L23Qty2);
  ITEM_CLEAR(L24Cust1, L24C, L10, L24Unit1, L24Qty1, L24Unit2, L24Qty2);

  ITEM_CLEAR(R0Cust1, R0C, R0, R0Unit1, R0Qty1, R0Unit2, R0Qty2);
  ITEM_CLEAR(R1Cust1, R1C, R1, R1Unit1, R1Qty1, R1Unit2, R1Qty2);
  ITEM_CLEAR(R2Cust1, R2C, R2, R2Unit1, R2Qty1, R2Unit2, R2Qty2);
  ITEM_CLEAR(R3Cust1, R3C, R3, R3Unit1, R3Qty1, R3Unit2, R3Qty2);
  ITEM_CLEAR(R4Cust1, R4C, R4, R4Unit1, R4Qty1, R4Unit2, R4Qty2);
  ITEM_CLEAR(R5Cust1, R5C, R5, R5Unit1, R5Qty1, R5Unit2, R5Qty2);
  ITEM_CLEAR(R6Cust1, R6C, R6, R6Unit1, R6Qty1, R6Unit2, R6Qty2);
  ITEM_CLEAR(R7Cust1, R7C, R7, R7Unit1, R7Qty1, R7Unit2, R7Qty2);
  ITEM_CLEAR(R8Cust1, R8C, R8, R8Unit1, R8Qty1, R8Unit2, R8Qty2);
  ITEM_CLEAR(R9Cust1, R9C, R9, R9Unit1, R9Qty1, R9Unit2, R9Qty2);
  ITEM_CLEAR(R10Cust1, R10C, R10, R10Unit1, R10Qty1, R10Unit2, R10Qty2);
  ITEM_CLEAR(R11Cust1, R11C, R10, R11Unit1, R11Qty1, R11Unit2, R11Qty2);
  ITEM_CLEAR(R12Cust1, R12C, R10, R12Unit1, R12Qty1, R12Unit2, R12Qty2);
  ITEM_CLEAR(R13Cust1, R13C, R10, R13Unit1, R13Qty1, R13Unit2, R13Qty2);
  ITEM_CLEAR(R14Cust1, R14C, R10, R14Unit1, R14Qty1, R14Unit2, R14Qty2);
  ITEM_CLEAR(R15Cust1, R15C, R10, R15Unit1, R15Qty1, R15Unit2, R15Qty2);
  ITEM_CLEAR(R16Cust1, R16C, R10, R16Unit1, R16Qty1, R16Unit2, R16Qty2);
  ITEM_CLEAR(R17Cust1, R17C, R10, R17Unit1, R17Qty1, R17Unit2, R17Qty2);
  ITEM_CLEAR(R18Cust1, R18C, R10, R18Unit1, R18Qty1, R18Unit2, R18Qty2);
  ITEM_CLEAR(R19Cust1, R19C, R10, R19Unit1, R19Qty1, R19Unit2, R19Qty2);
  ITEM_CLEAR(R20Cust1, R20C, R10, R20Unit1, R20Qty1, R20Unit2, R20Qty2);
  ITEM_CLEAR(R21Cust1, R21C, R10, R21Unit1, R21Qty1, R21Unit2, R21Qty2);
  ITEM_CLEAR(R22Cust1, R22C, R10, R22Unit1, R22Qty1, R22Unit2, R22Qty2);
  ITEM_CLEAR(R23Cust1, R23C, R10, R23Unit1, R23Qty1, R23Unit2, R23Qty2);
  ITEM_CLEAR(R24Cust1, R24C, R10, R24Unit1, R24Qty1, R24Unit2, R24Qty2);
end;

procedure TfrmDAIHAN_MAIN.btnCloseKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
// Start
    sleep(100);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);
    PanelMessage.Visible := false;
  end;
end;

procedure TfrmDAIHAN_MAIN.Button13Click(Sender: TObject);
begin
// 재발행
  frmRePrint := TfrmRePrint.Create(Self);
  try
      frmRePrint.ShowModal;
  finally
      frmRePrint.Free;
  end;
end;

procedure TfrmDAIHAN_MAIN.Button16Click(Sender: TObject);
begin
  frmPi := TfrmPi.Create(Self);
  try
    frmPi.Show;
  finally
//    frmPi.Free;
  end;
end;

end.
