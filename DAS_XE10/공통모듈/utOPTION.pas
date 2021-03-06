//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utOPTION
//  파일내용  : 옵션 화면(프로그램을 사용을 위한 세팅작업)
//  최초작성일: 2003-09-06
//  최초작성자: 박정진
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utOPTION;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, ExtDlgs, Grids, DBTables,
  Mask, ShellAPI, ShlObj, AdvObj, BaseGrid, AdvGrid;

type
  TfmOPTION = class(TForm)
    tvOPTION: TTreeView;
    bvOPTION: TBevel;
    btnOK: TButton;
    btnCANCLE: TButton;
    btnAPPLY: TButton;
    pnlNORMAL: TPanel;
    pnlNORTEXT: TPanel;
    pnlCOMM: TPanel;
    pnlCOMMTEXT: TPanel;
    pnlADD: TPanel;
    pnlADDTEXT: TPanel;
    pnlDATABASE: TPanel;
    pnlDEFUALTTEXT: TPanel;
    pnlJOB: TPanel;
    pnlJOBTEXT: TPanel;
    pcSYSTEM: TPageControl;
    tsSYSTEM: TTabSheet;
    lblCORP: TLabel;
    lblPJNAME: TLabel;
    lblVERSION: TLabel;
    lblEDTDATE: TLabel;
    lblLOGOIMG: TLabel;
    lblLBLIMG: TLabel;
    lblCOPYRIGHT: TLabel;
    edtCORP: TEdit;
    edtPJNAME: TEdit;
    edtVERSION: TEdit;
    edtEDTDATE: TEdit;
    edtLOGOIMG: TEdit;
    edtLBLIMG: TEdit;
    edtCOPYRIGHT: TEdit;
    btnFIND1: TButton;
    btnFIND2: TButton;
    odIMG: TOpenDialog;
    lblMSEC: TLabel;
    lblMIN: TLabel;
    edtCONV: TEdit;
    edtBASIC: TEdit;
    lblBASIC: TLabel;
    lblCONV: TLabel;
    ckbAUTO: TCheckBox;
    lblDARKNEES: TLabel;
    gbSPEED: TGroupBox;
    cbPRTSPEED: TComboBox;
    cbSLEWSPEED: TComboBox;
    cbBFSPEED: TComboBox;
    lblBACKFEED: TLabel;
    lblSLEW: TLabel;
    lblPRINT: TLabel;
    udDARKNEES: TUpDown;
    edtDARKNEES: TEdit;
    btnFIND3: TButton;
    edtICON: TEdit;
    lblICON: TLabel;
    btnADD: TButton;
    btnEDIT: TButton;
    btnDELETE: TButton;
    lblCOMMTIME: TLabel;
    edtCOMMTIME: TEdit;
    lblTYPE: TLabel;
    lblSERVER: TLabel;
    lblUSER: TLabel;
    lblPASS: TLabel;
    cbTYPE: TComboBox;
    edtSERVER: TEdit;
    edtUSERID: TEdit;
    edtPASSWORD: TEdit;
    lblDBNAME: TLabel;
    edtDBNAME: TEdit;
    lblLCPATH: TLabel;
    edtLCPATH: TEdit;
    btnLCPATH: TButton;
    edtDatPath: TEdit;
    btnDatPath: TButton;
    odDAT: TOpenDialog;
    rbtnRDB: TRadioButton;
    rbtnLDB: TRadioButton;
    btnDbAdd: TButton;
    btnDbDel: TButton;
    lblPort: TLabel;
    cbPort: TComboBox;
    lblBaud: TLabel;
    cbBaud: TComboBox;
    lblData: TLabel;
    lblStop: TLabel;
    lblParity: TLabel;
    cbParity: TComboBox;
    cbStop: TComboBox;
    cbData: TComboBox;
    chkUseYN: TCheckBox;
    btnCommAdd: TButton;
    btnCommDel: TButton;
    edtTitle: TEdit;
    lblTitle: TLabel;
    btnCommEdit: TButton;
    btnDbEdit: TButton;
    lblCOMMCNT: TLabel;
    edtCOMMCNT: TEdit;
    udCOMMCNT: TUpDown;
    pnlDisplay: TPanel;
    lblDisplayID: TLabel;
    pnlDISPLAYTEXT: TPanel;
    edtDisplayID: TEdit;
    chkDisplayYN: TCheckBox;
    rgrpDisplay: TRadioGroup;
    btnAddDisplay: TButton;
    btnEditDisplay: TButton;
    btnDelDisplay: TButton;
    chkOldCrc: TCheckBox;
    edtPCK_ZONE: TEdit;
    lblPCK_ZONE: TLabel;
    lblLGNUM: TLabel;
    lblLINE_GB: TLabel;
    edtLGNUM: TEdit;
    edtLINE_GB: TEdit;
    edtDisplayName: TEdit;
    lblDisplayName: TLabel;
    cboJOB_AREA: TComboBox;
    lblJOB_AREA: TLabel;
    chkConv_All: TCheckBox;
    stgDisplay: TStringGrid;
    stgComm: TStringGrid;
    stgDB: TStringGrid;
    stgData: TStringGrid;
    procedure tvOPTIONChange(Sender: TObject; Node: TTreeNode);
    procedure btnCANCLEClick(Sender: TObject);
    procedure btnFIND1Click(Sender: TObject);
    procedure edtCORPChange(Sender: TObject);
    procedure btnAPPLYClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnFIND2Click(Sender: TObject);
    procedure ckbAUTOClick(Sender: TObject);
    procedure udDARKNEESChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure stgDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnFIND3Click(Sender: TObject);
    procedure btnADDClick(Sender: TObject);
    procedure btnEDITClick(Sender: TObject);
    procedure btnDELETEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLCPATHClick(Sender: TObject);
    procedure btnDatPathClick(Sender: TObject);
    procedure rbtnRDBClick(Sender: TObject);
    procedure rbtnLDBClick(Sender: TObject);
    procedure btnDbAddClick(Sender: TObject);
    procedure stgDBDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnDbDelClick(Sender: TObject);
    procedure stgCommDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCommAddClick(Sender: TObject);
    procedure btnCommDelClick(Sender: TObject);
    procedure btnCommEditClick(Sender: TObject);
    procedure stgCommClick(Sender: TObject);
    procedure btnDbEditClick(Sender: TObject);
    procedure stgDBClick(Sender: TObject);
    procedure cbPortChange(Sender: TObject);
    procedure udCOMMCNTChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure stgDisplayDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure stgDisplayClick(Sender: TObject);
    procedure btnAddDisplayClick(Sender: TObject);
    procedure btnEditDisplayClick(Sender: TObject);
    procedure btnDelDisplayClick(Sender: TObject);

  private
    gszGrid_DB       : Array[0..6] of Char;          //그리드 출력 위치 설정;
    gszGrid_Comm     : Array[0..6] of Char;          //그리드 출력 위치 설정;
    gszGrid_Display  : Array[0..4] of Char;          //그리드 출력 위치 설정;

    procedure pr_Checkbox_Init();
    procedure pr_Grid_Init();

    procedure pr_pnlVISIBLE(sdPNL: TObject; sdTEXT: TObject; booTRUE: Boolean; strCAP: String);
    procedure pr_pnlTRUE(booTRUE1, booTRUE2, booTRUE3, booTRUE4, booTRUE5, booTRUE6: Boolean);
    procedure pr_initCREATE();
    procedure pr_initAPPLY(booTRUE1, booTRUE2: Boolean);  //적용 버튼 초기화위한 처리 함수

    procedure pr_initNORMAL();   // NORMAL 성정 초기화
    procedure pr_initCOMM();     // COMM 포트 설정 초기화
    procedure pr_initADD();      // 부가 설정 초기화
    procedure pr_initDATABASE(); // 데이터 베이스 환경설정
    procedure pr_initJOB();
    procedure pr_initDisplay();  // 전광판 환경설정

    procedure pr_initDBSET(sdSTG, sdRBTN, sdLBTN, sdTYPE, sdDBNAME,sdSERVER,sdUSERID,sdPASSWARD,sdLCPATH : TObject); //DB파일을 불러와 화면에 표시
    procedure pr_initCOMMSET(sdSTG, sdUSEYN, sdTITLE, sdPORT,sdBAUD,sdDATA,sdSTOP,sdPARITY : TObject); //통신 파일을 불러와 화면에 표시

    procedure pr_initAUTOUSE();    //부착위치 자동계산 사용여부 화면세팅
    procedure pr_initAUTO();       //부착위치 자동계산 사용여부
    procedure pr_initDB();         //데이터 베이스 사용 여부

    { Private declarations }
  public

    function  func_GetSPEED(strBUFF : String) : String;
    { Public declarations }
  end;

    procedure proc_grdGETLIST(sdGRID: TObject; strPATH : String; booYN : Boolean);overload;
    procedure proc_grdGETLIST(sdGRID: TObject; strPATH : String; strYN : String);overload;
    procedure proc_ToggleCheckbox(Sender: TObject; acol, arow: Integer ; strYN :String);
