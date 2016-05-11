unit ULib;

interface

uses
  AdvGrid,UDM,Dialogs,SysUtils,ComCtrls,Forms,DBTables,
  Windows,Messages,Variants,Classes,Graphics,Controls,StdCtrls,ExtCtrls,Gauges,Buttons,Registry,Grids,
  DBGrids,ComObj,DB;

type
  TZipcode = packed record
    FZipCode : String;
    FAddress : String;
end;

// �׸��� üũ�ڽ� �Ӽ�
type
  TGridCheckBox = packed record
    FIs       : Boolean;
    FColIndex : Integer;
end;   

// ���ڵ� ���
type
  TBarcodeHeader = packed record
    FVBELN       : String;
    //FLINE        : Integer;
    FCUST_CD     : String;
    FWRK_DT      : String;
    FDLV_CUST_NM : String;
    FBOX_NO      : Double;
    FROUTE_ID    : Integer; // 1:�װ�, 2:����
    FBRGEW       : Double;
end;

const
  gcALL = -999;
  giCOMP_CODE = 1000;// Integer;

  gcCNC_REMK   = 1; // ��������
  gcQUICK_STAT = 2; // ���
  gcROUTE      = 3; // ��ۼ���

  gcCUST_TRANS = 4; // ��۱ǿ�
  gcAUTH_LEVEL = 5; // ����

  gcAir  = 1;
  gcShip = 2;
  gcEMAKTXLen = 35;

  gcUserDefine = '999999';
                                              
  gcSetNone = 0; // �Ϲ�
  gcSet     = 1; // �Ϲݼ�Ʈ(������ڵ� ����)
  gcSetReg  = 2; // ��Ʈ�Է�(������ڵ� ����)
  gcSetDone = 3; // ��Ʈ�Ϸ�


  gcNumeric = 44;

var
  gbTest : Boolean;

  gsUserID    : String;
  gsUserPass  : String;
  gsAUTH_LEVEL: String;
  AZipcode    : TZipcode;
  gsVersion   : String;
  gsIPSS_ADDR : String;
  giLINE_CODE : Integer;
  ABarcodeHeader : TBarcodeHeader;
  giNowPage   : Integer;
  gsNowDate   : String;
  gsNowDateShort : String;
  gsNowDateTime : String;

  gsVBELN     : String;
  giSetType   : Integer; // 1:�Ϲ� Setǰ 2:Set �Է�(�����ڵ���°�)
  gsSET_DESC  : String;


  procedure pr_ClearGrid(AGrid:TAdvStringGrid);
  procedure pr_noInfo_message(qryMain:TQuery; AStatusBar:TStatusBar);
  procedure pr_QryToGridWithProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; AFormat:String);overload;
  procedure pr_QryToGridWithProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Integer; APROPERTY_STATE_OLD:Integer);overload;
  procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ASequenceFormat:String; AStrartCol:Integer;AGridCheckBox:boolean);overload;
  procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ASequenceFormat:String;AMessage:Integer);overload;
  procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Integer);overload;
  procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Array of Integer);overload;
  //function  fn_Fwait:TZipcode;

  procedure pr_ShowMessage(AMessage:String);
  function  fn_ShowMessageYN(AMessage:String):Integer;
  function  fn_GetNumber(S: string): string;
  function  fn_IsCheck(AStringGrid:TAdvStringGrid; ACol:Integer):Boolean;
  function  fn_SetCalendar(ASpeedButton: TBitBtn; ALeft: Integer): string;overload;
  function  fn_SetCalendar(ASpeedButton: TBitBtn; ASTDT_DATE: string; ALeft: Integer): string;overload;
  function  fn_GetSQL(AIndex: Integer):String;
  function  fn_TableToTCombo(AALL, AIndex:Integer; uComboBox:TComboBox):Integer;
  function  fn_GetOraAlias : TStringList;

  function  fn_GetNowDateTime:String;overload;
  function  fn_GetNowDateTime(ASort:Integer):String;overload;

  procedure proc_ExchangeGridRows( pGrid: TStringGrid; iFromRow, iToRow: Integer );
  procedure proc_SortStringgrid( pGrid: TStringGrid; pColumn1, pColumn2: LongInt;
                                 pSort: Integer; pSort1 : Integer = 0 );
  procedure Grid_Clear(Sender: TObject);overload;      // Grid Buffer �� Clear
  procedure Grid_Clear(Sender: TObject; pColumn: Integer; pValue: String; pClear: Integer = 0 );overload;
  procedure Grid_Clear(Sender: TObject; pColumn1, pColumn2: Integer;
                       pValue1, pValue2: String; pClear: Integer = 0 );overload;  // 2006.01.26 Shim



  procedure pr_PrintBarCode(ABarcodeHeader:TBarcodeHeader; sgSub:TadvStringGrid);
  procedure proc_LptPrint(sPrintStr : String);
  function  FindTextForStringGrid(StringGrid: TStringGrid; const Text: string): Integer;

  procedure DBGrid2Excel(cTitle : string; zDBGrids : TDBGrid);

  Function func_AppExec(ExeFileName :string):integer ;                        // �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ����ʴ� �Լ�
  Function func_AppExec_Wait(FormName :Tform ;ExeFileName :string):integer ;  // �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ��� �Լ�

  function fn_Grid2Excell(AForm:TForm; AGrid:TAdvStringGrid):Boolean;

  function  fn_DelCharacter(S: string): string;   
  function  fn_FindIndex(AComboBox: TComboBox; AFind: String): Integer;

