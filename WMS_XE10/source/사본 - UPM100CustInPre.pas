unit UPM100CustInPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, ToolEdit, CurrEdit, Buttons, CPort, Gauges;  

const
  gcGapH = 20;
  gcGapV = 7;
  gcGapVProduct = 17;

type
  TFPM100CustInPre = class(TForm)
    qryOpen: TQuery;
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
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
    edtCUST_NAME: TEdit;
    Label3: TLabel;
    dtpI_DATE: TDateTimePicker;
    GroupBox2: TGroupBox;
    rbtn3: TRadioButton;
    rbtn2: TRadioButton;
    rbtn1: TRadioButton;
    edtBARCODE: TEdit;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    cbPort: TComboBox;
    GroupBox3: TGroupBox;
    rbtnS: TRadioButton;
    rbtnL: TRadioButton;
    Button2: TButton;
    pnlPrint: TPanel;
    Label5: TLabel;
    Gauge1: TGauge;
    CheckBox1: TCheckBox;
    Gauge2: TGauge;
    Comm1Prnt1: TComPort;
    cedtVBELN: TCurrencyEdit;
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
    procedure Button3Click(Sender: TObject);
    procedure sgMainClick(Sender: TObject);
    procedure rbtn1Click(Sender: TObject);
    procedure rbtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
    gsORDER_TYPE : String;

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..16] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
    function  fn_Print(ARow:Integer):String;  
    function  fn_GetBarcode(ARow:Integer): String;
    function  fn_GetBarcodeP(ARow:Integer): String;
  public
    { Public declarations }
  end;

var
  FPM100CustInPre: TFPM100CustInPre;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const

  CD_SEQN       = 0;
  CD_SELC_TION  = 1;
  CD_CUST_NAME  = 2;
  CD_ORDER_NO   = 3;
  CD_ITEM_GUBUN = 4;
  CD_CATNO      = 5;
  CD_ITEM_NAME  = 6;
  CD_QTY        = 7;
  CD_ORDER_UNIT = 8;
  CD_STOCK_QTY  = 9;
  CD_STOCK_UNIT = 10;
  CD_ITEM_CODE  = 11;

procedure TFPM100CustInPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Comm1Prnt1.Close;
  Action := caFree;
end;

procedure TFPM100CustInPre.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CustInPre.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;



procedure TFPM100CustInPre.Button2Click(Sender: TObject);       

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

var
  lsPrint : String;
  li : Integer;  
  lsDate : String;
  lsBarcode : String;

  liH, liV : Integer;

  liRow   : Integer;
  lbCheck : Boolean;
  liCnt   : Integer;
