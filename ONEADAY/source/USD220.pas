unit USD220;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, Buttons;

type
  TFSD220 = class(TForm)
    grpS01: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label23: TLabel;
    sbnLine_S01: TSpeedButton;
    Shape8: TShape;
    dtpI_DATE1: TDateTimePicker;
    dtpI_DATE2: TDateTimePicker;
    grpGubun: TGroupBox;
    rbSt_01: TRadioButton;
    rbSt_02: TRadioButton;
    rbSt_03: TRadioButton;
    rbSt_All: TRadioButton;
    rbSt_04: TRadioButton;
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TStaticText;
    edtPNO: TEdit;
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Button1Click(Sender: TObject);
    procedure sbnLine_S01Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rbSt_AllClick(Sender: TObject);
  private
    { Private declarations }
    FFJOBS : string;

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
  FSD220: TFSD220;

implementation

uses UDM, ULib, UQMain, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN          =  0;
  CD_PNO           =  1;
  CD_CUST_CODE     =  2;
  CD_ITEM_CODE     =  3;
  CD_ITEM_NAME     =  4;
  CD_BACK_DATE     =  5;
  CD_BACK_DATE_SEQ =  6;
  CD_IMP_EXPDATE   =  7;
  CD_IMP_EXPQTY    =  8;
  CD_IMP_QTY       =  9;
  CD_EXP_QTY       = 10;
  CD_RET_QTY       = 11;
  CD_CHN_QTY       = 12;
  CD_BACK_QTY      = 13;
  CD_SEND_EXP_DATE = 14;
  CD_BACK_COMMENT  = 15;
  CD_I_DATE        = 16;
  CD_I_ID          = 17;
  CD_U_DATE        = 18;
  CD_U_ID          = 19;


procedure TFSD220.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFSD220.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSD220.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0009';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSD220.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSD220.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSD220.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSD220.FormDestroy(Sender: TObject);
begin
  FSD220 := nil;
end;

procedure TFSD220.pr_Clear;
begin

end;

procedure TFSD220.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN         ] := 'C';
       gcMGridAlign[CD_PNO          ] := 'C';
       gcMGridAlign[CD_CUST_CODE    ] := 'C';
       gcMGridAlign[CD_ITEM_CODE    ] := 'C';
       gcMGridAlign[CD_ITEM_NAME    ] := 'L';
       gcMGridAlign[CD_BACK_DATE    ] := 'C';
       gcMGridAlign[CD_BACK_DATE_SEQ] := 'C';
       gcMGridAlign[CD_IMP_EXPDATE  ] := 'C';
       gcMGridAlign[CD_IMP_EXPQTY   ] := 'R';
       gcMGridAlign[CD_IMP_QTY      ] := 'R';
       gcMGridAlign[CD_EXP_QTY      ] := 'R';
       gcMGridAlign[CD_RET_QTY      ] := 'R';
       gcMGridAlign[CD_CHN_QTY      ] := 'R';
       gcMGridAlign[CD_BACK_QTY     ] := 'R';
       gcMGridAlign[CD_SEND_EXP_DATE] := 'C';
       gcMGridAlign[CD_BACK_COMMENT ] := 'L';
       gcMGridAlign[CD_I_DATE       ] := 'C';
       gcMGridAlign[CD_I_ID         ] := 'C'; HideColumn(CD_I_ID        );
       gcMGridAlign[CD_U_DATE       ] := 'C';
       gcMGridAlign[CD_U_ID         ] := 'C'; HideColumn(CD_U_ID        );
    end;
end;

procedure TFSD220.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;

    if rbSt_All.Checked then
      Params[0].Value := '%%'
    else if rbSt_01.Checked then
      Params[0].Value := '01'
    else if rbSt_02.Checked then
      Params[0].Value := '02'
    else if rbSt_03.Checked then
      Params[0].Value := '03'
    else if rbSt_04.Checked then
      Params[0].Value := '04';

    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;

    if Trim(edtPNO.Text) = '' then
      Params[2].Value := '%%'
    else
      Params[2].Value := edtPNO.Text;

    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);
    Open;

    SetLength(la , 7);
    
    la[0] := CD_IMP_EXPQTY  ;
    la[1] := CD_IMP_QTY     ;
    la[2] := CD_EXP_QTY     ;
    la[3] := CD_RET_QTY     ;
    la[4] := CD_CHN_QTY     ;
    la[5] := CD_BACK_QTY    ;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);


    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSD220.pr_Ready;
begin

end;

procedure TFSD220.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSD220.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
      {
  if sgMain.Cells[CD_RETIRE_DATE, ARow] <> '99991231' then begin
    if (ARow > CD_SEQN) and
       (ACol > CD_SEQN) then begin
      AFont.Color := clRed;
    end;
  end;
  }
end;

procedure TFSD220.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSD220.sbnLine_S01Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    if FPopup.ShowModal = mrOK then begin

      edtITEM_CODE.Text    := gsITEM_CODE;
      edtITEM_NAME.Caption := gsITEM_NAME;
    end;
  finally

  end;

end;

procedure TFSD220.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSD220,'FSD220');
end;

procedure TFSD220.rbSt_AllClick(Sender: TObject);
begin

  Button1.Click;
end;

end.