const
  CR  = $0d;
  LF  = $0a;
  STX = $02;
  ETX = $03;
  EOT = $04;
  ENQ = $05;
  ACK = $06;
  NAK = $15;
  SYN = $16;
  TAB = $09;
  NUL = $00;
  ESC = $1b;
  OK  = '1';
  NO  = '0';

  BIF_RETURNONLYFSDIRS   = $0001;

  gsFILENAME1   : String = ('Option.ini');
  gsWork_Text01 : String = ('Work_Text01.Txt');
  gsWork_Text02 : String = ('Work_Text02.Txt');
  gsMasterDB_Nm : string = ('Master.db');
  gsPDA_Path    : string = ('\IPSM\soongsil\');
  

    //   ���� ��θ� �����´�.
  function func_GetFolder() : String;
  function fn_Save2Excell(AForm:TForm; AGrid:TAdvStringGrid):Boolean;



implementation

uses UPMSG, DateSet;

procedure pr_ClearGrid(AGrid:TAdvStringGrid);
var
  liRow, liCol : Integer;
begin
  with AGrid do begin
    for liRow := 1 to AGrid.RowCount - 1 do begin
      for liCol := 1 to AGrid.ColCount - 1 do begin
          AGrid.Cells[liCol, liRow] := '';
      end;
    end;
  end;
  AGrid.RowCount := 2;
end;

procedure pr_noInfo_message(qryMain:TQuery; AStatusBar:TStatusBar);
var
 liRecordCount : Integer;
begin
  if qryMain.IsEmpty then begin
     ShowMessage('�ش������� �������� �ʽ��ϴ�.');
     Exit;
  end;
  if qryMain.Fields[0].AsInteger = 0 then begin
     ShowMessage(qryMain.Fields[1].Value);
     Exit;
  end;
  liRecordCount := qryMain.RecordCount;
  AStatusBar.Panels.Items[0].Text := '��ȸ���:'+FormatFloat('#,###,##0��',liRecordCount);
  Application.ProcessMessages;
end;


procedure pr_QryToGridWithProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; AFormat:String);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
begin

  FQWait := TForm.Create(Application);

  try
    FQWait.Height      := 100;
    FQWait.BorderIcons := [];
    FQWait.Position    := poScreenCenter;
    FQWait.Caption     := '�����͸� ó�����Դϴ�...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '�����͸� ó�����Դϴ�...';
    APanel.Align   := alClient;

    FQWait.Show;
    FQWait.Update;


    liRow := 0;
    
    AQuery.Open;
    if AQuery.IsEmpty then begin
      FQWait.Close;
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;
    AGauge.MaxValue        := AQuery.RecordCount;

    while not AQuery.Eof do begin  //Rowī��Ʈ����

      advStringGrid.Cells[0 , liRow+1] := Formatfloat(AFormat,liRow+1);
      AGauge.Progress := liRow;
      Application.ProcessMessages;

      for liCol := 0 to AQuery.FieldCount -1 do begin
        advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
      end;

      liRow := liRow+1;


      AQuery.Next;

    end;       
    advStringGrid.AutoNumberCol(0);
    advStringGrid.AutoSize := True;
    
    FQWait.Close;
  finally
    FQWait.Free;
    FQWait := nil;
  end;

end;

procedure pr_QryToGridWithProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Integer; APROPERTY_STATE_OLD:Integer);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
begin

  FQWait := TForm.Create(Application);

  try
    FQWait.Height      := 100;
    FQWait.BorderIcons := [];
    FQWait.Position    := poScreenCenter;
    FQWait.Caption     := '�����͸� ó�����Դϴ�...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '�����͸� ó�����Դϴ�...';
    APanel.Align   := alClient;

    FQWait.Show;
    FQWait.Update;


    liRow := 0;
    
    AQuery.Open;
    if AQuery.IsEmpty then begin
      FQWait.Close;
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;
    AGauge.MaxValue        := AQuery.RecordCount;

    while not AQuery.Eof do begin  //Rowī��Ʈ����

      AGauge.Progress := liRow;
      Application.ProcessMessages;
      case ANumeric of
        44 : begin  

                for liCol := 0 to AQuery.FieldCount -1 do begin
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
        else begin   
                for liCol := 0 to AQuery.FieldCount -1 do begin
                  if (ANumeric = liCol+1) then
                    advStringGrid.Cells[liCol+1, liRow+1] := FormatFloat('#,###,###,###',AQuery.Fields[liCol].Value)
                  else
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
      end;

      advStringGrid.Cells[APROPERTY_STATE_OLD, liRow+1] := AQuery.FieldValues['PROPERTY_STATE'];

      liRow := liRow+1;
      AQuery.Next;
      
    end;                             
    advStringGrid.AutoNumberCol(0);
    advStringGrid.AutoSize := True;

    
    FQWait.Close;
  finally
    FQWait.Free;
    FQWait := nil;
  end;

end;


procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ASequenceFormat:String; AStrartCol:Integer;
                                      AGridCheckBox:boolean);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
begin

    liRow := 0;
    
    AQuery.Open;
    if AQuery.IsEmpty then begin
      
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;
    advStringGrid.AddCheckBox(1, 0, False, False);

    while not AQuery.Eof do begin  //Rowī��Ʈ����

      advStringGrid.Cells[0, liRow+1] := Formatfloat(ASequenceFormat,liRow+1);
      if AGridCheckBox = true then begin
        advStringGrid.AddCheckBox(1, liRow+1, False, False);
      end;

      Application.ProcessMessages;

      for liCol := 0 to AQuery.FieldCount -1 do begin
        advStringGrid.Cells[liCol+1+AStrartCol,liRow+1] := AQuery.Fields[liCol].AsString;
      end;
      liRow := liRow+1;
      AQuery.Next;

    end;

end;


procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ASequenceFormat:String; AMessage:Integer);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
begin

    liRow := 0;
    
    AQuery.Open;
    if AQuery.IsEmpty then begin
      if AMessage = 1 then pr_ShowMessage('�����Ͱ� �������� �ʽ��ϴ�.');
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;

    while not AQuery.Eof do begin  //Rowī��Ʈ����

      advStringGrid.Cells[0, liRow+1] := Formatfloat(ASequenceFormat,liRow+1);
      Application.ProcessMessages;

      for liCol := 0 to AQuery.FieldCount -1 do begin
        advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
      end;
      liRow := liRow+1;
      AQuery.Next;

    end;

end;


procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Integer);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
begin

  FQWait := TForm.Create(Application);

  try
    FQWait.Height      := 100;
    FQWait.BorderIcons := [];
    FQWait.Position    := poScreenCenter;
    FQWait.Caption     := '�����͸� ó�����Դϴ�...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '�����͸� ó�����Դϴ�...';
    APanel.Align   := alClient;

    FQWait.Show;
    FQWait.Update;


    liRow := 0;
    
    AQuery.Open;
    if AQuery.IsEmpty then begin
      FQWait.Close;
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;
    AGauge.MaxValue        := AQuery.RecordCount;

    while not AQuery.Eof do begin  //Rowī��Ʈ����

      AGauge.Progress := liRow;
      Application.ProcessMessages;
      case ANumeric of
        44 : begin  

                for liCol := 0 to AQuery.FieldCount -1 do begin
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
        else begin   
                for liCol := 0 to AQuery.FieldCount -1 do begin
                  if (ANumeric = liCol+1) then
                    advStringGrid.Cells[liCol+1, liRow+1] := FormatFloat('#,###,###,###',AQuery.Fields[liCol].Value)
                  else
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
      end;

      liRow := liRow+1;
      AQuery.Next;
      
    end;
    advStringGrid.AutoNumberCol(0);
    advStringGrid.AutoSize := True;


    FQWait.Close;
  finally
    FQWait.Free;
    FQWait := nil;
  end;

