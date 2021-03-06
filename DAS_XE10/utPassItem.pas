//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utPassItem
//  파일내용  : DAS 통과 제상품등록 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utPassItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, CheckLst, DB, DBTables;

type
  TfrmPassItem = class(TForm)
    cblItems: TCheckListBox;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    qryItemScan: TQuery;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassItem: TfrmPassItem;

implementation

{$R *.dfm}

uses utDAIHAN_MAIN, utPassItemPRT, utDM;

procedure TfrmPassItem.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmPassItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPassItem.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPassItem.Button1Click(Sender: TObject);
begin
  cblItems.Items.Clear;
  qryItemScan.Close;
  qryItemScan.Params[0].AsString := frmDAIHAN_MAIN.Label6.Caption;
  qryItemScan.Open;
  while not qryItemScan.Eof do
  begin
    cblItems.Items.Add(
      Format('%-20s', [qryItemScan.FieldValues['CATNO']])+ ' ('+
      Format('%7s', [qryItemScan.FieldByName('PICK_QTY').asstring])+ '/'+
      Format('%-6s', [qryItemScan.FieldByName('ORDER_UNIT').asstring])+ ' ) '+
      Format('%-20s', [qryItemScan.FieldValues['ITEM_CODE']])+ ' '+
      qryItemScan.FieldValues['ITEM_NAME']
    );
    qryItemScan.Next;
  end;
  qryItemScan.Close;
end;

procedure TfrmPassItem.Button6Click(Sender: TObject);
begin
  cblItems.Items.Clear;
  qryItemScan.Close;
  qryItemScan.Params[0].AsString := frmDAIHAN_MAIN.Label6.Caption;
  qryItemScan.Open;

  frmPassItemPRT := TfrmPassItemPRT.Create(Self);
  try
    frmPassItemPRT.Print;
   // func_PutDataPi(gcCOMM[giBCU1], 1,  Wcell,  1,  '0', GREENFLASH, '888888');
  finally
    frmPassItemPRT.Free;
  end;
  qryItemScan.Close;
end;

procedure TfrmPassItem.Button4Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to cblItems.Items.Count - 1 do
  begin
    cblItems.Checked[i] := True;
  end;
end;

procedure TfrmPassItem.Button5Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to cblItems.Items.Count - 1 do
  begin
    cblItems.Checked[i] := False;
  end;
end;

procedure TfrmPassItem.Button2Click(Sender: TObject);
var
  i : integer;

procedure PassOut(lblMast, lblCount : TLabel);
begin
  lblCount.Caption := IntToStr(strToInt(lblCount.Caption)+ 1);
  frmDAIHAN_MAIN.pnCount.Caption := inttostr(strtoint(frmDAIHAN_MAIN.pnCount.Caption) + 1);
  if lblMast.Caption = lblCount.Caption then
  begin
    frmDAIHAN_MAIN.proc_print(frmDAIHAN_MAIN.qryPassCount.FieldByName('CUST_CODE').AsString);
  end;
end;

