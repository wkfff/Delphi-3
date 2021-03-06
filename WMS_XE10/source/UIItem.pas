unit UIItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, CPort, Gauges, IniFiles, RxToolEdit,
  RxCurrEdit, AdvObj;

const
  gcGapH = 20;
  gcGapV = 7;
  gcGapVProduct = 17;

type
  TFIItem = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtCATNO: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    edtITEM_NAME: TEdit;
    Label3: TLabel;
    edtBARCODE: TEdit;
    Label6: TLabel;
    dtpI_DATE: TDateTimePicker;
    Label2: TLabel;
    Comm1Prnt1: TComPort;
    GroupBox2: TGroupBox;
    rbtn3: TRadioButton;
    rbtn2: TRadioButton;
    rbtn1: TRadioButton;
    Button3: TButton;
    cedtVBELN: TCurrencyEdit;
    GroupBox3: TGroupBox;
    rbtnS: TRadioButton;
    rbtnL: TRadioButton;
    GroupBox4: TGroupBox;
    cbPort: TComboBox;
    pnlPrint: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    Button5: TButton;
    pnCode: TPanel;
    Label76: TLabel;
    pnCodeTitle: TPanel;
    Button13: TButton;
    Button14: TButton;
    edtKAN_CODE: TEdit;
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
    procedure rbtn1Click(Sender: TObject);
    procedure rbtn2Click(Sender: TObject);
    procedure sgMainClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..16] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FIItem: TFIItem;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const
      CD_SEQN       =  0; 
      CD_CATNO      =  1;
      CD_ITEM_NAME  =  2;
      CD_CODE_SNM   =  3;
      CD_UNIT       =  4;
      CD_UNIT_CS    =  5;
      CD_UNIT_PK    =  6;
      CD_QTY        =  7;
      CD_QTY_UNIT   =  8;
      CD_KAN_CODE   =  9;
      CD_ITEM_CODE  = 10;
      CD_I_DATE     = 11;
      CD_I_ID       = 12;
      CD_U_DATE     = 13;
      CD_U_ID       = 14;
      CD_ITEM_GUBUN = 15;

procedure TFIItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin         
  Comm1Prnt1.Close;
  Action := caFree;
end;

procedure TFIItem.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIItem.Button1Click(Sender: TObject);
  procedure pr_GetReceive;
  begin         
    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' exec dbo.SP_GET_IMP_PLAN :CP_USERID');
      Params[0].Value := gsUSERID;
      Open;

      if Fields.FieldByNumber(1).AsString = '0' then begin
        ShowMessage(Fields.FieldByNumber(2).AsString);
        Exit;
      end;

    except
      on E : Exception do begin
        ShowMessage (E.Message);
        Exit;
      end;
    end;
  end;
begin
  pr_qryOpen;

  // 수신 sp_procedure call
  //pr_GetReceive;
end;

procedure TFIItem.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFIItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : if Button3.Enabled then Button3Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFIItem.FormDestroy(Sender: TObject);
begin
  FIItem := nil;
end;

procedure TFIItem.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  dtpI_DATE.DateTime := now;

  Application.ProcessMessages;

end;

procedure TFIItem.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFIItem.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_ITEM_CODE ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_UNIT      ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_UNIT_CS   ] := 'C'; HideColumn(CD_UNIT_CS);
       gcMGridAlign[CD_UNIT_PK   ] := 'C'; HideColumn(CD_UNIT_PK);
       gcMGridAlign[CD_QTY       ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_QTY_UNIT  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_KAN_CODE  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_I_DATE    ] := 'C'; HideColumn(CD_I_DATE    );
       gcMGridAlign[CD_I_ID      ] := 'C'; HideColumn(CD_I_ID      );
       gcMGridAlign[CD_U_DATE    ] := 'C'; HideColumn(CD_U_DATE    );
       gcMGridAlign[CD_U_ID      ] := 'C'; HideColumn(CD_U_ID      );
       gcMGridAlign[CD_ITEM_GUBUN] := 'C'; HideColumn(CD_ITEM_GUBUN);
    end;