end;


procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Array of Integer);
var
  FQWait : TForm;
  APanel : TPanel;
  AGauge : TGauge;

  liCol : integer;
  liRow : integer;
  liMax : integer;

  liPos : integer;
  liNumeric : integer;
begin

  FQWait := TForm.Create(Application);

  try

    FQWait.Height      := 100;
    FQWait.BorderIcons := [];
    FQWait.Position    := poScreenCenter;
    FQWait.Caption     := '�����͸� ó�����Դϴ�...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '�����͸� ó�����Դϴ�...';
    APanel.Align   := alClient;

    FQWait.Show;
    FQWait.Update;


    liRow := 0;

    AQuery.Open;
    if AQuery.IsEmpty then begin
      FQWait.Close;
      Exit;
    end;

    if AQuery.Fields.FieldByNumber(1).AsString = '0' then begin
      FQWait.Close;
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 1;
    AGauge.MaxValue        := AQuery.RecordCount;


    liMax := High(ANumeric);      

    liPos := 0;

    if liMax = 0 then
      liNumeric := gcNumeric
    else
      liNumeric := ANumeric[liPos];


    while not AQuery.Eof do begin  //Rowī��Ʈ����

      AGauge.Progress := liRow;
      Application.ProcessMessages;

      case liNumeric of
        44 : begin

                for liCol := 0 to AQuery.FieldCount -1 do begin
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
        else begin
                for liCol := 0 to AQuery.FieldCount -1 do begin

                  liMax := 0;
                  for liPos := 0 to High(ANumeric) do
                    if (ANumeric[liPos] = liCol+1) then begin
                      advStringGrid.Cells[liCol+1, liRow+1] := FormatFloat('#,###,###,###',AQuery.Fields[liCol].Value);
                      liMax := 1;
                      Break;
                    end;
                  if liMax = 0 then
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
      end;

      liRow := liRow+1;
      AQuery.Next;
      
    end;                             
    advStringGrid.AutoNumberCol(0);
    advStringGrid.AutoSize := True;


    FQWait.Close;
  finally
    FQWait.Free;
    FQWait := nil;
  end;

end;

{
function fn_Fwait: TZipcode;
begin
  Result.FZipCode := '';
  Result.FAddress := '';


end;
}    

procedure pr_ShowMessage(AMessage:String);
begin
  FPMSG := TFPMSG.Create(Application);
  try
  FPMSG.gsMessage  := AMessage;
  FPMSG.ShowModal;
  finally
    FPMSG.Free;
    FPMSG := nil;
  end;
end;

function fn_ShowMessageYN(AMessage:String):Integer;
begin
  Result := 2;
  FPMSG := TFPMSG.Create(Application);
  FPMSG.giYN       := 1;
  FPMSG.gsMessage  := AMessage;
  if FPMSG.ShowModal = mrOK then begin
    Result := 1;
  end;
end;

//------------------------------------------------------------------------------
// ���ڿ����� ���ڸ� �������� �Լ�
//------------------------------------------------------------------------------

function fn_GetNumber(S: string): string;
var
  iL: Word;
  Rs: string;
begin
  Rs := '';
  for iL := 1 to Length(S) do
  begin
//    if (Rs = '') and (S[iL] = '0' ) then
//      Continue;
    if S[iL] in ['0'..'9'] then Rs := Rs + S[iL];
//    if S[iL] in ['0'..'9','.','-'] then Rs := Rs + S[iL];
  end;

//  if (Trim(Rs) = '') or (Trim(Rs) = '-') or (Trim(Rs) = '.') then Rs := '0';
  Result := Rs;
end;

function  fn_IsCheck(AStringGrid:TAdvStringGrid; ACol:Integer):Boolean;
var
  liRow   : Integer;
  lbCheck : Boolean;
begin

  Result := False;
  
  with AStringGrid do begin
    for liRow := 1 to AStringGrid.RowCount - 1 do begin
      GetCheckBoxState(ACol, liRow, lbCheck);
      If lbCheck Then Begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

function fn_SetCalendar(ASpeedButton: TBitBtn; ALeft: Integer): string;
begin
  frmDateSet := TfrmDateSet.Create(Application);
  if ALeft > 0 then
    frmDateSet.Left := ALeft
  else
    frmDateSet.Left := ASpeedButton.Left;
  frmDateSet.Top := ASpeedButton.Top + ASpeedButton.Height + 75;

  try
    if (frmDateSet.ShowModal = mrOK) and
      (frmDateSet.fkey <> '') then
    begin
      Result := frmDateSet.fkey;
    end
    else
    begin
//        Result := 'False';
    end;
  finally
    frmDateSet.Free;
    frmDateSet := nil;
  end;
end; 

function fn_SetCalendar(ASpeedButton: TBitBtn; ASTDT_DATE: string; ALeft: Integer): string;
begin
  frmDateSet := TfrmDateSet.Create(Application);
  frmDateSet.gsSTDT_DATE := ASTDT_DATE;
  if ALeft > 0 then
    frmDateSet.Left := ALeft
  else
    frmDateSet.Left := ASpeedButton.Left;
  frmDateSet.Top := ASpeedButton.Top + ASpeedButton.Height + 75;

  try
    if (frmDateSet.ShowModal = mrOK) and
      (frmDateSet.fkey <> '') then
    begin
      Result := frmDateSet.fkey;
    end
    else
    begin
//        Result := 'False';
    end;
  finally
    frmDateSet.Free;
    frmDateSet := nil;
  end;
end; 

