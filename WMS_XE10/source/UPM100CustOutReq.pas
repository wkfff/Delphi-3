unit UPM100CustOutReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100CustOutReq = class(TForm)
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtCUST_CODE: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
    edtCUST_NAME: TEdit;
    Button2: TButton;
    Panel3: TPanel;
    stgDetail: TAdvStringGrid;
    stgHead: TAdvStringGrid;
    COMM_Proc: TStoredProc;
    btnPicking: TButton;
    btnJegoList: TButton;
    pnCode: TPanel;
    pnCodeTitle: TPanel;
    btnClose: TButton;
    stgJego: TAdvStringGrid;
    pnlPre: TPanel;
    Panel5: TPanel;
    Button3: TButton;
    stgPre: TAdvStringGrid;
    Button5: TButton;
    btnEmergency: TButton;
    btnDel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sgMainCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sgMainClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure stgHeadClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure stgHeadCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btnPickingClick(Sender: TObject);
    procedure btnJegoListClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure stgJegoClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnEmergencyClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);

  private
    { Private declarations }

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..16] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
    procedure SP_DAIHAN2_PM100_QRY_01(Sender: TObject; as_CUST_CODE, as_ITEM_GUBUN, as_ORDER_NO : String);
    procedure SP_DAIHAN2_PM100_QRY_02(Sender: TObject; as_CUST_CODE : String; ab_SELECT_YN : Boolean);
    procedure SP_DAIHAN2_PM100_QRY_03(Sender: TObject; as_CUST_CODE, as_ORDER_NO : String);
    procedure SP_DAIHAN2_PM100_QRY_04(Sender: TObject);
    procedure SP_DAIHAN2_PM100_QRY_05(Sender: TObject);
     function SP_DAIHAN2_PM100_SAV_01(as_CUST_CODE, as_ORDER_NO, as_SELECT_YN : String) : Boolean;
    procedure SP_DAIHAN2_PM100_SAV_02(as_USERID : String);
    procedure SP_DAIHAN2_PM100_SAV_03(as_USERID : String);
    procedure SP_DAIHAN2_PM100_SAV_04(as_ORDER_NO, as_ITEM_CODE, as_ORDER_UNIT, as_CUST_CODE : String);
    procedure SP_EXPORT_ORDER_GET(as_USERID : String);

  public
    { Public declarations }
  end;

var
  FPM100CustOutReq: TFPM100CustOutReq;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const

  CD_SEQN       = 0;
  CD_SELECT     = 1;
  CD_CUST_NAME  = 2;
  CD_ITEM_CNT   = 3;
  CD_CUST_CODE  = 4;

  CD_ORD_NO     = 3;
  CD_ORD_ST     = 4;
  CD_REMARK     = 5;
  CD_CUST_CD    = 6;

  CD_ITEM_GUBUN = 1;
  CD_CATNO      = 2;
  CD_ITEM_NAME  = 3;
  CD_QTY        = 4;
  CD_ORDER_UNIT = 5;

  CD_ITEM_CATNO = 4;
  CD_ITEM_NM    = 5;
  CD_ORD_UNIT   = 6;
  CD_PICK_QTY   = 7;
  CD_STOCK_QTY  = 8;
  CD_CUST_CD1   = 9;
  CD_ITEM_CODE  = 10;

  CD_USER_ID    = 1;
  CD_NAME       = 2;
  CD_LOC_FROM   = 3;
  CD_LOC_TO     = 4;
  CD_LOC_FROM2  = 5;
  CD_LOC_TO2    = 6;
  CD_ITEM_COUNT = 7;

procedure TFPM100CustOutReq.FormDestroy(Sender: TObject);
begin
  FPM100CustOutReq := nil;
end;

procedure TFPM100CustOutReq.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CustOutReq ,'FPM100CustOutReq');
end;

procedure TFPM100CustOutReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100CustOutReq.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CustOutReq.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100CustOutReq.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CustOutReq.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : btnPickingClick(Sender);
    VK_F4 : btnJegoListClick(Sender);
    VK_F5 : btnEmergencyClick(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CustOutReq.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  //dtpI_DATE1.Date := now - 7;
  //dtpI_DATE2.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;

end;

procedure TFPM100CustOutReq.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl,  True, True);
  end;
