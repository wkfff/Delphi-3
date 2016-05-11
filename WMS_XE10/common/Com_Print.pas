unit Com_Print;

interface

uses
  windows, SysUtils,StdCtrls, Grids, Classes, Controls, Dialogs,
  Graphics, Printers ;
  procedure print_Land_Title(s_cnt,wk_Font_size:Integer; s_gyul_font,s_gyul1,s_gyul2,
                             s_gyul3,s_gyul4,s_gyul5,s_gyul6 : string);
  {그리드 폼제어}
  Procedure Print_Draw_Init(Sender : Tobject;
                            P_size : Array of Integer;
                            P_G_Name : Array of ShortString;
                            P_G_Draw_Loc : Array of Char;
                            P_Orient : integer=0) ;
  Procedure Print_Draw_Main_Title(F_Size:Integer;F_Style:TfontStyles;F_Name,Data:String);
  procedure Print_Draw_Sub_Title(Cel_x,Loc_Cnt,Cel_width:Integer;
                                   Title:String;
                                   End_loc:Integer=2);
  procedure Print_Draw_Sub_Title2(Cel_x,Loc_Cnt,Cel_width:Integer;
                                   Title:String;
                                   End_loc:Integer=2);
  Procedure Print_PageNo(F_Size:Integer;F_Style:TfontStyles;F_Name,Data:String);
  procedure Print_Draw_Head (Title_Cnt,F_Size:Integer;F_Style:TfontStyles;F_Name:String);
  procedure Print_Draw_Head1(Title_Cnt,F_Size:Integer;F_Style:TfontStyles;F_Name:String; F_Width : array of integer);
  procedure Print_Draw_Body (X,F_Size:Integer;F_Style:TfontStyles;F_Name,Body:String);
  procedure Print_Draw_Body1 (X,F_Size:Integer;F_Style:TfontStyles;F_Name,Body:String; F_Widths : array of integer);
  procedure Print_Draw_Line(S_Len,E_Len,Gap : Integer);
  Procedure Print_Next_Page;
  Procedure Print_Draw_Close;
  procedure Print_New_Line(S_Len,E_Len,Gap : Integer);
  procedure Print_Y_Line(S_Len ,S_Row ,E_Len : Integer);
  procedure Print_Draw_Y_Line ( psize:Array of Integer;
                                PLine : Array of char);
  procedure Print_Line(Gap : Integer);
  Function PSelect_Grid(aSQL : String ; Col_Cnt : integer; Draw_Loc : array of char):Integer;
  Procedure Set_Print_Font(F_Size:Integer;F_Style:TfontStyles;F_Name:String);
  procedure Print_Bottom_Line(S_Len,E_Len,Gap : Integer);
  {일반 프린트 제어}
  Procedure Print_Draw_New_Init( P_size : Array of Integer;
                                P_Orient : integer);
  Procedure Print_Draw_open;

  procedure Print_Draw_new_Head (Title_Cnt : Integer;       //row 갯수
                                 F_Size:Integer;
                                 F_name : ShortString;
                                 F_Style:TfontStyles;
                                 psize : Array of Integer;
                                 pData : Array of String;
                                 Prt_Loc : Array of Char;
                                 Line:Char='N');

  procedure Print_Draw_new_Body (
                                  F_Size:Integer;
                                  F_Style:TfontStyles;
                                  F_Name:String;
                                  psize : Array of Integer;
                                  pData : Array of String;
                                  Ptype : Array of char);overload;
  procedure Print_Draw_new_Body (
                                  F_Size:Integer;
                                  F_Style:TfontStyles;
                                  F_Name:String;
                                  psize : Array of Integer;
                                  pData : Array of String;
                                  Ptype : Array of char;
                                  PBold : Array of char);overload;

  procedure Print_Draw_Font_Body (
                                   F_Size:Integer;
                                   F_Style:TfontStyles;
                                   F_Name:String;
                                   psize : Array of Integer;
                                   pData : Array of String;
                                   Ptype : Array of char;
                                   P_Font_Size: Array of Integer);
  procedure Print_TPrt (
                        F_Size:Integer;
                        F_Style:TfontStyles;
                        F_Name:String;
                        Row_Heigth : Integer;
                        psize : Array of Integer;
                        pData : Array of String;
                        Ptype : Array of char;
                        Bo_Loc: Array of Integer);


  procedure Print_Draw_LastPagNo(iProw:Integer;sPno,sData:String);

type
  TP_Data = record
    GData : array of array of string;
end;


var
  Prt_Grid : TStringGrid;
  prt_width : Integer;
  width_div : Real;
  Prt_Row : Integer;
  Prt_Col : Integer;
  Pag_width : Integer;
  pag_height : Integer;
  Prt_G_Name : Array of string;
  Prt_Draw_Loc : Array of Char;
  Start_Row :Array[0..25] of Integer;
  P_Data : TP_Data;    
  
  gsPrtOpt  : String; //프린트 출력기준

implementation