function  fn_GetSQL(AIndex: Integer):String;
begin
  case AIndex of
    // �ŷ�ó
    gcCUST_TRANS : Result :=
                             ' select ''[''+CODE_CD+''] ''+ CODE_SNM '+
                             '   from MT900                          '+
                             ' where code_tp = ''1300''              '+
                             '   and code_cd <> ''''                 '+
                             '  order by CODE_SNM                    ';
    //
    gcAUTH_LEVEL : Result :=
                             ' select ''[''+CODE_CD+''] ''+ CODE_SNM '+
                             '   from MT900                          '+
                             ' where code_tp = ''1000''              '+
                             '   and code_cd <> ''''                 '+
                             '  order by CODE_SNM                    ';
    // ��������
    gcCNC_REMK : Result :=
                             ' select case when mior_code = ''0'' then ''[''+mior_code+''] ''+ majr_name '+
                             ' 			else ''[''+mior_code+''] ''+ mior_name '+
                             ' 		end                                            '+
                             '   from cm_code                                          '+
                             '  where comp_code = '+IntToStr(giCOMP_CODE)+''+
                             '    and majr_code = ''CNC_REMK''             '+
                             '    and usag_sort = 1                        '+
                             '  order by mior_code                         ';
    // ��޿���
    gcQUICK_STAT : Result :=
                             ' select case when mior_code = ''0'' then ''[''+mior_code+''] ''+ majr_name '+
                             ' 			else ''[''+mior_code+''] ''+ mior_name '+
                             ' 		end                                            '+
                             '   from cm_code                                          '+
                             '  where comp_code = '+IntToStr(giCOMP_CODE)+''+
                             '    and majr_code = ''QUICK_STAT''           '+
                             '    and usag_sort = 1                        '+
                             '  order by mior_code                         ';
    // ��޿���
    gcROUTE     : Result :=
                             ' select case when mior_code = ''0'' then ''[''+mior_code+''] ''+ majr_name '+
                             ' 			else ''[''+mior_code+''] ''+ mior_name '+
                             ' 		end                                            '+
                             '   from cm_code                                          '+
                             '  where comp_code = '+IntToStr(giCOMP_CODE)+''+
                             '    and majr_code = ''ROUTE_ID''             '+
                             '    and usag_sort = 1                        '+
                             '  order by mior_code                         ';
  end;
end;

//---------------------------------------------------------
// ���̺��� �о TwCombo�ڽ��� Items�� Values�� �����ϱ�
// SQL������ ù��° Column�� Items���� �׸�
//     "     �ι�° Column�� Values�� �� �׸�
//---------------------------------------------------------
function fn_TableToTCombo(AALL, AIndex:Integer; uComboBox:TComboBox):Integer;
var
  Q1 : TQuery;
begin
  Q1 := TQuery.Create(Application);
  Q1.DatabaseName := DM.dbMain.DatabaseName;
  Q1.SQL.Clear;

  Q1.SQL.Add(fn_GetSQL(AIndex));

  uComboBox.Items.Clear;

  if AALL = 1 then begin       
    if (uComboBox is TComboBox) then begin
      (uComboBox as TComboBox).Items.Add('ALL');
    end;
  end;


  try
    Q1.Open;
    if Q1.RecordCount > 0 then begin
      // DB Master Table�� Open�� �� ��� ���ڵ带 �о�
      // �޺��ڽ��� �ִ´�.
      while not Q1.Eof do begin
        if (uComboBox is TComboBox) then begin
          (uComboBox as TComboBox).Items.Add(Q1.Fields.Fields[0].AsString);
        end;
        Q1.Next;
      end;
    end;
  except
    on E : EDBEngineError do
    begin
      //FError.ShowError('Q', E, 'UAPLib : fn_TableToTCombo');
      Exit;
    end;
  end;

  if (uComboBox is TComboBox) then begin
    if (uComboBox as TComboBox).Items.Count > 0 then
      Result := 0
    else
      Result := -1;
  end;

  Q1.Close;
  Q1.Free;
end;

function fn_GetOraAlias : TStringList;
var
  ResultStringList : TStringList;
  OraHome, OraNet, TempString : String;
  Reg : TRegistry;
  i, ReturnPos : Integer;
begin
  // Result Initialize..
  ResultStringList := TStringList.Create;
  ResultStringList.Clear;
  Result := ResultStringList;

  // Read Oracle Home Path From Registry..
  Reg         := TRegistry.Create;
  Reg.RootKey := HKey_Local_Machine;
  Reg.OpenKey('SOFTWARE\ORACLE', False);
  OraHome := Reg.ReadString('ORACLE_HOME');
  OraNet  := OraHome + '\Network' + '\Admin';
  if not FileExists(OraNet + '\TNSNAMES.ORA') then OraNet := OraHome + '\NET80' + '\Admin';
  Reg.Free;

  ResultStringList.LoadFromFile(OraNet + '\TNSNAMES.ORA');

  for i := 0 to ResultStringList.Count - 1 do
    if Copy(ResultStringList[i],1,1) = '#' then ResultStringList[i] := '';
    
  TempString := UpperCase(ResultStringList.Text);
  ResultStringList.Clear;
  ResultStringList.Add(TempString);
  //ResultStringList.Add( GF_AllTrim(TempString));
  TempString := ResultStringList.Text;
  ResultStringList.Clear;

  i := 1;
  ReturnPos := 0;
  while True do begin
    ReturnPos := Pos(UpperCase('=(DESCRIPTION='), UpperCase(TempString));
    if ReturnPos = 0 then Break;
    i := ReturnPos;
    while True do begin
      if (Copy(TempString, i, 1) = ')') or ( i = 1 ) then begin
        Break;
      end;
      Dec(i);
    end;
    if i <> 1 then Inc(i);

    ResultStringList.Add(Copy(TempString, i, ReturnPos - i ));
    TempString := Copy(TempString, ReturnPos + 14, Length(TempString));
  end;

  Result := ResultStringList;
end; 


procedure pr_PrintBarCode(ABarcodeHeader:TBarcodeHeader; sgSub:TadvStringGrid);
const
  gcFirstDiv = 3;
  gcDiv      = 4;
  gcFirst    = '230';
  gcNormal   = '140';
  gcIntervarY = 140;

  //sgSub
  S_SEQN_NUMB = 0;
  S_SELC_TION = 1;
  S_MATNR     = 2;
  S_MAKTX     = 3;
  S_MDATE     = 4;
  S_LOT_NO    = 5;
  S_DONE_QTY  = 6;
  S_EMAKTX    = 7;

