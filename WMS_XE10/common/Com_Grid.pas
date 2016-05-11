unit Com_Grid;

interface
uses  Controls, ExtCtrls,Messages,Classes ,Forms,Dialogs,
      Grids, StdCtrls, SysUtils, Windows, Graphics, comctrls, mask ,MaskUtils ,clipbrd, Com_Var;


  type
    TComBo = class(TComboBox)
    private
    { Private declarations }
      procedure combo_newexit(Sender:TObject);
      procedure Enter_key(Sender: TObject; var Key: Char);
      procedure Combo_Change(Sender:TObject);
    protected
   { Public declarations }
  end;

  Function Warp_Row_Cnt (const Data :String):Integer; //'|'갯수 파악
  procedure proc_Grid_Clear(Sender: TObject);
  procedure proc_ChkboxOnOff(Sender: TObject;iCol,iRow:Integer; bOn : Boolean );
  procedure proc_Grid_Delete(Sender: TObject); //그리드만 삭제
  procedure proc_Grid_AddRow(Sender: TObject;iRow:Integer);

  procedure Grid_Row2_chk(Sender: TObject;
                           No_chk:Boolean);
  procedure proc_Grid_Next(Sender: TObject;
                       Mode:Char;
                       Col_Pos:Integer=1; //시작위치
                       Col_Cnt:Integer=0; //끝라인값 :ColCount-Col_Cnt-1
                       No_chk:Boolean=True);overload; //Row값설정 유무

  procedure proc_Grid_Next ( Sender      : TObject;  //그리드
                             iCol_Start  : Integer;  //셀시작위치
                             iCol_End    : Integer;  //셀마직막위치
                             cMode       : char;     //모드 'I':신규 ,'E':수정 ,'Q' :조회
                             wKey        : Char;    //키값 설정
                             CanEdit_Loc : String);overload;   //




  procedure proc_Grid_Draw(Sender: TObject;
                       Col_Loc,
                       Row_Loc:Integer;
                       Rect: TRect;
                       State: TGridDrawState;
                       Draw_Loc:Char;
                       Sts_Pos:Integer=0;
                       Wrap_Cnt:Integer=1); overload;

  procedure Grid_Draw_Select_Color(Sender: TObject;
                                  Sel_loc: String;
                                  Col_loc: Integer;
                                  Col_Row: Integer;
                                  Rect   : TRect);



  procedure Grid_Draw(Sender: TObject;
                       Col_Loc,
                       Row_Loc:Integer;
                       Rect: TRect;
                       State: TGridDrawState;
                       Draw_Loc:Char;
                       Sts_Pos:Integer=0;
                       Wrap_Cnt:Integer=1);



  procedure Grid_Select_Order(Sender: TObject;
                               Sel_Col,
                               Add_Cnt:Integer;
                               Sort :Char );
  procedure Grid_OrderBy(Sender: TObject;
                          Button: TMouseButton;
                          Shift: TShiftState;
                          X,
                          Y: Integer);





  procedure Get_Grid_UP_Mode(Sender: TObject; Mode:char);

  procedure Get_Grid_key_Mode(Sender: TObject;
                               key_Start,
                               key_End:Integer);

  procedure Get_Grid_Fid_Data(Sender : Tobject;
                               Fname,
                               Grid_Fname: Array of ShortString;
                               var FData: Array of ShortString;
                               in_Row:Integer;
                               Ftype: Array of Char);
  procedure Set_Grid_Fmt_Num(Sender : Tobject;
                             Col_Loc,
                             Row_Loc:Integer;
                             Rect   : TRect;
                             aFmt_Index, aLeft, aRight  : Array of integer);

  { New Combobox}
  procedure Grid_ComBo_Crt( Sender: TObject;
                            Data: array of ShortString;
                            Class_code: ShortString;
                            combo_Loc : Integer=0);
  procedure Combo_Item( Sender: TObject;
                         Data: array of ShortString);

  procedure Grid_ComBo( Sender: TObject;
                         Data: ShortString;
                         Loc:Integer;
                         Clss_code : string=''); overload;
  procedure Grid_ComBo( Sender: TObject;
                         Data: ShortString;
                         piCol, piRow, Loc:Integer;
                         Clss_code : string=''); overload;
  {grid fromat check}
  function Grid_Dupchk(Sender: Tobject;
                        G_Row : Integer;
                        G_Data : String;//키값자료
                        G_Key_Col:Array of Integer):boolean;

  function  Grid_Fmt_Chk(Sender: TObject;
                          G_Fkey: Array of  Char;               //Null 값 체크 유무
                          G_Key_Col: Array of Integer):Boolean; //그리드 상에서 키 위치
  procedure Grid_LenChk(Sender : Tobject;
                         key : Char;
                         F_Name,
                         G_Name : Array of ShortString;
                         F_Type : Array of Char;
                         F_Size : Array of Integer;
                         G_Col: Integer;
                         Frmt_Chk : String='OLD');

  Function Grid_CommaToData (Data,Cmp_Data:String):Boolean;

  procedure Grid_Draw_Color(Sender: TObject;
                            Sel_loc: String;
                            Col_loc: Integer;
                            Row_loc: Integer;
                            Rect: TRect);

  procedure Grid_Draw_SetColor(Sender: TObject;  
                                Col_loc: Integer;
                                Row_loc: Integer;
                                Rect: TRect;
                                AColor:TColor);


  procedure SET_Grid_Draw(Sender: TObject;
                          Grid_Col_Name,
                          Fdata :array of ShortString;
                          Ftype :array of Char;
                          Row_cnt : Integer ); overload;



  procedure SET_Grid_Draw(Sender: TObject;
                        sData : String;
                        Ftype : Char;
                        iCol,iRow : Integer );overload;




  function Grid_Panel_Crt(Sender   : TObject;//그리드 객체명
                           hight    : Integer;//그리드 높이
                           sCol     : String; //TPanel 생성우치
                           sCaption : String):TPanel;//출력 값

  procedure Grid_Panel_Pos(Sender  : TObject;sCol : String;tPan:TPanel);//그리드 객체위치 설정

  procedure ChkBoxCrt();
  procedure ChkBoxFree();
  procedure ChkBoxShow(Sender: TObject; ACol, ARow: Integer;
                         Rect: TRect;  State: TGridDrawState; iChkLoc : Integer);

  procedure ToggleCheckbox(Sender: TObject; acol, arow: Integer );
  procedure ChkBoxOnOff(Sender: TObject);overload;
  procedure ChkBoxOnOff(Sender: TObject;iCol:Integer);overload;

  procedure AllChkboxOnOff(Sender: TObject; iChkLoc : Integer; bOn : Boolean );
  function Get_Chkbox(Sender: TObject; iCol,iRow : Integer ):Boolean;

  //그리드 타이틀 위치 찾기
  function func_GridTPos(Sender : Tobject; sTilte:String):Integer;

  //그리드 초기값 설정
  procedure proc_Grid_Init(tGrid:TStringGrid; sTitle:String;Var szRet:Array of TRecord; bW:Boolean=False);

  //그리드 출력 format 에 맞게 출력 (L:LOCATION
  procedure SET_Grid_Fmt( Sender: TStringGrid;
                           iCol,iRow : Integer;
                           sData : String;
                           cType : TFmtType
                           );

  function func_TitCnt(sTitle:String):Integer;
  //지정된 문자를 치환한다.
  function func_RepData(sData    : String;
              sDel : String):String;




  procedure CopyStreamToClipboard(S: TStream; fmt: Word);
  procedure proc_Grid_Cboard(theGrid: TStringGrid);
  procedure proc_GridSelect(Sender: TStringGrid; iS_X,iS_Y : Integer);
//  procedure proc_Grid_Txt(Sender  : TObject; iRow:Integer; sDefult, sFile, sCol : String);//그리드 객체명
  function func_FindIndex(Sender : TStringGrid;sFind:String;iCol:Integer):Integer; //그리드위치찾기
  function func_FindIndex_1(Sender : TStringGrid;sFind:String;iCol:Integer):Integer;


  {Xls}
  procedure proc_Xls_Grid(Sender : Tobject;  //객체
               Xls_Nm : String;
               Title  : TStringList;
               cDraw_Loc : Array Of Char;
               Del_Col:String='');overload;//경로

  procedure proc_Xls_Grid(Sender : Tobject;  //객체
               Xls_Nm : String;
               Title  : TStringList;
               cDraw_Loc : Array Of TRecord;
               Del_Col:String='');overload;//경로
  procedure Xls(Sender : Tobject;
                 Xls_Path,        //경로
                 Xls_Name:String; //명
                 G_Tit_Name: Array of ShortString;//그리드 타이틀
                 G_Size: Array of Integer;
                 G_Loc: Array of Char);//크기

  procedure Xls_job_Path(
                          Xls_Path :String);        //경로

  procedure Xls_Select(
                 G_Size: Array of Integer;
                 G_Data: Array of String;
                 Row : Integer);

  procedure Xls_job_Close;

var
  buf_Tstr  : TStringGrid; //TStringGrid buffer
  combo_new : array[0..14] of  Tcombobox; //combobox buffer
  buf_Loc   : Integer=0;   //checkbox location
  AllClear  : Boolean=False;    //checkbox all clear
  buf_combo_Loc : Integer=0;
  XlsHandle : Integer;
  igChkLoc  : Integer;
  FCheck, FNoCheck: TBitmap;   //콤보박스 이미지저장