var
  fmOPTION : TfmOPTION;
  boogEDTCHANG: Boolean;

implementation

{$R *.DFM}
{$WARN SYMBOL_DEPRECATED OFF}

uses Common, Common_grid, Common_Opt, utDM, utOPTSUB, utDAIHAN_MAIN;


{   이름	: pr_Checkbox_Init
    기능	: 체크박스 버튼 초기화.
    인수	: 없음
    결과값	: 없음
수정이력	:
--------------------------------------------------------------------
수정일자     수정자    수정내역
--------------------------------------------------------------------
}
procedure TfmOPTION.pr_Checkbox_Init;
var
    bmp      : TBitmap;
begin
    //--------------------------------------------------------------------------
    FCheck := TBitmap.Create;
    FNoCheck := TBitmap.Create;
    bmp := TBitmap.create;
    try
       bmp.handle := LoadBitmap( 0, PChar(OBM_CHECKBOXES ));
       {bmp now has a 4x3 bitmap of divers state images used by checkboxes and radiobuttons}
       with FNoCheck do
       begin
          {the first subimage is the unchecked box}
          width := bmp.width div 4;
          height := bmp.height div 3;
          canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect );
       end;
       with FCheck do
       begin
          {the second subimage is the checked box}
          width := bmp.width div 4;
          height := bmp.height div 3;
          canvas.copyrect(canvas.cliprect, bmp.canvas, rect( width, 0, 2 * width, height ));
       end;
    finally
       bmp.free
    end;
    //--------------------------------------------------------------------------
end;