var
  liTotalPage          : Integer;
  lsBarFooter          : String; // ������ ����Ʈ ��
  lsBarcode            : String;
  lsPrintList          : String;


  // ��ü ������ �� ���ϱ�
  function fn_GetPage:Integer;
  var
    lidiv  : Integer;
    liPage : Integer;
  begin
    liTotalPage := sgSub.RowCount -1;
    liTotalPage := liTotalPage - gcFirstDiv;

    if liTotalPage <= 0 then begin
      Result := 1;
      Exit;
    end;

    liPage := 1;
    lidiv  := liTotalPage div gcDiv;
    liPage := liPage + lidiv;
    if (liTotalPage mod gcDiv > 0) then
      Inc(liPage);

    Result := liPage;
  end;

  procedure pr_PrintBarcode(ASort:Integer);
  begin
    case ASort of
      1 : lsPrintList := lsPrintList + lsBarcode + lsBarFooter;
    else
      lsPrintList := lsPrintList + lsBarFooter;
    end;
    proc_LptPrint(lsPrintList);
  end;

var
  liRow                          : Integer;
  liMATNR                        : Integer;
  lsHeader                       : String;
  liY, liY2                      : Integer;
  lsEMAKTX, lsEMAKTX1, lsEMAKTX2 : String;    // ���� �����ڵ� ���ڿ� ������
  liPos, liLen, li, liFirst, liFind : Integer;

begin

  giNowPage   := 1;
  liTotalPage := fn_GetPage;



  // ���ڵ� ������ ���κ�
  lsBarFooter := '^PQ1^FS~SD21^FS^PRD^FS^XZ';
  lsBarcode   := ABarcodeHeader.FVBELN + FormatFloat('00',giLINE_CODE) + FormatFloat('0000',ABarcodeHeader.FBOX_NO);
  lsBarcode   := '^FO110,830^BY3,3^BAN,90,Y,N,N^FD'+ lsBarcode + '^FS'; // �ڽ��ױ� ����Ʈ

  liMATNR     := 0;
  liY         := 410;

  for liRow := 1 to sgSub.RowCount -1 do begin

    lsEMAKTX    := Trim(sgSub.Cells[S_EMAKTX,   liRow]);  // ���� �����ڵ� ���ڿ� ������
    liLen       := Length(lsEMAKTX);
    lsEMAKTX1   := lsEMAKTX;
    liFirst     := 0;
    if liLen > gcEMAKTXLen then begin
      liFind := 0;
      for li := 1 to liLen do begin
        lsEMAKTX1 := Copy(lsEMAKTX1, liPos+1, liLen);
        liPos  :=  Pos(' ', lsEMAKTX1);
        liFind := liFind + liPos;
        if liFind > gcEMAKTXLen then begin
           break;
        end;
        liFirst := liFind;
      end;

      lsEMAKTX1   :=  Copy(lsEMAKTX,1 ,liFirst);
      lsEMAKTX2   :=  Copy(lsEMAKTX,liFirst+1, liLen - liFirst);

      lsPrintList :=  lsPrintList + '^FO30,'  + IntToStr(liY+liMATNR*gcIntervarY+40) + '^A0N,40,40^FD' + lsEMAKTX1 + '^FS';
      lsPrintList :=  lsPrintList + '^FO30,'  + IntToStr(liY+liMATNR*gcIntervarY+80) + '^A0N,40,40^FD' + lsEMAKTX2 + '^FS';

    end
    else begin
      lsPrintList :=  lsPrintList + '^FO30,'  + IntToStr(liY+liMATNR*gcIntervarY+40)    + '^A0N,40,40^FD' + lsEMAKTX + '^FS';
    end;


    lsPrintList :=  lsPrintList + '^FO30,'  + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_MATNR,    liRow] + '^FS';
    // ����
    // LOT ��ȣ�� gcUserDefine �̸� �������ڵ� ������� �ʴ°� ���� 2008.05.07
//    if sgSub.Cells[S_LOT_NO, liRow] <> gcUserDefine then begin
//      lsPrintList :=  lsPrintList + '^FO250,' + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_MDATE,    liRow] + '^FS';
//      lsPrintList :=  lsPrintList + '^FO490,' + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_LOT_NO,   liRow] + '^FS';
//    end;
    if sgSub.Cells[S_LOT_NO, liRow] <> gcUserDefine then begin
      lsPrintList :=  lsPrintList + '^FO490,' + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_LOT_NO,   liRow] + '^FS';
    end;
    if sgSub.Cells[S_MDATE, liRow] <> gcUserDefine then begin
      lsPrintList :=  lsPrintList + '^FO250,' + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_MDATE,    liRow] + '^FS';
    end;

    lsPrintList :=  lsPrintList + '^FO700,' + IntToStr(liY+liMATNR*gcIntervarY) + '^A0N,35,35^FD' + sgSub.Cells[S_DONE_QTY, liRow] + 'EA^FS';
    Inc(liMATNR);

  end;

  // �������� �������
  if (liMATNR > 0)   and
     (liMATNR < 3)   and
     (giNowPage = 1) then begin
      pr_PrintBarcode(1);
  end
  else if (liMATNR > 0)   and
          (liMATNR < 5)   and
          (giNowPage > 1) then begin
      pr_PrintBarcode(2);
  end;

end;

procedure proc_LptPrint(sPrintStr : String);var

  F: TextFile;
  S: string;
begin
  if gbTest then begin
{
    AssignFile(F,'c:\test'+IntToStr(giNowPage)+'.txt');
    Rewrite(F);
    WriteLn(F, sPrintStr);
    CloseFile(F);
    S := 'cmd.exe /c copy c:\test'+IntToStr(giNowPage)+'.txt \\10.130.43.46\z4m';
    winexec(PChar(S), 0);



    AssignFile(F,'c:\test.txt');
    Rewrite(F);
    WriteLn(F, sPrintStr);
    CloseFile(F);
}
  end
  else begin    
    AssignFile( OutPut, 'LPT1' );
    ReWrite( OutPut );
    WriteLn( OutPut, sPrintStr );
    CloseFile( OutPut );
  end;
  
  Exit;

  if not gbTest then begin

    AssignFile(F,'c:\test'+IntToStr(giNowPage)+'.txt');
    Rewrite(F);
    WriteLn(F, sPrintStr);
    CloseFile(F);
    S := 'cmd.exe /c copy c:\test'+IntToStr(giNowPage)+'.txt \\10.130.43.46\z4m';
    winexec(PAnsiChar(S), 0);


  end
  else begin
    AssignFile(F,'c:\test.txt');
    Rewrite(F);
    WriteLn(F, sPrintStr);
    CloseFile(F);

    winexec('cmd.exe /c copy ''c:\test.txt \\10.130.43.46\z105sl''', 0);

    {
    CreateProcess(nil, 'cmd.exe /c "copy c:\test.txt \\10.130.43.223\z105sl"', nil, nil, true, DETACHED_PROCESS, nil, nil, &si, &pi);
    shellexecute(Application.Handle, 'print', 'cmd.exe /c "copy c:\test.txt \\10.130.43.223\z105sl"', nil, nil, SW_SHOW);
    }
  end;
