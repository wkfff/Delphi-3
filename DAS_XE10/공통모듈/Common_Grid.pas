{*******************************************************************************
* Project         :
* Unit ��	  : Common_Grid
* ���		  :
* �ۼ���	  :
* �ۼ���	  :
* ���� Unit	  :
* �����̷�	  :
*------------------------------------------------------------------------------
*   ��������   ������     ��������
*------------------------------------------------------------------------------
    2005.08.22  Shim      1. StringGrid���� ���������� ������������ �����ϴ� �Լ� �߰�
*******************************************************************************}
unit Common_Grid;

interface

uses  Controls, ExtCtrls,Messages,Classes ,Forms,Dialogs,
      Grids, StdCtrls, SysUtils, Windows, Graphics, comctrls;
  var
     giModePos  : Integer;
     giComboCnt : Integer=0;
     FCheck, FNoCheck: TBitmap;
     
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

  type
    TGridCracker = Class( TStringGrid );


  Function Warp_Row_Cnt (const Data :String):Integer; //'|'���� �ľ�
  procedure Grid_Clear(Sender: TObject);overload;      // Grid Buffer �� Clear
  procedure Grid_Clear(Sender: TObject; pColumn: Integer; pValue: String; pClear: Integer = 0 );overload;
  procedure Grid_Delete(Sender: TObject);overload;
  procedure Grid_Delete(Sender: TObject; iRow:Integer);overload;
  procedure Grid_chk_Delete(Sender: TObject;chk_loc:Integer);
  procedure Grid_Row2_chk(Sender: TObject;
                           No_chk:Boolean);
  procedure Grid_Next(Sender: TObject;
                       Mode:Char;
                       Col_Pos:Integer=1; //������ġ
                       Col_Cnt:Integer=0; //�����ΰ� :ColCount-Col_Cnt-1
                       No_chk:Boolean=True); //Row������ ����


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

  procedure Grid_Draw_Color(Sender: TObject;
                            Sel_loc: String;
                            Col_loc: Integer;
                            Row_loc: Integer;
                            Rect: TRect);

  procedure Grid_Draw_Color_Char(Sender: TObject;
                          Sel_Char: Char;
                          iCmpCol : Integer;
                          iRow    : Integer;
                          Rect: TRect);


  procedure Grid_Draw_Select_Color(Sender: TObject;
                                Sel_loc: String;
                                Col_loc: Integer;
                                Col_Row: Integer;
                                Rect   : TRect);


  Function func_Grid_NULL_CHK(Sender  : TObject;
                              Sel_loc : String;
                              Col_Cnt : Integer ):Boolean;


  procedure proc_Grid_Buf(Sender   : TStringGrid ;
                                   iCol_F   : Integer;  //���ۿ� �� ������ġ
                                   iCol_T   : Integer;  //���ۿ� �� ����ġ
                                   iChk_Loc : Integer;  //����,�ű����� ��ġȮ��(E,N)
                                   iRow    : Integer );


  procedure proc_Grid_Mode(Sender   : TStringGrid ;
                                    iCol_F   : Integer;  //���ۿ� �� ������ġ
                                    iCol_T   : Integer;  //���ۿ� �� ����ġ
                                    iChk_Loc : Integer;  //����,�ű����� ��ġȮ��(E,N)
                                    iRow     : Integer );



  procedure Grid_Edit(Sender  : TObject;
                      Sel_Loc : String;
                      Col_loc : Integer);


  procedure Combobox_crt(Sender  :Tobject;
                         iCol  :Integer;
                         sData   :array  of String) ;



  procedure Combobox_Close();

  procedure Grid_ComBo( Sender: TObject;
                           Sel_loc : String;
                           iCol:Integer;
                           Data: ShortString);
  procedure  proc_Combobox_Init(iCount:Integer);


  procedure proc_SortStringgrid( pGrid: TStringGrid; pColumn1, pColumn2: LongInt;
                                 pSort: Integer; pSort1 : Integer = 0  );
  procedure proc_ExchangeGridRows( pGrid: TStringGrid; iFromRow, iToRow: Integer );
  function  func_Get_GridSelectRow2Value(pStringGrid: TStringGrid;
                                         pValue : String; pColumn: Integer) : Integer;overload;
  function  func_Get_GridSelectRow2Value(pStringGrid: TStringGrid;
                                         pValue1, pValue2 : String; pColumn1, pColumn2: Integer):Integer;overload;

  procedure proc_Buf_Grid(Sender : TStringGrid; iRowCount, iSelectRow: Integer);

  procedure proc_GridToggleCheckbox(pStringGrid: TStringGrid; pCol: Integer ); overload;
  procedure proc_GridToggleCheckbox(pStringGrid: TStringGrid; pCol, pRow: Integer ); overload;