{   이름	: pr_Grid_Init
    기능	: 그리드 초기화 하기.
    인수	: 없음
    결과값	: 없음
수정이력	:
--------------------------------------------------------------------
수정일자     수정자    수정내역
--------------------------------------------------------------------
}
Procedure TfmOPTION.pr_Grid_Init;
begin
    with stgDb do
    begin
       Options:=Options-[goEditing];
       ColCount := 7; RowCount:= 2;
       gszGrid_DB[ 0]  := 'C';  ColWidths[ 0]  :=  45;  Cells[ 0,0]  := '순번';
       gszGrid_DB[ 1]  := 'C';  ColWidths[ 1]  :=  80;  Cells[ 1,0]  := '일자';
       gszGrid_DB[ 2]  := 'C';  ColWidths[ 2]  :=  80;  Cells[ 2,0]  := '시간';
       gszGrid_DB[ 3]  := 'C';  ColWidths[ 3]  :=  90;  Cells[ 3,0]  := '지시';
       gszGrid_DB[ 4]  := 'C';  ColWidths[ 4]  :=  70;  Cells[ 4,0]  := '검품';
       gszGrid_DB[ 5]  := 'C';  ColWidths[ 5]  :=  63;  Cells[ 5,0]  := '암호';
       gszGrid_DB[ 6]  := 'L';  ColWidths[ 6]  := 383;  Cells[ 6,0]  := 'KAN-코드';
    end;

    with stgComm do
    begin
       Options:=Options-[goEditing];
       ColCount := 7; RowCount:= 2;
       gszGrid_Comm[ 0]  := 'C';  ColWidths[ 0]  :=  30;  Cells[ 0,0]  := '순번';
       gszGrid_Comm[ 1]  := 'C';  ColWidths[ 1]  :=  73;  Cells[ 1,0]  := '일자';
       gszGrid_Comm[ 2]  := 'C';  ColWidths[ 2]  :=  65;  Cells[ 2,0]  := '시간';
       gszGrid_Comm[ 3]  := 'C';  ColWidths[ 3]  :=  65;  Cells[ 3,0]  := '지시';
       gszGrid_Comm[ 4]  := 'C';  ColWidths[ 4]  :=  65;  Cells[ 4,0]  := '검품';
       gszGrid_Comm[ 5]  := 'C';  ColWidths[ 5]  :=  65;  Cells[ 5,0]  := '암호';
       gszGrid_Comm[ 6]  := 'L';  ColWidths[ 6]  :=  65;  Cells[ 6,0]  := 'KAN-코드';
    end;

    with stgDisplay do
    begin
       Options:=Options-[goEditing];
       ColCount := 5; RowCount:= 2;
       gszGrid_Display[ 0]  := 'C';  ColWidths[ 0]  :=  30;  Cells[ 0,0]  := '순번';
       gszGrid_Display[ 1]  := 'C';  ColWidths[ 1]  := 100;  Cells[ 1,0]  := '일자';
       gszGrid_Display[ 2]  := 'C';  ColWidths[ 2]  := 100;  Cells[ 2,0]  := '시간';
       gszGrid_Display[ 3]  := 'C';  ColWidths[ 3]  :=  90;  Cells[ 3,0]  := '지시';
       gszGrid_Display[ 4]  := 'C';  ColWidths[ 4]  :=  -1;  Cells[ 4,0]  := '지시';
    end;
end;

procedure TfmOPTION.pr_pnlVISIBLE(sdPNL: TObject; sdTEXT: TObject; booTRUE: Boolean; strCAP: String);
begin
    TPanel(sdPNL).Top  := 11;
    TPanel(sdPNL).Left := 184;
    TPanel(sdPNL).Visible := booTRUE;
    TPanel(sdTEXT).Caption := strCAP;
end;

procedure TfmOPTION.pr_pnlTRUE(booTRUE1, booTRUE2, booTRUE3, booTRUE4, booTRUE5, booTRUE6: Boolean);
begin
    pr_pnlVISIBLE(pnlNORMAL,  pnlNORTEXT    ,booTRUE1,tvOPTION.Selected.Text);
    pr_pnlVISIBLE(pnlCOMM,    pnlCOMMTEXT   ,booTRUE2,tvOPTION.Selected.Text);
    pr_pnlVISIBLE(pnlADD,     pnlADDTEXT    ,booTRUE3,tvOPTION.Selected.Text);
    pr_pnlVISIBLE(pnlDATABASE,pnlDEFUALTTEXT,booTRUE4,tvOPTION.Selected.Text);
    pr_pnlVISIBLE(pnlJOB,     pnlJOBTEXT    ,booTRUE5,tvOPTION.Selected.Text);
    pr_pnlVISIBLE(pnlDISPLAY, pnlDISPLAYTEXT,booTRUE6,tvOPTION.Selected.Text);

    pr_initNORMAL();
    pr_initCOMM();
    pr_initADD();
    pr_initDATABASE();
    pr_initJOB();
    pr_initDisplay();

    if boogEDTCHANG = False then pr_initCREATE();
end;

procedure TfmOPTION.pr_initCREATE();
begin
    btnAPPLY.Enabled    := False;
    edtLOGOIMG.ReadOnly := False;
    edtLBLIMG.ReadOnly  := False;
    edtICON.ReadOnly    := False;
end;

procedure TfmOPTION.pr_initAPPLY(booTRUE1, booTRUE2: Boolean);
begin
    btnAPPLY.Enabled := booTRUE1;
    boogEDTCHANG     := booTRUE2;
end;

procedure TfmOPTION.pr_initNORMAL();
begin
    pcSYSTEM.ActivePageIndex := 0;
    edtCORP.Text      := gsCORP;
    edtPJNAME.Text    := gsSYSTEM;
    edtVERSION.Text   := gsVERSION;
    edtEDTDATE.Text   := gsEDTDATE;
    edtLOGOIMG.Text   := gsIMGFOLDER;
    edtLBLIMG.Text    := gsIMGLIM;
    edtICON.Text      := gsIMGICON;
    edtCOPYRIGHT.Text := gsCOPYTIGHT;

    pr_initAPPLY(False,False);
end;

procedure TfmOPTION.pr_initCOMM();
begin
    proc_grdGETLIST(stgComm, gsFOLDER+'~comm.tmp', 'Y');
end;

procedure TfmOPTION.pr_initADD();
begin
    pr_initAUTOUSE();
    pr_initAUTO();

    edtCONV.Text     := gsCONV;
    edtBASIC.Text    := gsBASIC;
    edtDARKNEES.Text := gsDARKNEES;
    edtCOMMTIME.Text := gsSLEEPTIME;
    cbPRTSPEED.Text  := gsPRTSPEED;
    cbSLEWSPEED.Text := gsSLEWSPEED;
    cbBFSPEED.Text   := gsBFSPEED;
    edtCOMMCNT.Text  := IntToStr(giCOMMCNT);

    if giCRCINFO = 2 then chkOldCrc.Checked := True
    else chkOldCrc.Checked := False;

    if giCONV_ALL = 2 then chkConv_All.Checked := True
    else chkConv_All.Checked := False;

    if gsDARKNEES = '' then udDARKNEES.Position := 0
    else udDARKNEES.Position := StrToInt(gsDARKNEES);
    udCOMMCNT.Position  := giCOMMCNT;

    edtPCK_ZONE.Text := intToStr(giPCK_ZONE);

    edtLGNUM.Text    := gsLGNUM;
    edtLINE_GB.Text  := gsLINE_GB;

    cboJOB_AREA.ItemIndex := giJOB_AREA;

    pr_initAPPLY(False,False);
end;