end;

function fn_GetNowDateTime:String;
begin
  try
    //DM.qryNowDate.Close;
    //DM.qryNowDate.Open;
    //Result := FormatDateTime('YYYY-MM-DD', DM.qryNowDate.Fields[0].AsDateTime);
    Result := FormatDateTime('YYYY-MM-DD', now);
  except

  end;
end;

function fn_GetNowDateTime(ASort:Integer):String;
begin
  try
    //DM.qryNowDate.Close;
    //DM.qryNowDate.Open;
    //Result := FormatDateTime('YYYY-MM-DD HH:MM:SS', DM.qryNowDate.Fields[0].AsDateTime);
    Result := FormatDateTime('YYYY-MM-DD HH:MM:SS', now);
  except

  end;
end;

{*****************************************************************************
*   �� �� ��  : proc_ExchangeGridRows
*   �Լ� ��� : StringGrid�� ���� ��ȯ�Ѵ�.
*   Parameters: TStringGrid
*               iFromRow, iToRow : ġȯ�� Column
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure proc_ExchangeGridRows( pGrid: TStringGrid; iFromRow, iToRow: Integer );
var
  k: Integer;
begin
   With pGrid Do
      For k:= 0 To ColCount-1 Do
        Cols[k].Exchange(iFromRow,iToRow);
end;


{*****************************************************************************
*   �� �� ��  : proc_SortStringgrid
*   �Լ� ��� : StringGrid���� ������ �����Ѵ�.
*   Parameters: TStringGrid,
*               Column1 : 1������ Column
*               Column2 : 2������ Column
*               Sort���� : 0 : ��������(Asc) 1: ��������(Desc)
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2005.08.22
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure proc_SortStringgrid( pGrid: TStringGrid; pColumn1, pColumn2: LongInt;
                               pSort: Integer; pSort1 : Integer = 0 );
var
  iRow1, iRow2, iCompare : Integer;
begin
  // 1.
  pGrid.Perform( WM_SETREDRAW, 0, 0 );
  for iRow1 := 1 to pGrid.RowCount - 1 do begin
     for iRow2 := iRow1+1 to pGrid.RowCount - 1 do begin
        // S1 > S2 : 0 ���� ũ��
        // S1 = S2 : 0
        // S1 < S2 : 0 ���� �۴�
        iCompare := CompareStr(pGrid.Cells[pColumn1, iRow1], pGrid.Cells[pColumn1, iRow2]);
        if      iCompare = 0 then begin // S1 = S2
           // �������� �����Ѵ�.
           If CompareStr(pGrid.Cells[pColumn2, iRow1], pGrid.Cells[pColumn2, iRow2]) > 0 then
              proc_ExchangeGridRows(pGrid, iRow1, iRow2)
           else If pSort1 = 1 then proc_ExchangeGridRows(pGrid, iRow1, iRow2);
        end
        else if iCompare < 0 then begin // S1 < S2
           case pSort of
              1 : proc_ExchangeGridRows(pGrid, iRow1, iRow2); // DESC
           end;
        end
        else if iCompare > 0 then begin // S1 > S2
           case pSort of
              0 : proc_ExchangeGridRows(pGrid, iRow1, iRow2); // ASCE
           end;
        end;
     end;
  end;
  pGrid.Perform( WM_SETREDRAW, 1, 0 );
  pGrid.Refresh;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Clear
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender : TStringGrid
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_Clear(Sender: TObject);overload;
var
    li_loop : Integer;
begin
    with (Sender as TStringGrid) do begin
       for li_loop := 1 to RowCount-1 do begin
         Rows[li_loop].Clear;
       end;
       Row      := 1;
       RowCount := 2;
    end;
end;    

{*****************************************************************************
*   �� �� ��  : Grid_Clear
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender : TStringGrid
*               pColumn : Clear��ų�� �׸�
*               pValue  : Clear �� ��
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_Clear(Sender: TObject; pColumn: Integer; pValue: String; pClear: Integer = 0 );
var
    li_loop, iRowCount, iCol : Integer;
    sSortValue : String;
begin
    iRowCount := 0;
    with (Sender as TStringGrid) do begin
       for li_loop := 1 to RowCount-1 do begin
         If Cells[pColumn, li_loop] = pValue then begin
            Case pClear of
               0 : begin Rows[li_loop].Clear; sSortValue := ''; end;
               1 : begin
                      sSortValue := pValue;
                      for iCol := 0 to ColCount - 1 do  begin
                          If iCol <> pColumn then Cells[iCol, li_loop] := '';
                      end;
                   end;
            end;
            iRowCount := iRowCount + 1;
         end;
       end;
       
       for li_loop := 1 to RowCount - 1 do begin
//          ShowMessage(Cells[pColumn1, li_loop]+Cells[pColumn2, li_loop]+ ' ' + sSortValue);
          If (Cells[pColumn, li_loop]) = sSortValue then begin
              If (Cells[pColumn, li_loop+1]) = sSortValue then begin
                 proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop + 2);
              end
              else proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop + 1);
          end;
       end;
       case (RowCount - iRowCount) of
         1 : RowCount := (RowCount - iRowCount) + 1;
         else RowCount :=  RowCount - iRowCount;
       end;
       Row  := 1;
{
       If iRowCount > 0 then begin
          for li_loop := iRowCount+1 to RowCount do begin
             If Cells[pColumn, li_loop] <> sSortValue then begin
                proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop - iRowCount);
             end;
          end;
          case (RowCount - iRowCount) of
            1 : RowCount := (RowCount - iRowCount) + 1;
            else RowCount :=  RowCount - iRowCount;
          end;
          Row  := 1;
       end;
}
    end;
end;   