uses UDM;
//uses Com_Union;
{*****************************************************************************
*   함 수 명  : print_Land_Title
*   함수 기능 : 박스 그리기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure print_Land_Title(s_cnt,wk_Font_size:Integer; s_gyul_font,s_gyul1,s_gyul2,
                           s_gyul3,s_gyul4,s_gyul5,s_gyul6 : string);
var
  h,k : Integer;
  x_tit_End : Integer;
const
  y = 180;
  t = 120;
begin
    x_tit_End :=  pag_height-(t* s_cnt+60);//박스위치값
    h := 83 - 13; // 83은 TextHeight('A')(=일반문자 높이)
    with Printer.canvas do begin
      //타이틀 부분 Font 결정(인수로결정)
      font.name  := s_gyul_Font;
      font.size  := wk_Font_size; //일반 문자 크기(10)
      font.Style := [];
      if s_gyul1 <> '' then begin
        case s_cnt of
          2: begin
                k := x_tit_End+ t*5 + 60;//타이틀 출력후 마지막 X좌표값에 120을 더한후
                                          //결재항목의 폭(60)를 더하고 시작위치(x값)을 구한다.
                Rectangle(k-60, 0, k+(y*s_cnt), h * 3);     //직사각형(h=한 글자높이)
                MoveTo(k, h); LineTo(k+(y*s_cnt), h);       //선의시작(MoveTo)과 끝(LineTo) (가로선)
                MoveTo(k, 0); LineTo(k, h * 3);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
                MoveTo(k+(y*1), 0); LineTo(k+(y*1), h * 3);
                textout(k-50, 30, '결');
                textout(k-50, 140,'재');
                textout(k+45,       15, s_gyul1);
                textout(k+(y*1+45), 15, s_gyul2);
             end;
          3: begin
                k := x_tit_End + t*4 + 60;
                Rectangle(k-60, 0, k+(y*s_cnt), h * 3);
                MoveTo(k, h); LineTo(k+(y*s_cnt), h);
                MoveTo(k, 0); LineTo(k, h * 3);
                MoveTo(k+(y*1), 0); LineTo(k+(y*1), h * 3);
                MoveTo(k+(y*2), 0); LineTo(k+(y*2), h * 3);
                textout(k-50, 30, '결');
                textout(k-50, 140,'재');
                textout(k+45,       15, s_gyul1);
                textout(k+(y*1+45), 15, s_gyul2);
                textout(k+(y*2+45), 15, s_gyul3);
             end;
          4: begin
                k := x_tit_End + t*3 + 60;
                Rectangle(k-60, 0, k+(y*s_cnt), h * 3);
                MoveTo(k, h); LineTo(k+(y*s_cnt), h);
                MoveTo(k, 0); LineTo(k, h * 3);
                MoveTo(k+(y*1), 0); LineTo(k+(y*1), h * 3);
                MoveTo(k+(y*2), 0); LineTo(k+(y*2), h * 3);
                MoveTo(k+(y*3), 0); LineTo(k+(y*3), h * 3);
                textout(k-50, 30, '결');
                textout(k-50, 140,'재');
                textout(k+45,       15, s_gyul1);
                textout(k+(y*1+45), 15, s_gyul2);
                textout(k+(y*2+45), 15, s_gyul3);
                textout(k+(y*3+45), 15, s_gyul4);
             end;
          5: begin
                k := x_tit_End + t*2 + 60;
                Rectangle(k-60, 0, k+(y*s_cnt), h * 3);
                MoveTo(k, h); LineTo(k+(y*s_cnt), h);
                MoveTo(k, 0); LineTo(k, h * 3);
                MoveTo(k+(y*1), 0); LineTo(k+(y*1), h * 3);
                MoveTo(k+(y*2), 0); LineTo(k+(y*2), h * 3);
                MoveTo(k+(y*3), 0); LineTo(k+(y*3), h * 3);
                MoveTo(k+(y*4), 0); LineTo(k+(y*4), h * 3);
                textout(k-50, 30, '결');
                textout(k-50, 140,'재');
                textout(k+45,       15, s_gyul1);
                textout(k+(y*1+45), 15, s_gyul2);
                textout(k+(y*2+45), 15, s_gyul3);
                textout(k+(y*3+45), 15, s_gyul4);
                textout(k+(y*4+45), 15, s_gyul5);
             end;
          6: begin
                k := x_tit_End + t + 60;//타이틀 출력후 마지막 X좌표값에 120을 더한후
                                        //결재항목의 폭(60)를 더하고 시작위치(x값)을 구한다.
                //항목 6개가 있는경우(담당,대리,과장,부장,이사,사장)
                Rectangle(k-60, 0, k+(y*s_cnt), h * 3);    //직사각형(h=한 글자높이)
                MoveTo(k, h); LineTo(k+(y*s_cnt), h);      //선의 시작(MoveTo)과 끝(LineTo) (가로선)
                MoveTo(k, 0); LineTo(k, h * 3);            //선의 시작(MoveTo)과 끝(LineTo) (세로선)
                MoveTo(k+(y*1), 0); LineTo(k+(y*1), h * 3);
                MoveTo(k+(y*2), 0); LineTo(k+(y*2), h * 3);
                MoveTo(k+(y*3), 0); LineTo(k+(y*3), h * 3);
                MoveTo(k+(y*4), 0); LineTo(k+(y*4), h * 3);
                MoveTo(k+(y*5), 0); LineTo(k+(y*5), h * 3);
                textout(k-50, 30, '결');
                textout(k-50, 140,'재');
                textout(k+45,       15, s_gyul1);
                textout(k+(y*1+45), 15, s_gyul2);
                textout(k+(y*2+45), 15, s_gyul3);
                textout(k+(y*3+45), 15, s_gyul4);
                textout(k+(y*4+45), 15, s_gyul5);
                textout(k+(y*5+45), 15, s_gyul6);
             end;
        end;
      end;
    end;
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Init
*   함수 기능 : 프린트 함수 초기화
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
// 2001/08/27      프린터 용지 조정                                   양선학
{
Procedure Print_Draw_Init(Sender : Tobject;
                          P_G_Name : Array of ShortString;
                          P_G_Draw_Loc : Array of Char;
                          P_Orient : integer);
var
  Loop_Array : Integer;
  Loop : Integer;
  Cell_With : Integer;
  Max_Array : Integer;
begin
    Cell_With :=0; //프리트 폭값 설정
    prt_row:=0;
    Prt_Grid := (Sender as TStringGrid);
    Max_Array := High(P_G_Name);
    SetLength(Prt_G_Name,Max_Array+1);
    SetLength(prt_Draw_Loc,Max_Array+1);
    for Loop_Array :=0 to Max_Array do begin
      Prt_G_Name[Loop_Array] :=  P_G_Name[Loop_Array];
      prt_Draw_Loc[Loop_Array] :=  P_G_Draw_Loc[Loop_Array];
    end;
// top ysh 추가
    if P_Orient = 0 then
       Printer.Orientation := poPortrait
    else
       Printer.Orientation := poLandScape;
// end
    Pag_width   := Printer.PageWidth;
    pag_height := Printer.PageHeight;
    with Prt_Grid do begin
      for Loop := 0 to  colcount-1 begin
        //타이틀을 입력하지않았거나 값을 숨긴 자료는 출력하지 않는다.
        if (UpperCase(P_G_Name[Loop])='NO!') or (P_G_Name[Loop]='') then Continue;
        Cell_With:=Cell_With+ColWidths[Loop];
      end;
      width_div :=(pag_width / Cell_with) ;
    end;
    printer.BeginDoc;//프린터 작업 시작
end;
}

{*****************************************************************************
*   함 수 명  : Print_Draw_Init
*   함수 기능 : 프린트 함수 초기화
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
// 2001/08/27      프린터 용지 조정                                   양선학
Procedure Print_Draw_Init(Sender : Tobject;
                          P_size : Array of Integer;
                          P_G_Name : Array of ShortString;
                          P_G_Draw_Loc : Array of Char;
                          P_Orient : integer);
var
  Loop_Array : Integer;
  Loop : Integer;
  Cell_With : Integer;
  Max_Array : Integer;
begin
    Cell_With :=0; //프리트 폭값 설정
    prt_row:=0;
    Prt_Grid := (Sender as TStringGrid);
    Max_Array := High(P_G_Name);
    SetLength(Prt_G_Name,Max_Array+1);
    SetLength(prt_Draw_Loc,Max_Array+1);
    for Loop_Array :=0 to Max_Array do begin
      Prt_G_Name[Loop_Array] :=  P_G_Name[Loop_Array];
      prt_Draw_Loc[Loop_Array] :=  P_G_Draw_Loc[Loop_Array];
    end;
// top ysh 추가
    if P_Orient = 0 then
       Printer.Orientation := poPortrait
    else
       Printer.Orientation := poLandScape;
    Pag_width   := Printer.PageWidth;
    pag_height := Printer.PageHeight;
    for Loop := 0 to Max_Array do begin
      Cell_With:=Cell_With+P_size[Loop];
    end;
    width_div :=(pag_width / Cell_with) ;
    printer.BeginDoc;//프린터 작업 시작

end;


{*****************************************************************************
*   함 수 명  : Print_Draw_Main_Title
*   함수 기능 : 타이틀 출력
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Procedure Print_Draw_Main_Title(F_Size:Integer;F_Style:TfontStyles;F_Name,Data:String);
var
  li_tw : Integer;
  x     : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name :=F_Name;
    Printer.canvas.font.Style := F_Style;
    x := pag_width div 2 ;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    li_tw := Printer.canvas.TextWidth(data);
    Printer.canvas.TextOut(x-(li_tw div 2),prt_row,data );
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
end;
(*
{*****************************************************************************
*   함 수 명  : Print_Draw_Sub_Title
*   함수 기능 : 서브 타이틀 출력
*   Parameters: Cel_x : Box 좌표
                Loc_cnt : Box 수
                Cel_width : 보정수 ( X 좌표 이동 )
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Sub_Title(Cel_x,Loc_Cnt,Cel_width:Integer;Title:String);
var
  x : Integer;
  y : Integer;
  li_tw : Integer;
  Sum_With : Integer;
Begin
    x := pag_width div Loc_Cnt;
    if Cel_x=1 then begin
      prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    end;
//    li_tw := Printer.canvas.TextWidth(Title);
    Printer.canvas.TextOut((x*(Cel_x-1)+Cel_width+10),prt_row,Title );
//    Printer.canvas.TextOut((x*Cel_x-Cel_width)-li_tw,prt_row,Title );
end;
*)
{*****************************************************************************
*   함 수 명  : Print_Draw_Sub_Title
*   함수 기능 : 서브 타이틀 출력
*   Parameters: Cel_x : Box 좌표
                Loc_cnt : Box 수
                Cel_width : 보정수 ( X 좌표 이동 )
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Sub_Title(Cel_x,Loc_Cnt,Cel_width:Integer;
                                   Title:String;
                                   End_loc:Integer);
var
  x : Integer;
  y : Integer;
  li_tw,Data_W : Integer;
  Sum_With : Integer;
Begin
    Data_W:=Printer.canvas.TextWidth('A');
    x := pag_width div Loc_Cnt;
    if Cel_x=1 then begin
      prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    end;
    if End_loc = Cel_x then begin
      Printer.canvas.TextOut((pag_width-Length(Title)*Data_W),prt_row,Title);
      exit;
    end;
    Printer.canvas.TextOut((x*(Cel_x-1)+Cel_width+10),prt_row,Title );
end;

procedure Print_Draw_Sub_Title2(Cel_x,Loc_Cnt,Cel_width:Integer;
                                   Title:String;
                                   End_loc:Integer);
var
  x : Integer;
  y : Integer;
  li_tw,Data_W : Integer;
  Sum_With : Integer;
Begin
    Data_W:=Printer.canvas.TextWidth('A');
    x := pag_width div Loc_Cnt;
    if Cel_x=1 then begin
      prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    end;
    Printer.canvas.TextOut(Loc_Cnt,prt_row-10,Title );
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_LastPagNo
*   함수 기능 : 마지막 패이지 번호 넣기 7/7
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_LastPagNo(iProw:Integer;sPno,sData:String);
var
  Data_W : Integer;
Begin
    Data_W:=Printer.canvas.TextWidth('A');
    Printer.canvas.TextOut((pag_width-Length(sData+sPno)*Data_W),iProw,sPno);
end;
{*****************************************************************************
*   함 수 명  : Print_PageNo
*   함수 기능 : 페이지 번호 출력
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Procedure Print_PageNo(F_Size:Integer;F_Style:TfontStyles;F_Name,Data:String);
var
  li_tw : Integer;
  x     : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name :=F_Name;
    Printer.canvas.font.Style := F_Style;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+10);
    x := pag_width ;
    li_tw := Printer.canvas.TextWidth(data);
    Printer.canvas.TextOut(x-li_tw,prt_row,data );
end;
{*****************************************************************************
*   함 수 명  : Print_Draw_Head
*   함수 기능 : 그리드상 타이틀 출력
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Print_Draw_Head (Title_Cnt,F_Size:Integer;F_Style:TfontStyles;F_Name:String);
var
  Loop_x : Integer;
  Loop_y : Integer;
  li_tw  : Integer;
  Col_x :  Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name :=F_Name;
    Printer.canvas.font.Style := F_Style;
    with Prt_Grid do begin
      Printer.canvas.MoveTo(0,prt_row);
      Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
      prt_row:=prt_row+7;
      for Loop_y:=0  to  Title_Cnt-1 do begin
        Col_X :=0;
        for Loop_x:=0  to  ColCount-1 do begin
          if (UpperCase(Prt_G_Name[Loop_x])='NO!') or (Prt_G_Name[Loop_x]='') then Continue;
          with Printer.canvas do begin
            li_tw := Printer.canvas.TextWidth(Cells[Loop_x,Loop_y]);
            Col_x :=Col_x+Strtoint(Format('%5.0f', [ColWidths[Loop_x]*width_div]));
            Case Prt_Draw_Loc[Loop_x] of
               'R' : TextOut(Col_x - (li_tw+5), Prt_row, Cells[Loop_x, Loop_y]);
               'L' : TextOut(Col_x - Strtoint(Format('%5.0f',[ColWidths[Loop_x]*width_div])) +5,
                             prt_row, Cells[Loop_x,Loop_y]);
               'C' : TextOut(Col_x - (Strtoint(Format('%5.0f',[ColWidths[Loop_x]*width_div]))+li_tw) div 2,
                             prt_row, Cells[Loop_x,Loop_y]);
            end;
          end;
        end;
        prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
      end;
    end;
    Printer.canvas.MoveTo(0,prt_row);
    Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
    prt_row:=prt_row+7;//공백값
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Head1
*   함수 기능 : 그리드상 타이틀 출력
*   Parameters:
*   Retrun    :
*   작 성 자  : 양 선학
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Print_Draw_Head1 (Title_Cnt,F_Size:Integer;F_Style:TfontStyles;F_Name:String; F_Width : array of integer);
var
  Loop_x : Integer;
  Loop_y : Integer;
  li_tw  : Integer;
  Col_x :  Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name :=F_Name;
    Printer.canvas.font.Style := F_Style;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    Printer.canvas.MoveTo(0,prt_row);
    Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
    prt_row:=prt_row+7;
    for Loop_y:=0  to  Title_Cnt-1 do begin
       Col_X :=0;
       for Loop_x:=0  to  High(Prt_G_Name) do
       begin
          with Printer.canvas do
          begin
              li_tw := Printer.canvas.TextWidth(Prt_G_Name[Loop_x]);
              Col_x :=Col_x+Strtoint(Format('%5.0f', [F_Width[Loop_x]*width_div]));
              Case Prt_Draw_Loc[Loop_x] of
                 'R' : TextOut(Col_x - (li_tw+5), Prt_row, Prt_G_Name[Loop_x]);
                 'L' : TextOut(Col_x - Strtoint(Format('%5.0f',[F_Width[Loop_x]*width_div])) +5,
                               prt_row, Prt_G_Name[Loop_x]);
                 'C' : TextOut(Col_x - (Strtoint(Format('%5.0f',[F_Width[Loop_x]*width_div]))+li_tw) div 2,
                               prt_row, Prt_G_Name[Loop_x]);
              end;
          end;
       end;
       prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    end;
    Printer.canvas.MoveTo(0,prt_row);
    Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
    prt_row:=prt_row+7;//공백값
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Body
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Body (X,F_Size:Integer;F_Style:TfontStyles;F_Name,Body:String);
var
  Loop  : Integer;
  li_tw : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name := F_Name;
    Printer.canvas.font.Style := F_Style;
    li_tw := Printer.canvas.TextWidth(Body);
    Prt_Col :=0;
    with Prt_Grid do begin
      for Loop  := 0 to x do
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ ColWidths[Loop]*width_div]));
      with Printer.canvas do begin
        Case Prt_Draw_Loc[x] of
          'R' : TextOut(Prt_Col - (li_tw+5), prt_row, Body);
          'L' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[ColWidths[x]*width_div]))) +5, prt_row, Body);
          'C' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[ColWidths[x]*width_div]))+li_tw) div 2,prt_row, Body);
        end;
      end;
      if x=ColCount-1 then
        prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    end;