end;

procedure TFIItem.pr_Clear;
begin

end;

procedure TFIItem.pr_qryOpen;
var
  la : Array of Integer;
begin  
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    

    if Trim(edtCATNO.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := '%'+edtCATNO.Text+'%';
                                {
    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;
      }

    if RadioButton0.Checked then begin
      Params[1].Value := 1;
      Params[2].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gcNoSale;
    end;

    SetLength(la , 2);

    la[0] := CD_UNIT_CS;
    la[1] := CD_UNIT_PK;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);
    sgMain.ColWidths[CD_ITEM_NAME] := gcITEM_NAMEWidth;

    pr_SetRecordCount(sgMain);

    sgMain.OnClick(Self);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFIItem.pr_Ready;
begin

end;

procedure TFIItem.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If ARow = 0 Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify;       //선택
          'L' :  HAlign := taLeftJustify;  //공장
       End;
    End;
end;

procedure TFIItem.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFIItem ,'FIItem');
end;

procedure TFIItem.SpeedButton1Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 0;
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      //edtITEM_CODE.Text := gsITEM_CODE;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

procedure TFIItem.Button3Click(Sender: TObject);
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
    lsITEM_NAME := sgMain.Cells[CD_ITEM_NAME, sgMain.Row];
      
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
  lsPrint : String;
  li : Integer;  
  lsDate : String;
  lbFirst : Boolean;
  lsBarcode : String;
  AITEM_NAME : TITEM_NAME;

  liH, liV : Integer;
begin
  if edtBARCODE.Text = '' then begin
    ShowMessage('발행바코드가 없습니다. 제품을 먼저 선택하십시오.');
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

    lbFirst := False;
    Gauge1.MaxValue := StrToInt(FloatToStr(cedtVBELN.Value));

    AITEM_NAME := fn_GetITEM_NAME;

    for li := 0 to StrToInt(FloatToStr(cedtVBELN.Value)) -1 do begin

      Gauge1.Progress := li+1;
      Application.ProcessMessages;

      // 라벨종류 제품
      if rbtn1.Checked then begin
        if length(edtBARCODE.Text) <> 14 then begin
          ShowMessage('제품 라벨이 아닙니다.');
          Exit;
        end;
        lbFirst := True;

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
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+ ',"4",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO,     sgMain.Row] +'"'+#$D#$A;
        if AITEM_NAME.A2 then begin
        

          liH := 150; liV := 157;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
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
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A
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
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
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
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;
          liH := 520; liV := 268;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;

          liH := 200; liV := 330;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;
          liH := 485; liV := 332;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;
          liH := 550; liV := 372;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapVProduct;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A;

        if lbFirst then begin
          lsBarcode := edtBARCODE.Text;   
          lbFirst := False;
        end;
        edtBARCODE.Text := Copy(edtBARCODE.Text,1,11) + FormatFloat('000', StrToInt(Copy(edtBARCODE.Text,12,3))+1);

      end               
    
      // 라벨종류 상품
      else if rbtn2.Checked then begin  
        if length(edtBARCODE.Text) <> 10 then begin
          ShowMessage('상품 라벨이 아닙니다.');
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
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"4",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO,     sgMain.Row] +'"'+#$D#$A;
        if AITEM_NAME.A2 then begin

          liH := 150; liV := 159;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          if rbtnL.Checked then
            lsPrint := lsPrint
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
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
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.BNAME +'"'+#$D#$A
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
                  +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"K.BF2",0,1,1,'+'"'+ AITEM_NAME.ANAME +'"'+#$D#$A
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
                +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",35,0,0,2,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;
          liH := 550; liV := 267;
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A
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
          liH := 30; liV := 10; // 25
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"3",0,1,1,'+'"'+ sgMain.Cells[CD_CATNO,     sgMain.Row] +'"'+#$D#$A;
          liH := 27; liV := 42; // 22
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'BARCODE '+IntToStr(liH)+','+IntToStr(liV)+',"128",40,0,0,2,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A;

          liH := 67; liV := 84; // 62
          if rbtnL.Checked then begin
            liH := liH + gcGapH;
            liV := liV + gcGapV;
          end;
          lsPrint := lsPrint
                    +'TEXT '+IntToStr(liH)+','+IntToStr(liV)+',"2",0,1,1,'+'"'+ edtBARCODE.Text +'"'+#$D#$A
                    +'PRINT 1,1'+#$D#$A
                    +'EOP'+#$D#$A
                    ;
      end;

      Comm1Prnt1.WriteStr(lsPrint);

      Sleep(200);
    end;

    // 라벨발행내역 저장
    if rbtn1.Checked then begin  
      lsDate  := FormatDateTime('YYYYMMDD',dtpI_DATE.Date);
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
        ParamByName('ITEM_CODE').Value := sgMain.Cells[CD_ITEM_CODE, sgMain.Row];
        ParamByName('PRT_DATE').Value  := lsDate;
        ParamByName('SER_FROM').Value  := Copy(edtBARCODE.Text,1,11);  
        ParamByName('SER_TO').Value    := Copy(edtBARCODE.Text,1,11)
                           + FormatFloat('000',StrToInt(Copy(edtBARCODE.Text,12,3))-1);
        ExecSQL;

      except
        on E : Exception do begin
          ShowMessage (E.Message);
          //FBarcoding.Close;
          Exit;
        end;
      end;
    end;

    Gauge1.Progress := 0;
    pnlPrint.Visible := False;
    Button3.Enabled  := not pnlPrint.Visible;
    sgMain.Enabled   := not pnlPrint.Visible;
    Button1.Enabled  := not pnlPrint.Visible;