begin      
  if not fn_IsCheck(sgMain, CD_SELC_TION) then begin
    ShowMessage('선택한 항목이 없습니다.');
    Exit;
  end;

  Comm1Prnt1.Port := cbPort.Text;

  try
    if not Comm1Prnt1.Connected then Comm1Prnt1.Open;

    Comm1Prnt1.Open;
  except
    ShowMessage('Port 오픈 Error!!!');
    Exit;
  end;

    pnlPrint.Visible := True;
    Button3.Enabled  := not pnlPrint.Visible;
    sgMain.Enabled   := not pnlPrint.Visible;
    Button1.Enabled  := not pnlPrint.Visible;

    Gauge1.MaxValue := StrToInt(FloatToStr(cedtVBELN.Value));


    with sgMain do begin     
      lsDate  := FormatDateTime('YYYYMMDD',dtpI_DATE.Date);

      Gauge2.MaxValue := sgMain.RowCount - 1;
      Gauge2.Progress := 0;

      liCnt := 1;
      for liRow := 1 to sgMain.RowCount - 1 do begin
        GetCheckBoxState(CD_SELC_TION, liRow, lbCheck);
        If lbCheck Then Begin
          // 바코드 라벨 발행
          lsBARCODE := fn_Print(liRow);

          Gauge2.Progress := liCnt;
          liCnt := liCnt + 1;
          
          if lsBARCODE = '' then begin
            Continue;
          end;
          // 제상품 구분
          if sgMain.Cells[CD_ITEM_GUBUN, liRow] = '제품' then begin

            // 라벨발행내역 저장
            with DM.qryOpen do try
              Close;
              SQL.Clear;
              SQL.Add(' declare @liCnt int                                  '+
                      '  Select @liCnt = Count(SER_TO)                      '+
                      '   from SM100                                        '+
                      '  where ITEM_CODE = :ITEM_CODE                       '+
                      '    and PRT_DATE  = :PRT_DATE                        '+
                      ' if @liCnt = 0 begin                                 '+
                      '   insert into SM100                                 '+
                      '   (ITEM_CODE, SER_FROM, SER_TO, PRT_DATE)           '+
                      '   values(:ITEM_CODE, :SER_FROM, :SER_TO, :PRT_DATE) '+
                      ' end                                                 '+
                      ' else begin                                          '+
                      '   update SM100                                      '+
                      '      set SER_TO = :SER_TO                           '+
                      '    where ITEM_CODE = :ITEM_CODE                     '+ 
                      '      and PRT_DATE  = :PRT_DATE                      '+
                      ' end                                                 ');
              ParamByName('ITEM_CODE').Value := sgMain.Cells[CD_ITEM_CODE, liRow];
              ParamByName('PRT_DATE').Value  := lsDate;
              ParamByName('SER_FROM').Value  := Copy(lsBARCODE,1,11);
              ParamByName('SER_TO').Value    := Copy(lsBARCODE,1,11)
                                 + FormatFloat('000',StrToInt(Copy(lsBARCODE,12,3))-1);
              ExecSQL;

            except
              on E : Exception do begin
                ShowMessage (E.Message);
                //FBarcoding.Close;
                Exit;
              end;
            end;
          end;
        end;
      end;
    end;

    Gauge1.Progress := 0;
    Gauge2.Progress := 0;
    pnlPrint.Visible := False;
    Button3.Enabled  := not pnlPrint.Visible;
    sgMain.Enabled   := not pnlPrint.Visible;
    Button1.Enabled  := not pnlPrint.Visible;
end;

procedure TFPM100CustInPre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CustInPre.FormDestroy(Sender: TObject);
begin
  FPM100CustInPre := nil;
end;

procedure TFPM100CustInPre.FormCreate(Sender: TObject);
begin      
  gsORDER_TYPE := gcPurchase;

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  
  dtpI_DATE.Date := now;

  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100CustInPre.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl,  True, True);
  end;
end;

procedure TFPM100CustInPre.pr_Grid_Init;
begin


    with sgMain do begin
       //Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C';
       gcMGridAlign[CD_SELC_TION ] := 'C';
       gcMGridAlign[CD_CUST_NAME ] := 'L';
       gcMGridAlign[CD_ORDER_NO  ] := 'C';
       gcMGridAlign[CD_ITEM_GUBUN] := 'C';
       gcMGridAlign[CD_CATNO     ] := 'C';
       gcMGridAlign[CD_ITEM_NAME ] := 'L';
       gcMGridAlign[CD_QTY       ] := 'R';
       gcMGridAlign[CD_ORDER_UNIT] := 'C';
       gcMGridAlign[CD_STOCK_QTY ] := 'C';
       gcMGridAlign[CD_STOCK_UNIT] := 'C';
       gcMGridAlign[CD_ITEM_CODE ] := 'C'; 
    end;
end;

procedure TFPM100CustInPre.pr_Clear;
begin

end;