end;

procedure TFPM100CustOutReq.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect]+[goEditing];
       ColCount := 5; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; ColWidths[CD_SEQN  ]     :=  30; Cells[CD_SEQN,0]      := '순번';
       gcMGridAlign[CD_SELECT    ] := 'C'; ColWidths[CD_SELECT ]    :=  30; Cells[CD_SELECT,0]    := '';
       gcMGridAlign[CD_CUST_NAME ] := 'L'; ColWidths[CD_CUST_NAME ] := 200; Cells[CD_CUST_NAME,0] := '거래처명';
       gcMGridAlign[CD_ITEM_CNT  ] := 'C'; ColWidths[CD_ITEM_CNT  ] :=  50; Cells[CD_ITEM_CNT,0]  := 'ITEM 수';
       gcMGridAlign[CD_CUST_CODE ] := 'L'; ColWidths[CD_CUST_CODE ] :=  -1; Cells[CD_CUST_CODE,0] := '거래처';
    end;

    with stgHead do begin
       Options:=Options+[goRowSelect]+[goEditing];
       ColCount := 7; RowCount:= 2;

       gcMGridAlign[CD_SEQN     ] := 'C'; ColWidths[CD_SEQN     ] :=  30; Cells[CD_SEQN     ,0] := '순번';
       gcMGridAlign[CD_SELECT   ] := 'C'; ColWidths[CD_SELECT   ] :=  30; Cells[CD_SELECT   ,0] := '';
       gcMGridAlign[CD_CUST_NAME] := 'L'; ColWidths[CD_CUST_NAME] := 200; Cells[CD_CUST_NAME,0] := '거래처명';
       gcMGridAlign[CD_ORD_NO   ] := 'L'; ColWidths[CD_ORD_NO   ] := 100; Cells[CD_ORD_NO   ,0] := '주문번호';
       gcMGridAlign[CD_ORD_ST   ] := 'C'; ColWidths[CD_ORD_ST   ] :=  60; Cells[CD_ORD_ST   ,0] := '진행상태';
       gcMGridAlign[CD_CUST_CD  ] := 'L'; ColWidths[CD_CUST_CD  ] :=  -1; Cells[CD_CUST_CD  ,0] := '거래처';
       gcMGridAlign[CD_REMARK   ] := 'L'; ColWidths[CD_REMARK   ] := 480; Cells[CD_REMARK   ,0] := '비고';

    end;

    with stgDetail do begin
       Options:=Options+[goRowSelect];
       ColCount := 6; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; ColWidths[CD_SEQN      ] := 30;  Cells[CD_SEQN      ,0] := '순번';
       gcMGridAlign[CD_ITEM_GUBUN] := 'C'; ColWidths[CD_ITEM_GUBUN] := 100; Cells[CD_ITEM_GUBUN,0] := '제상품구분';
       gcMGridAlign[CD_CATNO     ] := 'C'; ColWidths[CD_CATNO     ] := 150; Cells[CD_CATNO     ,0] := 'CAT NO';
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; ColWidths[CD_ITEM_NAME ] := 300; Cells[CD_ITEM_NAME ,0] := '제상품명';
       gcMGridAlign[CD_QTY       ] := 'R'; ColWidths[CD_QTY       ] := 100; Cells[CD_QTY       ,0] := '주문수량';
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; ColWidths[CD_ORDER_UNIT] := 100; Cells[CD_ORDER_UNIT,0] := '주문단위';
    end;

    with stgJego do begin
       Options:=Options+[goRowSelect]+[goEditing];
       ColCount := 11; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; ColWidths[CD_SEQN      ] :=  30; Cells[CD_SEQN      ,0] := '순번';
       gcMGridAlign[CD_SELECT    ] := 'C'; ColWidths[CD_SELECT    ] :=  30; Cells[CD_SELECT    ,0] := '';
       gcMGridAlign[CD_CUST_NAME ] := 'L'; ColWidths[CD_CUST_NAME ] := 190; Cells[CD_CUST_NAME ,0] := '거래처명';
       gcMGridAlign[CD_ORD_NO    ] := 'L'; ColWidths[CD_ORD_NO    ] := 100; Cells[CD_ORD_NO    ,0] := '주문번호';
       gcMGridAlign[CD_ITEM_CATNO] := 'L'; ColWidths[CD_ITEM_CATNO] := 100; Cells[CD_ITEM_CATNO,0] := 'CAT.NO';
       gcMGridAlign[CD_ITEM_NM   ] := 'L'; ColWidths[CD_ITEM_NM   ] := 280; Cells[CD_ITEM_NM   ,0] := '제상품명';
       gcMGridAlign[CD_ORD_UNIT  ] := 'C'; ColWidths[CD_ORD_UNIT  ] :=  60; Cells[CD_ORD_UNIT  ,0] := '주문단위';
       gcMGridAlign[CD_PICK_QTY  ] := 'R'; ColWidths[CD_PICK_QTY  ] :=  60; Cells[CD_PICK_QTY  ,0] := '주문수량';
       gcMGridAlign[CD_STOCK_QTY ] := 'R'; ColWidths[CD_STOCK_QTY ] :=  60; Cells[CD_STOCK_QTY ,0] := '재고수량';
       gcMGridAlign[CD_CUST_CD1  ] := 'L'; ColWidths[CD_CUST_CD1  ] := -1;  Cells[CD_CUST_CD1  ,0] := '거래처';
       gcMGridAlign[CD_ITEM_CODE ] := 'L'; ColWidths[CD_ITEM_CODE ] := -1;  Cells[CD_ITEM_CODE ,0] := '제상품코드';
    end;

    with stgPre do begin
       Options:=Options+[goRowSelect]+[goEditing];
       ColCount := 8; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; ColWidths[CD_SEQN      ] :=  30; Cells[CD_SEQN      ,0] := '순번';
       gcMGridAlign[CD_USER_ID   ] := 'C'; ColWidths[CD_USER_ID   ] :=  80; Cells[CD_USER_ID   ,0] := '사용자ID';
       gcMGridAlign[CD_NAME      ] := 'L'; ColWidths[CD_NAME      ] := 190; Cells[CD_NAME      ,0] := '사용자명';
       gcMGridAlign[CD_LOC_FROM  ] := 'C'; ColWidths[CD_LOC_FROM  ] := 100; Cells[CD_LOC_FROM  ,0] := '작업위치FROM';
       gcMGridAlign[CD_LOC_TO    ] := 'C'; ColWidths[CD_LOC_TO    ] := 100; Cells[CD_LOC_TO    ,0] := '작업위치TO';
       gcMGridAlign[CD_LOC_FROM2 ] := 'C'; ColWidths[CD_LOC_FROM2 ] := 100; Cells[CD_LOC_FROM2 ,0] := '작업위치2FROM';
       gcMGridAlign[CD_LOC_TO2   ] := 'C'; ColWidths[CD_LOC_TO2   ] := 100; Cells[CD_LOC_TO2   ,0] := '작업위치2TO';
       gcMGridAlign[CD_ITEM_COUNT] := 'C'; ColWidths[CD_ITEM_COUNT] :=  60; Cells[CD_ITEM_COUNT,0] := 'ITEM 수';
    end;
