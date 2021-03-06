//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utRePrint
//  파일내용  : DAS 입수내역 재발행 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utRePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, CheckLst, DB, DBTables, ComCtrls;

type
  TfrmRePrint = class(TForm)
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Label1: TLabel;
    Button3: TButton;
    DateTimePicker1: TDateTimePicker;
    ListBox1: TListBox;
    qrTemp: TQuery;
    qrSchedule: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRePrint: TfrmRePrint;

implementation

{$R *.dfm}

uses utDM, utPrint;

procedure TfrmRePrint.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime := now;
  Application.ProcessMessages;
  DateTimePicker1Change(Sender);
end;

procedure TfrmRePrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRePrint.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRePrint.Button1Click(Sender: TObject);
var
  i : integer;
begin
  if CheckListBox1.Items.Count < 1 then exit;

  for i := 0 to CheckListBox1.Items.Count - 1 do
  begin
    if CheckListBox1.Checked[i] then
    begin
      qrSchedule.Close;
      qrSchedule.Params[0].AsString := ListBox1.Items.Strings[ListBox1.Itemindex];
      qrSchedule.Params[1].AsString := trim(copy(CheckListBox1.Items.Strings[i],6, 12));
      qrSchedule.Open;
      if qrSchedule.FieldValues['TCNT'] <> qrSchedule.FieldValues['SCNT'] then
      begin
        beep;
        MessageDlg(qrSchedule.FieldValues['CUST_NAME']+ ' - DAS 분류가 끝나지 않았습니다.', mtWarning, [mbOk], 0);
      end
      else
      begin
        frmPrint := TfrmPrint.Create(Self);
        try
          frmPrint.qrPrint.Close;
          frmPrint.qrPrint.Params[0].AsString := ListBox1.Items.Strings[ListBox1.Itemindex];
          frmPrint.qrPrint.Params[1].AsString := trim(copy(CheckListBox1.Items.Strings[i],6, 12));
          frmPrint.qrPrint.Open;
          frmPrint.Print;
        finally
          frmPrint.Free;
        end;
      end;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmRePrint.DateTimePicker1Change(Sender: TObject);
begin
  ListBox1.Items.Clear;
  CheckListBox1.Items.Clear;

  qrTemp.Close;
  qrTemp.SQL.Clear;
  qrTemp.SQL.Add('SELECT ORDER_DT FROM PD126 ');
  qrTemp.SQL.Add('WHERE ORDER_DT LIKE '+ ''''+ FormatDateTime('YYYYMMDD', DateTimePicker1.Date) + '%'+ ''''+ ' ');
  qrTemp.SQL.Add('GROUP BY ORDER_DT ');
  qrTemp.SQL.Add('ORDER BY ORDER_DT ');
  qrTemp.Open;
  if qrTemp.RecordCount < 1 then exit;

  ListBox1.Items.Clear;
  CheckListBox1.Items.Clear;
  while not qrTemp.Eof do
  begin
    ListBox1.Items.Add(qrTemp.FieldValues['ORDER_DT']);
    qrTemp.Next;
  end;
  qrTemp.Close;
end;

procedure TfrmRePrint.ListBox1Click(Sender: TObject);
begin
  if ListBox1.Itemindex < 0 then exit;

  qrTemp.Close;
  qrTemp.SQL.Clear;
  qrTemp.SQL.Add('SELECT A.CUST_CODE, B.CUST_NAME, A.CELL_RESTORE');
  qrTemp.SQL.Add('FROM PD126 A, MT200 B');
  qrTemp.SQL.Add('WHERE A.ORDER_DT = :ORDER_DT');
  qrTemp.SQL.Add('  AND A.CUST_CODE = B.CUST_CODE');
  qrTemp.SQL.Add('ORDER BY CELL_RESTORE');
  qrTemp.Params[0].AsString := ListBox1.Items.Strings[ListBox1.Itemindex];
  qrTemp.Open;
  if qrTemp.RecordCount < 1 then
  begin
    beep;
    ShowMessage('해당 일자에 피킹내역이 없습니다.');
    exit;
  end;
  CheckListBox1.Items.Clear;
  while not qrTemp.Eof do
  begin
    CheckListBox1.Items.Add( format('%-3S', [qrTemp.FieldValues['CELL_RESTORE']])+ '- '+
                             format('%-13S', [qrTemp.FieldValues['CUST_CODE']])+
                             format('%-50S', [qrTemp.FieldValues['CUST_NAME']]) );
    qrTemp.Next;
  end;
  qrTemp.Close;
end;

end.
