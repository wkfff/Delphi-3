//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : frmLogIn
//  파일내용  : DAS 첫화면 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit frmLogIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,CPort, ExtCtrls, DB, DBTables, Grids, jpeg;

type
  TFOrderGet = class(TForm)
    Label1: TLabel;
    cbPickDate: TComboBox;
    sgWorker: TStringGrid;
    Label2: TLabel;
    cbWorker1: TComboBox;
    Button4: TButton;
    Bevel1: TBevel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Image1: TImage;
    qrPick: TQuery;
    qrUser: TQuery;
    qrSchedule: TQuery;
    qrTemp: TQuery;
    qrUpdate: TQuery;
    btnRefresh: TButton;
    btnPrint: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbPickDateChange(Sender: TObject);
    procedure sgWorkerKeyPress(Sender: TObject; var Key: Char);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FOrderGet: TFOrderGet;
  order_dt : String;
  nStartCell : integer;

  gbFTP_DOWN    : Boolean;
  giSTSCAN      : Integer;
  giHDSCAN      : Integer;
  giWEIGHT      : Integer;
  giBCU2        : Integer;
  giBCU1        : Integer;

  giBCU_ID      : Array of Integer;
  gsBCU_ZONE    : Array of String;


  giBCU_CNT     : Integer;
  giPI_CNT      : Integer;

const

  PISTART = 1;
  PIEND = 50;

implementation

uses Common, Common_Frm, Common_Opt, Common_Xls,
     utOPTION, frmOrdRcv, utDAIHAN_MAIN, utRePrint, UVersionInfo;

{$R *.dfm}
{$R XPTheme.RES}

procedure TFOrderGet.FormCreate(Sender: TObject);
begin
{
  giSTSCAN := 0;
  giHDSCAN := 0;
  giWEIGHT := 0;
  giBCU2   := 0;
  giBCU1   := 0;
}
  nStartCell := 99999;
  tmCOMMON.proc_Init(frmDAIHAN_MAIN);

//통신설정 가져오기
  giSTSCAN := func_txtGETIndex('고정스캐너', 1);
  giHDSCAN := func_txtGETIndex('핸드스캐너', 1);
  giWEIGHT := func_txtGETIndex('전자저울', 1);
  giBCU2   := func_txtGETIndex('BCU2', 1);
  giBCU1   := func_txtGETIndex('BCU1', 1);

  giPI_CNT := 0;

  qrPick.Close;
  qrPick.open;
  cbPickDate.Items.Clear;
  while not qrPick.Eof do
  begin
    cbPickDate.Items.Add(qrPick.FieldValues['ORDER_DT']);
    qrPick.Next;
  end;
  qrPick.Close;
  cbPickDate.Itemindex := -1;


// Find worker...
  qrUser.Close;
  qrUser.open;
  cbWorker1.Clear;
  while not qrUser.Eof do
  begin
    cbWorker1.Items.Add(Format('%-10s', [qrUser.FieldByName('USERID').asstring]) + ' ' + qrUser.FieldValues['NAME']);
    qrUser.Next;
  end;
  qrUser.Close;

// go
  sgWorker.Cells[1,0] := '거래처코드';
  sgWorker.Cells[2,0] := '거래처명';
  sgWorker.Cells[3,0] := '주문건수';
  sgWorker.Cells[4,0] := '완료건수/강제';
  sgWorker.Cells[5,0] := '지정셀';
  sgWorker.Cells[6,0] := '변경셀';
end;

procedure TFOrderGet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFOrderGet.Button7Click(Sender: TObject);
begin
  Close;
end;

procedure TFOrderGet.cbPickDateChange(Sender: TObject);
var
  i : integer;