end;

procedure Print_Draw_Body1 (X,F_Size:Integer;F_Style:TfontStyles;F_Name,Body:String; F_Widths : array of integer);
var
  Loop  : Integer;
  li_tw : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name := F_Name;
    Printer.canvas.font.Style := F_Style;
    li_tw := Printer.canvas.TextWidth(Body);
    Prt_Col :=0;
    for Loop  := 0 to x do
       Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ F_Widths[Loop]*width_div]));
    if  (Prt_Draw_Loc[x]='R') and (StrToIntDef(Body,-999999999)<>-999999999) then
      body := FormatFloat('#,###',StrToFloat(Body));
    with Printer.canvas do
    begin
       Case Prt_Draw_Loc[x] of
           'R' : TextOut(Prt_Col - (li_tw+5), prt_row, Body);
           'L' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[F_Widths[x]*width_div]))) +5, prt_row, Body);
           'C' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[F_Widths[x]*width_div]))+li_tw) div 2,prt_row, Body);
       end;
    end;
    if x = High(prt_G_name) then
       prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Line
*   함수 기능 : 라인그리기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Line(S_Len,E_Len,Gap : Integer);
begin
    with Printer.canvas do begin
      If gsPrtOpt='LINEPRT' Then  Printer.canvas.Pen.Style :=psDot;
      font.Style := [];
      Prt_Row := Prt_Row + Gap;
      MoveTo(S_Len, Prt_Row);
      LineTo(E_Len, Prt_Row);
      If gsPrtOpt='LINEPRT' Then Printer.canvas.Pen.Style :=psSolid;
    end;
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Line
*   함수 기능 : 라인그리기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Line(Gap : Integer);
begin
    with Printer.canvas do begin
      If gsPrtOpt='LINEPRT' Then  Printer.canvas.Pen.Style :=psDot;
      font.Style := [];
      MoveTo(0, Pag_Height-Gap);
      LineTo(Pag_width, Pag_Height-Gap);
      If gsPrtOpt='LINEPRT' Then Printer.canvas.Pen.Style :=psSolid;
    end;
