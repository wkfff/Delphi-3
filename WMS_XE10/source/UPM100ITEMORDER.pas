unit UPM100ITEMORDER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, ToolEdit, CurrEdit, Buttons;

type
  TFPM100ITEMORDER = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtITEM_CODE: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Button3: TButton;
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    dtpI_DATE2: TDateTimePicker;
    Label14: TLabel;
    edtCUST_NAME: TEdit;
    Label1: TLabel;
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
  FPM100ITEMORDER: TFPM100ITEMORDER;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const

  CD_SEQN          = 0;
  CD_CUST_NAME     = 1;
  CD_ORDER_NO      = 2;
  CD_ITEM_CODE     = 3;
  CD_ITEM_NAME     = 4;
  CD_ORDER_UNIT    = 5;
  CD_QTY           = 6;
  CD_CUST_CODE     = 7;
  CD_CUST_TRANS    = 8;
  CD_CATNO         = 9;
  CD_KAN_CODE      = 10;
  CD_LOC_CODE      = 11;
  CD_INOUT_QTY     = 12;
  CD_LGST_COMPANY  = 13;
  CD_LGST_NO       = 14;
  CD_I_ID          = 15;

procedure TFPM100ITEMORDER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100ITEMORDER.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100ITEMORDER.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100ITEMORDER.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100ITEMORDER.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100ITEMORDER.FormDestroy(Sender: TObject);
begin
  FPM100ITEMORDER := nil;
end;

procedure TFPM100ITEMORDER.FormCreate(Sender: TObject);
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

procedure TFPM100ITEMORDER.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100ITEMORDER.pr_Grid_Init;
begin
    

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN         ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CUST_NAME    ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_NO     ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_CODE    ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_NAME    ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_UNIT   ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY          ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_CUST_CODE    ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CUST_TRANS   ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CATNO        ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_KAN_CODE     ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_LOC_CODE     ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_INOUT_QTY    ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_LGST_COMPANY ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_LGST_NO      ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_I_ID         ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
    end;
end;

procedure TFPM100ITEMORDER.pr_Clear;
begin

end;

procedure TFPM100ITEMORDER.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  if length(Trim(edtITEM_CODE.Text)) = 0 then qryOpen.Params[0].Value := '%%' else qryOpen.Params[0].Value := edtITEM_CODE.Text;

  if RadioButton0.Checked = true then qryOpen.Params[1].Value := '%%';
  if RadioButton1.Checked = true then qryOpen.Params[1].Value := 'G';
  if RadioButton2.Checked = true then qryOpen.Params[1].Value := 'P';
  if RadioButton3.Checked = true then qryOpen.Params[1].Value := 'B';

  with qryOpen do try
    Close;

    SetLength(la , 1);

    la[0] := CD_QTY;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100ITEMORDER.pr_Ready;
begin

end;

procedure TFPM100ITEMORDER.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100ITEMORDER.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100ITEMORDER ,'FPM100ITEMORDER');
end;

procedure TFPM100ITEMORDER.SpeedButton1Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 2;
    if FPopup.ShowModal = mrOK then begin


    end;
  finally

  end;
end;

end.