end;

procedure TFPM100CustOutReq.pr_Clear;
begin

end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_QRY_01(Sender: TObject; as_CUST_CODE, as_ITEM_GUBUN, as_ORDER_NO : String);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
begin
    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_01';
            Params.Clear;
            Params.CreateParam(ftString,'@CUST_CODE' , ptinput).AsString := as_CUST_CODE;    // 출고 일자
            Params.CreateParam(ftString,'@ITEM_GUBUN', ptinput).AsString := as_ITEM_GUBUN;   // 출고 순번
            Params.CreateParam(ftString,'@ORDER_NO', ptinput).AsString := as_ORDER_NO;   // 출고 순번
            Open;
            grid.RowCount := 2;
            grid.AddCheckBox(1, 0, False, False);
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    // 2016-01-25 dyddyd
                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;

                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);

                    end;

                    if grid.Cells[1, iCnt] = 'N' then grid.AddCheckBox(1, iCnt, False, True)
                    else grid.AddCheckBox(1, iCnt, True, True);

                    // 2016-01-25 dyddyd 수정
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_QRY_02(Sender: TObject; as_CUST_CODE : String; ab_SELECT_YN : Boolean);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
    sSELECT_YN : String;
begin
    if ab_SELECT_YN then sSELECT_YN := 'Y'
    else sSELECT_YN := 'N';

    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_02';
            Params.Clear;
            Params.CreateParam(ftString,'@A_CUST_CODE' , ptinput).AsString := as_CUST_CODE;    // 출고 일자
            Params.CreateParam(ftString,'@A_SELECT_YN' , ptinput).AsString := sSELECT_YN;    // 출고 일자
            Open;
            grid.RowCount := 2;
            grid.AddCheckBox(1, 0, False, False);
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);
                    end;

                    if grid.Cells[1, iCnt] = 'N' then grid.AddCheckBox(1, iCnt, False, True)
                    else grid.AddCheckBox(1, iCnt, True, True);

                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_QRY_03(Sender: TObject; as_CUST_CODE, as_ORDER_NO : String);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
