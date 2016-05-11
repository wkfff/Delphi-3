{*******************************************************************************
* Project   : 
* Unit 명	  : mlPop_01
* 기능		    : 코드를 넘겨주면 명을 얻어온다.
* 작성자	   : 백민하
* 작성일	   : 2003-10-16
* 참조 Unit	:
* 수정이력	 :
*------------------------------------------------------------------------------
*   수정일자   수정자     수정내역
*------------------------------------------------------------------------------
    2005.09.21  Shim      1. 상품조회POPUP에서 사용하는 SQL문장(Sql_ITEM_LIKE_1) 추가
    2005.10.06  Shim      1. POPUP화면의 Width계산방식 변경
                          2. 업체조회시 비고항목과 대표자항목이 같이 조회되도록 변경

*******************************************************************************}
{
  호출시 화면에서 넘길 변수  4개
    gsMulti               //멀티구분 선택 구분 ('0' : 단일선택, '1': 멀티 선택
    gsJepumgun            //제품군             (제품군을 넘김)
    gsCode                //코드    -- 매개변수 + Return 변수
    gsName                //명
    (멀티선택 일경우 붙여서 넘김 -('11111','22222','33333'))
    Tag =1 : 코드 Tag =2 : 명 초기화
}
unit mlPop_01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids,   StdCtrls, ExtCtrls, Db, Buttons;
type
  TfrmPop_01 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    sg01: TStringGrid;
    Panel1: TPanel;
    edtCode: TEdit;
    edtName: TEdit;
    Label27: TLabel;
    Shape42: TShape;
    Label2: TLabel;
    lblCnt: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    shpNm_W: TShape;
    lblNm_W: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnConfirm: TButton;
    btnClose: TButton;
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure sg01DblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sg01DblClick(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg01KeyPress(Sender: TObject; var Key: Char);
    procedure edtNameChange(Sender: TObject);
    procedure edtCodeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodeEnter(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure pnlNm_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlNm_1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    bJob      : Boolean;
    gszLoc    : Array[0..20] of Char;
    D_Loc     : Array[0..20] of Char;           //그리드 출력 위치 설정;
    procedure pr_GridInit;

    function  fn_GetCode(vStr: String): String;
    function  fn_SubstrParam(subStr: String; var vStr: String): String;

    { Private declarations }
  public
    gsMulti    ,           //멀티구분
    gsSaupgun  ,           //사업군
    gsCode     ,           //제품코드
    gsName     : String;   //제품명
    { Public declarations }
  end;
Const
//-----------------------------------------------------------------------------------------------------------------
  SQL_ITEM_LIKE = '[구성품 정보;PARAM]                                                  '+#13+
                               '  SELECT  A.BAR_CD            구성품바코드              '+#13+
                               '         ,A.ITEM_NM           구성품명                  '+#13+
                               '    FROM  TB_LA01 A                                     '+#13+
                               '   WHERE  1=1                                           '+#13+
                               '     AND  A.COMM_CD          =  ''02''                  '+#13+
                               '     AND  A.USE_YN           =  ''Y''                   '+#13+
                               '     AND  A.BAR_CD           =  :pPARAM1@               '+#13+
                               '     AND  A.BAR_CD LIKE ''%'' || :pPARAM2@ || ''%''     '+#13+
                               '     AND  A.ITEM_NM LIKE ''%'' || :pPARAM3@ || ''%''    '+#13+
                               '  ORDER BY A.BAR_CD                                     '+#13;
  SQL_ITEM_ALL = '[제품 정보;PARAM]                                                     '+#13+
                               '  SELECT  A.BAR_CD            제품바코드                '+#13+
                               '         ,A.ITEM_NM           제품명                    '+#13+
                               '    FROM  TB_LA01 A                                     '+#13+
                               '   WHERE  1=1                                           '+#13+
                               '     AND  A.USE_YN           =  ''Y''                   '+#13+
                               '     AND  A.BAR_CD           =  :pPARAM1@               '+#13+
                               '     AND  A.BAR_CD LIKE ''%'' || :pPARAM2@ || ''%''     '+#13+
                               '     AND  A.ITEM_NM LIKE ''%'' || :pPARAM3@ || ''%''    '+#13+
                               '  ORDER BY A.BAR_CD                                     '+#13;
  SQL_ITEM_ONLY = '[제품 정보;PARAM]                                                     '+#13+
                               '  SELECT  A.BAR_CD            제품바코드                '+#13+
                               '         ,A.ITEM_NM           제품명                    '+#13+
                               '    FROM  TB_LA01 A                                     '+#13+
                               '   WHERE  1=1                                           '+#13+
                               '     AND  A.USE_YN           =  ''Y''                   '+#13+
                               '     AND  A.COMM_CD          =  ''01''                  '+#13+
                               '     AND  A.BAR_CD           =  :pPARAM1@               '+#13+
                               '     AND  A.BAR_CD LIKE ''%'' || :pPARAM2@ || ''%''     '+#13+
                               '     AND  A.ITEM_NM LIKE ''%'' || :pPARAM3@ || ''%''    '+#13+
                               '  ORDER BY A.BAR_CD                                     '+#13;
  SQL_CUST_LIKE = '[거래처 정보;PARAM]                                                  '+#13+
                               '  SELECT  A.CUST_CD           거래처코드                '+#13+
                               '         ,A.CUST_NM           거래처명                  '+#13+
                               '    FROM  TB_LA03 A                                     '+#13+
                               '   WHERE  1=1                                           '+#13+
                               '     AND  A.CUST_CD          =  :pPARAM1@               '+#13+
                               '     AND  A.CUST_CD LIKE ''%'' || :pPARAM2@ || ''%''    '+#13+
                               '     AND  A.CUST_NM LIKE ''%'' || :pPARAM3@ || ''%''    '+#13+
                               '  ORDER BY A.CUST_CD                                    '+#13;
//-----------------------------------------------------------------------------------------------------------------
var
  frmPop_01: TfrmPop_01;
  gszW_Parm : Array[0..10] Of String;
//  iPMax_Cnt      : Integer=2;
  giArray_Max    : Integer;
  giszCnt        : Integer;
  gCol_Loc       : Integer;
  gSql_Ch_Data   : String;
  gFind_YN       : Boolean;
  giCol_Cnt  : Integer;
  function func_PopUp_Sql( Const sSql_Cd  : String;
                                 szW_Parm : Array Of String;
                             Var Ret_Data : Array of String;
                                 PopUp_YN : Boolean =False;
                                 Find_YN  : Boolean =True;
                                 Col_Cnt  : Integer =3 ) : Boolean ;

implementation

uses
    Common_Grid
  , Common_Frm
  , utDM;

{$R *.DFM}


{===============================================================================
   이름    : pr_GridInit
   기능    : 그리드 초기화
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
===============================================================================}
procedure TfrmPop_01.pr_GridInit;
var
    i : Integer;
begin
    For i := 1 To sg01.RowCount-1 Do Begin
        sg01.Rows[i].Clear;
    End;
    sg01.RowCount := 2;
    lblCnt.Caption := '0';
end;


{===============================================================================
   이름    : func_PopUp_Sql
   기능    : 조건에 맞는 내역을 조회하여 그리드에 DISPLAY
   인수    :
   결과값  : 레코드 없으면 : False,  존재 : True
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
===============================================================================}
  function func_PopUp_Sql( Const sSql_Cd  : String;
                                 szW_Parm : Array Of String;
                             Var Ret_Data : Array of String;
                                 PopUp_YN : Boolean =False;
                                 Find_YN  : Boolean =True;
                                 Col_Cnt  : Integer =3 ) : Boolean ;
    function fn_Div_Date ( Sql_Data : String):String;
    var
       iDiv_S : Integer;
       iDiv_E : Integer;
       i_Loc : Integer;
    Begin
       iDiv_S := Pos ('[',Sql_Data);
       iDiv_E := Pos (']',Sql_Data);
       i_Loc  := pos (';',Sql_Data);
       frmPop_01.Caption :=Copy(Sql_Data,iDiv_S+1,i_Loc-iDiv_S-1);  //타이틀명 출력
       Result := Copy(Sql_Data,iDiv_E+1,Length(Sql_Data));          //최종 쿼리문
    End;
    //#13 자리계산해서 문자열 정리
    function fn_13_Div ( Sql_Data : String; Find_Data : String):String;
    var
       iDiv_S   : Integer;
       Pos_13   : Integer;
       iMaxLen  : Integer;
       Buf_Data : String;
       Cmp_Data : String;
       Add_Data : String;
    Begin
       iDiv_S := 1;
       Pos_13 := 1;
       Cmp_Data := '';
       Buf_Data := '';
       Add_Data := '';
       Buf_Data := Sql_Data;
       iMaxLen  := Length(Sql_Data);
       While iDiv_S>0  Do Begin
          Cmp_Data := Cmp_Data +  Copy(Buf_Data, 1, Pos_13+1);
          Pos_13 :=Pos(#13,Buf_Data);
          If (Pos(Find_Data,Copy(Buf_Data,1,Pos_13))=0) Then Begin
             Add_Data := Add_Data + Copy(Buf_Data, 1, Pos_13+1);
          End;
          iDiv_S :=  Pos_13;
          Buf_Data:=Copy(Buf_Data,Pos_13+1,iMaxLen);
       End;
       Result := Add_Data;
    End;
var
    iDipLen     : Integer;
    iSize       : Integer;
    iLoop       : Integer;
    incRow      : Integer;
    MaxCol      : Integer;
    iSql        : Integer;
    iSum_Width  : Integer;
    ch_Row      : Integer;
    Ch_Sql      : String;
    iszMax      : Integer;
//    Ch_Ret_Data : Array  of  String;
begin
    ch_Row    := 1;
    giszCnt   := High( szW_Parm);
    For iLoop := 0 To giszCnt Do Begin
       gszW_Parm[iLoop] :='';
       If High( szW_Parm) > iLoop  Then
          gszW_Parm[iLoop] := szW_Parm[iLoop];//치환작업
    End;
    giCol_Cnt   := Col_Cnt;
    gFind_YN    := Find_YN;//찾기능사용할것인지여부
    Result      := True;
    giArray_Max := 1;
    Ch_Sql:=fn_Div_Date(sSql_Cd); //타이틀 및 문장 정리
    gSql_Ch_Data :=sSql_Cd;
    With COMM_Query Do Begin
       Close;
       SQL.Clear;
       //파라미터 정리
       iszMax := High(szW_Parm);
       If gFind_YN Then Begin
          For iSql :=0 To iszMax  Do Begin
             If (szW_Parm[iSql]='') or (iSql > iszMax-2) Then
                Ch_Sql :=fn_13_Div(Ch_Sql,'pPARAM'+IntToStr(iSql+1)+'@');//코드
          End;

       End
       Else  If Pos(';PARAM',sSql_Cd)>0 Then Begin //=,LIKE같이 있을경우
          For iSql :=0 To iszMax Do Begin
             If szW_Parm[iSql]='' Then
                Ch_Sql :=fn_13_Div(Ch_Sql,'pPARAM'+IntToStr(iSql+1)+'@');//코드
          End;
       End;
       //쿼리문장 생성
       SQL.Add( Ch_Sql);
       If gFind_YN Then Begin
          For iSql :=0 To iszMax-2 Do Begin
             If szW_Parm[iSql]<>'' Then
                ParamByName('pPARAM'+IntToStr(iSql+1)+'@').AsString   := szW_Parm[iSql];
          End;
       End
       Else Begin
          For iSql :=0 To iszMax Do Begin
             If szW_Parm[iSql]<>'' Then
                ParamByName('pPARAM'+IntToStr(iSql+1)+'@').AsString   := szW_Parm[iSql];
          End;
       End;
//       SQL.SaveToFile('MSTVDR.txt');
       Open;
//       Last;
//       First;
       MaxCol := Fields.Count +1;
//       SetLength(Ch_Ret_Data,MaxCol);
       giArray_Max := MaxCol;
       If (IsEmpty) And (PopUp_YN=False) Then Begin
          Result := False;
          Exit;
       End;
       If (RecordCount=1) And (PopUp_YN=False) Then Begin // 값이 있을경우
          for  iLoop:= 1 To High(Ret_Data) Do Begin
             //Ch_Ret_Data[iLoop]:=Fields.FieldByNumber(iLoop).AsString;
             //Ret_Data[iLoop]:=Ch_Ret_Data[iLoop];
             Ret_Data[iLoop]:=Fields.FieldByNumber(iLoop).AsString;
          End;
       End
       Else Begin
          If (frmPop_01=Nil)  Then Begin
             frmPop_01  := TfrmPop_01.create(Application);
             fn_Div_Date(sSql_Cd);
          End;
          With frmPop_01 do begin
             // if  not (gNext_Grid) Then
             // pr_GridInit; //그리드 초기화
             iSum_Width    := 0;
             sg01.ColCount := Col_Cnt;
             gszLoc [0]:='C';
             D_Loc[0] := 'C';

             For  iLoop:= 1 To sg01.ColCount-1 Do Begin
                With sg01 Do begin
                   cells[iLoop,0]:=Fields.FieldByNumber(iLoop).DisplayName;   // 타이틀명
                   iDipLen := Length(cells[iLoop,0]);                         // 타이틀항목Cell길이
                   iSize   := Fields.FieldByNumber(iLoop).DataSize;           // 데이터항목 길이
                   gszLoc[iLoop]:= 'C'; // 문자Type
                   D_Loc[iLoop] := 'L'; // 왼쪽정렬

                   If Fields.FieldByNumber(iLoop).DataType In [ftInteger,ftFloat,ftBCD] Then Begin
                      gszLoc [iLoop]:='I'; // 숫자 TYPE
                      D_Loc[iLoop] := 'R'; // 오른쪽정렬
                   End;
                   If iDipLen> iSize Then Begin
                      iSize := iDipLen;
                   End;
                   ColWidths[iLoop] := iSize;
                   If D_Loc[iLoop] = 'R' then
                      ColWidths[iLoop]:= 60
                   else begin
                      case sg01.ColWidths[iLoop] of
                        01..40 : ColWidths[iLoop] := ColWidths[iLoop]*10;
                        41..50 : ColWidths[iLoop] := 300;
                        else ColWidths[iLoop] := 100;
                      end;
{ 2005.010.06 Shim
                      If ColWidths[iLoop] > 50 Then Begin
                         ColWidths[iLoop] := 100;
                      End
                      Else Begin
                         ColWidths[iLoop] := ColWidths[iLoop]*10;
                      End;
}
                   end;
                   iSum_Width := iSum_Width +  ColWidths[iLoop];
                End;
             End;
             Width :=  iSum_Width + 80;   // 임시주석처리
             While Not(COMM_Query.Eof) Do Begin
                incRow:=incRow+1;
                sg01.RowCount := incRow+1;
                For  iLoop:= 1 To MaxCol-1 Do begin
                   With sg01 Do begin
                      Cells[iLoop,incRow]:=Fields.FieldByNumber(iLoop).AsString;
                      If Cells[iLoop,incRow]= szW_Parm[iszMax-1] Then ch_Row :=incRow;
                   End;
                end;
                sg01.cells[0,incRow]:=IntToStr(incRow);
                COMM_Query.Next;
             End;
             sg01.Row :=ch_Row;
             lblCnt.Caption := FormatFloat('#,##0', incRow);
             //그리드에 값이 있으면 그리드로포커스 이동
             If frmPop_01.Active = False Then Begin
                If showmodal=mrOk then Begin
                   If (frmPop_01<>Nil)  Then Begin
                      Result := False;
                      pr_GridInit;
                      free;
                      frmPop_01 :=Nil;
                   End;
                   Exit
                End; //자료 넣기
             End Else
             Begin
//                Exit;
             End;
             If bJob= True Then Begin

                For  iLoop:= 1 To High(Ret_Data) Do Begin
                   With sg01 Do Begin
//                      Ch_Ret_Data[iLoop]:= cells[iLoop,Row];
//                      Ret_Data[iLoop]:=   Ch_Ret_Data[iLoop];
                      Ret_Data[iLoop]:= cells[iLoop,Row];
                   End;
                End;

                If (frmPop_01<>Nil)  Then Begin
                   Result := True;
                   pr_GridInit;
                   free;
                   frmPop_01 :=Nil;
                   Exit;
//                   Application.ProcessMessages ;

//                   tBuf_Frm.OnActivate(tBuf_Frm);
                End;
             End;
          End;
       End;
    End;
End;

procedure TfrmPop_01.edtCodeKeyPress(Sender: TObject; var Key: Char);
var
    Ret_Data   : Array of  String;
    bQry_Yn    : Boolean;
    szBuf_Data : Array of  String;
    iLoop      : Integer;
begin
    If Key = #13 Then Begin
       Key := #0;
       If Not(gFind_YN) Then Begin
          SetLength(Ret_Data,giArray_Max);
          SetLength(szBuf_Data,giszcnt+1);
          For iLoop := 0 To giszcnt Do
             szBuf_Data[iLoop] :=gszW_Parm[iLoop];//치환작업
          If (frmPop_01.ActiveControl Is TEdit) Then Begin
             szBuf_Data[giszCnt-1] :=Trim(edtCode.Text);
             szBuf_Data[giszCnt-0] :=Trim(edtName.Text);
          End;
//          bQry_Yn := True;
          If (Sender As TEdit).Tag= 1 Then Begin
             bQry_Yn := False;
          End;
          sg01.Enabled := True;
          pr_GridInit;
          func_PopUp_Sql( gSql_Ch_Data
                         ,szBuf_Data
                         ,Ret_Data
                         ,True
                         ,gFind_YN
                         ,giCol_Cnt
                         );
          If lblCnt.Caption ='0' Then Begin
             sg01.Enabled := False;
             SelectNext(Twincontrol(ActiveControl),True,True);
          End
          Else Begin
             sg01.SetFocus; //값이 있으면 그리드에 포커스로 이동
          End;
       End
       Else Begin
          If Trim((Sender As TEdit).Text)='' Then Begin
             If (Sender As TEdit).Name='edtCode' Then Begin
                edtName.SetFocus;
             End
             Else Begin
                edtCode.SetFocus;
             End;
             Exit;
          End;
{
          If gCol_Loc=0 Then Begin  //찾을 위치값을 지정하지않았을경우
             gCol_Loc := (Sender As TFlatEdit).Tag;
             proc_QuickSearch(sg01,(Sender As TFlatEdit), gCol_Loc,gCol_Loc);
             Exit;
          End; //찾을 위치값을 지정했을경우
          If (Sender As TFlatEdit).Tag =1 Then begin //코드
             proc_QuickSearch(sg01,(Sender As TFlatEdit), gCol_Loc,gCol_Loc);
          End
          Else
          If (Sender As TFlatEdit).Tag =2 Then begin //명
             proc_QuickSearch(sg01,(Sender As TFlatEdit), gCol_Loc+1,gCol_Loc+1);
          end;
}
//          proc_QuickSearch(sg01,(Sender As TFlatEdit), (Sender As TFlatEdit).Tag,(Sender As TFlatEdit).Tag);

       End;
    End;
end;

procedure TfrmPop_01.FormShow(Sender: TObject);
begin



  edtCode.Clear;
  edtName.Clear;
  bJob := False;

  If gsMulti = '1' Then Begin //멀티행 선택가능
    sg01.Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
                     goRangeSelect,   goDrawFocusSelected, goRowSelect];
//    sg01.MouseActions.DisjunctRowSelect := True;
  End
  Else Begin                  //단일행만 선택
    sg01.Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
                     goDrawFocusSelected, goRowSelect];
    edtCode.SetFocus;
//    sg01.MouseActions.DisjunctRowSelect := False;
  End;
  If (lblCnt.Caption > '0') Then Begin //조회된 내역이 있으면 그리드로 포커스 이동
    edtCode.SetFocus;
//    sg01.SetFocus;
  End;
end;

procedure TfrmPop_01.btnCloseClick(Sender: TObject);
begin
    gsCode    := '';
    gsName    := '';
    gsSaupgun := '';
    ModalResult := mrOk;


end;

procedure TfrmPop_01.btnConfirmClick(Sender: TObject);
begin
    If sg01.Cells[1, sg01.Row] = '' Then btnCloseClick(Sender);
    bJob := True;
    ModalResult := mrCancel;
end;

procedure TfrmPop_01.sg01DblClickCell(Sender: TObject; ARow, ACol: Integer);
begin
    btnConfirmClick(Sender);
end;


procedure TfrmPop_01.sg01DblClick(Sender: TObject);
begin
    btnConfirmClick(Sender);
end;

procedure TfrmPop_01.edtCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_ESCAPE Then
       btnCloseClick(Sender);
end;

{===============================================================================
   이름    : fn_GetCode
   기능    : ','를 기준으로 문자열을 잘라서 SQL Parameter로  넘김
   인수    : vStr : 문자열
   결과값  : 자른 Parameter
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
===============================================================================}
function TfrmPop_01.fn_GetCode(vStr:String): String;
var
  sTmp, sCode: String;
  iCnt, iInx: Integer;
begin
    If (Trim(vStr) = '')  Or
       (Trim(vStr) = ',') Then Begin
       Result := '';
       Exit;
    End;
    iCnt := 0;
    sTmp := Trim(vStr);
    For iInx := 1 To Length(sTmp) Do Begin
       If Copy(sTmp,iInx,1) = ',' Then Begin
         Inc(iCnt);
       End;
    End;
    sCode := '';
    For iInx := 1 To iCnt+1 Do Begin
       If iInx = iCnt+1 Then Begin
         sCode := sCode + '''' + Trim(fn_SubstrParam(',', sTmp)) + '''';
       End
       Else Begin
         sCode := sCode + '''' + Trim(fn_SubstrParam(',', sTmp)) + ''', ';
       End;
    End;
    Result := sCode;
end;

{===============================================================================
   이름    : fn_SubstrParam
   기능    : 문자를 특정문자 기준으로 자름
   인수    : subStr => 자를 기준문자
             Str    => 문자열

   결과값  : 자른 Parameter
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
===============================================================================}
function TfrmPop_01.fn_SubstrParam(subStr: String; var vStr: String): String;
var
  sTStr: String;
begin
    If Pos(subStr, vStr) > 0 Then Begin
       sTStr := Copy(vStr, 1, Pos(subStr, vStr)-1);
       vStr  := Copy(vStr, Pos(subStr, vStr)+1, Length(vStr)-Pos(subStr, vStr));
    End
    Else Begin
       sTStr := vStr;
       vStr  := '';
    End;
    Result  := sTStr;
end;

procedure TfrmPop_01.sg01KeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then Begin
       btnConfirmClick(Sender);
    End;
end;

procedure TfrmPop_01.edtNameChange(Sender: TObject);
begin
    If (TEdit(Sender).Modified) And (gFind_YN=False) Then Begin
       pr_GridInit;
    End;

end;

procedure TfrmPop_01.edtCodeChange(Sender: TObject);
begin
    If (Sender As TEdit).Tag =1 Then Begin //코드
       edtName.Text :='';
    End
    Else
    If (Sender As TEdit).Tag =2 Then Begin //명
       edtCode.Text :='';
    end;
end;

procedure TfrmPop_01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TfrmPop_01.edtCodeEnter(Sender: TObject);
var
  sComp: String;
begin
    proc_OnEnterColor(Sender);
    If Sender Is TEdit Then Begin
       sComp := Copy(TEdit(Sender).Name,4,Length(TEdit(Sender).Name)-1);
       proc_OnEnterColor(TShape(FindComponent('shp' + sComp)));
    End;
end;

procedure TfrmPop_01.edtCodeExit(Sender: TObject);

    function fn_CommaTonull(Value:String):String;
    begin
        Result:= StringReplace(Value, ',', '',[rfReplaceAll]);
    end;


var
    sComp: String;
begin
    proc_OnExitColor(Sender);
    If Sender Is TEdit Then Begin
       sComp := Copy(TEdit(Sender).Name,4,Length(TEdit(Sender).Name)-1);
       proc_OnExitColor(TShape(FindComponent('shp' + sComp)));
    End;
    If (Trim((Sender As TEdit).Text)<>'') And (StrToInt('0'+(fn_CommaTonull(lblCnt.Caption )))>0) Then Begin
       sg01.SetFocus;
    End;
end;

procedure TfrmPop_01.pnlNm_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
    sNum : String;
    bCanCle : Boolean;
    bBackspace : Boolean;
begin
    bCanCle  := False;
    bBackspace := False;
    sNum  := (Sender As TPanel).Caption;
    (Sender As TPanel).BevelInner := bvLowered;
    (Sender As TPanel).BevelOuter := bvLowered;
    If  sNum='닫기' Then Begin
       Exit;
    End;
    If  sNum='Enter' Then Begin
       SendMessage( gChForm.Handle, WM_NEXTDLGCTL, 0, 0);
       Exit;
    End;
    If  sNum='취소' Then Begin
       bCanCle  := True;
    End;
    If  sNum='Backspace' Then bBackspace := True;
    If Not(sNum[1] In ['0'..'9']) Then  sNum:='';
    If activeControl is TEdit       Then Begin
       With activeControl As TEdit       Do Begin
           Text :=  Text + sNum;
           If bCanCle Then Text :='';
           If bBackspace Then  Text:= Copy(Text,1,Length(Text)-1);
       End;
    End;
end;

procedure TfrmPop_01.pnlNm_1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    (Sender As TPanel).BevelInner := bvRaised;
    (Sender As TPanel).BevelOuter := bvRaised;
end;





procedure TfrmPop_01.sg01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
   Grid_Draw(Sender,ACol,ARow, Rect, State, D_Loc[ACol]);
end;

end.
                                                                                                                               