implementation
uses Xls;
     //Com_PrFn;
{*****************************************************************************
*   함 수 명  : func_Grid_Clear
*   함수 기능 : 그리드 초기화
*   Parameters: Sender : TStringGrid
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure proc_Grid_Clear(Sender: TObject);
var
  li_loop : Integer;
begin
    with (Sender as TStringGrid) do begin
      for li_loop := 1 to RowCount-1 do begin
        Rows[li_loop].Clear;
      end;
      Row := 1;
      RowCount := 2;
    end;
end;

{*****************************************************************************
*   함 수 명  : func_Grid_Delete
*   함수 기능 : 그리드에서 선택된 한row 을 삭제
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure proc_Grid_Delete(Sender: TObject);
var
  li_i,li_j : Integer;
begin
    with (Sender as TStringGrid) do begin
      if RowCount > 2 then begin
        for li_i := Row to RowCount - 2 do
          Rows[li_i]:= Rows[li_i+1];
        Rows[RowCount-1].Clear;
        RowCount := RowCount - 1;
      end else  begin
        // 마지막 열의 문자열 Clear
        Rows[RowCount-1].Clear;
        // 마지막 열의 문자열에 '' Set
        Rows[RowCount-1].Add('');
      end;
      Refresh;
    end;
end;
{*****************************************************************************
*   함 수 명  : func_Grid_AddRow
*   함수 기능 : 그리드에서 선택된 한row값 증가
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure proc_Grid_AddRow(Sender: TObject;iRow:Integer);
var
  li_i,li_j : Integer;
begin
    with (Sender as TStringGrid) do begin
      if RowCount > 2 then begin
        RowCount := RowCount + 1;
        for li_i :=   RowCount - 1 downto iRow do
          Rows[li_i]:= Rows[li_i-1];
        Rows[iRow].Clear;
      end else  begin
        // 마지막 열의 문자열 Clear
        Rows[RowCount-1].Clear;
        // 마지막 열의 문자열에 '' Set
        Rows[RowCount-1].Add('');
      end;
      Refresh;
    end;
end;



{*****************************************************************************
*   함 수 명  : Grid_Row2_chk
*   함수 기능 : 첫번째  row 값 체크
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자}

procedure Grid_Row2_chk(Sender: TObject;
                         No_chk:Boolean);
var
  i : Integer;
  Cmp_str : String;
begin
    with (Sender as TStringGrid) do begin
      if Cells[ColCount+1,Row]='' then begin
        Cmp_Str :='';
        for i:=ColCount+2 to ColCount*2+1 do
          Cmp_Str:= Cmp_Str+Cells[i,1];
        if Trim(Cmp_Str)='' then //첫번째 row 에 값이 없을경우
          Cells[ColCount+1,1]:=' I';
        if (No_chk) then
        begin
          Cells[0,row]:=InttoStr(Row);
          Cells[colcount+2,row]:=InttoStr(Row);   // 자동 증가 일 경우 버퍼값도 일단 채운다.
        end;
      end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Grid_Next
*   함수 기능 : 그리드 초기화
*   Parameters: Sender : TStringGrid
*               Mode : 'I'  -> 신규 모드 자동으로 Row 값 증가
*                      else -> 조회 모드
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
   2001.08.15   첫번째 row에 값이없을경우 입력모드값 설정             백민하
}


procedure proc_Grid_Next(Sender: TObject;
                     Mode:Char;
                     Col_Pos:Integer; //시작위치
                     Col_Cnt:Integer; //끝라인값 :ColCount-Col_Cnt-1;
                     No_chk:Boolean); //Row값설정 유무
begin
    with (Sender as TStringGrid) do begin
      Grid_Row2_chk(Sender,No_chk);
      if col=ColCount-Col_Cnt-1 then begin
        Col := Col_Pos;
        if (RowCount <= Row + 1) then begin
          if (UpCase(Mode)='I') then begin
            if No_chk then begin
              Cells[0,RowCount]:=IntTostr(RowCount);
              Cells[ColCount+2,RowCount]:=IntTostr(RowCount);
            end;
            Cells[ColCount+1,RowCount]:=' I';
            RowCount := RowCount+1;
            row:=RowCount-1;
          end;
        end else begin
          row := row + 1;
        end;
      end else Col:=Col+1;
    end;
end;
{*****************************************************************************
*   함 수 명  : Warp_Row_Cnt
*   함수 기능 : 그리드 초기화
*   Parameters:Sender: Data
*
*   Retrun    : Integer -> '|' 갯수
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Function Warp_Row_Cnt (const Data :String):Integer;
var
  k : integer;
  comma_cnt : Integer;
begin
  comma_cnt :=0;
  for k := 1 to length(data) do
    if (copy(Data,k,1) = '|') then
       inc(comma_cnt);
  Result := comma_cnt;
end;
{*****************************************************************************
*   함 수 명  : Grid_Draw
*   함수 기능 : 그리드 초기화
*   Parameters:Sender: TObject
*               Col_Loc,              //col 위치값
*               Row_Loc:Integer       //row 위치값
*               Rect: TRect;          //
*               State: TGridDrawState;//상태값
*               Draw_Loc:Char;        //'L'->왼쪽 정렬 'C'->중앙 정렬 'R'->오른쪽 정렬
*               Sts_Pos:Integer);     //중복 처리 작업을 할 0-Sts_Pos 컬럼 위치
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure proc_Grid_Draw(Sender: TObject;
                    Col_Loc,
                    Row_Loc:Integer;
                    Rect: TRect;
                    State: TGridDrawState;
                    Draw_Loc:Char;
                    Sts_Pos:Integer;
                    Wrap_Cnt:Integer);
var
  li_Left ,li_Top ,li_tw : Integer;
  Pos_cnt : Integer;
  warp_data,ch_data : ShortString;
  Wrap_Pos : Integer;
  CurY : Integer;
  EndData,one_cnt : Boolean;
begin
    with (Sender as TStringGrid) do begin
      with Canvas do begin
        if (Row_Loc = 0) then begin
          if Wrap_Cnt>1 then begin
//            DefaultDrawing := false;
            warp_data := Cells[Col_Loc,Row_Loc];
            Pos_cnt:= Warp_Row_Cnt(warp_data);  //객수 파악
            RowHeights[0] := (TextHeight('A')*Wrap_Cnt)+(Wrap_Cnt*4)+8;
            if  Pos_cnt =0 then begin
              li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
              li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
              Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
            end
            else
            begin
              EndData := False;
              one_cnt := False;
              CurY :=  (RowHeights[0] mod ((TextHeight('A') * ( Pos_cnt+1))+(Wrap_Cnt*4))) div 2;
              while (not EndData) do begin
                Wrap_Pos:= pos('|', warp_data);
                if Wrap_Pos > 0 then begin
                  ch_data :=Copy(warp_data, 0, Wrap_Pos-1);
                  warp_data := Copy(warp_data,Wrap_Pos+1 , Length(warp_data) - Wrap_Pos);
                  li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(ch_data)) div 2;
                  if (not one_cnt) then begin
                    one_cnt := True;
                    Textrect(Rect, li_Left, CurY, ch_data); //출력할 자료
                  end else begin
                    TextOut(li_Left, CurY, ch_data); //출력할 자료
                  end;
                  CurY := CurY +  TextHeight('A')+5;
                end
                else
                begin
                  EndData := True;
                  li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(warp_data)) div 2;
                  TextOut(li_Left, CurY, warp_data); //출력할 자료
                end;
              end;
            end;
          end
          else
          begin
            li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
            li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
            Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
          end;
        end else begin
          //Sts_Pos안에서 작업할 영역 선택
          Font.Color :=  clWindowText;
          if (gdSelected in State) or (Pos('>',Cells[Col_Loc,Row_Loc])>0) then begin
            Brush.Color :=$008BF1FA;//clAQUA;
            Font.Color :=Clblue;
          end;
          if Sts_Pos>=Col_Loc then begin
            if Cells[Col_Loc,Row_Loc]=Cells[Col_Loc,Row_Loc-1] then begin
              Font.Color := (Sender as TStringGrid).Color;
              if gdSelected in State then
                Font.Color:=clAQUA;
            end;
          end;
          
          FillRect(Rect);
          li_tw := TextWidth(Trim(Cells[Col_Loc, Row_Loc]));
          Case UpCase(Draw_Loc) of
              'R' : TextOut(Rect.Right - li_tw - 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
              'L' : TextOut(Rect.Left+2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
              'C' : TextOut((Rect.Left + Rect.Right - li_tw) div 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
          end;
        end;
      end;
    end;
end;



{*****************************************************************************
*   함 수 명  : Grid_Select_Order
*   함수 기능 : 선택된 컬럼순으로 정렬
*   Parameters:Sender: TObject
*               Sel_Col,              //col 위치값
*               Add_Cnt:Integer       //Colcount =  ColCount+Add_Cnt+1;
*               Sort : Char           //'D' : 내림차순 'A' 오름차순
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Grid_Select_Order(Sender: TObject;
                             Sel_Col,
                             Add_Cnt:Integer;
                             Sort :Char );
var
  Array_Cnt,Start_Col: Integer;
  li_loop ,lj_loop ,Loop_Sort: Integer;
  cmp_suwi : array of ShortString;

begin
    //--그리드에 설정된 필드명 검색
    Start_Col:=0;
    Array_Cnt := (Sender as TStringGrid).ColCount+Add_Cnt+1;
    SetLength(cmp_suwi,Array_Cnt);//--임시 저장 배열
    with (Sender as TStringGrid) do begin
      if Cells[0,0]='No' then Start_Col:=1;
      for li_loop := 1 to RowCount - 1 do begin
        for lj_loop := li_loop+1  to RowCount - 1 do begin
          if (trim(Cells[Sel_Col,li_loop+1])='') then begin
            Continue;
          end;
          if Sort='A' then begin //오름 차순 정렬
            if Cells[Sel_Col,li_loop] > Cells[Sel_Col,lj_loop] then begin
              for Loop_Sort := Start_Col to ColCount+Add_Cnt do begin
                cmp_suwi[Loop_Sort]:= Cells[Loop_Sort,li_loop];
                Cells[Loop_Sort,li_loop]:=Cells[Loop_Sort,lj_loop];
                Cells[Loop_Sort,lj_loop]:=cmp_suwi[Loop_Sort];
              end;
            end;
          end else
          if Sort='D' then begin //내림 차순 정렬
            if Cells[Sel_Col,li_loop] < Cells[Sel_Col,lj_loop] then begin
              for Loop_Sort := Start_Col to ColCount+Add_Cnt do begin
                cmp_suwi[Loop_Sort]:= Cells[Loop_Sort,li_loop];
                Cells[Loop_Sort,li_loop]:=Cells[Loop_Sort,lj_loop];
                Cells[Loop_Sort,lj_loop]:=cmp_suwi[Loop_Sort];
              end;
            end;
          end;
        end;
      end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Grid_OrderBy
*   함수 기능 : 마우스로 선택된 컬럼 정렬
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Grid_OrderBy(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  iCol : integer;
  iRow : integer;
  Set_Sort : Char;
begin
    Set_Sort:='A';
    if Set_Sort='▲' then Set_Sort:='D';
    (Sender As TStringGrid).MouseToCell(X,Y,iCol,iRow);//마우스->  그리드 좌표값  얻기
    if (iCol <0) or (iRow<0) then exit;
    if UpperCase(Trim((Sender As TStringGrid).Cells[iCol,0])) = 'NO' then Exit;
    if (iRow = 0) and (Button = mbLeft) then
    begin
      with (Sender As TStringGrid) do
      Grid_Select_Order(Sender,iCol,ColCount,Set_Sort);
    end;
end;

{*****************************************************************************
*   함 수 명  : SET_Grid_Draw
*   함수 기능 : 그리드에 자료 출력하기
*   Parameters: Sender: TObject;Fdata
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.02
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
{   2001.08.07         'No' 값의 증가                                 배 호병
}
procedure SET_Grid_Draw(Sender: TObject;
                        Grid_Col_Name,
                        Fdata :array of ShortString;
                        Ftype :array of Char;
                        Row_cnt : Integer );
var
  i : Integer;
begin
    With (Sender as  TStringGrid) do begin
      RowCount := Row_cnt+1;
//      Row      := Row_cnt;                           // 'No'값의 증가
      For i:= 0 to high(Ftype) do begin
        if UpperCase(Grid_Col_Name[i])='NO!' then
        begin
          Cells[i,Row_cnt]:=IntTostr(Row_cnt);
          Cells[i+ColCount+2,Row_cnt]:=IntTostr(Row_cnt);
          Continue;
        end;
        case Ftype[i] of
          'I' : if (Fdata[i]<>'') then
                begin
                   Cells[i,Row_cnt]:=FormatFloat('#,##0.#####',StrToFloat(Fdata[i]));
                   Cells[i+ColCount+2,Row_cnt]:=FormatFloat('#,##0.#####',StrToFloat(Fdata[i]));
                end;
          'F' : if (Fdata[i]<>'') then
                begin
                   Cells[i,Row_cnt]:=FormatFloat('#,##0.####',StrToFloat(Fdata[i]));
                   Cells[i+ColCount+2,Row_cnt]:=FormatFloat('#,##0.####',StrToFloat(Fdata[i]));
                end;
          'C' : begin
                   Cells[i,Row_cnt]:=Fdata[i];
                   Cells[i+ColCount+2,Row_cnt]:=Fdata[i];
                end;
          'L' : if (Fdata[i]<>'') then  // Location Format
                begin
                   Cells[i,Row_cnt]:= FormatMaskText('#-#-##-#-##;0',Fdata[i]);
                   Cells[i+ColCount+2,Row_cnt]:= FormatMaskText('#-#-##-#-##;0',Fdata[i]);
                end;
          'T' : if (Fdata[i]<>'') then  // Time Format
                begin
                   Cells[i,Row_cnt]:= FormatMaskText('##:##;0',Fdata[i]);
                   Cells[i+ColCount+2,Row_cnt]:= FormatMaskText('00:00;0',Fdata[i]);
                end;
          'M' : if (Fdata[i]<>'') then  // 입력용 날짜 Format
                begin
                   Cells[i,Row_cnt]:= FormatMaskText('####-##-##;0',Fdata[i]);
                   Cells[i+ColCount+2,Row_cnt]:= FormatMaskText('####-##-##;0',Fdata[i]);
                end;
        end;
      end;
      // 조회할때 그리드 Row 모드를 조회 모드로 한다.
      Cells[ColCount+1,Row_cnt] := ' R';
    end;
end;

{*****************************************************************************
*   함 수 명  : SET_Grid_Draw
*   함수 기능 : 그리드에 자료 출력하기
*   Parameters: Sender: TObject;Fdata
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.02
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
{   2001.08.07         'No' 값의 증가                                 배 호병
}
procedure SET_Grid_Draw(Sender: TObject;
                        sData : String;
                        Ftype : Char;
                        iCol,iRow : Integer );
var
  i : Integer;
begin
    With (Sender as  TStringGrid) do begin
       // 조회할때 그리드 Row 모드를 조회 모드로 한다.
     Cells[ColCount+1,iRow] := ' R';
//     For i:= 0 to high(Ftype) do begin
        case Ftype of
          'I' :
                begin
                   Cells[iCol,iRow]:=FormatFloat('#,##0.#####',StrToFloat(sData));
                   Cells[iCol+ColCount+2,iRow]:=FormatFloat('#,##0.#####',StrToFloat(sData));
                   Exit;
                end;
          'F' :
                begin
                   Cells[iCol,iRow]:=FormatFloat('#,##0.####',StrToFloat(sData));
                   Cells[iCol+ColCount+2,iRow]:=FormatFloat('#,##0.####',StrToFloat(sData));
                   Exit;
                end;
          'C' : begin
                   Cells[iCol,iRow]:=sData;
                   Cells[iCol+ColCount+2,iRow]:=sData;
                   Exit;
                end;
          'L' :
                begin
                   Cells[iCol,iRow]:= FormatMaskText('#-#-##-##-#;0',sData);
                   Cells[iCol+ColCount+2,iRow]:= FormatMaskText('#-#-##-##-#;0',sData);
                   Exit;
                end;
          'T' :
                begin
                   Cells[iCol,iRow]:= FormatMaskText('##:##;0',sData);
                   Cells[iCol+ColCount+2,iRow]:= FormatMaskText('00:00;0',sData);
                   Exit;
                end;
          'M' :
                begin
                   Cells[iCol,iRow]:= FormatMaskText('####-##-##;0',sData);
                   Cells[iCol+ColCount+2,iRow]:= FormatMaskText('####-##-##;0',sData);
                   Exit;
                end;
//        end;
      end;
    end;
end;






{*****************************************************************************
*   함 수 명  : SET_Grid_Fmt
*   함수 기능 : 그리드에 자료 형식 출력
*   Parameters: Sender: TObject;Fdata
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.02
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
{   2001.08.07         'No' 값의 증가                                 배 호병
}
procedure SET_Grid_Fmt( Sender: TStringGrid;
                        iCol,iRow : Integer;
                        sData : String;
                        cType : TFmtType
                        );
begin
    If sData='' Then Exit;
    With (Sender) do begin
        case cType of
            fmI : Cells[iCol ,iRow]:= FormatFloat('#,##0.#####',StrToFloat(sData));
            fmINULL : Cells[iCol ,iRow]:= FormatFloat('#,##',StrToFloat(sData));
            fmF : Cells[iCol ,iRow]:= FormatFloat('#,##0.####',StrToFloat(sData));
            fmC : Cells[iCol ,iRow]:= sData;
            fmL : Cells[iCol ,iRow]:= FormatMaskText('#-##-#-##-##;0',sData);
            fmT : Cells[iCol ,iRow]:= FormatMaskText('##:##:##;0',sData);
            fmM : Cells[iCol ,iRow]:= FormatMaskText('####-##-##;0',sData);
            fmYM : Cells[iCol ,iRow]:= FormatMaskText('####-##;0',sData);
        else
            Cells[iCol ,iRow]:= sData;
        end;
    end;
end;



{*****************************************************************************
*   함 수 명  : SET_Grid_Mode
*   함수 기능 : 그리드에 선택된값 체크 모드 전환
*   Parameters: Sender: TObject;Fdata
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.02
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
{   2001.08.07         신규모드일때는 수정모드로 전환안함             배호병
    2001.08.18         자리수 1->2자리로 수정                         백민하
}
procedure Get_Grid_UP_Mode(Sender: TObject; Mode:char);
begin
    With (Sender as TStringGrid) do
    begin
// top  ysh 임시로 해 본다.
       if (trim(Cells[Colcount+1,Row]) = '') then
       begin
           Cells[Colcount+1,Row]:=' I';
           Exit;
       end;
       if (Cells[Colcount+1,Row][2] = 'I') then  exit;
// end
//       ShowMessage(Cells[Col,Row]+':'+trim(Cells[Col+Colcount+2,Row]));
       if trim(Cells[Col,Row]) <> trim(Cells[Col+Colcount+2,Row]) then
       begin
           Cells[Colcount+1,Row]:=' E';
       end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Get_Grid_key_Mode
*   함수 기능 : 그리드에 선택된값 체크 모드 전환
*   Parameters: Sender: TObject
*               key_Start: 키체크 시작 위치점
*               key_End:키체크 종료 점
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.02
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
key 값을 수정했으면 자료를 삭제후 저장
}
procedure Get_Grid_key_Mode(Sender: TObject;
                             key_Start,
                             key_End:Integer);
begin
    With (Sender as TStringGrid) do begin
      if (Col<=key_Start) and (Col>=key_End)  then begin //시작점과 종료점 사이일경우
        if (Trim(Cells[Colcount+1,Row])<>'I')
          and(trim(Cells[Col,Row])<> Cells[Col+Colcount+2,Row]) then begin
            Cells[Colcount+1,Row]:='DI';
        end;
      end;
    end;
end;
{*****************************************************************************
*   함 수 명  : func_GridTPos
*   함수 기능 :
*   Parameters: Sender :객체
*               sTilte : 타이틀
*
*
*   Retrun    :  그리드 타이틀 위치
*   작 성 자  : 백 민하
*   작 성 일  : 2001.06.27
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
}
function func_GridTPos(Sender : Tobject; sTilte:String):Integer;
var
    iCol : Integer;
Begin
    Result := -1;
    With (Sender as TStringGrid) do begin
       For iCol := 1 To Colcount - 1 Do Begin
          If Trim(Cells[iCol,0]) =  sTilte Then Begin
             Result := iCol;
             Exit;
          End;
       End;
    End;
End;

{*****************************************************************************
*   함 수 명  : get_Grid_Fid_Data
*   함수 기능 : 필드형식에 맞게 자료 얻기
*   Parameters: Fname :필드명
*                Grid_Fname :그리드에 출력할 필드명
*                FData : 입력할 결과값
*                in_Row : 그리드상 row
*   Retrun    :  FData ->입력할 자료
*   작 성 자  : 백 민하
*   작 성 일  : 2001.06.27
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
   2001.08.20  컴보박스 입력시 처리 추가                             백 민하 }

procedure Get_Grid_Fid_Data(Sender : Tobject;
                            Fname,
                            Grid_Fname:Array of ShortString;
                            var FData: Array of ShortString;
                            in_Row:Integer;
                            Ftype:Array of Char);
var
  i,j     : Integer;
  ch_data : String;
  F_Pos   : Integer;
begin
    With (Sender as TStringGrid) do begin
      For i:= 0 to ColCount-1 do begin
        if Grid_Fname[i]='' then  Continue;
        if UpperCase(Grid_Fname[i])='NO!' then Continue;
        if UpperCase(Grid_Fname[i])='NULL' then Continue;
// ysh       F_Pos:=Pos('.',Grid_Fname[j])+1;
        F_Pos:=Pos('.',Grid_Fname[i])+1;
        if F_Pos>0 then begin
           Grid_Fname[i]:=Copy(Grid_Fname[i],F_Pos,Length(Grid_Fname[i]));
        end;
        ch_data:=Cells[i,in_Row];
        for j:= 0 to high(Fname) do begin
          if Fname[j] = Trim(Grid_Fname[i]) then begin
            FData[j]:=ch_Data;
            if Ftype[j]='X' then
              FData[j]:=Copy(ch_Data,cCbo_Len+1,cDtl_Len)
// 2001.11.10 ysh  그리드 널 업데이트 처리
            else if Ftype[j] in ['I','F'] then
            begin
              if trim(ch_data) = '' then
                 FData[j]:= '0';
            end else if Ftype[j] in ['T'] then
            begin
              if trim(ch_data) = '' then
                 FData[j]:= ' ';
            end;
          end;
        end;
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Set_Grid_Fmt_Num
*   함수 기능 : 그리드에 숫자형 필드 표시
*   Parameters:
*   Retrun    :
*   작 성 자  : 양 선학
*   작 성 일  : 2001.08.09
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Set_Grid_Fmt_Num(Sender : Tobject;
                           Col_Loc,
                           Row_Loc:Integer;
                           Rect   : TRect;
                           aFmt_Index, aLeft, aRight  : Array of integer);
var
  tmpText, cellText: String;
  ii, X, Y: Integer;
  crect : TRect;
begin
    With (Sender as TStringGrid) do
    begin
        if (Row_Loc > 0) and (Col_Loc in [aFmt_Index[Col_Loc]]) and (Cells[Col_Loc, Row_Loc] <> '') then
        begin
            cellText:= '';
            tmpText := Cells[Col_Loc, Row_Loc];
            for ii   := 1 to Length(tmpText) do
                if tmpText[ii] in ['0'..'9','-','+','.'] then
                    cellText    := cellText + tmpText[ii];

            try
                {cell의 값을 floating point 으로 변환}
                if cellText <> '' then
                   cellText  := FloatToStrF(StrToFloat(cellText),
                                            ffNumber,aLeft[Col_Loc],aRight[Col_Loc]); // 소숫점을 없애려면 2->0 으로
            except on EConvertError do
                begin
                    cellText    := '';
                end;
            end;

            if cellText = '' then
            begin
                {Set font}
                Canvas.Font.Color := clRed;  {잘못된 수치는 빨강}
                Canvas.TextOut(Rect.Left+2, Rect.Top+2, Cells[Col_Loc,Row_Loc]);
            end else
            begin
              {cell이 수치이므로 오른쪽 right-justified}
              X := Rect.Right - Canvas.TextWidth(cellText);

              {cell의 수치를 bottom과 top에 대한 중앙으로}
              Y := Rect.Top + ((Rect.Bottom - Rect.Top -
                                Canvas.TextHeight(cellText)) div 2);
              Canvas.Font.Style := Canvas.Font.Style - [fsBold];

              // 오른쪽 margin을 주기위해 왼쪽으로 3 pixels 만큼 이동
              Dec(X, 3);

              Canvas.TextRect(Rect, X, Y, cellText);
            end;
        end;
    end;
end;


{  이름    : proc_Grid_Next_Key
   기능    : enter를 치면 다음 컬럼으로 이동
   인수    :  AdvStringGrid : TObject;  //그리드
                                   iCol_Start: Integer;  //셀시작위치
                                   iCol_End  : Integer;  //셀마직막위치
                                   cMode     : char;     //모드 'I':신규 ,'E':수정 ,'Q' :조회
                                   wKey      : Word);    //키값 설정
                                   CanEdit_Loc  ',1,' 1번째셀 건너뜨고 다음셀로 이동


   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}

procedure proc_Grid_Next ( Sender      : TObject;  //그리드
                           iCol_Start  : Integer;  //셀시작위치
                           iCol_End    : Integer;  //셀마직막위치
                           cMode       : char;     //모드 'I':신규 ,'E':수정 ,'Q' :조회
                           wKey        : Char;    //키값 설정
                           CanEdit_Loc : String);   //

    Function  fn_CanEdit_YN(iCol : Integer ;CanEdit_Loc : String): Boolean;
    begin
       Result := False;
       If Pos( ','+inttostr(iCol)+',',CanEdit_Loc)>0 Then Begin
          Result:= True;
       End;
    end;

var
    iS_Pos    : Integer;
    iE_Pos    : Integer;
    iNext_Pos : Integer;
    iFix_Pos  : Integer;
    bEndRow   : Boolean;
    iNext_Col : Integer;
    bNext_Col : Boolean;
    Shift     : TShiftState;
begin
    iS_pos := iCol_Start;
    iE_pos := iCol_End;
    With (Sender as TStringGrid) do Begin
       If (not ((gChForm).ActiveControl is TStringGrid)) And ( cMode in ['I','E'] ) Then Begin
          Col := iS_pos;
          RowCount :=   RowCount + 1;
          Row := RowCount - 1;
          SetFocus;
          Exit;
       end;
       iFix_Pos := FixedRows;
       //그리드상에 폭설정을 =0 이면 다음으로 이동
       //그리드에 설정된 셀의 끝인지 확인 다음 라인으로 이동

       bEndRow := False;
       If (Col>=iE_pos) and (wKey in [#13]) Then Begin
          bEndRow := True;
          Col := iS_pos;  //셀의 시작위치로 이동
          If (RowCount = Row + 1)  Then  Begin //조회모드일경우 처음으로 이동
             If (cMode = 'Q') Then Begin
                Row:=iFix_Pos;
             End Else If (cMode in ['I','E']) And (wKey=#13) Then Begin //신규,수정일때Row 증가
                RowCount :=   RowCount + 1;
                Row := RowCount - 1;
                If Cells[0,0]='NO' Then Begin
                   Cells[0,Row] := IntToStr(Row);
                End;
             End;
          End Else Begin
            Row := Row + 1;
          End;
       End;
       If Not(bEndRow) Then Begin
          If (wKey in [#13])  Then Begin
              for iNext_Pos:= Col+1 to iE_pos do Begin  
                 If (ColWidths[iNext_Pos]<=0) or (fn_CanEdit_YN(iNext_Pos,CanEdit_Loc)) then Begin
                   // Col:=Col+1;
                    If (Col>iE_pos)  Then Begin
                       Col := iS_pos;  //셀의 시작위치로 이동
                       If (RowCount = Row + 1) And (cMode in ['I','E'])  Then  Begin //조회모드일경우 처음으로 이동
                          RowCount :=   RowCount + 1;
                          Row := RowCount - 1;
                       End
                       Else Begin
                          Row := Row + 1;
                       End;
                       Exit;
                    End;
                 End else Begin
                    Break;
                 end;
              end;
              Col := Col + 1;
          End;
       End;
       SetFocus;
    End;
end;


{*****************************************************************************
*   함 수 명  : Grid_ComBo_Crt
*   함수 기능 : 콤보박스 생성
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Grid_ComBo_Crt( Sender: TObject;
                          Data: array of ShortString;
                          Class_code: ShortString;
                          combo_Loc : Integer);
var
  ch_height : integer;
begin
    if combo_new[combo_Loc] = nil then // Combo 존재 유무 체크
       combo_new[combo_Loc] := TComBo.Create(Application);
    With  combo_new[combo_Loc] do begin
      Parent :=(Sender as TGroupBox);
      Style := csDropDownList;
      OnExit :=TComBo.Create(Application).combo_newexit;
      OnKeyPress :=TComBo.Create(Application).Enter_key;
      onChange :=TComBo.Create(Application).Combo_Change;
      Visible := False;
    end;
    if (Trim(Class_code) = '') then
      Combo_Item(combo_new[combo_Loc],Data)
end;
{*****************************************************************************
*   함 수 명  : Combo_Item
*   함수 기능 : 콤보박스 자료 추가
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Combo_Item( Sender: TObject; Data: array of ShortString);
var
  i: integer;
begin
  (Sender as TComboBox).items.Clear;
  For i := 0 to high(Data) do begin
    (Sender as TComboBox).items.add(Data[i]);
  end;
end;

{*****************************************************************************
*   함 수 명  : Grid_ComBo
*   함수 기능 : 그리상에 콤보박스 지정
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
// 2001/08/30      공용코드가 아닐경우 인덱스 찾기 수정               양선학   

procedure Grid_ComBo( Sender: TObject;
                         Data: ShortString;
                         Loc:Integer;
                         Clss_code : string);
var
  R  : TRect;
  ch_top:Integer;
  ch_left:Integer;
begin
    buf_combo_Loc :=Loc;
    with (Sender as TStringGrid) do begin
      ch_top :=Top;
      ch_left := Left;
      if Col=Loc then Begin
        buf_Tstr:= (Sender as TStringGrid);
        R := CellRect(Col, Row);
        R.Left := R.Left;
        R.Right := R.Right;
        R.Top := R.Top;
        R.Bottom := R.Bottom;
        With combo_new[Loc] do begin
          Left := R.Left +ch_left+ 1;
          Top := R.Top +ch_top+ 1;
          Width := (R.Right + 1) -R.Left-1;
          Height := (R.Bottom + 1) - R.Top;
          Visible := True;
          SetFocus;
        end;
        if (Trim(Clss_code) = '') then
           combo_new[Loc].ItemIndex := combo_new[Loc].Items.IndexOf(Cells[col,Row])
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Grid_ComBo
*   함수 기능 : 그리상에 콤보박스 지정
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
// 2001/08/30      공용코드가 아닐경우 인덱스 찾기 수정               양선학

procedure Grid_ComBo( Sender: TObject;
                         Data: ShortString;
                         piCol, piRow, Loc:Integer;
                         Clss_code : string);
var
  R  : TRect;
  ch_top:Integer;
  ch_left:Integer;
begin
    buf_combo_Loc :=Loc;
    with (Sender as TStringGrid) do begin
      ch_top :=Top;
      ch_left := Left;
      if piCol=Loc then Begin
        buf_Tstr:= (Sender as TStringGrid);
        R := CellRect(piCol, piRow);
        R.Left := R.Left;
        R.Right := R.Right;
        R.Top := R.Top;
        R.Bottom := R.Bottom;
        With combo_new[Loc] do begin
          Left := R.Left +ch_left+ 1;
          Top := R.Top +ch_top+ 1;
          Width := (R.Right + 1) -R.Left-1;
          Height := (R.Bottom + 1) - R.Top;
          Visible := True;
          SetFocus;
        end;
        if (Trim(Clss_code) = '') then
           combo_new[Loc].ItemIndex := combo_new[Loc].Items.IndexOf(Cells[picol,piRow])
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Enter_key
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure TCombo.Enter_key(Sender: TObject; var Key: Char);
var
  ch_mode : Char;
begin
    if combo_new[buf_combo_Loc].Visible=True then begin
      if (Key in [#13])  then  begin                            { if it's an enter key }
        Key := #0;                                 { eat enter key }
        with buf_Tstr do begin
          Cells[Col,Row]:=Trim(combo_new[buf_combo_Loc].Text);
          Grid_Row2_chk(buf_Tstr,False);
          Ch_Mode:=' ';
          if Trim(Cells[ColCount+1,Row])<>'' then Ch_Mode:=Cells[ColCount+1,Row][2];
          combo_new[buf_combo_Loc].Visible := False;
          proc_Grid_Next(buf_Tstr,Ch_Mode);
        end;
      end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Combo_Change
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Tcombo.Combo_Change(Sender:TObject);
begin
    With buf_Tstr do begin
      Cells[Col,Row]:=Trim(combo_new[buf_combo_Loc].Text);
    end;
end;
procedure TCombo.combo_newexit(Sender:TObject);
var
  ch_mode : char;
begin
    if buf_Tstr <> nil then begin
      with buf_Tstr do begin
        combo_new[buf_combo_Loc].Visible := False;
        SetFocus;
      end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Grid_LenChk
*   함수 기능 : 길이체크
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Grid_LenChk(Sender : Tobject;
                       key : Char;
                       F_Name,
                       G_Name : Array of ShortString;
                       F_Type : Array of Char;
                       F_Size : Array of Integer;
                       G_Col: Integer;
                       Frmt_Chk : String);
var
  j     : Integer;
  F_Pos   : Integer;
begin
    With (Sender as TStringGrid) do begin
      F_Pos:=Pos('.',G_Name[G_Col])+1;
      if F_Pos>0 then begin
         G_Name[G_Col]:=Copy(G_Name[G_Col],F_Pos,Length(G_Name[G_Col]));
      end;
      for j:= 0 to high(F_name) do begin
        if F_name[j] = G_Name[G_Col] then begin
          Case F_Type[j] of
            'I' :begin
                  if  not(key in ['0'..'9','.','-',#13,#8]) then key:=#0;
                 end;
            'C' :begin
                 end;
            'D' :begin
                 end;
          end;
          if Length(Cells[G_Col,Row])> F_Size[j] then begin
            MessageBox(GetFocus,pchar(Cells[G_Col,0]+
                                      '는 자리수['+
                                      inttostr(F_Size[j])+
                                      ']보다 크게입력 할수 없습니다.!')
                       ,'자료형식 에러',mb_IconExclamation+mb_OK);

            exit;
          end;

        end;
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Grid_Dupchk
*   함수 기능 : 중복에러처리
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function Grid_Dupchk(Sender: Tobject;
                       G_Row : Integer;
                       G_Data : String;//키값자료
                       G_Key_Col:Array of Integer):boolean;
var
  i ,d : Integer;
  Ch_data : string;
begin
    Result := True;
    With (Sender as  TStringGrid) do begin
      for i:= 1 to RowCount-1 do begin
        Ch_data :='';
        for d:= 0 to  high(G_Key_Col) do
          Ch_data := Ch_data+Cells[G_Key_Col[d],i];
        if (Ch_data=Trim(G_Data)) and (i<>G_Row) then begin
          MessageBox(GetFocus,pchar('이미 등록된 자료가 있습니다!!!')
                     ,'중복처리 에러',mb_IconExclamation+mb_OK);
//          Cells[G_Key_Col[d],G_Row]:=Cells[G_Key_Col[d]+Colcount+2,G_Row];
          Result := False;
          exit;
        end;
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Grid_Format_Chk
*   함수 기능 : 그리드상 형식체크
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Function  Grid_Fmt_Chk(Sender: TObject;
                        G_Fkey: Array of  Char;               //Null 값 체크 유무
                        G_Key_Col: Array of Integer):Boolean; //그리드 상에서 키 위치
var
  Ch_Data : ShortString;
  i ,j: Integer;
  d : Integer; //체크 키값
  G_Data : String;
begin
    Result := True;
    G_Data :='';
    With (Sender as  TStringGrid) do begin
      for i:=1 to Rowcount-1 do begin
        for j:=0 to ColCount-1 do begin
          if (G_Fkey[j] in ['P','F']) then begin //Null Value check
            Ch_Data := Trim(Cells[j,i]);
            if (Ch_Data='') then begin
              Result := False;
              MessageBox(GetFocus,pchar('Null 값을 입력할수 없습니다.!!!'),
                               '자료형식 에러',mb_IconExclamation+mb_OK);
              Col:=j; Row:=i;
              exit;
            end;
            //필드 키값 체크
            if G_Key_Col[0]>0 then begin
              for d:=0 to high(G_Key_Col) do begin
                G_Data := G_Data +Cells[G_Key_Col[d],i];
                if (Not Grid_Dupchk(Sender,i,G_Data,G_Key_Col)) then begin //중복에러체크
                  Result := False;
                  Col:=j; Row:=i;
                  exit;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Grid_CommaToData
*   함수 기능 : 컴마기준으로 위치값 계산
*   Parameters: 값이 잇으면 True
                            False;
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

Function Grid_CommaToData (Data,Cmp_Data:String):Boolean;
var
  ch_data : String;
  i : Integer;
  data_len : integer;
begin
   Result := False;
   data_len:= length(Data);
   For i:= 1 to data_len do begin
      if (data[i]=',') then begin
        if Cmp_Data=Trim(ch_data) then begin
           Result := True;
           exit;
        end;
        ch_data:='';
        continue;
      end;
      ch_data:=ch_data+data[i];
   end;
   if Cmp_Data=Trim(ch_data) then begin
      Result := True;
      exit;
   end;
end;

{*****************************************************************************
*   함 수 명  : Grid_Draw_Color
*   함수 기능 : 그리드 입력셀 구분
                조회셀만 색을 바꾸자
                Grid_Draw 보다 한수 위에서 처리해야됨( 끗발이 낮음 )
*   Parameters:
           Sel_loc : 그리드에 출력할 색상 위치값 ',0,4,7,8,9,11,12,'
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.10.20
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Grid_Draw_Color(Sender: TObject;
                          Sel_loc: String;
                          Col_loc: Integer;
                          Row_loc: Integer;
                          Rect: TRect);
begin
  with (Sender as TStringGrid) do begin
    if Pos( ','+inttostr(Col_loc)+',',Sel_loc)>0 then begin
     if  Row_loc>0 then
     with Canvas do begin
       FillRect(Rect);
//       Brush.Color :=$00F7DECA;
       Brush.Color :=$00D7FFD7;
       fillRect(rect);
     end;
    end;
  end;
end;

procedure Grid_Draw_SetColor(Sender: TObject;
                              Col_loc: Integer;
                              Row_loc: Integer;
                              Rect: TRect;
                              AColor:TColor);
begin
  with (Sender as TStringGrid) do begin
     if  (Row_loc > 0) and
          (Col_loc > 0) then
     with Canvas do begin
       FillRect(Rect);
//       Brush.Color :=$00F7DECA;
       Brush.Color := AColor;
       fillRect(rect);
     end;
  end;
end;

{*****************************************************************************
*   함 수 명  : Grid_Panel_Crt
*   함수 기능 : 그리드타이틀에 판넬생성
*   Parameters:
*                hight:타이틀 row 지정
*                sCol :결합할 col 지정
*                sCaption : 결합 타이틀 출력 자료
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
****************************************************************************** }
{
function Grid_Panel_Crt(Sender   : TObject;//그리드 객체명
                         hight    : Integer;//그리드 높이
                         sCol     : String; //TPanel 생성우치
                         sCaption : String ):TPanel;//출력 값
var
    ch_height : integer;
    A         : TPanel;
    iCol      : Integer;
    iLoop     : Integer;
    iWdEn     : Integer;
    iWdSt     : Integer;
    iLeft     : Integer;
    sDNm      : String;
begin
    (Sender as TStringGrid).RowHeights[0]:=hight;
//    A := TPanel.Create(Application);
    A := TPanel.Create((Sender as TStringGrid).Owner);
    sDNm := Copy(sCol,2,Length(sCol));
    sDNm := Copy(sDNm,1,Pos(',',sDNm)-1);
    iWdEn := 0;
    iWdSt := 0;
    iLeft := 0;
    With  A do begin
        Parent  := (Sender as TStringGrid);
        Name    := 'pnlCrt'+(Sender as TStringGrid).Name+sDNm;
        caption := sCaption;
        With (Sender as TStringGrid) Do Begin
           For iLoop :=  0 to  ColCount -1 Do Begin
              If Pos( ','+inttostr(iLoop)+',',sCol)>0 then begin
                 iWdEn := iWdEn +  ColWidths[iLoop] + 1 ;
                 iLeft := iWdSt;
              End
              Else Begin
                iWdSt := iWdSt +  ColWidths[iLoop] + 1;
              End;
           End;
        End;
        Left  := iLeft;
        Width := iWdEn-1;
        Height:= hight div 2;
        Visible := true;
    end;
    Result := A;
end;
}
//위치지정부분 수정
function Grid_Panel_Crt(Sender   : TObject;//그리드 객체명
                         hight    : Integer;//그리드 높이
                         sCol     : String; //TPanel 생성우치
                         sCaption : String ):TPanel;//출력 값
var
    R         : TRect;
    ch_height : integer;
    A         : TPanel;
    iCol      : Integer;
    iLoop     : Integer;
    iWdEn     : Integer;
    iWdSt     : Integer;
    iLeft     : Integer;
    ch_top    : Integer;
    ch_left   : Integer;
    bOneChk   : Boolean;
    sDNm      : String;
begin
    (Sender as TStringGrid).RowHeights[0]:=hight;
//    A := TPanel.Create(Application);
    A := TPanel.Create((Sender as TStringGrid).Owner);
    sDNm := Copy(sCol,2,Length(sCol));
    sDNm := Copy(sDNm,1,Pos(',',sDNm)-1);
    iWdEn := 0;
    iWdSt := 0;
    iLeft := 0;
    With  A do begin
        Parent  := (Sender as TStringGrid);
        Name    := 'pnlCrt'+(Sender as TStringGrid).Name+sDNm;
        caption := sCaption;
        With (Sender as TStringGrid) Do Begin
           ch_top  :=0;
           ch_left :=0;
           bOneChk := True;
           For iLoop :=  0 to  ColCount -1 Do Begin
              If Pos( ','+inttostr(iLoop)+',',sCol)>0 then begin
                 If bOneChk Then Begin
                    iCol := iLoop;
                    bOneChk := False;
                 End;
                 iWdEn := iWdEn +  ColWidths[iLoop] + 1 ;
                 iLeft := iWdSt;

              End
              Else Begin
                iWdSt := iWdSt +  ColWidths[iLoop] + 1;
              End;
           End;
           R := CellRect(iCol, 0);
           R.Left := R.Left;
           R.Right := R.Right;
           R.Top := R.Top;
           R.Bottom := R.Bottom;
        End;
        Left  := R.Left +ch_left;
        Top   := R.Top +ch_top;
        Width := iWdEn-1;
        Height:= (R.Bottom - R.Top) div 2;
        Visible := true;
    end;
    Result := A;
end;




{*****************************************************************************
*   함 수 명  : Grid_Panel_Pos
*   함수 기능 : 그리드타이틀에 판넬위치설정
*   Parameters:
*                hight:타이틀 row 지정
*                sCol :결합할 col 지정
*                sCaption : 결합 타이틀 출력 자료
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
****************************************************************************** }
                                    {
procedure proc_Grid_Txt(Sender  : TObject;iRow:Integer;sDefult, sFile,sCol : String);//그리드 객체명
var
    sData : String;
    iCol : Integer;
    sBufData : String;
Begin
    With (Sender As TStringGrid) Do Begin
       sData :='';
       sBufData :='';
       For iCol :=  0 to  ColCount -1 Do Begin
          If Pos( ','+inttostr(iCol)+',',sCol)>0 then begin
             sBufData := Cells[iCol,iRow];
             sBufData := func_RepData(sBufData,',');
             sBufData := func_RepData(sBufData,'''');

             If sData='' then Begin
                If sDefult='' Then Begin
                   sData:=sBufData
                End
                Else Begin
                   sData:=sDefult + cgsTab + sBufData;
                end;
             End
             Else Begin
                sData := sData + cgsTab + sBufData;
             End;
          End;
       End;
       If sData <>'' Then proc_TxtWrite( sFile,sData,iRow);
    End;
End;
                       }


{*****************************************************************************
*   함 수 명  : Grid_Panel_Pos
*   함수 기능 : 그리드타이틀에 판넬위치설정
*   Parameters:
*                hight:타이틀 row 지정
*                sCol :결합할 col 지정
*                sCaption : 결합 타이틀 출력 자료
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
****************************************************************************** }

procedure Grid_Panel_Pos(Sender  : TObject;sCol : String;tPan:TPanel);//그리드 객체명
var
    R         : TRect;
    ch_height : integer;
    iCol      : Integer;
    iLoop     : Integer;
    iWdEn     : Integer;
    iWdSt     : Integer;
    iLeft     : Integer;
    iCol_Loc  : Integer;
    bOneChk   : Boolean;
    ch_top    : Integer;
    ch_left   : Integer;
    iEndCol   : Integer;

    sName     : String;
    sDNm      : String;
begin
    iWdEn :=0;
    iWdSt :=0;
    With (Sender as TStringGrid) Do Begin
       // update;
        SendMessage( (Sender as TStringGrid).Handle, WM_SetRedraw, 0, 0);

        ch_top  :=0;
        ch_left :=0;
        bOneChk := True;

        With  tPan do begin
//           SendMessage( tPan.Handle , WM_SetRedraw, 1, 0);

           For iLoop :=  0 to  ColCount -1 Do Begin
              If Pos( ','+inttostr(iLoop)+',',sCol)>0 then begin
                 If bOneChk Then Begin
                    iCol    := iLoop;
                    bOneChk := False;
                 End;
                 iWdEn   := iWdEn + ColWidths[iLoop] + 1 ;
                 iLeft   := iWdSt;
                 iEndCol := iLoop;
              End
              Else Begin
                 iWdSt := iWdSt + ColWidths[iLoop] + 1;
              End;
              {
              R := CellRect(iCol, 0);
              R.Left := R.Left;
              R.Right := R.Right;
              R.Top := R.Top;
              R.Bottom := R.Bottom;
              }
           End;

           R := CellRect(iCol, 0);
           R.Left := R.Left;
           R.Right := R.Right;
           R.Top := R.Top;
           R.Bottom := R.Bottom;

           Left  := R.Left +ch_left;
           Top   := R.Top +ch_top;
           Width := iWdEn-1;
           Height:= (R.Bottom - R.Top) div 2;


        End;
       SendMessage( (Sender as TStringGrid).Handle, WM_SetRedraw, 1, 0);
       tPan.Repaint;

    End;
end;

{*****************************************************************************
*   함 수 명  : ChkBoxCrt
*   함수 기능 : 콤보박스 생성
*   Parameters:
*
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure ChkBoxCrt();
var
  bmp: TBitmap;
begin
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
end;



{*****************************************************************************
*   함 수 명  : ChkBoxFree
*   함수 기능 : 콤보박스 초기화
*   Parameters:
*
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure ChkBoxFree();
var
  bmp: TBitmap;
begin
  FCheck.Free;
  FNoCheck.Free;
End;
{*****************************************************************************
*   함 수 명  : ChkBoxOnOff
*   함수 기능 : 그리드상  체크박스 설정
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure ChkBoxShow(Sender: TObject; ACol, ARow: Integer;
Rect: TRect;  State: TGridDrawState;iChkLoc : Integer);
var
  grid: TStringGrid;
begin
  igChkLoc := iChkLoc;
  if not ( gdFixed In State ) and (aCol = iChkLoc) then
//  If (aCol = iChkLoc) then
  begin
    grid:= Sender As TStringGrid;
    with grid.Canvas do
    begin
     // brush.color := clBtnFace;
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



procedure ChkBoxOnOff(Sender: TObject);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
    grid := Sender As TStringGrid;
    With grid Do Begin
       if (Col = igChkLoc)  then
       begin
         ToggleCheckbox(Sender, Col, Row );
       end;
    End;
end;

procedure ChkBoxOnOff(Sender: TObject;iCol:Integer);
var
  pt: TPoint;
  grid: TStringgrid;
  aCol, aRow: Integer;
begin
    grid := Sender As TStringGrid;
    With grid Do Begin
      ToggleCheckbox(Sender, iCol, Row );
    End;
end;


procedure ToggleCheckbox(Sender: TObject; acol, arow: Integer );
begin
    with (Sender As TStringGrid) do
    begin
      if Assigned( Objects[aCol, aRow] ) then
        Objects[aCol, aRow] := Nil
      else
        Objects[aCol, aRow] := Pointer(1);
    end;
end;


procedure AllChkboxOnOff(Sender: TObject; iChkLoc : Integer; bOn : Boolean );
Var
    iRow : Integer;
begin
    with (Sender As TStringGrid) do begin
      For iRow := 1 To RowCount -1 Do begin
        If bOn Then Begin
           if Assigned( Objects[iChkLoc, iRow] ) then
             Continue
           else
             Objects[iChkLoc, iRow] := Pointer(1);
        End
        Else Begin
           if Assigned( Objects[iChkLoc, iRow] ) then
             Objects[iChkLoc, iRow] := Nil
           else
             Continue;
        End;
      End;
    end;
end;

procedure Proc_ChkboxOnOff(Sender: TObject; iCol,iRow:Integer; bOn : Boolean );
begin
    with (Sender As TStringGrid) do begin
        If bOn Then Begin
           if Assigned( Objects[iCol, iRow] ) then
             Exit
           else
             Objects[iCol, iRow] := Pointer(1);
        End
        Else Begin
           if Assigned( Objects[iCol, iRow] ) then
             Objects[iCol, iRow] := Nil
           else
             Exit
        End;
     End;

end;

function Get_Chkbox(Sender: TObject; iCol,iRow : Integer ):Boolean;
begin
    with (Sender As TStringGrid) do
    begin
       if Assigned( Objects[iCol,iRow] ) then
          Result := True
       else
          Result := False
    end;
end;

 {*****************************************************************************
*   함 수 명  : proc_Grid_Init
*   함수 기능 : 그리드 초기 설정(타이틀,폭)
*   Parameters:
*                Xls_Path:경로
*                Xls_Nm:경로+이름
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure proc_Grid_Init(tGrid:TStringGrid; sTitle:String;Var szRet:Array of TRecord; bW:Boolean=False);

const
    WS_GUBUN ='|';
var
    iPos    : Integer;
    iCol    : Integer;
    iColMax : Integer;
    cmpData : String;
    iRow : Integer;
    iszPos  : Array of TRecord;
    iGLen   : Integer;
    iPosLoc : Integer;
    sJobData : String;
begin
    iRow := 0;
    iGLen := Length(WS_GUBUN);   //구분자 문자열 길이 구하기
    tGrid.ColCount :=func_TitCnt(sTitle);
    iColMax := tGrid.ColCount;
    SetLength(iszPos, iColMax+1);
    //문자구분 해서 자르기
    For iCol := 0 To iColMax-1 Do Begin
       If (Pos( WS_GUBUN,sTitle)=0)  Then  Begin
          //마지막 문자가 왔는지 체크  있으면 정상처리
          case sTitle[1] Of
             'I' : iszPos[iCol].iType := fmI;
             'F' : iszPos[iCol].iType := fmF;
             'C' : iszPos[iCol].iType := fmC;
             'L' : iszPos[iCol].iType := fmL;
             'T' : iszPos[iCol].iType := fmT;
             'M' : iszPos[iCol].iType := fmM;

          End;
         // iszPos[iCol].iType    := sTitle[1];

          iszPos[iCol].iLoc     := sTitle[2];
          iszPos[iCol].sTitle   := Trim(Copy(sTitle, 3,Length(sTitle)));
          iszPos[iCol].iWidth   := Length(sTitle)*tGrid.Font.Size;
          iszPos[iCol+1].iWidth :=-1;
          Break;
       End;
       iPosLoc := Pos( WS_GUBUN,sTitle);
       iGLen :=0;
       If (iPosLoc>0) Then iGLen := Length(WS_GUBUN);
       sJobData  := Copy( sTitle,1,iPosLoc-iGLen);
       sTitle := Copy( sTitle,Length(sJobData)+iGLen+iGLen,Length(sTitle));

       case sJobData[1] Of
          'I' : iszPos[iCol].iType := fmI;
          'F' : iszPos[iCol].iType := fmF;
          'C' : iszPos[iCol].iType := fmC;
          'L' : iszPos[iCol].iType := fmL;
          'T' : iszPos[iCol].iType := fmT;
          'M' : iszPos[iCol].iType := fmM;

       End;

       //iszPos[iCol].iType  := sJobData[1];
       iszPos[iCol].iLoc   := sJobData[2];
       iszPos[iCol].sTitle := Trim(Copy(sJobData, 3,Length(sJobData)));
       iszPos[iCol].iWidth := Length(sJobData)*tGrid.Font.Size;
    End;
    //그리드 head 부분 설정
    For iCol := 0 To iColMax -1 Do Begin
       If iszPos[iCol].iWidth=-1 Then Break;
       If bW= True Then Begin
          tGrid.ColWidths[iCol] := iszPos[iCol].iWidth;
       End;
       tGrid.Cells[iCol,0]   := iszPos[iCol].sTitle;
       szRet[iCol] := iszPos[iCol];
    End;

end;
 {*****************************************************************************
*   함 수 명  : fn_FindIndex
*   함수 기능 : 위치찾기
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function func_FindIndex(Sender : TStringGrid;sFind:String;iCol:Integer):Integer;
Var
    iRow : Integer;
Begin
    With Sender Do Begin
       For iRow := 1 To RowCount - 1 Do Begin
          If sFind =Cells[2,iRow]+Cells[iCol,iRow] Then Break;
       End;
    End;

    Result := iRow;
End;


function func_FindIndex_1(Sender:TStringGrid; sFind:String; iCol:Integer):Integer;
Var
    iRow : Integer;
    iFindRow : Integer;
Begin
    iFindRow := -1;
    With Sender Do Begin
       For iRow := 1 To RowCount - 1 Do Begin
          If sFind = Cells[iCol,iRow] Then begin
            iFindRow := iRow;
            Break;
          end;
       End;
    End;

    Result := iFindRow;
End;


 {*****************************************************************************
*   함 수 명  : proc_TitCnt
*   함수 기능 : 타이틀 갯수 구하기
*   Parameters:
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
function func_TitCnt(sTitle:String):Integer;
const
    WS_GUBUN ='|';
var
    iPos    : Integer;
    iCol    : Integer;
    iGLen   : Integer;
    iPosLoc : Integer;
    iCnt    : Integer;
    sJobData : String;
begin
    iCnt := 0;
    iGLen := Length(WS_GUBUN);   //구분자 문자열 길이 구하기
    //문자구분 해서 자르기
    While sTitle<>'' Do Begin
       Inc(iCnt);
       If (Pos( WS_GUBUN,sTitle)=0)  Then  Begin
          //마지막 문자가 왔는지 체크  있으면 정상처리
          Break;
       End;
       iPosLoc := Pos( WS_GUBUN,sTitle);
       iGLen :=0;
       If (iPosLoc>0) Then iGLen := Length(WS_GUBUN);
       sJobData  := Copy( sTitle,1,iPosLoc-iGLen);
       sTitle := Copy( sTitle,Length(sJobData)+iGLen+iGLen,Length(sTitle));
    End;
    Result := iCnt
end;




procedure CopyStreamToClipboard(S: TStream; fmt: Word);
var
 hMem: THandle;
 pMem: Pointer;
begin
 {stream의 위치를 맨 앞으로 이동시킨다}
 S.Position := 0;

 {stream의 크기만큼 전역 힙(heap)에 메모리 블록을 할당한후 윈도우 핸들을 얻는다}
 hMem := GlobalAlloc(GHND or GMEM_DDESHARE, S.Size);
 if hMem <> 0 then
 begin
   {전역 힙의 할당된 메모리 블록을 고정(lock)시킨다}
   pMem := GlobalLock(hMem);
   if pMem <> nil then
   begin
     {할당받은 메모리 블럭에 stream의 내용을 복사한다}
     S.Read(pMem^, S.Size);
     {위의 S.Read()에 의해 증가된 포인터를 다시 맨 앞으로 이동시킨다}
     S.Position := 0;
     {전역 힙에서 메모리 블록의 잠금 해제}
     GlobalUnlock(hMem);

     {클립보드를 열러서 주어진 포맷(여기서는 CF_TEXT)과 윈도우 핸들로 지정된
      데이타를 클립보드에 준다}
     Clipboard.Open;
     try
       Clipboard.SetAsHandle(fmt, hMem);
     finally
       Clipboard.Close;
     end;
   end
   else
   begin
     {메모리 lock의 실패로 memory block 예외를 발생시킨다}
     GlobalFree(hMem);
     OutOfMemoryError;
   end;
 end
 else
 begin
   {메모리 할당의 실패로 memory block 예외를 발생시킨다}
   OutOfMemoryError;
 end;
end;

procedure proc_Grid_Cboard(theGrid: TStringGrid);
var
 m: TMemoryStream;
 i, j: Integer;
 S: String;
begin
 m := TMemoryStream.Create;
 try
   with theGrid do
     for i := theGrid.Selection.Top to theGrid.Selection.Bottom do
       for j := theGrid.Selection.Left to theGrid.Selection.Right do
       begin
         S := Cells[j, i];
         // 맨 마지막 선택된 Column이면 CR/LF 를 추가하여 행구분
         if j = theGrid.Selection.Right then
           AppendStr(S, #13#10)
         else
           AppendStr(S, #9); // 각 Column을 Tab 문자로 구분
         m.WriteBuffer(S[1], Length(S));
     end;
   S[1] := #0; // 문자열 stream의 끝 표시
   m.WriteBuffer(S[1], 1);
   CopyStreamToClipboard(m, CF_TEXT); // stream의 내용을 클립보드로 복사
 finally
   m.Free;
 end;
end;


procedure proc_GridSelect(Sender: TStringGrid; iS_X,iS_Y : Integer);
var
    SelectedRectangle: TGridRect;
    CoordTopLeft, CoordBottomRight: TGridCoord;
begin
 // 선택하고자 하는 직사각형 영역을 설정한다
    CoordTopLeft.X:= iS_X; // 두번째 컬럼부터 선택
    CoordTopLeft.Y:= iS_Y; // 첫번째 행부터 선택
    CoordBottomRight.X:= Sender.Row; // 마지막 컬럼의 전컬럼
    CoordBottomRight.Y:= Sender.Col; // 마지막 행의 전행
    // 직사각형 영역을 TGridRect 에 할당한다
    with Sender do begin
       SelectedRectangle.TopLeft     := CoordTopLeft;
       SelectedRectangle.BottomRight := CoordBottomRight;
    end;
    Sender.Selection:= SelectedRectangle;
end;

function func_RepData(sData    : String;
              sDel : String):String;
Begin
   Result:= StringReplace(sData, sDel, '',[rfReplaceAll]);
End;


{*****************************************************************************
*   함 수 명  : proc_Xls_Grid
*   함수 기능 : 그리드상의 자료를 액셀로 변환
*   Parameters:
*                Xls_Path:경로
*                Xls_Nm:경로+이름
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure proc_Xls_Grid(Sender : Tobject;
               Xls_Nm : String;
               Title  : TStringList;
               cDraw_Loc : Array Of Char;
               Del_Col:String='');        //경로
  function fn_RepData(sData    : String;
                srepData : String):String;
  Begin
     Result:= StringReplace(sData, srepData, '',[rfReplaceAll]);
  End;
var
  FileHandle : Integer;
  FileNameStr : String;
  iCol      : Integer;
  iRow      : Integer;
  iXlsCol   : Integer;  //액셀 컬럼 비교
  iXlsWidth : Integer;
  iX        : Integer; //액셀폭설정
  iXlsRow   : Integer; //액셀row설정
  sXlsData  : String;  //자료
  cMode     : Char;

Const
  CPOS = '|';
begin
    iXlsCol :=0;
    iXlsRow :=-1;
    FileNameStr := Xls_Nm+'.xls';
    FileHandle := Xls_Create(FileNameStr);
    With (Sender as  TStringGrid) do begin
      //-----------폭 설정--------------------------------------
      For iCol := 0 To ColCount -1 Do Begin
        If (ColWidths[iCol] <= 0) Or (Pos( ','+inttostr(iCol)+',',Del_Col)>0) Then Continue;
        sXlsData := Cells[iCol , 0];         //출력할 head 자료
        iX:=1;
        If Pos (CPOS,sXlsData) > 0 Then iX:=1;
        iXlsWidth  := (ColWidths[iCol] Div ((Font.Size)-(13-Font.Size))) * iX ;
        Xls_SetColWidth(FileHandle, iXlsCol, iXlsWidth);    // set column width
        Inc(iXlsCol);
      End;
      If Title <> Nil Then Begin
         //타이틀 설정
         For iRow :=0 to  Title.Count -1 Do Begin
            Inc(iXlsRow);
            Xls_SetString(FileHandle, iXlsRow, 0, Title.Strings[iRow]);
         End;
      End;
      //-----------자료 설정--------------------------------------
      For iRow := 0 To RowCount - 1  Do Begin
        Inc(iXlsRow);
        iXlsCol :=0;
        For iCol := 0 To ColCount -1 Do Begin
          If (ColWidths[iCol] <= 0) Or (Pos( ','+inttostr(iCol)+',',Del_Col)>0) Then Continue;
          If iRow >= FixedRows Then Begin
            cMode := cDraw_Loc[iCol];
            sXlsData := Cells[iCol , iRow];         //출력할 head 자료
          End
          Else Begin
            cMode :='C';
            sXlsData := fn_RepData(Cells[iCol , iRow],'|');         //출력할 head 자료
          End;
          if  cMode in ['I'] then begin
            if Cells[iCol,iRow]='' then
              Xls_SetDouble(FileHandle, iXlsRow, iXlsCol,0 )
            else
              Xls_SetDouble(FileHandle, iXlsRow, iXlsCol,StrtoFloat( fn_RepData(sXlsData, ',')));
          end else
          begin
             Xls_SetString(FileHandle, iXlsRow, iXlsCol, sXlsData);
          end;
          Inc(iXlsCol);
        End;
      End;
    End;
    Title.Free;
    Xls_Close (FileHandle);  // closing stuff
end;

{*****************************************************************************
*   함 수 명  : proc_Xls_Grid
*   함수 기능 : 그리드상의 자료를 액셀로 변환
*   Parameters:
*                Xls_Path:경로
*                Xls_Nm:경로+이름
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure proc_Xls_Grid(Sender : Tobject;
               Xls_Nm : String;
               Title  : TStringList;
               cDraw_Loc : Array Of TRecord;
               Del_Col:String='');        //경로
  function fn_RepData(sData    : String;
                srepData : String):String;
  Begin
     Result:= StringReplace(sData, srepData, '',[rfReplaceAll]);
  End;
var
  FileHandle : Integer;
  FileNameStr : String;
  iCol      : Integer;
  iRow      : Integer;
  iXlsCol   : Integer;  //액셀 컬럼 비교
  iXlsWidth : Integer;
  iX        : Integer; //액셀폭설정
  iXlsRow   : Integer; //액셀row설정
  sXlsData  : String;  //자료
  cMode     : Char;

Const
  CPOS = '|';
begin
    iXlsCol :=0;
    iXlsRow :=-1;
    FileNameStr := Xls_Nm+'.xls';
    FileHandle := Xls_Create(FileNameStr);
    With (Sender as  TStringGrid) do begin
      //-----------폭 설정--------------------------------------
      For iCol := 0 To ColCount -1 Do Begin
        If (ColWidths[iCol] <= 0) Or (Pos( ','+inttostr(iCol)+',',Del_Col)>0) Then Continue;
        sXlsData := Cells[iCol , 0];         //출력할 head 자료
        iX:=1;
        If Pos (CPOS,sXlsData) > 0 Then iX:=1;
        iXlsWidth  := (ColWidths[iCol] Div ((Font.Size)-(13-Font.Size))) * iX ;
        Xls_SetColWidth(FileHandle, iXlsCol, iXlsWidth);    // set column width
        Inc(iXlsCol);
      End;
      If Title <> Nil Then Begin
         //타이틀 설정
         For iRow :=0 to  Title.Count -1 Do Begin
            Inc(iXlsRow);
            Xls_SetString(FileHandle, iXlsRow, 0, Title.Strings[iRow]);
         End;
      End;
      //-----------자료 설정--------------------------------------
      For iRow := 0 To RowCount - 1  Do Begin
        Inc(iXlsRow);
        iXlsCol :=0;
        For iCol := 0 To ColCount -1 Do Begin
          If (ColWidths[iCol] <= 0) Or (Pos( ','+inttostr(iCol)+',',Del_Col)>0) Then Continue;
          If iRow >= FixedRows Then Begin
            cMode :=   cDraw_Loc[iCol].iLoc ;
            sXlsData := Cells[iCol , iRow];         //출력할 head 자료
          End
          Else Begin
            cMode :='C';
            sXlsData := fn_RepData(Cells[iCol , iRow],'|');         //출력할 head 자료
          End;
          if  cMode in ['R'] then begin
            if Cells[iCol,iRow]='' then
              Xls_SetDouble(FileHandle, iXlsRow, iXlsCol,0 )
            else
              Xls_SetDouble(FileHandle, iXlsRow, iXlsCol,StrtoFloat( fn_RepData(sXlsData, ',')));
          end else
          begin
             Xls_SetString(FileHandle, iXlsRow, iXlsCol, sXlsData);
          end;
          Inc(iXlsCol);
        End;
      End;
    End;
    Title.Free;
    Xls_Close (FileHandle);  // closing stuff
end;

{*****************************************************************************
*   함 수 명  : Xls
*   함수 기능 : 그리드상의 자료를 액셀로 변환
*   Parameters:
*                Xls_Path:경로
*                Xls_Name:이름
*                G_Tit_Name :그리드상 타이틀명
*                G_Size: 타이틀 크기
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Xls(Sender : Tobject;
               Xls_Path,        //경로
               Xls_Name:String; //명
               G_Tit_Name: Array of ShortString;//그리드 타이틀
               G_Size: Array of Integer;
               G_Loc: Array of Char);//크기
var
  FileHandle : Integer;
  FileNameStr : String;
  i ,j: Integer;
  SavDialogs : TSaveDialog;
begin
 //   FileNameStr := ExtractFilePath(Application.ExeName);
{
    FileNameStr := Xls_Path+
                   Xls_Name+
                   '.xls';

}
    FileNameStr := Xls_Path+'.xls';
    FileHandle := Xls_Create(FileNameStr);
    //                           y  x
    for i:=0 to high(G_Tit_Name) do begin //타이틀 출력
       if (G_Size[i]=0) then Continue;
       Xls_SetColWidth(FileHandle, i, G_Size[i]);    // set column width
       Xls_SetString(FileHandle, 0, i, G_Tit_Name[i]);
    end;
    With (Sender as  TStringGrid) do begin
      for j:= 1 to Rowcount-1 do begin
        for i:=0 to high(G_Tit_Name) do begin //타이틀 출력
          if  G_Size[i]=0 then Continue;
          if  G_Loc[i] in ['I'] then
          begin
             if Cells[i,j]='' then
               Xls_SetDouble(FileHandle, j, i,0 )
             else
               Xls_SetDouble(FileHandle, j, i, StrToFloat(StringReplace(Cells[i,j], ',', '',[rfReplaceAll])));
          end else
          begin
             Xls_SetString(FileHandle, j, i, Cells[i,j]);
          end;
        end;
      end;
    end;
    Xls_Close (FileHandle);  // closing stuff
end;

{*****************************************************************************
*   함 수 명  : Xls_job_Path
*   함수 기능 : 경로 설정
*   Parameters:
*                Xls_Path:경로
*                Xls_Name:이름
*                G_Tit_Name :그리드상 타이틀명
*                G_Size: 타이틀 크기
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Xls_job_Path(
               Xls_Path :String);        //경로
var
  FileNameStr : String;
begin
    FileNameStr := Xls_Path+'.xls';
    XlsHandle := Xls_Create(FileNameStr);
end;

{*****************************************************************************
*   함 수 명  : Xls_Select
*   함수 기능 : 조회된 자료를 액셀로 변환
*   Parameters:
*                Xls_Path:경로
*                Xls_Name:이름
*                G_Tit_Name :그리드상 타이틀명
*                G_Size: 타이틀 크기
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Xls_Select(
               G_Size: Array of Integer;
               G_Data: Array of String;
               Row : Integer);

var
  i ,Pos_loc : Integer;
//  SavDialogs : TSaveDialog;
  Max_Col : Integer;
  ch_data : String;
begin
    Max_Col :=  high(G_Data);
    for i:= 0 to Max_Col do begin
      Xls_SetColWidth(XlsHandle, i, G_Size[i]);    // set column width
      ch_data := StringReplace(G_Data[i], ',', '',[rfReplaceAll]);
      Pos_loc := Pos('.',ch_data);
      if Pos_loc>0 then
      begin
        if StrTointDef(Copy(ch_data,Pos_loc+1,Length(ch_data)),-1)> -1 then
          Xls_SetDouble(XlsHandle, Row, i, StrToFloat(ch_data))
        else
          Xls_SetString(XlsHandle,Row, i, G_Data[i]);
      end else
      begin

      if (StrTointDef(ch_data,-1)> -1) and (StrTointDef(copy(ch_data,1,1),-1)> -1) then
        Xls_SetDouble(XlsHandle, Row, i, StrToFloat(ch_data))
      else
        Xls_SetString(XlsHandle,Row, i, G_Data[i]);
      end;
      
    end;
end;
{*****************************************************************************
*   함 수 명  : Xls_Close
*   함수 기능 : 액셀 닫기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Xls_job_Close;
begin
    Xls_Close (XlsHandle);  // closing stuff
end;

{*****************************************************************************
*   함 수 명  : Grid_Draw_Color
*   함수 기능 : 그리드 입력셀 구분
                조회셀만 색을 바꾸자
                Grid_Draw 보다 한수 위에서 처리해야됨( 끗발이 낮음 )
*   Parameters:
           Sel_loc : 그리드에 출력할 색상 위치값 ',0,4,7,8,9,11,12,'
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.10.20
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Grid_Draw_Select_Color(Sender: TObject;
                                Sel_loc: String;
                                Col_loc: Integer;
                                Col_Row: Integer;
                                Rect   : TRect);
begin
    with (Sender as TStringGrid) do begin
       If  Col_Row=0 Then Exit;
       If Pos( ','+inttostr(Col_loc)+',',Sel_loc)>0 then begin

          with Canvas do begin
            FillRect(Rect);
//            Brush.Color :=$00F7DECA;
            Brush.Color :=$00D7FFD7;
            fillRect(rect);
          end;
       end;
    end;
end;


{*****************************************************************************
*   함 수 명  : Grid_Draw
*   함수 기능 : 그리드 초기화
*   Parameters:Sender: TObject
*               Col_Loc,              //col 위치값
*               Row_Loc:Integer       //row 위치값
*               Rect: TRect;          //
*               State: TGridDrawState;//상태값
*               Draw_Loc:Char;        //'L'->왼쪽 정렬 'C'->중앙 정렬 'R'->오른쪽 정렬
*               Sts_Pos:Integer);     //중복 처리 작업을 할 0-Sts_Pos 컬럼 위치
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Grid_Draw(Sender: TObject;
                    Col_Loc,
                    Row_Loc:Integer;
                    Rect: TRect;
                    State: TGridDrawState;
                    Draw_Loc:Char;
                    Sts_Pos:Integer;
                    Wrap_Cnt:Integer);
var
  li_Left ,li_Top ,li_tw : Integer;
  Pos_cnt : Integer;
  warp_data,ch_data : ShortString;
  Wrap_Pos : Integer;
  CurY : Integer;
  EndData,one_cnt : Boolean;
begin
    with (Sender as TStringGrid) do begin
      with Canvas do begin
        if (Row_Loc = 0) then begin
          if Wrap_Cnt>1 then begin
//            DefaultDrawing := false;
            warp_data := Cells[Col_Loc,Row_Loc];
            Pos_cnt:= Warp_Row_Cnt(warp_data);  //객수 파악
            RowHeights[0] := (TextHeight('A')*Wrap_Cnt)+(Wrap_Cnt*4)+8;
            if  Pos_cnt =0 then begin
              li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
              li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
              Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
            end
            else
            begin
              EndData := False;
              one_cnt := False;
              CurY :=  (RowHeights[0] mod ((TextHeight('A') * ( Pos_cnt+1))+(Wrap_Cnt*4))) div 2;
              while (not EndData) do begin
                Wrap_Pos:= pos('|', warp_data);
                if Wrap_Pos > 0 then begin
                  ch_data :=Copy(warp_data, 0, Wrap_Pos-1);
                  warp_data := Copy(warp_data,Wrap_Pos+1 , Length(warp_data) - Wrap_Pos);
                  li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(ch_data)) div 2;
                  if (not one_cnt) then begin
                    one_cnt := True;
                    Textrect(Rect, li_Left, CurY, ch_data); //출력할 자료
                  end else begin
                    TextOut(li_Left, CurY, ch_data); //출력할 자료
                  end;
                  CurY := CurY +  TextHeight('A')+5;
                end
                else
                begin
                  EndData := True;
                  li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(warp_data)) div 2;
                  TextOut(li_Left, CurY, warp_data); //출력할 자료
                end;
              end;
            end;
          end
          else
          begin
            li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
            li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
            Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
          end;
        end else begin
          //Sts_Pos안에서 작업할 영역 선택
          Font.Color :=  clWindowText;
//          if (gdSelected in State) or (Pos('>',Cells[Col_Loc,Row_Loc])>0) then begin
// 2005.09.08 Shim '>'값으로 인해서 Grid색상이 변하는 경우가 발생하여 변경함.
          if (gdSelected in State)  then begin
            Brush.Color := $0076CFE2;
            Font.Color :=Clred;
          end;
          if Sts_Pos>=Col_Loc then begin
            if Cells[Col_Loc,Row_Loc]=Cells[Col_Loc,Row_Loc-1] then begin
              Font.Color := $00D7FFD7;//(Sender as TStringGrid).Brush.Color;
              if gdSelected in State then  begin
                 Brush.Color := $0076CFE2;
                 Font.Color :=$0076CFE2;
              end;
            end;
          end;
          FillRect(Rect);
          li_tw := TextWidth(Trim(Cells[Col_Loc, Row_Loc]));
          Case UpCase(Draw_Loc) of
              'R' : TextOut(Rect.Right - li_tw - 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
              'L' : TextOut(Rect.Left+2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
              'C' : TextOut((Rect.Left + Rect.Right - li_tw) div 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
          end;
        end;
      end;
    end;
end;




end.
