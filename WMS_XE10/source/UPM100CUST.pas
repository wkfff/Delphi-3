unit UPM100CUST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100CUST = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
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
    Label1: TLabel;
    edtITEM_CODE: TEdit;
    sbnLine_S01: TSpeedButton;
    edtITEM_NAME: TEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Button3: TButton;
    Label2: TLabel;
    edtITEM_CODE1: TEdit;
    SpeedButton2: TSpeedButton;
    edtITEM_NAME1: TEdit;
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
    procedure sbnLine_S01Click(Sender: TObject);
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
  FPM100CUST: TFPM100CUST;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN       = 0;
  CD_ORDER_NO   = 1;
  CD_ITEM_CODE  = 2;
  CD_ITEM_NAME  = 3;
  CD_ORDER_UNIT = 4;
  CD_QTY        = 5;
  CD_CUST_CODE  = 6;
  CD_CUST_TRANS = 7;
  CD_CATNO      = 8;
  CD_KAN_CODE   = 9;





procedure TFPM100CUST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100CUST.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CUST.Button1Click(Sender: TObject);
begin
 pr_qryOpen;

end;

procedure TFPM100CUST.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CUST.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CUST.FormDestroy(Sender: TObject);
begin
  FPM100CUST := nil;
end;

procedure TFPM100CUST.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  
  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100CUST.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100CUST.pr_Grid_Init;
begin
    

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_ORDER_NO  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_CODE ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_CUST_CODE ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CUST_TRANS] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_KAN_CODE  ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
    end;
end;

procedure TFPM100CUST.pr_Clear;
begin

end;

procedure TFPM100CUST.pr_qryOpen;
var
  la : Array of Integer;
begin  
  pr_ClearGrid(sgMain);

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

procedure TFPM100CUST.pr_Ready;
begin

end;

procedure TFPM100CUST.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100CUST.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CUST ,'FPM100CUST');
end;

procedure TFPM100CUST.sbnLine_S01Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    if (Sender = SpeedButton1) then
      FPopup.pcCondition.ActivePageIndex := 0
    else
      FPopup.pcCondition.ActivePageIndex := 1;
    if FPopup.ShowModal = mrOK then begin

      if (Sender = SpeedButton2) then begin
        edtITEM_CODE1.Text := gsITEM_CODE;
        edtITEM_NAME1.Text := gsITEM_NAME;
      end
      else begin
        edtCATNO.Text     := gsCATNO;
        edtITEM_CODE.Text := gsITEM_CODE;
        edtITEM_NAME.Text := gsITEM_NAME;
      end;
    end;
  finally

  end;
end;

end.