begin
    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_03';
            Params.Clear;
            Params.CreateParam(ftString,'@CUST_CODE' , ptinput).AsString := as_CUST_CODE;    // 출고 일자
            Params.CreateParam(ftString,'@ORDER_NO', ptinput).AsString := as_ORDER_NO;   // 출고 순번
            Open;
            grid.RowCount := 2;
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    // 2016-01-25 dyddyd
                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;

                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);
                    end;

                    // 2016-01-25 dyddyd 수정
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_QRY_04(Sender: TObject);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
begin
    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_04';
            Params.Clear;
            Open;
            grid.RowCount := 2;
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);
                    end;

                    grid.AddCheckBox(1, iCnt, False, True);

                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_QRY_05(Sender: TObject);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
begin
    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_05';
            Params.Clear;
            Open;
            grid.RowCount := 2;
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);
                    end;
                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

function TFPM100CustOutReq.SP_DAIHAN2_PM100_SAV_01(as_CUST_CODE, as_ORDER_NO, as_SELECT_YN : String) : Boolean;
begin
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_SAV_01';
            Params.Clear;
            Params.CreateParam(ftString,'@A_CUST_CODE', ptinput).AsString := as_CUST_CODE;    // 출고 일자
            Params.CreateParam(ftString,'@A_ORDER_NO' , ptinput).AsString := as_ORDER_NO;   // 출고 순번
            Params.CreateParam(ftString,'@A_SELECT_YN', ptinput).AsString := as_SELECT_YN;   // 출고 순번
            Open;
            if Trim(Fields.FieldByNumber(1).AsString) = 'ERR' then
            begin
                ShowMessage(Trim(Fields.FieldByNumber(2).AsString));
                Result := false;
                EXIT;
            end;
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
        Result := true;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := false;
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_SAV_02(as_USERID : String);
begin
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_SAV_02';
            Params.Clear;
            Params.CreateParam(ftString,'@A_USERID', ptinput).AsString := as_USERID;    // 출고 일자
            Open;
            ShowMessage(Trim(Fields.FieldByNumber(2).AsString));
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_SAV_03(as_USERID : String);
begin
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_SAV_03';
            Params.Clear;
            Params.CreateParam(ftString,'@A_USERID', ptinput).AsString := as_USERID;    // 출고 일자
            Open;
            ShowMessage(Trim(Fields.FieldByNumber(2).AsString));
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_DAIHAN2_PM100_SAV_04(as_ORDER_NO, as_ITEM_CODE, as_ORDER_UNIT, as_CUST_CODE : String);
begin
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_SAV_04';
            Params.Clear;
            Params.CreateParam(ftString,'@A_ORDER_NO', ptinput).AsString   := as_ORDER_NO;    // 거래명세번호
            Params.CreateParam(ftString,'@A_ITEM_CODE', ptinput).AsString  := as_ITEM_CODE;   // 제상품코드
            Params.CreateParam(ftString,'@A_ORDER_UNIT', ptinput).AsString := as_ORDER_UNIT; // 주문단위
            Params.CreateParam(ftString,'@A_CUST_CODE', ptinput).AsString  := as_CUST_CODE;   // 거래처코드
            Params.CreateParam(ftString,'@A_USERID', ptinput).AsString     := gsUserID;       // 사용자
            Open;
            ShowMessage(Trim(Fields.FieldByNumber(2).AsString));
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.SP_EXPORT_ORDER_GET(as_USERID : String);
begin
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_EXPORT_ORDER_GET';
            Params.Clear;
            Params.CreateParam(ftString,'@CP_USERID', ptinput).AsString := as_USERID;    // 출고 일자
            Open;
            ShowMessage(Trim(Fields.FieldByNumber(2).AsString));
            Close;
            UnPrepare;
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            Exit;
        end;
    end;