procedure TfmOPTION.pr_initDATABASE();
begin
    proc_grdGETLIST(stgDb, gsFOLDER+'db.tmp', False);

    rbtnRDB.Checked := True;
    rbtnRDBClick(rbtnRDB);

    pr_initAPPLY(False,False);
end;

procedure TfmOPTION.pr_initDBSET(sdSTG, sdRBTN, sdLBTN, sdTYPE, sdDBNAME,sdSERVER,sdUSERID,sdPASSWARD,sdLCPATH : TObject); //DB파일을 불러와 화면에 표시
begin
    with TStringGrid(sdStg) do
    begin
        if Cells[0, Row] = '서버용' then TCheckBox(sdRBTN).Checked := True
        else TCheckBox(sdLBTN).Checked := True;

        TComboBox(sdTYPE).Text := Cells[1, Row];
        TEdit(sdDBNAME).Text   := Cells[2, Row];
        TEdit(sdSERVER).Text   := Cells[3, Row];
        TEdit(sdUSERID).Text   := Cells[4, Row];
        TEdit(sdPASSWARD).Text := Cells[5, Row];
        TEdit(sdLCPATH).Text   := Cells[6, Row];
    end;
    pr_initDB();
end;

procedure TfmOPTION.pr_initJOB();
begin
    proc_grdGETLIST(stgData, gsDATPATH, True);
    edtDatPath.Text := gsDATPATH;

    pr_initAPPLY(False,False);
end;

procedure TfmOPTION.pr_initDisplay();
begin
    proc_grdGETLIST(stgDisplay, gsFOLDER+'~display.tmp', 'Y');
end;

procedure TfmOPTION.pr_initCOMMSET(sdSTG, sdUSEYN, sdTITLE, sdPORT,sdBAUD,sdDATA,sdSTOP,sdPARITY : TObject);
var
    strBAUD, strDATA, strSTOP, strPARITY : String;
begin
    with TStringGrid(sdStg) do
    begin
        if Assigned( TStringGrid(sdStg).Objects[0, Row] ) then TCheckBox(sdUSEYN).Checked := True
        else TCheckBox(sdUSEYN).Checked := False;
        TEdit(sdTITLE).Text    := Cells[1, Row];
        TComboBox(sdPORT).Text := Cells[2, Row];
        strBAUD   := Cells[3, Row];
        strDATA   := Cells[4, Row];
        strSTOP   := Cells[5, Row];
        strPARITY := Cells[6, Row];
    end;

    if strBAUD = '9600'   then TComboBox(sdBAUD).ItemIndex := 0;
    if strBAUD = '19200'  then TComboBox(sdBAUD).ItemIndex := 1;
    if strBAUD = '38400'  then TComboBox(sdBAUD).ItemIndex := 2;
    if strBAUD = '57600'  then TComboBox(sdBAUD).ItemIndex := 3;
    if strBAUD = '115200' then TComboBox(sdBAUD).ItemIndex := 4;

    if strDATA = '5' then TComboBox(sdDATA).ItemIndex := 0;
    if strDATA = '6' then TComboBox(sdDATA).ItemIndex := 1;
    if strDATA = '7' then TComboBox(sdDATA).ItemIndex := 2;
    if strDATA = '8' then TComboBox(sdDATA).ItemIndex := 3;

    if strSTOP = '1'   then TComboBox(sdSTOP).ItemIndex := 0;
    if strSTOP = '1.5' then TComboBox(sdSTOP).ItemIndex := 1;
    if strSTOP = '2'   then TComboBox(sdSTOP).ItemIndex := 2;

    if strPARITY = 'Even'  then TComboBox(sdPARITY).ItemIndex := 0;
    if strPARITY = 'Mark'  then TComboBox(sdPARITY).ItemIndex := 1;
    if strPARITY = 'None'  then TComboBox(sdPARITY).ItemIndex := 2;
    if strPARITY = 'Odd'   then TComboBox(sdPARITY).ItemIndex := 3;
    if strPARITY = 'Space' then TComboBox(sdPARITY).ItemIndex := 4;

    pr_initAPPLY(False,False);
end;


procedure TfmOPTION.pr_initAUTOUSE();
var
    strUSE : String;
begin
    strUSE := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','자동계산','사용안함');
    if strUSE = '사용' then ckbAUTO.Checked := True
    else ckbAUTO.Checked := False;

    pr_initAPPLY(False,False);
end;


procedure TfmOPTION.pr_initAUTO();
begin
    if ckbAUTO.Checked = True then
    begin
        lblCONV.Enabled  := True;
        lblBASIC.Enabled := True;
        lblMIN.Enabled   := True;
        lblMSEC.Enabled  := True;
        edtCONV.Enabled  := True;
        edtBASIC.Enabled := True;
    end
    else
    begin
        lblCONV.Enabled  := False;
        lblBASIC.Enabled := False;
        lblMIN.Enabled   := False;
        lblMSEC.Enabled  := False;
        edtCONV.Enabled  := False;
        edtBASIC.Enabled := False;
    end;
end;

procedure TfmOPTION.pr_initDB();
begin
    if rbtnRDB.Checked = True then
    begin
        lblDBNAME.Enabled:= True;
        lblSERVER.Enabled:= True;
        lblUSER.Enabled  := True;
        lblPASS.Enabled  := True;

        edtDBNAME.Enabled   := True;
        edtSERVER.Enabled   := True;
        edtUSERID.Enabled   := True;
        edtPASSWORD.Enabled := True;
    end
    else
    begin
        lblDBNAME.Enabled:= False;
        lblSERVER.Enabled:= False;
        lblUSER.Enabled  := False;
        lblPASS.Enabled  := False;

        edtDBNAME.Enabled   := False;
        edtSERVER.Enabled   := False;
        edtUSERID.Enabled   := False;
        edtPASSWORD.Enabled := False;
    end;

    if rbtnLDB.Checked = True then
    begin
        lblLCPATH.Enabled := True;

        edtLCPATH.Enabled := True;
        btnLCPATH.Enabled := True;
    end
    else
    begin
        lblLCPATH.Enabled := False;

        edtLCPATH.Enabled := False;
        btnLCPATH.Enabled := False;
    end;
end;