begin
  sgWorker.EditorMode := true;
  cbWorker1.Enabled := true;
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;

  if cbPickDate.Itemindex = -1 then exit;

  qrSchedule.Close;
  qrSchedule.Params[0].AsString := cbPickDate.Text;
  qrSchedule.open;
  if qrSchedule.RecordCount < 1 then exit;
  sgWorker.RowCount := qrSchedule.RecordCount+ 1;
  i := 0;
  nStartCell := 99999;
  while not qrSchedule.Eof do
  begin
    inc(i);
    sgWorker.Cells[1, i] := qrSchedule.FieldValues['CUST_CODE'];
    sgWorker.Cells[2, i] := qrSchedule.FieldValues['CUST_NAME'];
    sgWorker.Cells[3, i] := qrSchedule.FieldValues['TCNT'];
    sgWorker.Cells[4, i] := qrSchedule.FieldValues['SCNT'];
    sgWorker.Cells[5, i] := qrSchedule.FieldValues['CELL'];
    sgWorker.Cells[6, i] := qrSchedule.FieldValues['CELL_RESTORE'];

    if qrSchedule.FieldValues['XCNT'] > 0 then
      sgWorker.Cells[4, i] := sgWorker.Cells[4, i] + '/' + floattostr(qrSchedule.FieldValues['XCNT']);

    if nStartCell > strtoint(sgWorker.Cells[6, i]) then
    begin
      nStartCell := strtoint(sgWorker.Cells[6, i]);
    end;
    if qrSchedule.FieldValues['SCNT'] > 0 then
    begin
      sgWorker.EditorMode := false;
      cbWorker1.Enabled := false;
      Button1.Enabled := false;
      Button2.Enabled := false;
      Button3.Enabled := false;
    end;
    qrSchedule.Next;
  end;
  qrSchedule.First;
  for i := 0 to cbWorker1.Items.Count - 1 do
  begin
    if trim(copy(cbWorker1.Items.Strings[i], 1, 10)) = qrSchedule.FieldValues['U_ID'] then
    begin
      cbWorker1.ItemIndex := i;
    end;
  end;
  qrSchedule.Close;
end;

procedure TFOrderGet.sgWorkerKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if sgWorker.Col < 6 then sgWorker.Col := sgWorker.Col + 1
    else
    begin
      if sgWorker.RowCount > sgWorker.Row + 1 then sgWorker.Row := sgWorker.Row + 1;
    end;
  end
  else
  begin
    if (sgWorker.Col < 6) or (Button1.Enabled = false) then
    begin
      key := #0;
      exit;
    end;
//
    if key = #8 then exit;
  end;
end;

procedure TFOrderGet.Button4Click(Sender: TObject);
var
  i : integer;
  cSchedule, cMast : string;
begin
  if cbWorker1.ItemIndex < 0 THEN
  BEGIN
    BEEP;
    MessageDlg('분류(DAS) 작업자를 선택하십시오.',mtWarning,[mbOK],0);
    exit
  END;

  qrTemp.Close;
  qrTemp.Open;
  if qrTemp.Fields[0].AsInteger = 0 then
  begin
    beep;
    MessageDlg('해당 피킹일자에 분류(DAS) 대상자료가 없습니다.', mtWarning, [mbOk], 0);
    exit;
  end;
  qrTemp.Close;

  cSchedule := '';
  cMast := '';
// 마스터 조회용
// 지우자니 아깝다 ㅠㅠ
//
//  for i := 1 to sgWorker.RowCount -1 do cMast := cMast + format('%-2s', [sgWorker.Cells[5,i]]) + '^';
//
  for i := 1 to 50 do cMast := cMast + format('%-2s', [copy(inttostr(i+100),2,2)]) + '^';
  for i := 1 to sgWorker.RowCount -1 do
  begin
    if (pos(format('%-2s', [sgWorker.Cells[6,i]])+ '^', cSchedule) > 0) or
       (pos(format('%-2s', [sgWorker.Cells[6,i]])+ '^', cMast) <= 0) then
    begin
      beep;
      MessageDlg('중복되는 셀이 있거나 없는 셀번호입니다.', mtWarning, [mbOk], 0);
      sgWorker.Col := 6;
      sgWorker.Row := i;
      exit;
    end;
    cSchedule := cSchedule + format('%-2s', [sgWorker.Cells[6,i]]) + '^';
  end;
   order_dt := cbPickDate.Text;
// Here I am...
  for i := 1 to sgWorker.RowCount -1 do
  begin
    qrUpdate.Params[0].AsString := sgWorker.Cells[6, i];
    qrUpdate.Params[1].AsString := trim(copy(cbWorker1.Text, 1, 10));
    qrUpdate.Params[2].AsString := cbPickDate.Text;
    qrUpdate.Params[3].AsString := sgWorker.Cells[1, i];
    qrUpdate.ExecSQL;
  end;
  Application.ProcessMessages;