end;

procedure TFPM100CustOutReq.pr_qryOpen;
var
    sCUST_CODE, sITEM_GUBUN, sORDER_NO : String;
begin
    pr_ClearGrid(sgMain);

    pr_ClearGrid(stgHead);
    pr_ClearGrid(stgDetail);

    if length(Trim(edtCUST_CODE.Text)) = 0 then
        sCUST_CODE := '%%'
    else
        sCUST_CODE := edtCUST_CODE.Text;

    if RadioButton0.Checked then sITEM_GUBUN := '%%'
    else if RadioButton1.Checked then sITEM_GUBUN := gcSerial
    else if RadioButton2.Checked then sITEM_GUBUN := gc88
    else if RadioButton3.Checked then sITEM_GUBUN := gcNoSale;

    if length(Trim(edtORDER_NO.Text)) = 0 then
       sORDER_NO := '%%'
    else
        sORDER_NO := edtORDER_NO.Text+'%';

    SP_DAIHAN2_PM100_QRY_01(sgMain, sCUST_CODE, sITEM_GUBUN, sORDER_NO);
    pr_SetRecordCount(sgMain);
end;

procedure TFPM100CustOutReq.pr_Ready;
begin

end;

procedure TFPM100CustOutReq.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If ARow = 0 Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify; //선택
          'L' :  HAlign := taLeftJustify;  //공장
       End;
    End;
end;

procedure TFPM100CustOutReq.SpeedButton1Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 1;
    if FPopup.ShowModal = mrOK then begin

      edtCUST_CODE.Text := gsCUST_CODE;
      edtCUST_NAME.Text := gsCUST_NAME;
    end;
  finally

  end;
end;

procedure TFPM100CustOutReq.sgMainCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
    SELECT_YN : String;
begin
    sgMain.RowSelect[Arow] := State;
    if State then SELECT_YN := 'Y'
    else SELECT_YN := 'N';

    SP_DAIHAN2_PM100_SAV_01(sgMain.Cells[CD_CUST_CODE, ARow], '', SELECT_YN);
end;

procedure TFPM100CustOutReq.sgMainClickCell(Sender: TObject; ARow,
  ACol: Integer);
Var
    IDX   : Integer;
    state : Boolean;
begin
    if ARow > 0 then
    begin
        if sgMain.GetCheckBoxState(1,ARow,state) then
        begin
            SP_DAIHAN2_PM100_QRY_02(stgHead, sgMain.Cells[CD_CUST_CODE, ARow], state);
        end;

        pr_SetRecordCount(stgHead);
    end
    else
    begin
        if sgMain.GetCheckBoxState(1,ARow,state) then
        begin
            if state then
                For IDX := 0 to sgMain.RowCount - 1 do
                begin
                    if IDX > 0 then if SP_DAIHAN2_PM100_SAV_01(sgMain.Cells[CD_CUST_CODE, IDX], '', 'N') = false then Exit;
                    sgMain.SetCheckBoxState(1, IDX, False);
                end
            else
                For IDX := 0 to sgMain.RowCount - 1 do
                begin
                    if IDX > 0 then if SP_DAIHAN2_PM100_SAV_01(sgMain.Cells[CD_CUST_CODE, IDX], '', 'Y') = false then Exit;
                    sgMain.SetCheckBoxState(1, IDX, True);
                end;
        end;
    end;
end;

procedure TFPM100CustOutReq.stgHeadClickCell(Sender: TObject; ARow,
  ACol: Integer);
Var
    IDX   : Integer;
    state : Boolean;