procedure proc_grdGETLIST(sdGRID: TObject; strPATH : String; booYN : Boolean);overload;
var
    txtFile : TextFile;
    strBUFF : String;
    arrBUFF : Array[0..99] of String;
    intCNT, i, j  : Integer;
begin
    intCNT := 0;

    AssignFile(txtFile, strPATH);
    if FileExists(strPATH) then
    begin
        Reset(txtFile);
        while not Eof(txtFile) do
        begin
            Readln(txtFile,strBUFF);
            proc_data_distinction(strBUFF,'|',arrBUFF,j);
            TStringGrid(sdGRID).ColCount := j;
            for i := 0 to j - 1 do
            begin
                TStringGrid(sdGRID).Cells[ i,intCNT] := arrBUFF[i];
                if booYN = True then
                begin
                    case i of
                        0    : TStringGrid(sdGRID).ColWidths[i] := 172;
                        1..2 : TStringGrid(sdGRID).ColWidths[i] := 38;
                        3    : TStringGrid(sdGRID).ColWidths[i] := 45;
                        4..6 : TStringGrid(sdGRID).ColWidths[i] := 30;
                    else
                        TStringGrid(sdGRID).ColWidths[i] := 44;
                    end;
                end
                else
                begin
                    TStringGrid(sdGRID).ScrollBars := ssBoth;
                end;
            end;
            intCNT := intCNT + 1;
            if intCNT = 1 then TStringGrid(sdGRID).RowCount := intCNT + 1
            else TStringGrid(sdGRID).RowCount := intCNT;
        end;
        CloseFile(txtFile);
    end;
end;


procedure proc_grdGETLIST(sdGRID: TObject; strPATH : String; strYN : String);overload;
var
    txtFile : TextFile;
    strBUFF : String;
    arrBUFF : Array[0..99] of String;
    intCNT, i, j  : Integer;
begin
    intCNT := 0;

    AssignFile(txtFile, strPATH);
    if FileExists(strPATH) then
    begin
        Reset(txtFile);
        while not Eof(txtFile) do
        begin
            Readln(txtFile,strBUFF);
            proc_data_distinction(strBUFF,'|',arrBUFF,j);
            TStringGrid(sdGRID).ColCount := j;
            for i := 0 to j - 1 do
            begin
                if strYN = 'Y' then
                begin
                    if i = 0 then
                    begin
                        proc_ToggleCheckbox(TStringGrid(sdGRID),i,intCNT, arrBUFF[i]);
                        TStringGrid(sdGRID).Cells[ i,intCNT] := arrBUFF[i];
                    end
                    else
                    begin
                        TStringGrid(sdGRID).Cells[ i,intCNT] := arrBUFF[i];
                        TStringGrid(sdGRID).ScrollBars := ssBoth;
                    end;
                end
                else
                begin
                    TStringGrid(sdGRID).Cells[ i,intCNT] := arrBUFF[i];
                    TStringGrid(sdGRID).ScrollBars := ssBoth;
                end;
            end;
            intCNT := intCNT + 1;
            if intCNT = 1 then TStringGrid(sdGRID).RowCount := intCNT + 1
            else TStringGrid(sdGRID).RowCount := intCNT;
        end;
        CloseFile(txtFile);
    end;
end;

{   이름	: ToggleCheckbox
    기능	: 그리드 공통 모듈 코딩_폼에 그리드 사용시 체크박스
    인수	: 없음
    결과값	: 없음
수정이력	:
--------------------------------------------------------------------
수정일자     수정자    수정내역
--------------------------------------------------------------------
}
procedure proc_ToggleCheckbox(Sender: TObject; acol, arow: Integer ; strYN: String);
begin
  if aCol = 0 then
    with TGridCracker( Sender ) do
    begin
      if strYN = 'Y' then
        Objects[aCol, aRow] := Pointer(1)
      else
        Objects[aCol, aRow] := Nil;
    end;
end;

function TfmOPTION.func_GetSPEED(strBUFF : String) : String;
begin
    if strBUFF = '50.8 mm/sec'  then Result := 'A'
    else
    if strBUFF = '76.2 mm/sec'  then Result := 'B'
    else
    if strBUFF = '101.6 mm/sec' then Result := 'C'
    else
    if strBUFF = '127 mm/sec'   then Result := '5'
    else
    if strBUFF = '152.4 mm/sec' then Result := 'D'
    else
    if strBUFF = '203.2 mm/sec' then Result := 'E'
    else
    if strBUFF = '220.5 mm/sec' then Result := '9'
    else
    if strBUFF = '245 mm/sec'   then Result := '10'
    else
    if strBUFF = '369.5 mm/sec' then Result := '11'
    else
    if strBUFF = '304.8 mm/sec' then Result := '12';
end;

procedure TfmOPTION.tvOPTIONChange(Sender: TObject; Node: TTreeNode);
begin
    case tvOPTION.Selected.SelectedIndex of
        0:
        begin
            pr_pnlTRUE(True,False,False,False,False,False);
        end;
        1:
        begin
            pr_pnlTRUE(False,True,False,False,False,False);
        end;
        2:
        begin
            pr_pnlTRUE(False,False,True,False,False,False);
        end;
        3:
        begin
            pr_pnlTRUE(False,False,False,True,False,False);
        end;
        4:
        begin
            pr_pnlTRUE(False,False,False,False,True,False);
        end;
        5:
        begin
            pr_pnlTRUE(False,False,False,False,False,True);
        end;
    end;
end;

function BrowsedialogCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM) : integer stdcall;
var
    wa, rect : TRect;
    dialogPT : TPoint;
begin
  //center in work area
    if uMsg = BFFM_INITIALIZED then
    begin
      wa := Screen.WorkAreaRect;
      GetWindowRect(Wnd, Rect);
      dialogPT.X := ((wa.Right-wa.Left) div 2) -
                    ((rect.Right-rect.Left) div 2);
      dialogPT.Y := ((wa.Bottom-wa.Top) div 2) -
                    ((rect.Bottom-rect.Top) div 2);
      MoveWindow(Wnd,
                 dialogPT.X,
                 dialogPT.Y,
                 Rect.Right - Rect.Left,
                 Rect.Bottom - Rect.Top,
                 True);
    end;

    Result := 0;