end;

{*****************************************************************************
*   함 수 명  : Print_new_Line
*   함수 기능 : 라인그리기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_New_Line(S_Len,E_Len,Gap : Integer);
begin
    with Printer.canvas do begin
      If gsPrtOpt='LINEPRT' Then  Printer.canvas.Pen.Style :=psDot;
      font.Style := [];
      Prt_Row := Prt_Row + Gap;
      MoveTo(S_Len, Prt_Row);
      LineTo(E_Len, Prt_Row);
      Prt_Row := Prt_Row + Gap;
      If gsPrtOpt='LINEPRT' Then Printer.canvas.Pen.Style :=psSolid;
    end;
end;


{*****************************************************************************
*   함 수 명  : Print_Y_Line
*   함수 기능 : 라인그리기
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.12.26
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Y_Line(S_Len ,S_Row ,E_Len : Integer);
begin
    with Printer.canvas do begin
      font.Style := [];
      MoveTo(S_Len,S_Row);
      LineTo(S_Len,E_Len);
    end;
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Y_Line
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Y_Line (  psize:Array of Integer;
                               PLine : Array of char);
var
  Loop  : Integer;
  li_tw : Integer;
  p_max : Integer;
begin
    Prt_Col :=0;
    P_max := High(PLine);
    for Loop  := 0 to P_max do begin
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ psize[Loop]*width_div]));
      if PLine[Loop]='Y' then
        Print_Y_Line(Prt_Col,Start_Row[Loop],prt_row);
    end;
    Print_Y_Line(0,Start_Row[0],prt_row);
    Print_Y_Line(pag_width,Start_Row[0],prt_row);