begin
    if ARow > 0 then
    begin
        SP_DAIHAN2_PM100_QRY_03(stgDetail, stgHead.Cells[CD_CUST_CD, ARow], stgHead.Cells[CD_ORD_NO, ARow]);

        pr_SetRecordCount(stgDetail);
    end
    else
    begin
        if stgHead.GetCheckBoxState(1,ARow,state) then
        begin
            if state then
                For IDX := 0 to sgMain.RowCount - 1 do stgHead.SetCheckBoxState(1, IDX, False)
            else
                For IDX := 0 to sgMain.RowCount - 1 do stgHead.SetCheckBoxState(1, IDX, True);
        end;
    end;
end;

procedure TFPM100CustOutReq.stgHeadCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
    SELECT_YN : String;
begin
    stgHead.RowSelect[Arow] := State;
    if State then SELECT_YN := 'Y'
    else SELECT_YN := 'N';

    SP_DAIHAN2_PM100_SAV_01(stgHead.Cells[CD_CUST_CD, ARow], stgHead.Cells[CD_ORD_NO, ARow], SELECT_YN);
end;

procedure TFPM100CustOutReq.btnPickingClick(Sender: TObject);
begin
    SP_DAIHAN2_PM100_QRY_05(stgPre);
    pnlPre.visible := True;//
end;

procedure TFPM100CustOutReq.btnJegoListClick(Sender: TObject);
begin
    SP_DAIHAN2_PM100_QRY_04(stgJego);
    pnCode.visible := True;//
end;

procedure TFPM100CustOutReq.btnCloseClick(Sender: TObject);
begin
    pnCode.Visible := False;
    pr_qryOpen;
end;

procedure TFPM100CustOutReq.stgJegoClickCell(Sender: TObject; ARow,
  ACol: Integer);
Var
    IDX   : Integer;
    state : Boolean;
begin
    if ARow > 0 then
    begin

    end
    else
    begin
        if stgJego.GetCheckBoxState(1,ARow,state) then
        begin
            if state then
                For IDX := 0 to sgMain.RowCount - 1 do stgJego.SetCheckBoxState(1, IDX, False)
            else
                For IDX := 0 to sgMain.RowCount - 1 do stgJego.SetCheckBoxState(1, IDX, True);
        end;
    end;
end;

procedure TFPM100CustOutReq.Button3Click(Sender: TObject);
begin
    pnlPre.Visible := False;
    pr_qryOpen;
end;

procedure TFPM100CustOutReq.Button5Click(Sender: TObject);
begin
    SP_DAIHAN2_PM100_SAV_02(gsUserID);


    SP_DAIHAN2_PM100_QRY_05(stgPre);
    pr_qryOpen;
end;

procedure TFPM100CustOutReq.btnEmergencyClick(Sender: TObject);
var
    Res : Integer;
begin
    Res := Application.MessageBox('긴급출고로 전환합니다. 저장하시겠습니까?'
                                ,'작업 확인',
                                 MB_ICONINFORMATION+MB_YESNO);  //일반 에러
    If Res = ID_YES Then
    Begin
        SP_DAIHAN2_PM100_SAV_03(gsUserID);
    end;
    pr_qryOpen;
end;

procedure TFPM100CustOutReq.btnDelClick(Sender: TObject);
var
    IDX, Res : Integer;
    lbCheck : Boolean;
begin
    Res := Application.MessageBox('해당 제품품을 강제마감 처리합니다. 저장하시겠습니까?'
                                ,'작업 확인',
                                 MB_ICONINFORMATION+MB_YESNO);  //일반 에러
    If Res = ID_YES Then
    Begin
        For IDX := 0 to stgJego.RowCount - 1 do
        begin
            stgJego.GetCheckBoxState(1, IDX, lbCheck);
            if lbCheck then
            begin
                SP_DAIHAN2_PM100_SAV_04(stgJego.Cells[CD_ORD_NO, IDX], stgJego.Cells[CD_ITEM_CODE, IDX], stgJego.Cells[CD_ORD_UNIT, IDX], stgJego.Cells[CD_CUST_CD1, IDX]);
            end;
        end;
        SP_DAIHAN2_PM100_QRY_04(stgJego);
    end;
end;

end.