procedure TFPM100CustInPre.pr_qryOpen;
{
  procedure pr_QryToGridWithoutProgress;(AQuery:TQuery; advStringGrid:TadvStringGrid; ASequenceFormat:String; AStrartCol:Integer;
                                        AGridCheckBox:TGridCheckBox);
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

      while not AQuery.Eof do begin  //Row카운트증가

        advStringGrid.Cells[0, liRow+1] := Formatfloat(ASequenceFormat,liRow+1);
        if AGridCheckBox.FIs then begin
          advStringGrid.AddCheckBox(1, liRow+1, False, False);
        end;

        Application.ProcessMessages;

        for liCol := 0 to AQuery.FieldCount -1 do begin
          advStringGrid.Cells[liCol+1+AStrartCol,liRow+1] := AQuery.Fields[liCol].AsString;
        end;
        liRow := liRow+1;
        AQuery.Next;

      end;

  end;    }   

  procedure pr_QryToGridWithProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Integer; AGridCheckBox:TGridCheckBox);
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
      FQWait.Caption     := '데이터를 처리중입니다...';

      AGauge         := TGauge.Create(FQWait);
      AGauge.Parent  := FQWait;
      AGauge.Align   := alBottom;
      AGauge.ForeColor := clBlue;
      AGauge.Height  := 25;

      APanel         := TPanel.Create(FQWait);
      APanel.Parent  := FQWait;
      APanel.Caption := '데이터를 처리중입니다...';
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

      while not AQuery.Eof do begin  //Row카운트증가

        AGauge.Progress := liRow;
        Application.ProcessMessages;
        case ANumeric of
          44 : begin  

                  for liCol := 0 to AQuery.FieldCount -1 do begin
                      advStringGrid.AddCheckBox(1, liRow+1, False, False);
                      advStringGrid.Cells[liCol+2,liRow+1] := AQuery.Fields[liCol].AsString;
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
var
  AGridCheckBox : TGridCheckBox;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;

    Params[0].Value := gsORDER_TYPE;   

    if length(Trim(edtCUST_CODE.Text)) = 0 then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtCUST_CODE.Text;

    if RadioButton0.Checked = true then Params[2].Value := '%%';
    if RadioButton1.Checked = true then Params[2].Value := gcSerial;
    if RadioButton2.Checked = true then Params[2].Value := gc88;
    if RadioButton3.Checked = true then Params[2].Value := gcNoSale;

    //Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    //Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    if length(Trim(edtORDER_NO.Text)) = 0 then
      Params[3].Value := '%%'
    else
      Params[3].Value := edtORDER_NO.Text+'%';

    pr_QryToGridWithProgress(qryOpen, sgMain, gcNumeric, AGridCheckBox);
    sgMain.ColWidths[CD_ITEM_NAME] := gcITEM_NAMEWidth;

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100CustInPre.pr_Ready;
begin

end;

procedure TFPM100CustInPre.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100CustInPre.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CustInPre ,'FPM100CustInPre');
end;

procedure TFPM100CustInPre.SpeedButton1Click(Sender: TObject);
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

procedure TFPM100CustInPre.Button3Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CustInPre.sgMainClick(Sender: TObject);
begin
  if sgMain.Cells[CD_ITEM_GUBUN, sgMain.Row] = gcSerial then begin
    {
    rbtn1.Enabled := True;
    rbtn1.Checked := True;
    rbtn2.Enabled := False;
    rbtn3.Enabled := False;
    }
    cedtVBELN.Value := StrToFloat(sgMain.Cells[CD_QTY, sgMain.Row]);
    rbtn1.OnClick(Self);
  end
  else begin
    {
    rbtn1.Enabled := False;
    rbtn2.Enabled := True;
    if rbtn1.Checked then rbtn2.Checked := True;
    rbtn3.Enabled := True;
    } 
    rbtn2.OnClick(Self);
  end;

  {
  if rbtn1.Checked then begin
    rbtn1.OnClick(Self);
  end
  else if rbtn2.Checked then begin
    rbtn2.OnClick(Self);
  end
  else if rbtn3.Checked then begin
    rbtn3.OnClick(Self);
  end;
  }
end;

function TFPM100CustInPre.fn_Print(ARow:Integer):String;
type
  TITEM_NAME = packed record
    A2    : Boolean;
    ANAME : String;
    BNAME : String;
end;             

  function fn_GetITEM_NAME:TITEM_NAME;
  var
    li, lilen, liFind : Integer;
    lsITEM_NAME, ls : String;
  begin
    Result.A2    := False;
    Result.ANAME := '';
    Result.BNAME := '';
    lsITEM_NAME := sgMain.Cells[CD_ITEM_NAME, ARow];
      
    liLen := Length(lsITEM_NAME);
    if liLen > gcEMAKTXLen then begin
      for li := gcEMAKTXLen downto 1 do begin
        ls := Copy(lsITEM_NAME, li, 1);
        if ls = ' ' then begin   
          Result.A2    := True;
          Result.ANAME := Copy(lsITEM_NAME, 1, li-1);
          Result.BNAME := Copy(lsITEM_NAME, li+1, Length(lsITEM_NAME));
          Break;
        end;
      end;
    end
    else begin
      Result.ANAME := lsITEM_NAME;
    end;
  end;
