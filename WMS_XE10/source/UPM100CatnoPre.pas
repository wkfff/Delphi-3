unit UPM100CatnoPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, ToolEdit, CurrEdit, Buttons;

type
  TFPM100CatnoPre = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel2: TPanel;
    Button3: TButton;
    Label1: TLabel;
    Label5: TLabel;
    edtCATNO: TEdit;
    sbnLine_S01: TSpeedButton;
    edtITEM_NAME: TEdit;
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

    gcMGridAlign : Array[0..27] of Char;   //�׸��� ��� ��ġ ����;
    gcSGridAlign : Array[0..16] of Char;   //�׸��� ��� ��ġ ����;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPM100CatnoPre: TFPM100CatnoPre;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const

  CD_SEQN       = 0;
  CD_CATNO      = 1;
  CD_ITEM_NAME  = 2;
  CD_CODE_SNM   = 3;
  CD_ORDER_NO   = 4;
  CD_ORDER_UNIT = 5;
  CD_QTY        = 6;
  CD_CUST_NAME  = 7;

procedure TFPM100CatnoPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100CatnoPre.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CatnoPre.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100CatnoPre.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CatnoPre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CatnoPre.FormDestroy(Sender: TObject);
begin
  FPM100CatnoPre := nil;
end;

procedure TFPM100CatnoPre.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  //dtpI_DATE1.Date := now - 7;
  //dtpI_DATE2.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100CatnoPre.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl,  True, True);
  end;
end;

procedure TFPM100CatnoPre.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ORDER_NO  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_CUST_NAME ] := 'L'; //ColWidths[M_RCV_DT     ] := 50;
    end;
end;

procedure TFPM100CatnoPre.pr_Clear;
begin

end;

procedure TFPM100CatnoPre.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  if RadioButton0.Checked = true then qryOpen.Params[0].Value := '%%';
  if RadioButton1.Checked = true then qryOpen.Params[0].Value := gcSerial;
  if RadioButton2.Checked = true then qryOpen.Params[0].Value := gc88;
  if RadioButton3.Checked = true then qryOpen.Params[0].Value := gcNoSale;

  if length(Trim(edtCATNO.Text)) = 0 then
    qryOpen.Params[1].Value := '%%'
  else
    qryOpen.Params[1].Value := edtCATNO.Text+'%';


  with qryOpen do try
    Close;

    SetLength(la , 2);

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

procedure TFPM100CatnoPre.pr_Ready;
begin

end;

procedure TFPM100CatnoPre.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If ARow = 0 Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify; //����
          'L' :  HAlign := taLeftJustify;  //����
       End;
    End;
end;

procedure TFPM100CatnoPre.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CatnoPre ,'FPM100CatnoPre');
end;

procedure TFPM100CatnoPre.sbnLine_S01Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text := gsCATNO;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

end.