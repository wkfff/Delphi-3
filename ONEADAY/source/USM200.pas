unit USM200;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, Buttons;

type
  TFSM200 = class(TForm)
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
  FSM200: TFSM200;

implementation

uses UDM, ULib, UQMain, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN         =  0;
  CD_PNO          =  1;
  CD_CUST_CODE    =  2;
  CD_ITEM_NAME    =  3;
  CD_IMP_EXPDATE  =  4;
  CD_CODE_SNM     =  5;
  CD_IMP_EXPQTY   =  6;
  CD_IMP_QTY      =  7;
  CD_EXP_QTY      =  8;
  CD_RET_QTY      =  9;
  CD_CHN_QTY      = 10;
  CD_BACK_QTY     = 11;
  CD_DANGA        = 12;
  CD_TAX_GUBUN    = 13;
  CD_CUST_ZIP     = 14;
  CD_CUST_ADDRESS = 15;
  CD_CUST_TEL1    = 16;
  CD_CUST_TEL2    = 17;
  CD_CUST_PER     = 18;
  CD_I_DATE       = 19;
  CD_I_ID         = 20;
  CD_U_DATE       = 21;
  CD_U_ID         = 22;
  CD_ITEM_CODE    = 23;


procedure TFSM200.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFSM200.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSM200.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0004';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSM200.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSM200.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSM200.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSM200.FormDestroy(Sender: TObject);
begin
  FSM200 := nil;
end;

procedure TFSM200.pr_Clear;
begin

end;

procedure TFSM200.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C';
       gcMGridAlign[CD_PNO         ] := 'C';
       gcMGridAlign[CD_CUST_CODE   ] := 'C';
       gcMGridAlign[CD_ITEM_NAME   ] := 'L';
       gcMGridAlign[CD_IMP_EXPDATE ] := 'C';
       gcMGridAlign[CD_CODE_SNM    ] := 'C';
       gcMGridAlign[CD_IMP_EXPQTY  ] := 'R';
       gcMGridAlign[CD_IMP_QTY     ] := 'R'; //HideColumn(CD_IMP_QTY     );
       gcMGridAlign[CD_EXP_QTY     ] := 'R'; //HideColumn(CD_EXP_QTY     );
       gcMGridAlign[CD_RET_QTY     ] := 'R'; //HideColumn(CD_RET_QTY     );
       gcMGridAlign[CD_CHN_QTY     ] := 'R'; //HideColumn(CD_CHN_QTY     );
       gcMGridAlign[CD_BACK_QTY    ] := 'R'; //HideColumn(CD_BACK_QTY    );
       gcMGridAlign[CD_DANGA       ] := 'R';
       gcMGridAlign[CD_TAX_GUBUN   ] := 'C';
       gcMGridAlign[CD_CUST_ZIP    ] := 'C';
       gcMGridAlign[CD_CUST_ADDRESS] := 'L';
       gcMGridAlign[CD_CUST_TEL1   ] := 'C';
       gcMGridAlign[CD_CUST_TEL2   ] := 'C';
       gcMGridAlign[CD_CUST_PER    ] := 'C';
       gcMGridAlign[CD_I_DATE      ] := 'C'; 
       gcMGridAlign[CD_I_ID        ] := 'C'; HideColumn(CD_I_ID        );
       gcMGridAlign[CD_U_DATE      ] := 'C'; //HideColumn(CD_U_DATE      );
       gcMGridAlign[CD_U_ID        ] := 'C'; //HideColumn(CD_U_ID        );
       gcMGridAlign[CD_ITEM_CODE   ] := 'C'; HideColumn(CD_ITEM_CODE   );
    end;
end;

procedure TFSM200.pr_qryOpen;
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
    la[0] := CD_IMP_EXPQTY;
    la[1] := CD_IMP_QTY;
    la[2] := CD_EXP_QTY;
    la[3] := CD_RET_QTY;
    la[4] := CD_CHN_QTY;
    la[5] := CD_BACK_QTY;
    la[6] := CD_DANGA;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);


    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM200.pr_Ready;
begin

end;

procedure TFSM200.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM200.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM200.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSM200.sbnLine_S01Click(Sender: TObject);
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

procedure TFSM200.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSM200 ,'FSM200');
end;

procedure TFSM200.rbSt_AllClick(Sender: TObject);
begin

  Button1.Click;
end;

end.