var
  li : Integer;
  lsPrint : String;
  liH, liV : Integer;     
  AITEM_NAME : TITEM_NAME;
  liCount : Integer;
  lsBARCODE : String;
begin
    liCount   := StrToIntDef(sgMain.Cells[CD_STOCK_QTY, ARow], 0);
    cedtVBELN.Value := liCount;


    for li := 0 to liCount -1 do begin

      Gauge1.Progress := li+1;
      Application.ProcessMessages;
         
      // 제상품 구분
      if sgMain.Cells[CD_ITEM_GUBUN, ARow] = '제품' then
        lsBARCODE := fn_GetBarcode(ARow)
      else
        lsBARCODE := fn_GetBarcodeP(ARow);
        
      Result := lsBARCODE;

      edtBARCODE.Text := lsBARCODE;
        
      AITEM_NAME := fn_GetITEM_NAME;

      // 라벨종류 제품
      if sgMain.Cells[CD_ITEM_GUBUN, ARow] = '제품' then begin
        
        if length(lsBARCODE) <> 14 then begin
          ShowMessage('제품 라벨이 아닙니다.');
          Result := '';
          Exit;
        end;

        lsPrint :=
                 'SIZE 100 mm, 52 mm'+#$D#$A
                +'GAP 3 mm,0 mm'+#$D#$A
                +'DIRECTION 1,0'+#$D#$A
                +'CLS'+#$D#$A;

        liH := 150; liV := 115;
        if rbtnL.Checked then begin
          liH := liH + gcGapH;
          liV := liV + gcGapVProduct;
        end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+ ',"4",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO, ARow] +'"'+#$D#$A;
        if AITEM_NAME.A2 then begin
        

          liH := 150; liV := 157;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A;
          liH := 150; liV := 186;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A;
        end
        else begin
          liH := 150; liV := 157;
          if rbtnL.Checked then begin   
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;            
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A;
        end;              
          liH := 445; liV := 225;
          if rbtnL.Checked then begin   
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ lsBARCODE +'"'+#$D#$A;
          liH := 520; liV := 268;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ lsBARCODE +'"'+#$D#$A;

          liH := 200; liV := 330;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ lsBARCODE +'"'+#$D#$A;
          liH := 485; liV := 332;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ lsBARCODE +'"'+#$D#$A;
          liH := 550; liV := 372;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ lsBARCODE +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A;

        lsBARCODE := Copy(lsBARCODE,1,11) + FormatFloat('000', StrToInt(Copy(lsBARCODE,12,3))+1);

      end               
    
      // 라벨종류 상품
      else if sgMain.Cells[CD_ITEM_GUBUN, ARow] = '상품' then begin
        if length(lsBARCODE) <> 10 then begin
          ShowMessage('상품 라벨이 아닙니다.');   
          Result := '';
          Exit;
        end;
        lsPrint :=
                 'SIZE 100 mm, 40 mm' + #$D#$A
                +'GAP 3 mm,0 mm' + #$D#$A
                +'DIRECTION 1,0' +#$D#$A
                +'CLS'+#$D#$A;
                              
          liH := 150; liV := 115;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"4",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO,     ARow] +'"'+#$D#$A;
        if AITEM_NAME.A2 then begin

          liH := 150; liV := 159;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A;
          liH := 150; liV := 186;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A;
        end
        else begin     
          liH := 150; liV := 159;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;                 
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"HAN",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
          else
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A;
        end;
          liH := 530; liV := 230;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ lsBARCODE +'"'+#$D#$A;
          liH := 550; liV := 267;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ lsBARCODE +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A;
      end

      // 라벨종류 소형
      else if rbtn3.Checked then begin
          lsPrint :=
                   'SIZE 35 mm, 15 mm' + #$D#$A
                  +'GAP 3 mm,0 mm' + #$D#$A
                  +'DIRECTION 1,0' +#$D#$A
                  +'CLS'+#$D#$A;
          liH := 25; liV := 10;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO,     ARow] +'"'+#$D#$A;
          liH := 22; liV := 42;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",40,0,0,2,1,'+'"'+ lsBARCODE +'"'+#$D#$A;

          liH := 62; liV := 84;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"2",0,1,1,'+'"'+ lsBARCODE +'"'+#$D#$A
                    +'PRINT 1,1'+#$D#$A
                    +'EOP'+#$D#$A
                    ;
      end;

      Comm1Prnt1.WriteStr(lsPrint);

      Sleep(200);
    end;
