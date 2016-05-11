unit UPM100PeriodCatnoOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100PeriodCatnoOut = class(TForm)
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
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    dtpI_DATE2: TDateTimePicker;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
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
  FPM100PeriodCatnoOut: TFPM100PeriodCatnoOut;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQ             = 0;
  CD_EXP_DATE        = 1;
  CD_CATNO           = 2;
  CD_ITEM_NAME       = 3;
  CD_SUM_EA_QTY      = 4;
  CD_SUM_EA_INOUT    = 5;
  CD_SUM_DANGA       = 6;
  CD_SUM_DANGA_INOUT = 7;                          

procedure TFPM100PeriodCatnoOut.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100PeriodCatnoOut ,'FPM100PeriodCatnoOut');
end;

procedure TFPM100PeriodCatnoOut.FormDestroy(Sender: TObject);
begin
  FPM100PeriodCatnoOut := nil;
end;

procedure TFPM100PeriodCatnoOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100PeriodCatnoOut.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100PeriodCatnoOut.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100PeriodCatnoOut.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100PeriodCatnoOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100PeriodCatnoOut.FormCreate(Sender: TObject);
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

procedure TFPM100PeriodCatnoOut.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100PeriodCatnoOut.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQ            ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_EXP_DATE       ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_CATNO          ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_NAME      ] := 'L'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_SUM_EA_QTY     ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_SUM_EA_INOUT   ] := 'R'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_SUM_DANGA      ] := 'R'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_SUM_DANGA_INOUT] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
    end;
end;

procedure TFPM100PeriodCatnoOut.pr_Clear;
begin

end;

procedure TFPM100PeriodCatnoOut.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  if length(Trim(edtCATNO.Text)) = 0 then
    qryOpen.Params[0].Value := '%%'
  else
    qryOpen.Params[0].Value := edtCATNO.Text+'%';

  if RadioButton0.Checked = true then qryOpen.Params[1].Value := '%%';
  if RadioButton1.Checked = true then qryOpen.Params[1].Value := gcSerial;
  if RadioButton2.Checked = true then qryOpen.Params[1].Value := gc88;
  if RadioButton3.Checked = true then qryOpen.Params[1].Value := gcNoSale;

  qryOpen.Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
  qryOpen.Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

  with qryOpen do try
    Close;

    SetLength(la , 4);

    la[0] := CD_SUM_EA_QTY     ;
    la[1] := CD_SUM_EA_INOUT   ;
    la[2] := CD_SUM_DANGA      ;
    la[3] := CD_SUM_DANGA_INOUT;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100PeriodCatnoOut.pr_Ready;
begin

end;

procedure TFPM100PeriodCatnoOut.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100PeriodCatnoOut.SpeedButton1Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

end.