implementation
Var
    combo_new : array of  Tcombobox; //combobox buffer
    buf_Tstr  : TStringGrid;



{*****************************************************************************
*   �� �� ��  : Grid_Title
*   �Լ� ��� : Ÿ��Ʋ ���           ���� :'|'
*   Parameters: Sender : TStringGrid
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure Grid_Title(Sender: TObject;
                      Title_Data:Array of ShortString);        // Ÿ��Ʋ ���
begin

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

procedure Grid_Clear(Sender: TObject; pColumn: Integer; pValue: String; pClear: Integer = 0 );overload;
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
    end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Delete
*   �Լ� ��� : �׸��忡�� ���õ� ��row �� ����
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure Grid_Delete(Sender: TObject);overload;
var
  li_i,li_j : Integer;
begin
    with (Sender as TStringGrid) do begin
      if RowCount > 2 then begin
        for li_i := Row to RowCount - 2 do
          for li_j := 0 to ColCount*2+1 do
            Cells[li_j,li_i] := Cells[li_j, li_i+1];
        Rows[RowCount-1].Clear;
        RowCount := RowCount - 1;
      end else  begin
        // ������ ���� ���ڿ� Clear
        Rows[RowCount-1].Clear;
        // ������ ���� ���ڿ��� '' Set
        Rows[RowCount-1].Add('');
      end;
//      set_checkbox_alignment(Sender,buf_loc);
      Refresh;
    end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Delete
*   �Լ� ��� : �׸��忡�� ���õ� ��row �� ����
*   Parameters: Sender : TStringGrid, iRow : Integer
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure Grid_Delete(Sender: TObject; iRow:Integer);overload;
begin
    with (Sender as TStringGrid) do begin
      Rows[iRow].Clear;
      if RowCount > 2 then begin
         RowCount := iRow;
      end;
      Refresh;
    end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_chk_Delete
*   �Լ� ��� : �׸��忡�� ���õ� ��row �� ����
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure Grid_chk_Delete(Sender: TObject;chk_loc:Integer);
var
  li_i,li_j,i : Integer;
  cmp_data : String;
  inc_row : Integer;
  NewCheckBox: TCheckBox;
begin
    inc_row :=1;
    cmp_data := '';
    with (Sender as TStringGrid) do begin
      for i:= 1 to RowCount-1 do
      begin
        if (Objects[chk_loc,i] is TCheckBox) then
        begin
          NewCheckBox := (Objects[chk_loc,i] as TCheckBox);
          if NewCheckBox.Checked then
          begin
            inc(inc_row);
            Continue;
          end;
        end;
        for li_j := 0 to ColCount*2+1 do
        begin
          Cells[li_j,i] := '';
        end;
      end;

      for i:= 1 to RowCount-1 do
      begin
        if(Objects[chk_loc,i] as TCheckBox) <> nil then begin
          (Objects[chk_loc,i] as TCheckBox).Visible := false;
           Objects[chk_loc,i] := nil;
        end;
        if trim(Cells[0,i])='' then
        begin
          for li_i := i to RowCount - 1 do
          begin
            if Cells[0,li_i]<>'' then
            begin
              for li_j := 0 to ColCount do
              begin
                Cells[li_j,i] := Cells[li_j, li_i];
                Cells[Colcount+li_j+2,i] := Cells[li_j, li_i];
                Cells[li_j, li_i]:='';
              end;
              Cells[Colcount+1,i]:=' R';
              break;
            end;
          end;
        end;
      end;
      if inc_row=1 then inc_row:=2;
      rowcount := inc_row;
    end;
end;


{*****************************************************************************
*   �� �� ��  : Grid_Row2_chk
*   �Լ� ��� : ù��°  row �� üũ
*   Parameters: Sender : TStringGrid
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������}

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
        if Trim(Cmp_Str)='' then //ù��° row �� ���� �������
          Cells[ColCount+1,1]:=' I';
        if (No_chk) then
        begin
          Cells[0,row]:=InttoStr(Row);
          Cells[colcount+2,row]:=InttoStr(Row);   // �ڵ� ���� �� ��� ���۰��� �ϴ� ä���.
        end;
      end;
    end;
end;
{*****************************************************************************
*   �� �� ��  : Grid_Next
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender : TStringGrid
*               Mode : 'I'  -> �ű� ��� �ڵ����� Row �� ����
*                      else -> ��ȸ ���
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************
   2001.08.15   ù��° row�� ���̾������ �Է¸�尪 ����             �����
}


procedure Grid_Next(Sender: TObject;
                     Mode:Char;
                     Col_Pos:Integer; //������ġ
                     Col_Cnt:Integer; //�����ΰ� :ColCount-Col_Cnt-1;
                     No_chk:Boolean); //Row������ ����
begin
    with (Sender as TStringGrid) do begin
      Grid_Row2_chk(Sender,No_chk);
      if col=Col_Cnt then begin
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
      end else If ColCount -1 >col then Col:=Col+1;
    end;
end;
{*****************************************************************************
*   �� �� ��  : Warp_Row_Cnt
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters:Sender: Data
*
*   Retrun    : Integer -> '|' ����
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : Grid_Draw
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters:Sender: TObject
*               Col_Loc,              //col ��ġ��
*               Row_Loc:Integer       //row ��ġ��
*               Rect: TRect;          //
*               State: TGridDrawState;//���°�
*               Draw_Loc:Char;        //'L'->���� ���� 'C'->�߾� ���� 'R'->������ ����
*               Sts_Pos:Integer);     //�ߺ� ó�� �۾��� �� 0-Sts_Pos �÷� ��ġ
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
            Pos_cnt:= Warp_Row_Cnt(warp_data);  //���� �ľ�
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
                    Textrect(Rect, li_Left, CurY, ch_data); //����� �ڷ�
                  end else begin
                    TextOut(li_Left, CurY, ch_data); //����� �ڷ�
                  end;
                  CurY := CurY +  TextHeight('A')+5;
                end
                else
                begin
                  EndData := True;
                  li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(warp_data)) div 2;
                  TextOut(li_Left, CurY, warp_data); //����� �ڷ�
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
          //Sts_Pos�ȿ��� �۾��� ���� ����
          Font.Color :=  clWindowText;