{*****************************************************************************
*   �� �� ��  : Grid_Clear
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender             : TStringGrid
*               pColumn1, pColumn2 : Clear��ų�� �׸�
*               pValue,   pValue2  : Clear �� ��
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_Clear(Sender: TObject; pColumn1, pColumn2: Integer;
                     pValue1, pValue2: String; pClear: Integer = 0 );
var
    li_loop, iRowCount, iCol : Integer;
    sSortValue : String;
begin
    iRowCount  := 0;
    sSortValue := '';
    with (Sender as TStringGrid) do begin
       for li_loop := 1 to RowCount-1 do begin
         If ((Cells[pColumn1, li_loop] = pValue1 ) AND
             (Cells[pColumn2, li_loop] = pValue2 )) then begin
            Case pClear of
               0 : begin Rows[li_loop].Clear; sSortValue := ''; end;
               1 : begin
                      sSortValue := pValue1+pValue2;
                      for iCol := 0 to ColCount - 1 do  begin
                          If iCol <> pColumn1 then begin Cells[iCol, li_loop] := ''; break; end;
                          If iCol <> pColumn2 then begin Cells[iCol, li_loop] := ''; break; end;
                      end;
                   end;
            end;
            iRowCount := iRowCount + 1;
         end;
       end;

       for li_loop := 1 to RowCount - 1 do begin
//          ShowMessage(Cells[pColumn1, li_loop]+Cells[pColumn2, li_loop]+ ' ' + sSortValue);
          If (Cells[pColumn1, li_loop]+Cells[pColumn2, li_loop]) = sSortValue then begin
              If (Cells[pColumn1, li_loop+1]+Cells[pColumn2, li_loop+1]) = sSortValue then begin
                 proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop + 2);
              end
              else proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop + 1);
          end;
       end;
       case (RowCount - iRowCount) of
         1 : RowCount := (RowCount - iRowCount) + 1;
         else RowCount :=  RowCount - iRowCount;
       end;
       Row  := 1;
{
       If iRowCount > 0 then begin
          for li_loop := iRowCount+1 to RowCount do begin
//             ShowMessage(Cells[pColumn1, li_loop]+Cells[pColumn2, li_loop]+ ' ' + sSortValue);
             If (Cells[pColumn1, li_loop]+Cells[pColumn2, li_loop]) <> sSortValue then begin
                proc_ExchangeGridRows((Sender as TStringGrid), li_loop, li_loop - iRowCount);
             end;
          end;
          case (RowCount - iRowCount) of
            1 : RowCount := (RowCount - iRowCount) + 1;
            else RowCount :=  RowCount - iRowCount;
          end;
          Row  := 1;
       end;
}
    end;
end;


function FindTextForStringGrid(StringGrid: TStringGrid; const Text: string): Integer;

    function FindText(StringGrid: TStringGrid; const Text: string): Integer;
    // Result: if found Text returns RowIndex, else returns -1
    var
        ColIndex, RowIndex: Integer;
    begin
        Result := -1;
        for RowIndex := 0 to StringGrid.RowCount - 1 do
        begin
            for ColIndex := 0 to StringGrid.ColCount - 1 do
            begin
                if Pos(StringGrid.Cells[ColIndex, RowIndex], Text) <> 0 then // Found
                begin
                    Result := RowIndex;
                    Exit;
                end;
            end;
        end;
    end;

var
    RowIndex: Integer;
    TopRowIndex: Integer;
    SelRect: TGridRect;
begin
    RowIndex := FindText(StringGrid, Text);
    if RowIndex <> -1 then
    begin
        TopRowIndex := RowIndex - StringGrid.VisibleRowCount + StringGrid.FixedRows;
        if TopRowIndex < StringGrid.FixedRows then
            TopRowIndex := StringGrid.FixedRows;
        StringGrid.TopRow := TopRowIndex;
        SelRect.Left := 0;
        SelRect.Top := RowIndex;
        SelRect.Right := StringGrid.ColCount;
        SelRect.Bottom := RowIndex;
        StringGrid.Selection := SelRect;
    end;
end;



procedure DBGrid2Excel(cTitle : string; zDBGrids : TDBGrid);
var
    XL, XArr, XTitle: Variant;
    i, j, k: Integer;

  function GetCellName(nCount : integer): string;
  begin
    if nCount div 26 > 0 then Result := CHR(64 + nCount div 26);
    if nCount div 26 > 0 then Result := Result + CHR(64 + nCount mod 26) else Result := CHR(64 + nCount);
  end;

begin

  if not zDBGrids.DataSource.DataSet.Active then exit;
  if zDBGrids.DataSource.DataSet.RecordCount = 0 then exit;

  XTitle := VarArrayCreate([1, zDBGrids.Columns.Count], VarVariant);
  XArr := VarArrayCreate([1, zDBGrids.Columns.Count], VarVariant);

  Try
     //XL := CreateOLEObject('Scalc.Application');
     XL := CreateOLEObject('Excel.Application');
  Except
     MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
     Exit;
  End;

  XL.WorkBooks.Add;
  XL.Visible := True;
  i := 1;
  k := 1;

  while i <= zDBGrids.Columns.Count
  do begin
     XTitle[i] := zDBGrids.Columns[i-1].Title.Caption;
     Inc(i);
  end;