end;

procedure TFIItem.rbtn1Click(Sender: TObject);
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
    Params[0].Value := sgMain.Cells[CD_ITEM_CODE, sgMain.Row];
    Params[1].Value := lsDate;
    Open;

    if not IsEmpty then 
      if not Fields[0].IsNull then begin
        edtBARCODE.Text := Copy(FieldByName('SER_TO').Value,1,11)
                         + FormatFloat('000',StrToInt(Copy(FieldByName('SER_TO').Value,12,3))+1);

      end
      else begin
        edtBARCODE.Text := sgMain.Cells[CD_ITEM_CODE, sgMain.Row]
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

procedure TFIItem.rbtn2Click(Sender: TObject);   
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

  edtBARCODE.Text := sgMain.Cells[CD_ITEM_CODE, sgMain.Row]
                   + fn_GetBarCodeDate;
end;

procedure TFIItem.sgMainClick(Sender: TObject);
begin
  if sgMain.Cells[CD_ITEM_GUBUN, sgMain.Row] = gcSerial then begin    
    {
    rbtn1.Enabled := True;
    rbtn1.Checked := True;
    rbtn2.Enabled := False;
    rbtn3.Enabled := False;
    }
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

procedure TFIItem.Button5Click(Sender: TObject);
begin
  edtKAN_CODE.Text := sgMain.Cells[CD_KAN_CODE , sgMain.Row];
  pnCode.Visible   := True;
  edtKAN_CODE.SetFocus;
end;

procedure TFIItem.Button13Click(Sender: TObject);
begin
  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add(' update MT300                  '+
            '    set KAN_CODE = :KAN_CODE   '+
            '  where ITEM_CODE = :ITEM_CODE ');
    Params[0].Value := Trim(edtKAN_CODE.Text);
    Params[1].Value := sgMain.Cells[CD_ITEM_CODE, sgMain.Row];
    ExecSQL;
                       
    pnCode.Visible   := False;
    Application.ProcessMessages;
    pr_qryOpen;
  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFIItem.Button14Click(Sender: TObject);
begin
  pnCode.Visible   := False;
end;

end.