end;


{*****************************************************************************
*   함 수 명  : Print_Next_Page
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Procedure Print_Next_Page;
begin
    Printer.Newpage;
end;
{*****************************************************************************
*   함 수 명  : Print_Draw_Close
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

Procedure Print_Draw_Close;
begin
    Printer.EndDoc;
//    Printer.Free;
end;

{*****************************************************************************
*   함 수 명  : Select_Grid
*   함수 기능 : 조회된값 그리드에 출력
*   Parameters: Tb_Name : 테이블명
                Fid_Where: 조건
*   Retrun    : Integer ->조회된 레코드수
*   작 성 자  : 양 선학
*   작 성 일  : 2001.06.27
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Function PSelect_Grid(aSQL : String ; Col_Cnt : integer; Draw_Loc : array of char):Integer;
var
  Str_in  : String;
  i ,j    : Integer;
  max     : Integer;
  S_cnt,S_pos   : Integer;
  Row_Inc : Integer;
  F_Pos : Integer;
begin
   With DM.qryOpen do
   begin
       Close;
       Sql.Clear;
       sql.add(aSQL);
       Prepare;
       open;
       S_cnt := 0;
       Row_Inc :=0;
       SetLength(P_Data.GData, Recordcount);
       while (Not eof) do
       begin
           SetLength(P_Data.GData[Row_Inc], Col_Cnt);
           for J := 0 to Col_Cnt-1 do
               if Draw_Loc[j] = 'N' then
                  P_Data.GData[Row_Inc,J] := inttostr(Row_Inc+1)
               else if Draw_Loc[j] = 'R' then
                  P_Data.GData[Row_Inc,J] := FormatFloat('#,##0',Fields[j].AsFloat)
               else
                  P_Data.GData[Row_Inc,J] := Fields[j].AsString;
           inc(Row_Inc);
           next;
       end;
   end;
   Result := Row_Inc
end;

{*****************************************************************************
*   함 수 명  : Set_Print_Font
*   함수 기능 : font 변경
*   Parameters: Tb_Name : 테이블명
                Fid_Where: 조건
*   Retrun    : Integer ->조회된 레코드수
*   작 성 자  : 양 선학
*   작 성 일  : 2001.08.30
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Procedure Set_Print_Font(F_Size:Integer;F_Style:TfontStyles;F_Name:String);
begin
   Printer.canvas.font.size   := F_Size;
   Printer.canvas.Font.Name   := F_Name;
   Printer.canvas.font.Style  := F_Style;
end;

procedure Print_Bottom_Line(S_Len,E_Len,Gap : Integer);
begin
    with Printer.canvas do begin
      font.Style := [];
      MoveTo(S_Len, Gap);
      LineTo(E_Len, Gap);
    end;
end;
//------------------------------------------------------------------------------
//                          New prtint
//
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
Function Title_Row_Cnt (const Data :String):Integer;
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
*   함 수 명  : Print_Draw_Init
*   함수 기능 : 프린트 함수 초기화
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
// 2001/08/27      프린터 용지 조정                                   양선학
Procedure Print_Draw_New_Init( P_size : Array of Integer;
                               P_Orient : integer);
var
  P_max : Integer;
  Loop : Integer;
  Cell_With : Integer;
begin
    Try
       Cell_With :=0; //프리트 폭값 설정
       prt_row:=0;
       P_max := High(P_size);
       //프린트 설정    LINEPRT :라인프리트 PRT :일반프린트
       If gsPrtOpt='LINEPRT' Then Begin
          P_Orient:=0
       End;

       if P_Orient = 0 then
          Printer.Orientation := poPortrait
       else
          Printer.Orientation := poLandScape;
       Pag_width   := Printer.PageWidth;
       pag_height := Printer.PageHeight;
       for Loop := 0 to  P_max  do begin
         Cell_With:=Cell_With+P_size[Loop];
       end;
       width_div :=(pag_width / Cell_with) ;
    Except
       ShowMessage('프린트 드라이버를 확인 후 작업하십시오!!!');
    End;
end;
{*****************************************************************************
*   함 수 명  : Print_Draw_open
*   함수 기능 : 프린트 함수 초기화
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Procedure Print_Draw_open;
begin
    printer.BeginDoc;//프린터 작업 시작
end;
{*****************************************************************************
*   함 수 명  : Print_Draw_Head
*   함수 기능 : 그리드상 타이틀 출력
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Print_Draw_new_Head (Title_Cnt : Integer;       //row 갯수
                               F_Size:Integer;
                               F_name : ShortString;
                               F_Style:TfontStyles;
                               psize : Array of Integer;
                               pData : Array of String;
                               Prt_Loc : Array of Char;
                               Line:Char='N');
var
  Loop_x : Integer;
  Loop_y : Integer;
  li_tw  : Integer;
  Col_x :  Integer;
  CurY : Integer;
  Prt_Y : Integer;
  P_max : Integer;
  warp_data,ch_data : ShortString;
  Wrap_Pos : Integer;
  EndData : Boolean;
  one_cnt : Boolean;
  li_Left : Integer;
  ch_Loop_x,S_Line : Integer;
  Line_chk : Boolean;
begin
    Line_chk := False;
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name :=F_Name;
    Printer.canvas.font.Style := F_Style;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
    Printer.canvas.MoveTo(0,prt_row);
    Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
    prt_row:=prt_row+7;
    P_max := High(pData);
//    SetLength(Start_Row, P_max);
    for Loop_y:=0  to  Title_Cnt-1 do begin
      Col_X :=0;
      CurY := 0;
      for Loop_x:=0  to  P_max do begin
        Col_x :=Col_x+Strtoint(Format('%5.0f', [psize[Loop_x]*width_div]));
        Start_Row[Loop_x]:= prt_row;
        if Title_Cnt>1 then begin
          EndData := False;
          one_cnt := False;
          CurY := 0;
          Prt_Y := 0;
          warp_data := pData[Loop_x];
          while (not EndData) do begin
            with Printer.canvas do begin
              Wrap_Pos:= pos('|', warp_data);
              li_tw := Printer.canvas.TextWidth(warp_data);
              if Wrap_Pos > 0 then begin
                ch_data :=Copy(warp_data, 0, Wrap_Pos-1);
                li_tw := Printer.canvas.TextWidth(ch_data);
                  warp_data := Copy(warp_data,Wrap_Pos+1 , Length(warp_data) - Wrap_Pos);
                li_Left := (Col_x - Textwidth(ch_data)) div 2;
                if (not one_cnt) then begin
                  one_cnt := True;
//                  TextOut(li_Left, CurY, ch_data); //출력할 자료
                end else begin
//                  TextOut(li_Left, CurY, ch_data); //출력할 자료
                end;
                Case Prt_Loc[Loop_x] of
                   'R' : TextOut(Col_x - (li_tw+5), prt_row +CurY, ch_data);
                   'L' : TextOut(Col_x - Strtoint(Format('%5.0f',[psize[Loop_x]*width_div])) +5,
                                 prt_row +CurY, ch_data);
                   'C' : TextOut(Col_x - (Strtoint(Format('%5.0f',[psize[Loop_x]*width_div]))+li_tw) div 2,
                                 prt_row +CurY, ch_data);
                end;
                if (CurY=0) and (Line='Y') then
                begin
                  if (Line_chk= False) then
                  begin
                    Line_chk:= True;
                    S_Line:=Col_x-Strtoint(Format('%5.0f', [psize[Loop_x]*width_div]));
                    Printer.canvas.MoveTo(S_Line,prt_row+TextHeight('A')+5);
                    Printer.canvas.LineTo(pag_width,prt_row+TextHeight('A')+5);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
                  end;
                  if ch_data<>'' then
                    Start_Row[Loop_x]:= prt_row+TextHeight('A')+5;
                end;
                CurY := CurY +  TextHeight('A')+10;
              end
              else
              begin
                EndData := True;
                if  CurY =0 then
                begin
                  CurY := ((TextHeight('A')+10)*(Title_Cnt)-10);
                  Prt_Y := (( CurY div 2) - (TextHeight('A') div 2));
                end else
                begin
                  Prt_Y := CurY;
                end;
                Case Prt_Loc[Loop_x] of
                   'R' : TextOut(Col_x - (li_tw+5), prt_row +Prt_Y, warp_data);
                   'L' : TextOut(Col_x - Strtoint(Format('%5.0f',[psize[Loop_x]*width_div])) +5,
                                 prt_row +Prt_Y, warp_data);
                   'C' : TextOut(Col_x - (Strtoint(Format('%5.0f',[psize[Loop_x]*width_div]))+li_tw) div 2,
                                 prt_row +Prt_Y, warp_data);
                end;
              end;
            end;
          end;
        end else
        begin
          with Printer.canvas do begin
              li_tw := Printer.canvas.TextWidth(pData[Loop_x]);
              Case Prt_Loc[Loop_x] of
                 'R' : TextOut(Col_x - (li_tw+5), Prt_row, pData[Loop_x]);
                 'L' : TextOut(Col_x - Strtoint(Format('%5.0f',[psize[Loop_x]*width_div])) +5,
                               prt_row, pData[Loop_x]);
                 'C' : TextOut(Col_x - (Strtoint(Format('%5.0f',[psize[Loop_x]*width_div]))+li_tw) div 2,
                               prt_row, pData[Loop_x]);
              end;
          end;
//          prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
        end;
      end;
    end;
    if CurY = 0 then
      prt_row := prt_row+(Printer.canvas.Textheight('A')+15)
    else
      prt_row := prt_row+ ((Printer.canvas.TextHeight('A')+10)*(Title_Cnt)-10)+15;
    Printer.canvas.MoveTo(0,prt_row);
    Printer.canvas.LineTo(pag_width,prt_row);             //선의시작(MoveTo)과 끝(LineTo) (세로선)
    prt_row:=prt_row+7;//공백값
end;

{*****************************************************************************
*   함 수 명  : Print_Draw_Body
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_new_Body (
                               F_Size:Integer;
                               F_Style:TfontStyles;
                               F_Name:String;
                               psize : Array of Integer;
                               pData : Array of String;
                               Ptype : Array of char);

var
  Loop  : Integer;
  li_tw : Integer;
  p_max : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name  := F_Name;
    Printer.canvas.font.Style := F_Style;
//------------------------------------------------------------------------------
{
    If gsPrtOpt='LINEPRT' Then Begin
       Printer.canvas.font.Style := [fsBold];
    End;
}
    Prt_Col :=0;
    P_max := High(pData);
    for Loop  := 0 to P_max do begin
      li_tw := Printer.canvas.TextWidth(pData[Loop]);
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ psize[Loop]*width_div]));
      with Printer.canvas do begin
        Case Ptype[Loop] of
          'R' : TextOut(Prt_Col - (li_tw+5), prt_row, pData[loop]);
          'L' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))) +5, prt_row, pData[loop]);
          'C' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))+li_tw) div 2,prt_row, pData[loop]);

        end;
      end;
    end;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