end; (*BrowsedialogCallBack*)

///////////////////////////////////////////////////////////////////

function Browsedialog(const Title: string; const Flag: integer): string;
var
    lpItemID : PItemIDList;
    BrowseInfo : TBrowseInfo;
    DisplayName : array[0..MAX_PATH] of char;
    TempPath : array[0..MAX_PATH] of char;
begin
    Result:='';
    FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
    with BrowseInfo do begin
        hwndOwner := Application.Handle;
        pszDisplayName := @DisplayName;
        lpszTitle := PChar(Title);
        ulFlags := Flag;
        lpfn := BrowsedialogCallBack;
    end;
    lpItemID := SHBrowseForFolder(BrowseInfo);
    if lpItemId <> nil then
    begin
        SHGetPathFromIDList(lpItemID, TempPath);
        Result := TempPath;
        GlobalFreePtr(lpItemID);
    end;
end;


procedure TfmOPTION.btnCANCLEClick(Sender: TObject);
begin
    Close;
end;

procedure TfmOPTION.btnFIND1Click(Sender: TObject);
begin
    odIMG.InitialDir := edtLOGOIMG.Text;
    if odIMG.Execute then
    begin
        edtLOGOIMG.Text := odIMG.FileName;
    end;
end;

procedure TfmOPTION.btnFIND2Click(Sender: TObject);
begin
    odIMG.InitialDir := edtLBLIMG.Text;
    if odIMG.Execute then
    begin
        edtLBLIMG.Text := odIMG.FileName;
    end;
end;

procedure TfmOPTION.btnFIND3Click(Sender: TObject);
begin
    odIMG.InitialDir := edtICON.Text;
    if odIMG.Execute then
    begin
        edtICON.Text := odIMG.FileName;
    end;
end;

procedure TfmOPTION.edtCORPChange(Sender: TObject);
begin
    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnAPPLYClick(Sender: TObject);
var
    intUSECOMM : integer;
begin
    intUSECOMM := 0;

    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','업체명',edtCORP.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','시스템명',edtPJNAME.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','버젼',edtVERSION.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','수정일자',edtEDTDATE.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','이미지 폴더',edtLOGOIMG.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','라벨 이미지',edtLBLIMG.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','아이콘',edtICON.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'시스템 정보','Copyright',edtCOPYRIGHT.Text);

    if ckbAUTO.Checked = True then func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','자동 계산','사용')
    else  func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','자동 계산','사용안함');

    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','켄베어 속도',edtCONV.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','기본 시간',edtBASIC.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','DARKNEES',edtDARKNEES.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','Print 속도',cbPRTSPEED.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','회전 속도',cbSLEWSPEED.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','Backfeed 속도',cbBFSPEED.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','사용 포트',IntToStr(intUSECOMM));
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','통신 시간',edtCOMMTIME.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','인쇄 파일',edtDatPath.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','통신 횟수',edtCOMMCNT.Text);

    if chkOldCrc.Checked = False then func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','CRC 정보','1')
    else func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','CRC 정보','2');

    if chkConv_All.Checked = False then func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','컨베어 전체 제어','1')
    else func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','컨베어 전체 제어','2');

    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','최대 피킹존', edtPCK_ZONE.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','창고구분', edtLGNUM.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','라인구분', edtLINE_GB.Text);
    func_IniSave(gsFOLDER,gsFILENAME1,'부가 설정','작업구간', IntToStr(cboJOB_AREA.ItemIndex));

//    Application.Terminate;

//    ShellExecute( Application.Handle, 'Open', PChar( gsFTPEXE ), nil, nil, SW_SHOW);
    FreeObjectInstance(Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC)));

    tmCOMMON.proc_Init(frmDAIHAN_MAIN);

    pr_initAPPLY(False,False);
end;

procedure TfmOPTION.btnOKClick(Sender: TObject);
begin
    if btnAPPLY.Enabled = True then btnAPPLY.Click;
    Close;
end;

procedure TfmOPTION.ckbAUTOClick(Sender: TObject);
begin
    pr_initAUTO();
    btnAPPLY.Enabled := True;
end;

procedure TfmOPTION.stgDataDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    Grid_Draw(Sender,ACol,ARow,Rect,State,'C',0,1);
end;

procedure TfmOPTION.btnADDClick(Sender: TObject);
begin
    fmOPTSUB := TfmOPTSUB.Create(Self);
    try
        fmOPTSUB.proc_grdGETCAPTION('추가');
        fmOPTSUB.ShowModal;
    finally
        fmOPTSUB.Free;
    end;
end;

procedure TfmOPTION.btnEDITClick(Sender: TObject);
begin
    fmOPTSUB := TfmOPTSUB.Create(Self);
    try
        fmOPTSUB.proc_grdGETCAPTION('수정');
        fmOPTSUB.proc_grdGETEDIT(stgData);
        fmOPTSUB.ShowModal;
    finally
        fmOPTSUB.Free;
    end;
end;

procedure TfmOPTION.btnDELETEClick(Sender: TObject);
var
    strBUFF : String;
begin
    strBUFF := '(' + stgData.Cells[ 1,stgData.Row] + ')을 삭제할까요?';
    if Application.MessageBox(PChar(strBUFF),PChar(gsCORP),OKCANCEL) = IDOK then
    begin
        Grid_Delete(stgData);
        fmOPTSUB.proc_txtSAVE(fmOPTION.stgData, gsDATPATH);
    end;
end;

procedure TfmOPTION.FormCreate(Sender: TObject);
begin
    pr_Checkbox_Init;
    pr_Grid_Init;
    Session.GetDriverNames(cbTYPE.Items);
end;

procedure TfmOPTION.btnLCPATHClick(Sender: TObject);
var
    sFolder : string;
begin
    sFolder := browseDialog('Database 폴더 선택하기', BIF_RETURNONLYFSDIRS);
    edtLCPATH.Text := sFolder;
end;