//  XL.Range['A1', CHR(64 + zDBGrids.Columns.Count) + '1'].Value := XTitle;
  XL.Range['A1',GetCellName(zDBGrids.Columns.Count)+ '1'].Value := XTitle;

  zDBGrids.DataSource.DataSet.DisableControls;
  zDBGrids.DataSource.DataSet.First;
  while not zDBGrids.DataSource.DataSet.EOF
  do begin
     j := 1;
     while j <= zDBGrids.Columns.Count
     do begin
        if zDBGrids.Fields[j-1].DataType = ftString then
             XArr[j] := StringReplace(StringReplace(zDBGrids.Fields[j-1].Value, #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll])
        else
             XArr[j] := zDBGrids.Fields[j-1].Value;
        Inc(j);
     end;
//     XL.Range['A' + IntToStr(k+1), CHR(64 + zDBGrids.Columns.Count) + IntToStr(k+1)].Value := XArr;
     XL.Range['A' + IntToStr(k+1), GetCellName(zDBGrids.Columns.Count)+ IntToStr(k+1)].Value := XArr;
     zDBGrids.DataSource.DataSet.Next;
     Inc(k);
  end;
  XL.Range[XL.WorkSheets[1].Cells[1, 1], XL.WorkSheets[1].Cells[1,zDBGrids.Columns.Count]].Interior.Color := clSkyBlue;
//  XL.Range['A1', CHR(64 + zDBGrids.Columns.Count) + IntToStr(k)].Select;
  XL.Range['A1', GetCellName(zDBGrids.Columns.Count)+ IntToStr(k)].Select;
  XL.Selection.Columns.AutoFit;
  XL.Range['A1', 'A1'].Select;
  zDBGrids.DataSource.DataSet.EnableControls;
  zDBGrids.DataSource.DataSet.First;
end;
    
{    �̸� : func_AppExec
     ��� : �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ����ʴ� �Լ�
     �μ� : ������ Exeȭ�ϸ�� �Ķ����
   ����� : ������ Exeȭ���� �ڵ鰪
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function  func_AppExec(ExeFileName :string):integer ;
var
   wk_Char          : array[0..200] of Char;
   startupinfo      :   TStartupinfo;
   processinfo      :   TProcessInformation;
begin
  try
    begin
      fillchar(startupinfo,sizeof(Tstartupinfo),0);
      if  createprocess(nil,
                        Pchar(ExeFileName), //strpcopy(wk_Char,ExeFileName),
                        nil,
                        nil,
                        false,
                        NORMAL_PRIORITY_CLASS,
                        nil,
                        nil,
                        startupinfo,
                        processinfo)  then
         begin
             application.processmessages;
      end;
    end;
    Result   :=   processinfo.hprocess;
  except
    Result   :=   1;
    MessageDlg(ExeFileName + '�� �����Ҽ� �����ϴ�',mtError,[mbOK],0);
  end;
end;



{    �̸� : func_AppExec_Wait
     ��� : �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ��� �Լ�
     �μ� : ������ Exeȭ�ϸ�� �Ķ����
   ����� : 0- Exeȭ���� ������ 1- Exeȭ���� �������� ����
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function  func_AppExec_Wait(FormName :Tform ;ExeFileName :string):integer ;
var
   wk_Char          : array[0..200] of Char;
   startupinfo      :   TStartupinfo;
   processinfo      :   TProcessInformation;
begin
  try
    begin
      fillchar(startupinfo,sizeof(Tstartupinfo),0);
      if  createprocess(nil,
                        Pchar(ExeFileName), //strpcopy(wk_Char,ExeFileName),
                        nil,
                        nil,
                        false,
                        NORMAL_PRIORITY_CLASS,
                        nil,
                        nil,
                        startupinfo,
                        processinfo)  then
         begin
           FormName.enabled  :=  false;
           while  Waitforsingleobject(processinfo.hprocess,0) = WAIT_TIMEOUT  do
             application.processmessages;
           FormName.enabled  :=  True;
      end;
    end;
    Result   :=   0;
  except
    Result   :=   1;
    MessageDlg(ExeFileName + '�� �����Ҽ� �����ϴ�',mtError,[mbOK],0);
  end;
end;
    

function func_GetFolder() : String;
var
    S : String;
begin
    S := Application.ExeName;
    Result := ExtractFilePath(S);
end;

function fn_Save2Excell(AForm:TForm; AGrid:TAdvStringGrid):Boolean;
var
  uSaveDialog : TSaveDialog;
  lsFileName  : String;
begin
  Result := False;

  if AGrid.RowCount = 0 then begin
    Application.MessageBox('ó���� �ڷᰡ �����ϴ�.', '',
                           MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    exit;
  end;
  uSaveDialog := TSaveDialog.Create(AForm);

  with uSaveDialog do begin
    Filter := 'Excel (*.xls)|*.XLS';
    //Filter := 'Excel (*.xls)|*.XLS|Text files (*.txt)|*.TXT';
    FilterIndex := 1;

    if not Execute then begin
      Free;
      Result := True;
      Exit;
    end;
    case FilterIndex of
      1 :
        if pos('.',FileName) > 0 then
        begin
          lsFileName := Copy(FileName,1,pos('.',FileName)-1) + '.xls'

        end else lsFileName := FileName + '.xls';
      2 :
        if pos('.',FileName) > 0 then
          lsFileName := Copy(FileName,1,pos('.',FileName)-1) + '.txt'
        else lsFileName := FileName + '.txt';
    end;

    AGrid.SaveToXLS(lsFileName);

  end;

end;

function fn_Grid2Excell(AForm:TForm; AGrid:TAdvStringGrid):Boolean;
var
  lsd : TSaveDialog;
  lsFileName : String;
begin
  Result := False;

    if AGrid.RowCount = 0 then begin
      Application.MessageBox('ó���� �ڷᰡ �����ϴ�.', '',
                             MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
      exit;
    end;
    lsd := TSaveDialog.Create(AForm);

    with lsd do try
      Filter := 'Excel (*.xls)|*.XLS';
      FilterIndex := 1;

      if not Execute then begin
        Free;
        Result := True;
        Exit;
      end;
      case FilterIndex of
        1 :
          if pos('.',FileName) > 0 then
          begin
            lsFileName := Copy(FileName,1,pos('.',FileName)-1) + '.xls'

          end else lsFileName := FileName + '.xls';
        2 :
          if pos('.',FileName) > 0 then
            lsFileName := Copy(FileName,1,pos('.',FileName)-1) + '.txt'
          else lsFileName := FileName + '.txt';
      end;

      AGrid.SaveToXLS(lsFileName);
    except
      lsd.Free;
      Result := False;
    end;
    lsd.Free;         
    Result := True;

end;

//------------------------------------------------------------------------------
// ���ڿ����� ���ڸ� �������� �Լ�
//------------------------------------------------------------------------------

function fn_DelCharacter(S: string): string;
var
  iL: Word;
  Rs: string;
begin
  Rs := '';
  for iL := 1 to Length(S) do
  begin
    if not (S[iL] in ['-',' ']) then Rs := Rs + S[iL];
  end;

  Result := Rs;
end;



function fn_FindIndex(AComboBox: TComboBox;
  AFind: String): Integer;
var
  li : Integer;
begin
  Result := 0;
  for li := 0 to AComboBox.Items.Count do begin
    if Pos(AFind, AComboBox.Items.Strings[li]) > 0 then begin
      Result := li;
      Break;
    end;
  end;
end;

end.