end;


{*****************************************************************************
*   함 수 명  : Print_Draw_Body
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_new_Body (
                               F_Size:Integer;
                               F_Style:TfontStyles;
                               F_Name:String;
                               psize : Array of Integer;
                               pData : Array of String;
                               Ptype : Array of char;
                               pBold :Array of char);

var
  Loop  : Integer;
  li_tw : Integer;
  p_max : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name := F_Name;
    Printer.canvas.font.Style := F_Style;
//------------------------------------------------------------------------------
{
    If gsPrtOpt='LINEPRT' Then Begin
       Printer.canvas.font.Style := [fsBold];
    End;
}
    Prt_Col :=0;
    P_max := High(pData);
    for Loop  := 0 to P_max do begin
      Printer.canvas.font.Style :=[];
      If pBold[Loop] ='Y' Then Printer.canvas.font.Style :=[fsBold];

      li_tw := Printer.canvas.TextWidth(pData[Loop]);
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ psize[Loop]*width_div]));
      with Printer.canvas do begin
        Case Ptype[Loop] of
          'R' : TextOut(Prt_Col - (li_tw+5), prt_row, pData[loop]);
          'L' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))) +5, prt_row, pData[loop]);
          'C' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))+li_tw) div 2,prt_row, pData[loop]);
          'B' : Begin
                  Printer.canvas.font.size  :=9;
                  Printer.canvas.Font.Name  := 'C39 Low 36pt DOT';
                  Printer.canvas.font.Style := [];
                  if  Trim(pData[loop]) <> '' Then Begin
                     TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))) +15, prt_row,'*'+pData[loop]+'*');
                  End;
                  Printer.canvas.font.size  := F_Size;
                  Printer.canvas.Font.Name := F_Name;
                  Printer.canvas.font.Style := F_Style;
                  prt_row := prt_row+10;
                End;

        end;
      end;
    end;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+15);