end;

function TFPM100CustInPre.fn_GetBarcode(ARow:Integer): String;
var
  lsDate : String;
  function fn_GetBarCodeDate:String;
  var
    lsMonth, lsDay : String;
    liMonth,
    liDay  : Integer;
  begin
    lsDate  := FormatDateTime('YYYYMMDD',dtpI_DATE.Date);
    liMonth := StrToInt(Copy(lsDate,5,2));
    liDay   := StrToInt(Copy(lsDate,7,2));

    case liMonth of
      1..9 : lsMonth := IntToStr(liMonth);
      10   : lsMonth := '0';
      11   : lsMonth := 'A';
      12   : lsMonth := 'B';
    end;
    case liDay of
      1..9 : lsDay := IntToStr(liDay);
      10   : lsDay := '0';
      11   : lsDay := 'A';
      12   : lsDay := 'B';
      13   : lsDay := 'C';
      14   : lsDay := 'D';
      15   : lsDay := 'E';
      16   : lsDay := 'F';
      17   : lsDay := 'G';
      18   : lsDay := 'H';
      19   : lsDay := 'I';
      20   : lsDay := 'J';
      21   : lsDay := 'K';
      22   : lsDay := 'L';
      23   : lsDay := 'M';
      24   : lsDay := 'N';
      25   : lsDay := 'O';
      26   : lsDay := 'P';
      27   : lsDay := 'Q';
      28   : lsDay := 'R';
      29   : lsDay := 'S';
      30   : lsDay := 'T';
      31   : lsDay := 'U';
    end;

    Result := Copy(lsDate,3,2)+ lsMonth + lsDay;
  end;
begin
  lsDate  := FormatDateTime('YYYYMMDD',dtpI_DATE.Date);
  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add(' Select max(SER_TO) SER_TO     '+
            '   from SM100                  '+
            '  where ITEM_CODE = :ITEM_CODE '+
//            '    and SER_FROM  = :SER_FROM  '+
//            '    and SER_TO    = :SER_TO    '+
            '    and PRT_DATE  = :PRT_DATE  ');
    Params[0].Value := sgMain.Cells[CD_ITEM_CODE, ARow];
    Params[1].Value := lsDate;
    Open;

    if not IsEmpty then 
      if not Fields[0].IsNull then begin
        Result := Copy(FieldByName('SER_TO').Value,1,11)
                         + FormatFloat('000',StrToInt(Copy(FieldByName('SER_TO').Value,12,3))+1);

      end
      else begin
        Result := sgMain.Cells[CD_ITEM_CODE, ARow]
                         + fn_GetBarCodeDate
                         + '001';
      end;


  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

function TFPM100CustInPre.fn_GetBarcodeP(ARow:Integer): String;
  function fn_GetBarCodeDate:String;
  var
    lsDate, lsMonth, lsDay : String;
    liMonth : Integer;
  begin
    lsDate  := FormatDateTime('YYYYMMDD',dtpI_DATE.Date);
    liMonth := StrToInt(Copy(lsDate,5,2));

    case liMonth of
      1..9 : lsMonth := IntToStr(liMonth);
      10   : lsMonth := '0';
      11   : lsMonth := 'A';
      12   : lsMonth := 'B';
    end;  
    Result := Copy(lsDate,3,2)+ lsMonth;
  end;
begin

  Result := sgMain.Cells[CD_ITEM_CODE, ARow]
                   + fn_GetBarCodeDate;
end;

procedure TFPM100CustInPre.rbtn1Click(Sender: TObject);
begin
  edtBARCODE.Text := fn_GetBarcode(sgMain.Row);
end;

procedure TFPM100CustInPre.rbtn2Click(Sender: TObject);
begin
  edtBARCODE.Text := fn_GetBarcodeP(sgMain.Row);
end;

procedure TFPM100CustInPre.CheckBox1Click(Sender: TObject);
var
  liRow : Integer;
begin
  for liRow := 1 to sgMain.RowCount - 1 do begin
    sgMain.SetCheckBoxState(CD_SELC_TION, liRow, CheckBox1.Checked);
  end;
end;

end.