//          if (gdSelected in State) or (Pos('>',Cells[Col_Loc,Row_Loc])>0) then begin
// 2005.09.08 Shim '>'������ ���ؼ� Grid������ ���ϴ� ��찡 �߻��Ͽ� ������.
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

{*****************************************************************************
*   �� �� ��  : Grid_Select_Order
*   �Լ� ��� : ���õ� �÷������� ����
*   Parameters:Sender: TObject
*               Sel_Col,              //col ��ġ��
*               Add_Cnt:Integer       //Colcount =  ColCount+Add_Cnt+1;
*               Sort : Char           //'D' : �������� 'A' ��������
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
    //--�׸��忡 ������ �ʵ�� �˻�
    Start_Col:=0;
    Array_Cnt := (Sender as TStringGrid).ColCount+Add_Cnt+1;
    SetLength(cmp_suwi,Array_Cnt);//--�ӽ� ���� �迭
    with (Sender as TStringGrid) do begin
      if Cells[0,0]='No' then Start_Col:=1;
      for li_loop := 1 to RowCount - 1 do begin
        for lj_loop := li_loop+1  to RowCount - 1 do begin
          if (trim(Cells[Sel_Col,li_loop+1])='') then begin
            Continue;
          end;
          if Sort='A' then begin //���� ���� ����
            if Cells[Sel_Col,li_loop] > Cells[Sel_Col,lj_loop] then begin
              for Loop_Sort := Start_Col to ColCount+Add_Cnt do begin
                cmp_suwi[Loop_Sort]:= Cells[Loop_Sort,li_loop];
                Cells[Loop_Sort,li_loop]:=Cells[Loop_Sort,lj_loop];
                Cells[Loop_Sort,lj_loop]:=cmp_suwi[Loop_Sort];
              end;
            end;
          end else
          if Sort='D' then begin //���� ���� ����
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
*   �� �� ��  : Grid_OrderBy
*   �Լ� ��� : ���콺�� ���õ� �÷� ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_OrderBy(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  iCol : integer;
  iRow : integer;
  Set_Sort : Char;
begin
    Set_Sort:='A';
    if Set_Sort='��' then Set_Sort:='D';
    (Sender As TStringGrid).MouseToCell(X,Y,iCol,iRow);//���콺->  �׸��� ��ǥ��  ���
    if (iCol <0) or (iRow<0) then exit;
    if UpperCase(Trim((Sender As TStringGrid).Cells[iCol,0])) = 'NO' then Exit;
    if (iRow = 0) and (Button = mbLeft) then
    begin
      with (Sender As TStringGrid) do
      Grid_Select_Order(Sender,iCol,ColCount,Set_Sort);
    end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Draw_Color
*   �Լ� ��� : �׸��� �Է¼� ����
                ��ȸ���� ���� �ٲ���
                Grid_Draw ���� �Ѽ� ������ ó���ؾߵ�( ������ ���� )
*   Parameters:
           Sel_loc : �׸��忡 ����� ���� ��ġ�� ',0,4,7,8,9,11,12,'
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.10.20
******************************************************************************
    ��������           ���� �� ����                                   ������
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
       Brush.Color :=$00B5F0FF;
//       Brush.Color :=$00D7FFD7;
       fillRect(rect);
     end;
    end;
  end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Draw_Color
*   �Լ� ��� : �׸��� �Է¼� ����
                ��ȸ���� ���� �ٲ���
                Grid_Draw ���� �Ѽ� ������ ó���ؾߵ�( ������ ���� )
*   Parameters:
           Sel_loc : �׸��忡 ����� ���� ��ġ�� ',0,4,7,8,9,11,12,'
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.10.20
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_Draw_Color_Char(Sender: TObject;
                          Sel_Char: Char;
                          iCmpCol : Integer;
                          iRow    : Integer;
                          Rect: TRect);
begin
  with (Sender as TStringGrid) do begin
     If Cells[iCmpCol,iRow]='' Then Exit;
     if Cells[iCmpCol,iRow][1]=Sel_Char then Begin
     with Canvas do begin
       FillRect(Rect);
//       Brush.Color :=$00F7DECA;
       Brush.Color :=$00D7FFD7;
       fillRect(rect);
     end;
    end;
  end;
end;

{*****************************************************************************
*   �� �� ��  : Grid_Draw_Color
*   �Լ� ��� : �׸��� �Է¼� ����
                ��ȸ���� ���� �ٲ���
                Grid_Draw ���� �Ѽ� ������ ó���ؾߵ�( ������ ���� )
*   Parameters:
           Sel_loc : �׸��忡 ����� ���� ��ġ�� ',0,4,7,8,9,11,12,'
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.10.20
******************************************************************************
    ��������           ���� �� ����                                   ������
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


{-----------------------------------------------------------------------------

   �̸�    : proc_Grid_Buf
   ���    : ���� ������ �ڷ��� ������ �����۾��� �ߴ��� Ȯ���Ѵ�.
   �μ�    :
   �����  : �۾����� : True,  �Ұ�(��): False
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Grid_Buf(Sender   : TStringGrid ;
                                 iCol_F   : Integer;  //���ۿ� �� ������ġ
                                 iCol_T   : Integer;  //���ۿ� �� ����ġ
                                 iChk_Loc : Integer;  //����,�ű����� ��ġȮ��(E,N)
                                 iRow    : Integer );
Var
    iCol       : Integer;
    iStart_Col : Integer;
Begin
    iStart_Col :=iChk_Loc + 1;
    With Sender Do Begin
       For iCol := iCol_F To  iCol_T Do Begin
          Cells[iStart_Col+iCol,iRow] := Cells[iCol,iRow];
       End;
    End;
End;

{-----------------------------------------------------------------------------

   �̸�    : proc_Buf_Grid
   ���    : �����ڷḦ ǥ��Column���� �����Ͽ� Data�� �����Ѵ�.
   �μ�    : TStringGrid
   �����  : �۾����� : True,  �Ұ�(��): False
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Buf_Grid(Sender     : TStringGrid;
                        iRowCount, iSelectRow : Integer);
Var
    iCol, iRow : Integer;
    iStart_Col : Integer;
Begin
    iStart_Col := (Sender AS TStringGrid).ColCount + 2;
    With Sender Do Begin
       for iRow := iSelectRow to iRowCount - 1 do begin
          For iCol := 0 To ColCount - 1 Do Begin
             Cells[iCol,iRow] := Cells[iStart_Col+iCol,iRow] ;
          End;
       end;
       RowCount := iRowCount;
    End;
End;

{ -----------------------------------------------------------------------------

   �̸�    : proc_Grid_Mode
   ���    : �׸��� ��� ����
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Grid_Mode(Sender   : TStringGrid ;
                                  iCol_F   : Integer;  //���ۿ� �� ������ġ
                                  iCol_T   : Integer;  //���ۿ� �� ����ġ
                                  iChk_Loc : Integer;  //����,�ű����� ��ġȮ��(E,N)
                                  iRow     : Integer );
Var
    iCol       : Integer;
    iStart_Col : Integer;
    sAdd_Str_S : String;
    sAdd_Str_T : String;
Begin
    sAdd_Str_S :='';
    sAdd_Str_T :='';
    iStart_Col :=iChk_Loc + 1;
    giModePos  := iChk_Loc;
    With Sender Do Begin
       If Cells[iChk_Loc,iRow]='' Then Begin
          proc_Grid_Buf(Sender
                      ,iCol_F       //���ۿ� �� ������ġ
                      ,iCol_T       //���ۿ� �� ����ġ
                      ,iChk_Loc     //�۾���� ��ġ
                      ,iRow)
       End;
       //�ű��۾����� Ȯ��
       For iCol := iCol_F To iCol_T Do Begin
          sAdd_Str_S := sAdd_Str_S + Trim(Cells[iStart_Col+iCol,iRow]);
          sAdd_Str_T := sAdd_Str_T + Trim(Cells[iCol,iRow]);
       End;
       //���ۿ� ���� ������ �ű��۾�
       If  sAdd_Str_S='' Then Begin //�ű� ���� ����
          Cells[giModePos,iRow] := ' I';
       End
       Else Begin //���� ���� ����
          If (sAdd_Str_S <> sAdd_Str_T) Then Begin
             Cells[giModePos,iRow] := ' E';
          End
          Else Begin
             Cells[giModePos,iRow] := ' Q';
          End;
       End;
    End;
End;
{ -----------------------------------------------------------------------------

   �̸�    : Grid_Edit
   ���    : �Է�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure Grid_Edit(Sender  : TObject;
                    Sel_Loc : String;
                    Col_loc : Integer);
begin
    With (Sender as TStringGrid) do begin
      If Pos( ','+inttostr(Col_loc)+',',Sel_loc)>0 then begin
         If (goEditing in Options) then
         Begin
            Options:=Options-[goEditing];
         End;
      End
      Else Begin
         Options:=Options+[goEditing];
      End;
    End;
end;
{ -----------------------------------------------------------------------------

   �̸�    : func_Grid_NULL_CHK
   ���    : ���� �Է��ش��� üũ
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

Function func_Grid_NULL_CHK(Sender  : TObject;
                            Sel_loc : String;
                            Col_Cnt : Integer ):Boolean;
Var
    sData    : String;
    sAddData : String;
    iLoop    : Integer;
    iRow     : Integer;
    iCol     : Integer;
begin
    Result := True;
    With (Sender as TStringGrid) do begin
       For iRow  := 1 To RowCount -1 Do Begin
          sAddData:='';
          For iCol := 0 To Col_Cnt  Do Begin
             If Pos( ','+inttostr(iCol)+',',Sel_loc)>0 then begin
                sAddData :=  sAddData + Cells[iCol,iRow];
             End;
          End;
          If sAddData='' Then Continue;
          For iLoop := 0 To Col_Cnt Do Begin
             sData := Trim(Cells[iLoop,iRow]);
             If Pos( ','+inttostr(iLoop)+',',Sel_loc)>0 then begin
                If  sData='' Then Begin
                   Result := False;
                   Col    := iLoop;
                   Row    := iRow;
                   ShowMessage(Cells[iLoop,0]+'�� ���� �Է��ؾ� �մϴ�.!!!');
                   Exit;
                End;
             End;
          End;
       End;
    End;
end;

procedure  proc_Combobox_Init (iCount:Integer);
Begin
    giComboCnt := iCount;
    SetLength(combo_new,iCount);
end;


{*****************************************************************************
*   �� �� ��  : Combobox_crt
*   �Լ� ��� : �׸��忡 ���۳�Ʈ ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Combobox_crt(Sender  :Tobject;
                       iCol    :Integer;
                       sData   :array  of String) ;


//--------------------------------------------------
    procedure Grid_ComBo_Crt(Sender: TObject;
                              iCol : Integer);
    begin
        if combo_new[iCol] = nil then // Combo ���� ���� üũ
            combo_new[iCol] := TComBo.Create(Application);
        With  combo_new[iCol] do begin
            Parent := (Sender as TStringGrid);
            Style := csDropDownList;
            OnExit :=TComBo.Create(Application).combo_newexit;
            OnKeyPress :=TComBo.Create(Application).Enter_key;
            onChange :=TComBo.Create(Application).Combo_Change;
            font.Name := '����ü';
            font.Size :=9;
            Visible := false;
        end;
    end;


    procedure Grid_ComBo_Data(
                             Data: array  of String;
                             pos:Integer);
    var
      Loop_Data : Integer;
    begin
        if  combo_new[pos]=nil then exit;
        combo_new[pos].clear;
        for Loop_Data:= 0 to high(Data) do
        begin
            combo_new[pos].items.add(data[Loop_Data]);
        end;
    end;
begin
    Grid_ComBo_Crt(Sender,iCol);
    Grid_ComBo_Data(sData,iCol);
end;

procedure Combobox_Close();
Var
    i : Integer;
Begin
    for i:=0 to giComboCnt-1 do  begin
       combo_new[i].Free;
       combo_new[i]:=Nil;
    End;
End;
{*****************************************************************************
*   �� �� ��  : Grid_ComBo
*   �Լ� ��� : �׸��� �޺��ڽ� ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Grid_ComBo( Sender: TObject;
                         Sel_loc : String;
                         iCol:Integer;
                         Data: ShortString);
var
    R  : TRect;
    Cmp_Data : String;
begin
   If Pos( ','+inttostr(iCol)+',',Sel_loc)>0 then begin

      buf_Tstr:= (Sender as TStringGrid);
      Cmp_Data := Data;
      with (Sender as TStringGrid)  do begin
          Options:=Options-[goEditing];
          R := CellRect(Col, Row);
          R.Left := R.Left;
          R.Right := R.Right;
          R.Top := R.Top;
          R.Bottom := R.Bottom;
          With combo_new[iCol] do begin
              ItemIndex:=-1;
              height:= (items.Count+1)*20;
              Left := R.Left ;
              Top := R.Top ;
              Width := (R.Right + 1) -R.Left-1;
              if Cmp_Data <>'' then
              begin
                    ItemIndex:=Items.IndexOf(Cmp_Data);
              end;

              Visible := True;

              setfocus;
          End;
        end;
    end;
end;

{*****************************************************************************
*   �� �� ��  : Enter_key
*   �Լ� ��� :
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure TCombo.Enter_key(Sender: TObject; var Key: Char);
Var
    cMode : char;
begin
    with (buf_Tstr)  do begin
        if (Key in [#13])  then  begin                            { if it's an enter key }
            Key := #0;                                 { eat enter key }
            SetFocus;
            If Cells[giModePos,Row]='' Then  cMode:=' '
            Else cMode :=Cells[giModePos,Row][2];
            Grid_Next(buf_Tstr
                      ,cMode );
        end;
    end;
end;

procedure TCombo.combo_newexit(Sender:TObject);

begin
    with (buf_Tstr)  do begin
        combo_new[col].Visible := False;
        Cells[col,row]:=  combo_new[col].text;
    end;
end;
{*****************************************************************************
*   �� �� ��  : Combo_Change
*   �Լ� ��� :
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure Tcombo.Combo_Change(Sender:TObject);
begin
    with (buf_Tstr)  do begin
        Cells[Col,Row]:=Trim(combo_new[col].Text);
    end;
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
*   �� �� ��  : func_Get_GridSelectRow2Value
*   �Լ� ��� : StringGrid�� ���÷��� ���Ͽ� Grid������ ��ȸ�Ѵ�.
*   Parameters: TStringGrid
*               pValue : ��ȸ��, ��Column�׸�
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
function func_Get_GridSelectRow2Value(pStringGrid: TStringGrid;
                                      pValue : String; pColumn: Integer):Integer;
var
  iRow, iResult : Integer;
begin
   iResult := 0;
   With pStringGrid do begin
      for iRow := 1 to (pStringGrid.RowCOunt - 1) do begin
         If pValue = pStringGrid.Cells[pColumn, iRow] then begin
            iResult:= iRow; break;
         end;
      end;
   end;
   Result := iResult;
end;

{*****************************************************************************
*   �� �� ��  : func_Get_GridSelectRow2Value
*   �Լ� ��� : StringGrid�� ���÷��� ���Ͽ� Grid������ ��ȸ�Ѵ�.
*   Parameters: TStringGrid
*               pValue1, pValue2 : ��ȸ��, ��Column�׸�
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
function func_Get_GridSelectRow2Value(pStringGrid: TStringGrid;
                                      pValue1, pValue2 : String; pColumn1, pColumn2: Integer):Integer;
var
  iRow, iResult : Integer;
begin
   iResult := 0;
   With pStringGrid do begin
      for iRow := 1 to (pStringGrid.RowCOunt - 1) do begin
         If (pValue1 = pStringGrid.Cells[pColumn1, iRow]) AND
            (pValue2 = pStringGrid.Cells[pColumn2, iRow]) then begin
            iResult:= iRow; break;
         end;
      end;
   end;
   Result := iResult;
end;

{*****************************************************************************
*   �� �� ��  : proc_GridToggleCheckbox
*   �Լ� ��� : StringGrid�� CheckBox�� üũ���θ� ó���Ѵ�. (��ü)
*   Parameters: TStringGrid
*               ���� Column
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure proc_GridToggleCheckbox(pStringGrid: TStringGrid; pCol: Integer );
var
  iRow : Integer;
begin
    for iRow := 1 to pStringGrid.RowCount - 1 do begin
       proc_GridToggleCheckbox(pStringGrid, pCol, iRow);
    end;
end;

{*****************************************************************************
*   �� �� ��  : proc_GridToggleCheckbox
*   �Լ� ��� : StringGrid�� CheckBox�� üũ���θ� ó���Ѵ�.
*   Parameters: TStringGrid
*               ���� Column, Row
*   Retrun    :
*   �� �� ��  : Shim
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

procedure proc_GridToggleCheckbox(pStringGrid: TStringGrid; pCol, pRow: Integer );
begin
   with TGridCracker( pStringGrid ) do begin
     if Assigned( Objects[pCol, pRow] ) then  Objects[pCol, pRow] := Nil
     else Objects[pCol, pRow] := Pointer(1);

     InvalidateCell( pCol, pRow );
   end;
end;

end.