end;



{*****************************************************************************
*   함 수 명  : Print_Draw_Font_Body
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Print_Draw_Font_Body (
                               F_Size:Integer;
                               F_Style:TfontStyles;
                               F_Name:String;
                               psize : Array of Integer;
                               pData : Array of String;
                               Ptype : Array of char;
                               P_Font_Size: Array of Integer);

var
  Loop  : Integer;
  li_tw : Integer;
  p_max : Integer;
  Buf_Size : Integer;
begin
    Prt_Col :=0;
    P_max := High(pData);
    Buf_Size:= F_Size;
    for Loop  := 0 to P_max do begin
      Printer.canvas.Font.Name := F_Name;
      Printer.canvas.font.Style := F_Style;
      Printer.canvas.font.size  := F_Size;
      if P_Font_Size[Loop]>0 then begin
        Printer.canvas.font.size  := P_Font_Size[Loop];
        Printer.canvas.font.Style := [fsBold];
        Buf_Size:=P_Font_Size[Loop]
      end;
      li_tw := Printer.canvas.TextWidth(pData[Loop]);
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ psize[Loop]*width_div]));
      with Printer.canvas do begin
        Case Ptype[Loop] of
          'R' : TextOut(Prt_Col - (li_tw+5), prt_row, pData[loop]);
          'L' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))) +5, prt_row, pData[loop]);
          'C' : TextOut(Prt_Col - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))+li_tw) div 2,prt_row, pData[loop]);
        end;
      end;
    end;
    Printer.canvas.font.size  := Buf_Size;
    //Defult Line Width =15 -> Textheight('A')*2
    prt_row := prt_row+(Printer.canvas.Textheight('A')*2);