procedure TfmOPTION.btnDatPathClick(Sender: TObject);
begin
    odDAT.InitialDir := gsFOLDER;
    if odDAT.Execute then
    begin
        edtDatPath.Text := odDAT.FileName;
        proc_grdGETLIST(stgData, edtDatPath.Text, True);
        edtDatPath.Text := edtDatPath.Text;
    end;
end;

procedure TfmOPTION.rbtnRDBClick(Sender: TObject);
begin
    pr_initDB();
end;

procedure TfmOPTION.rbtnLDBClick(Sender: TObject);
begin
    pr_initDB();
end;

procedure TfmOPTION.btnDbAddClick(Sender: TObject);
var
   strSAVE, strTmp : String;
begin
    if rbtnRDB.Checked = True then strTmp := rbtnRDB.Caption
    else strTmp := rbtnLDB.Caption;

    strSAVE :=strTmp + '|' + cbTYPE.Text + '|' + edtDBNAME.Text + '|' +edtSERVER.Text + '|' +edtUSERID.Text + '|' + edtPASSWORD.Text + '|' + edtLCPATH.Text;
    proc_Log2File(gsFOLDER+'db.tmp',strSAVE);
    proc_grdGETLIST(stgDb, gsFOLDER+'db.tmp', False);
    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnDbEditClick(Sender: TObject);
var
   strTmp : String;
begin
    if rbtnRDB.Checked = True then strTmp := rbtnRDB.Caption
    else strTmp := rbtnLDB.Caption;

    stgDb.Cells[ 0,stgDb.Row] := strTmp;
    stgDb.Cells[ 1,stgDb.Row] := cbTYPE.Text;
    stgDb.Cells[ 2,stgDb.Row] := edtDBNAME.Text;
    stgDb.Cells[ 3,stgDb.Row] := edtSERVER.Text;
    stgDb.Cells[ 4,stgDb.Row] := edtUSERID.Text;
    stgDb.Cells[ 5,stgDb.Row] := edtPASSWORD.Text;
    stgDb.Cells[ 6,stgDb.Row] := edtLCPATH.Text;

    fmOPTSUB.proc_txtSAVE(fmOPTION.stgDb, gsFOLDER+'db.tmp');
    proc_grdGETLIST(stgDb, gsFOLDER+'db.tmp', 'Y');
    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnDbDelClick(Sender: TObject);
var
    strBUFF : String;
begin
    strBUFF := '(' + stgDb.Cells[ 1,stgDb.Row] + ')을 삭제할까요?';
    if Application.MessageBox(PChar(strBUFF),PChar(gsCORP),OKCANCEL) = IDOK then
    begin
        Grid_Delete(stgDb);
        fmOPTSUB.proc_txtSAVE(fmOPTION.stgDb, gsFOLDER+'db.tmp');
    end;
    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.stgDBClick(Sender: TObject);
begin
    pr_initDBSET(stgDb, rbtnRDB, rbtnLDB, cbTYPE, edtDBNAME, edtSERVER, edtUSERID, edtPASSWORD, edtLCPATH);
end;

procedure TfmOPTION.stgDBDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
    sMode : String;
begin
    With Sender Do Begin
       sMode :=',1,2,3,4,5,6,7,';    //작업 색깔지정
    End;
    Grid_Draw_Select_Color(Sender,sMode,Acol,Arow,Rect);
    Grid_Draw(Sender,ACol,ARow, Rect, State, gszGrid_DB[ACol]);
end;



procedure TfmOPTION.btnCommAddClick(Sender: TObject);
var
   strSAVE, strTmp : String;
begin
    if chkUseYN.Checked = True then strTmp := 'Y'
    else strTmp := 'N';

    if Copy(cbPort.Text,1,3) = 'LPT' then strSAVE :=strTmp + '|' + edtTitle.Text + '|' + cbPort.Text + '||||'
    else strSAVE :=strTmp + '|' + edtTitle.Text + '|' + cbPort.Text + '|' +cbBaud.Text + '|' +cbData.Text + '|' + cbStop.Text + '|' + cbParity.Text;
    proc_Log2File(gsFOLDER+'~comm.tmp',strSAVE);
    proc_grdGETLIST(stgComm, gsFOLDER+'~comm.tmp', 'Y');

    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnCommEditClick(Sender: TObject);
var
   strTmp : String;
begin
    if chkUseYN.Checked = True then strTmp := 'Y'
    else strTmp := 'N';

    stgComm.Cells[ 0,stgComm.Row] := strTmp;
    stgComm.Cells[ 1,stgComm.Row] := edtTitle.Text;
    stgComm.Cells[ 2,stgComm.Row] := cbPort.Text;
    if Copy(cbPort.Text,1,3) = 'LPT' then
    begin
        stgComm.Cells[ 3,stgComm.Row] := '';
        stgComm.Cells[ 4,stgComm.Row] := '';
        stgComm.Cells[ 5,stgComm.Row] := '';
        stgComm.Cells[ 6,stgComm.Row] := '';
    end
    else
    begin
        stgComm.Cells[ 3,stgComm.Row] := cbBaud.Text;
        stgComm.Cells[ 4,stgComm.Row] := cbData.Text;
        stgComm.Cells[ 5,stgComm.Row] := cbStop.Text;
        stgComm.Cells[ 6,stgComm.Row] := cbParity.Text;
    end;

    fmOPTSUB.proc_txtSAVE(fmOPTION.stgComm, gsFOLDER+'~comm.tmp');
    proc_grdGETLIST(stgComm, gsFOLDER+'~comm.tmp', 'Y');

    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnCommDelClick(Sender: TObject);
var
    strBUFF : String;
begin
    strBUFF := '(' + stgComm.Cells[ 1,stgComm.Row] + ')을 삭제할까요?';
    if Application.MessageBox(PChar(strBUFF),PChar(gsCORP),OKCANCEL) = IDOK then
    begin
        Grid_Delete(stgComm);
        fmOPTSUB.proc_txtSAVE(fmOPTION.stgComm, gsFOLDER+'~comm.tmp');
    end;
    proc_grdGETLIST(stgComm, gsFOLDER+'~comm.tmp', 'Y');

    pr_initAPPLY(True,True);
end;


