unit UPM700Stock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM700Stock = class(TForm)
    Panel1: TPanel;
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
    edtITEM_NAME: TEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Button3: TButton;
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Label4: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label14: TLabel;
    dtpI_DATE2: TDateTimePicker;
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
  FPM700Stock: TFPM700Stock;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const 
  CD_SEQN       = 0;
  CD_WORK_DATE  = 1;  //작업일자
  CD_WORK_NO    = 2;  //작업순번
  CD_ITEM_GUBUN = 3;  //제상품구분
  CD_CATNO      = 4;  //CAT. NO
  CD_ITEM_NAME  = 5;  //제상품명
  CD_LOC_CODE   = 6;  //LOC NO
  CD_QTY        = 7;  //재고반영이전수량
  CD_QTY_EA     = 8;  //재고수량
  CD_STOCK_UNIT = 9;  //재고단위
  CD_U_ID       =10;  //재고단위

  
procedure TFPM700Stock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM700Stock.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM700Stock.Button1Click(Sender: TObject);
begin
 pr_qryOpen;

end;

procedure TFPM700Stock.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM700Stock.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM700Stock.FormDestroy(Sender: TObject);
begin
  FPM700Stock := nil;
end;

procedure TFPM700Stock.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
   
  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;

  
  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM700Stock.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM700Stock.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_WORK_DATE ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_WORK_NO   ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_GUBUN] := 'C'; HideColumn(CD_ITEM_GUBUN);
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_LOC_CODE  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_QTY       ] := 'R'; //HideColumn(CD_QTY);
       gcMGridAlign[CD_QTY_EA    ] := 'R'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_STOCK_UNIT] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_U_ID      ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;

    end;
end;

procedure TFPM700Stock.pr_Clear;
begin

end;

procedure TFPM700Stock.pr_qryOpen;
var
  la : Array of Integer;
begin  
  pr_ClearGrid(sgMain);  
                  {
  if edtITEM_CODE.Text = '' then
    edtITEM_CODE.Text := '0000000';
  if edtITEM_CODE1.Text = '' then
    edtITEM_CODE1.Text := 'zzzzzzz';
  if edtITEM_CODE.Text > edtITEM_CODE1.Text then begin
    ShowMessage('From이 To보다 큽니다..');
    Exit;
  end;           }


  with qryOpen do try
    Close;
    if Trim(edtCATNO.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCATNO.Text;

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

    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    SetLength(la , 2);

    la[0] := CD_QTY;
    la[1] := CD_QTY_EA;
    
    pr_QryToGridWithoutProgress(qryOpen, sgMain, la); 
    //sgMain.ColWidths[CD_ITEM_NAME] := gcITEM_NAMEWidth;
    
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM700Stock.pr_Ready;
begin

end;

procedure TFPM700Stock.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM700Stock.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM700Stock ,'FPM700Stock');
end;

procedure TFPM700Stock.SpeedButton1Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 0;
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

end.