end;

{*****************************************************************************
*   함 수 명  : Print_TPrt
*   함수 기능 :
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.28
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Print_TPrt (
                      F_Size:Integer;
                      F_Style:TfontStyles;
                      F_Name:String;
                      Row_Heigth : Integer;
                      psize : Array of Integer;
                      pData : Array of String;
                      Ptype : Array of char;
                      Bo_Loc: Array of Integer);
var
  Loop  : Integer;
  li_tw : Integer;
  p_max : Integer;
begin
    Printer.canvas.font.size  := F_Size;
    Printer.canvas.Font.Name := F_Name;
    Printer.canvas.font.Style := F_Style;
    P_max := High(pData);
    Prt_Col:=0;
    for Loop  := 0 to P_max do begin
      li_tw := Printer.canvas.TextWidth(pData[Loop]);
      Prt_Col :=Prt_Col+Strtoint(Format('%5.0f',[ psize[Loop]*width_div]));
      with Printer.canvas do begin
        Case Ptype[Loop] of
          'R' : TextOut(Prt_Col + Bo_Loc[loop] - (li_tw+5), prt_row, pData[loop]);
          'L' : TextOut(Prt_Col + Bo_Loc[loop] - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))) +5, prt_row, pData[loop]);
          'C' : TextOut(Prt_Col + Bo_Loc[loop] - (Strtoint(Format('%5.0f',[psize[Loop]*width_div]))+li_tw) div 2,prt_row, pData[loop]);
        end;
      end;
    end;
    prt_row := prt_row+(Printer.canvas.Textheight('A')+Row_Heigth);
end;

end.