procedure TfmOPTION.stgCommClick(Sender: TObject);
begin
    pr_initCOMMSET(stgComm, chkUSEYN, edtTitle, cbPort ,cbBaud, cbData, cbStop, cbParity);
end;

procedure TfmOPTION.stgCommDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
    sMode : String;
    grid  : TStringGrid;
begin
    With Sender Do Begin
       sMode :=',1,2,3,4,5,6,7,';    //작업 색깔지정
    End;
    Grid_Draw_Select_Color(Sender,sMode,Acol,Arow,Rect);
    Grid_Draw(Sender,ACol,ARow, Rect, State, gszGrid_Comm[ACol]);

    if (aCol = 0) and (aRow > 0) then
    begin
       grid:= Sender As TStringGrid;
       with grid.Canvas do
       begin
          brush.color := $E0E0E0;
          {checkboxes look better on a non-white background}
          Fillrect( rect );
         {listbox state is encoded by the Objects property}
          if Assigned(grid.Objects[aCol, aRow]) then
          Draw( (rect.right + rect.left - FCheck.width) div 2,
                    (rect.bottom + rect.top - FCheck.height) div 2, FCheck )
          else
          Draw( (rect.right + rect.left - FNoCheck.width) div 2,
                    (rect.bottom + rect.top - FNoCheck.height) div 2, FNoCheck )
       end;
    end;
end;

procedure TfmOPTION.cbPortChange(Sender: TObject);
begin
    if Copy(cbPort.Text,1,3) = 'LPT' then
    begin
        cbBaud.Enabled := False;
        cbData.Enabled := False;
        cbStop.Enabled := False;
        cbParity.Enabled := False;
    end
    else
    begin
        cbBaud.Enabled := True;
        cbData.Enabled := True;
        cbStop.Enabled := True;
        cbParity.Enabled := True;
    end;
    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.udCOMMCNTChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: Integer; Direction: TUpDownDirection);
begin
    edtCOMMCNT.Text := IntToStr(udCOMMCNT.Position);
end;

procedure TfmOPTION.udDARKNEESChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
begin
    edtDARKNEES.Text := IntToStr(udDARKNEES.Position);
end;

procedure TfmOPTION.stgDisplayDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    sMode : String;
    grid  : TStringGrid;
begin
    With Sender Do Begin
       sMode :=',1,2,3,4,';    //작업 색깔지정
    End;
    Grid_Draw_Select_Color(Sender,sMode,Acol,Arow,Rect);
    Grid_Draw(Sender,ACol,ARow, Rect, State, gszGrid_Display[ACol]);

    if (aCol = 0) and (aRow > 0) then
    begin
       grid:= Sender As TStringGrid;
       with grid.Canvas do
       begin
          brush.color := $E0E0E0;
          {checkboxes look better on a non-white background}
          Fillrect( rect );
         {listbox state is encoded by the Objects property}
          if Assigned(grid.Objects[aCol, aRow]) then
          Draw( (rect.right + rect.left - FCheck.width) div 2,
                    (rect.bottom + rect.top - FCheck.height) div 2, FCheck )
          else
          Draw( (rect.right + rect.left - FNoCheck.width) div 2,
                    (rect.bottom + rect.top - FNoCheck.height) div 2, FNoCheck )
       end;
    end;
end;

procedure TfmOPTION.stgDisplayClick(Sender: TObject);
begin
    with TStringGrid(Sender) do
    begin
        if Assigned( TStringGrid(Sender).Objects[0, Row] ) then chkDisplayYN.Checked := True
        else chkDisplayYN.Checked := False;
        edtDisplayName.Text  := Cells[1, Row];
        edtDisplayID.Text    := Cells[2, Row];
        if Cells[4, Row] <> '' then rgrpDisplay.ItemIndex := StrToInt(Cells[4, Row]);
    end;
end;

procedure TfmOPTION.btnAddDisplayClick(Sender: TObject);
var
   strSAVE, strTmp : String;
begin
    if chkDisplayYN.Checked = True then strTmp := 'Y'
    else strTmp := 'N';

    strSAVE :=strTmp + '|' + edtDisplayName.Text + '|' + edtDisplayID.Text + '|' + rgrpDisplay.Items.Strings[rgrpDisplay.ItemIndex] + '|' + IntToStr(rgrpDisplay.ItemIndex);

    proc_Log2File(gsFOLDER+'~display.tmp',strSAVE);
    proc_grdGETLIST(stgDisplay, gsFOLDER+'~display.tmp', 'Y');

    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnEditDisplayClick(Sender: TObject);
var
   strTmp : String;
begin
    if chkDisplayYN.Checked = True then strTmp := 'Y'
    else strTmp := 'N';

    stgDisplay.Cells[ 0,stgDisplay.Row] := strTmp;
    stgDisplay.Cells[ 1,stgDisplay.Row] := edtDisplayName.Text;
    stgDisplay.Cells[ 2,stgDisplay.Row] := edtDisplayID.Text;
    stgDisplay.Cells[ 3,stgDisplay.Row] := rgrpDisplay.Items.Strings[rgrpDisplay.ItemIndex];
    stgDisplay.Cells[ 4,stgDisplay.Row] := IntToStr(rgrpDisplay.ItemIndex);

    fmOPTSUB.proc_txtSAVE(fmOPTION.stgDisplay, gsFOLDER+'~display.tmp');
    proc_grdGETLIST(stgDisplay, gsFOLDER+'~display.tmp', 'Y');

    pr_initAPPLY(True,True);
end;

procedure TfmOPTION.btnDelDisplayClick(Sender: TObject);
var
    strBUFF : String;
begin
    strBUFF := '(' + stgDisplay.Cells[ 1,stgDisplay.Row] + ')을 삭제할까요?';
    if Application.MessageBox(PChar(strBUFF),PChar(gsCORP),OKCANCEL) = IDOK then
    begin
        Grid_Delete(stgDisplay);
        fmOPTSUB.proc_txtSAVE(fmOPTION.stgDisplay, gsFOLDER+'~display.tmp');
    end;
    proc_grdGETLIST(stgDisplay, gsFOLDER+'~Display.tmp', 'Y');

    pr_initAPPLY(True,True);
end;

end.