// 2011.07.14
//
//  frmMonitor := TfrmMonitor.Create(Self);
  frmDAIHAN_MAIN := TfrmDAIHAN_MAIN.Create(Self);
  try
//      frmMonitor.Show;
//
    order_dt := cbPickDate.Text;
    frmDAIHAN_MAIN.Label4.Caption := cbWorker1.Text;
    frmDAIHAN_MAIN.Label5.Caption := cbWorker1.Text;
    frmDAIHAN_MAIN.Label6.Caption := cbPickDate.Text;
    frmDAIHAN_MAIN.ShowModal;
  finally
//      frmMonitor.Free;
    frmDAIHAN_MAIN.Free;
  end;

// 2011.06.07
// 2011.DAS-7번
// 최초 DAS 진입 후 1건이상 처리 후 메뉴 복귀시에 쿼리 확인 후
// 재정렬버튼 Disabled 처리
//
  cbPickDateChange(Sender);
end;

procedure TFOrderGet.Button6Click(Sender: TObject);
begin
  fmOPTION := TfmOPTION.Create(Self);
  try
    fmOPTION.ShowModal;
  finally
    fmOPTION.Free;
  end;
end;

procedure TFOrderGet.Button5Click(Sender: TObject);
begin
  FPITest := TFPITest.Create(Self);
  try
      FPITest.ShowModal;
  finally
      FPITest.Free;
  end;
end;

procedure TFOrderGet.btnRefreshClick(Sender: TObject);
begin
  cbWorker1.ItemIndex := -1;
  sgWorker.RowCount := 2;
  sgWorker.Cells[1, 1] := '';
  sgWorker.Cells[2, 1] := '';
  sgWorker.Cells[3, 1] := '';
  sgWorker.Cells[4, 1] := '';
  sgWorker.Cells[5, 1] := '';
  sgWorker.Cells[6, 1] := '';

  qrPick.Close;
  qrPick.open;
  cbPickDate.Items.Clear;
  while not qrPick.Eof do
  begin
    cbPickDate.Items.Add(qrPick.FieldValues['ORDER_DT']);
    qrPick.Next;
  end;
  qrPick.Close;
  cbPickDate.Itemindex := -1;
end;

procedure TFOrderGet.Button1Click(Sender: TObject);
var
  i, nCell1, nCell2 : integer;
begin
  if sgWorker.RowCount = 1 then exit;

  nStartCell := 1;
  nCell1 := 1;
  nCell2 := 26;
  for i := 1 to sgWorker.RowCount - 1 do
  begin
    if i mod 2 = 1 then
    begin
       sgWorker.Cells[6, i] := copy(inttostr(nCell1+100),2,2);
       inc(nCell1);
    end
    else
    begin
       sgWorker.Cells[6, i] := copy(inttostr(nCell2+100),2,2);
       inc(nCell2);
    end;
  end;
end;

procedure TFOrderGet.Button2Click(Sender: TObject);
var
  i : integer;
begin
  if (sgWorker.RowCount = 1) or (nStartCell = 1) then exit;

  nStartCell := nStartCell - 1;
  for i := 1 to sgWorker.RowCount - 1 do
  begin
    sgWorker.Cells[6, i] := copy(inttostr((strtoint(sgWorker.Cells[6, i])+100)-1),2,2);
  end;
end;

procedure TFOrderGet.Button3Click(Sender: TObject);
var
  i : integer;
begin
  if (sgWorker.RowCount = 1) or (nStartCell * 2 + (sgWorker.RowCount - 1) > 50) then exit;

  nStartCell := nStartCell + 1;
  for i := 1 to sgWorker.RowCount - 1 do
  begin
    sgWorker.Cells[6, i] := copy(inttostr((strtoint(sgWorker.Cells[6, i])+100)+1),2,2);
  end;
end;

procedure TFOrderGet.btnPrintClick(Sender: TObject);
begin
// 재발행
  frmRePrint := TfrmRePrint.Create(Self);
  try
      frmRePrint.ShowModal;
  finally
      frmRePrint.Free;
  end;
end;

procedure TFOrderGet.FormShow(Sender: TObject);
begin
  Caption := '대한과학 DAS 시스템 Build ' + fnGetVersionInfo(tvFileVersion);
end;

end.