begin
  if cblItems.Items.Count = 0 then exit;
  if MessageDlg('DAS 통과등록을 진행합니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then exit;
  for i := 0 to cblItems.Items.Count - 1 do
  begin
    if cblItems.Checked[i] then
    begin
      frmDAIHAN_MAIN.qryPassCount.Close;
      frmDAIHAN_MAIN.qryPassCount.Params[0].AsString := frmDAIHAN_MAIN.Label6.Caption;
      frmDAIHAN_MAIN.qryPassCount.Params[1].AsString := trim(copy(cblItems.Items.Strings[i],40,20));
      frmDAIHAN_MAIN.qryPassCount.Open;
      while not frmDAIHAN_MAIN.qryPassCount.eof do
      begin
        CASE frmDAIHAN_MAIN.qryPassCount.FieldByName('CELL_RESTORE').AsInteger OF
          01: PassOut(frmDAIHAN_MAIN.L0C, frmDAIHAN_MAIN.L0W);
          02: PassOut(frmDAIHAN_MAIN.L1C, frmDAIHAN_MAIN.L1W);
          03: PassOut(frmDAIHAN_MAIN.L2C, frmDAIHAN_MAIN.L2W);
          04: PassOut(frmDAIHAN_MAIN.L3C, frmDAIHAN_MAIN.L3W);
          05: PassOut(frmDAIHAN_MAIN.L4C, frmDAIHAN_MAIN.L4W);
          06: PassOut(frmDAIHAN_MAIN.L5C, frmDAIHAN_MAIN.L5W);
          07: PassOut(frmDAIHAN_MAIN.L6C, frmDAIHAN_MAIN.L6W);
          08: PassOut(frmDAIHAN_MAIN.L7C, frmDAIHAN_MAIN.L7W);
          09: PassOut(frmDAIHAN_MAIN.L8C, frmDAIHAN_MAIN.L8W);
          10: PassOut(frmDAIHAN_MAIN.L9C, frmDAIHAN_MAIN.L9W);
          11: PassOut(frmDAIHAN_MAIN.L10C, frmDAIHAN_MAIN.L10W);
          12: PassOut(frmDAIHAN_MAIN.L11C, frmDAIHAN_MAIN.L11W);
          13: PassOut(frmDAIHAN_MAIN.L12C, frmDAIHAN_MAIN.L12W);
          14: PassOut(frmDAIHAN_MAIN.L13C, frmDAIHAN_MAIN.L13W);
          15: PassOut(frmDAIHAN_MAIN.L14C, frmDAIHAN_MAIN.L14W);
          16: PassOut(frmDAIHAN_MAIN.L15C, frmDAIHAN_MAIN.L15W);
          17: PassOut(frmDAIHAN_MAIN.L16C, frmDAIHAN_MAIN.L16W);
          18: PassOut(frmDAIHAN_MAIN.L17C, frmDAIHAN_MAIN.L17W);
          19: PassOut(frmDAIHAN_MAIN.L18C, frmDAIHAN_MAIN.L18W);
          20: PassOut(frmDAIHAN_MAIN.L19C, frmDAIHAN_MAIN.L19W);
          21: PassOut(frmDAIHAN_MAIN.L20C, frmDAIHAN_MAIN.L20W);
          22: PassOut(frmDAIHAN_MAIN.L21C, frmDAIHAN_MAIN.L21W);
          23: PassOut(frmDAIHAN_MAIN.L22C, frmDAIHAN_MAIN.L22W);
          24: PassOut(frmDAIHAN_MAIN.L23C, frmDAIHAN_MAIN.L23W);
          25: PassOut(frmDAIHAN_MAIN.L24C, frmDAIHAN_MAIN.L24W);
          26: PassOut(frmDAIHAN_MAIN.R0C, frmDAIHAN_MAIN.R0W);
          27: PassOut(frmDAIHAN_MAIN.R1C, frmDAIHAN_MAIN.R1W);
          28: PassOut(frmDAIHAN_MAIN.R2C, frmDAIHAN_MAIN.R2W);
          29: PassOut(frmDAIHAN_MAIN.R3C, frmDAIHAN_MAIN.R3W);
          30: PassOut(frmDAIHAN_MAIN.R4C, frmDAIHAN_MAIN.R4W);
          31: PassOut(frmDAIHAN_MAIN.R5C, frmDAIHAN_MAIN.R5W);
          32: PassOut(frmDAIHAN_MAIN.R6C, frmDAIHAN_MAIN.R6W);
          33: PassOut(frmDAIHAN_MAIN.R7C, frmDAIHAN_MAIN.R7W);
          34: PassOut(frmDAIHAN_MAIN.R8C, frmDAIHAN_MAIN.R8W);
          35: PassOut(frmDAIHAN_MAIN.R9C, frmDAIHAN_MAIN.R9W);
          36: PassOut(frmDAIHAN_MAIN.R10C, frmDAIHAN_MAIN.R10W);
          37: PassOut(frmDAIHAN_MAIN.R11C, frmDAIHAN_MAIN.R11W);
          38: PassOut(frmDAIHAN_MAIN.R12C, frmDAIHAN_MAIN.R12W);
          39: PassOut(frmDAIHAN_MAIN.R13C, frmDAIHAN_MAIN.R13W);
          40: PassOut(frmDAIHAN_MAIN.R14C, frmDAIHAN_MAIN.R14W);
          41: PassOut(frmDAIHAN_MAIN.R15C, frmDAIHAN_MAIN.R15W);
          42: PassOut(frmDAIHAN_MAIN.R16C, frmDAIHAN_MAIN.R16W);
          43: PassOut(frmDAIHAN_MAIN.R17C, frmDAIHAN_MAIN.R17W);
          44: PassOut(frmDAIHAN_MAIN.R18C, frmDAIHAN_MAIN.R18W);
          45: PassOut(frmDAIHAN_MAIN.R19C, frmDAIHAN_MAIN.R19W);
          46: PassOut(frmDAIHAN_MAIN.R20C, frmDAIHAN_MAIN.R20W);
          47: PassOut(frmDAIHAN_MAIN.R21C, frmDAIHAN_MAIN.R21W);
          48: PassOut(frmDAIHAN_MAIN.R22C, frmDAIHAN_MAIN.R22W);
          49: PassOut(frmDAIHAN_MAIN.R23C, frmDAIHAN_MAIN.R23W);
          50: PassOut(frmDAIHAN_MAIN.R24C, frmDAIHAN_MAIN.R24W);
        end;
        frmDAIHAN_MAIN.qryPassCount.Next;
      end;

      frmDAIHAN_MAIN.qryPassUpdate.Close;
      frmDAIHAN_MAIN.qryPassUpdate.Params[0].AsString := trim(copy(frmDAIHAN_MAIN.Label4.Caption,1,10));
      frmDAIHAN_MAIN.qryPassUpdate.Params[1].AsString := frmDAIHAN_MAIN.Label6.Caption;
      frmDAIHAN_MAIN.qryPassUpdate.Params[2].AsString := trim(copy(cblItems.Items.Strings[i],40,20));
      frmDAIHAN_MAIN.qryPassUpdate.ExecSQL;
      Application.ProcessMessages;

      frmDAIHAN_MAIN.qrDASLOG.Close;
      frmDAIHAN_MAIN.qrDASLOG.Params[0].AsString :=frmDAIHAN_MAIN.Label6.Caption;
      frmDAIHAN_MAIN.qrDASLOG.Params[1].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[2].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[3].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[4].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[5].AsString :=trim(copy(cblItems.Items.Strings[i],40,20));
      frmDAIHAN_MAIN.qrDASLOG.Params[6].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[7].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[8].AsInteger:=0;
      frmDAIHAN_MAIN.qrDASLOG.Params[9].AsString :='';
      frmDAIHAN_MAIN.qrDASLOG.Params[10].AsString:='P';
      frmDAIHAN_MAIN.qrDASLOG.ExecSQL;
      Application.ProcessMessages;
      cblItems.Checked[i] := False;
    end;
  end;
  frmDAIHAN_MAIN.qryPassCount.Close;
  Beep;
  ShowMessage('DAS 통과등록이 끝났습니다.');
  Button1Click(Sender);
end;

end.
