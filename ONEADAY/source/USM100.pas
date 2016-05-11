unit USM100;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, Buttons;

type
  TFSM100 = class(TForm)
    grpS01: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label23: TLabel;
    dtpI_DATE1: TDateTimePicker;
    dtpI_DATE2: TDateTimePicker;
    grpGubun: TGroupBox;
    rbSt_01: TRadioButton;
    rbSt_02: TRadioButton;
    rbSt_03: TRadioButton;
    rbSt_All: TRadioButton;
    rbSt_04: TRadioButton;
    edtORDER_NO: TEdit;
    edtPOST_NO: TEdit;
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
  FSM100: TFSM100;

implementation

uses UDM, ULib, UQMain, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN         =  0;
  CD_POST_NO      =  1;
  CD_TAECBAE_NO   =  2;
  CD_BOX_NAME     =  3;
  CD_RECEIVER     =  4;
  CD_RCV_ZIP      =  5;
  CD_RCV_ADDRESS  =  6;
  CD_RCV_TEL1     =  7;
  CD_RCV_TEL2     =  8;
  CD_ITEM_CODE    =  9;
  CD_ITEM_NAME    = 10;
  CD_ORD_QTY      = 11;
  CD_DANGA        = 12;
  CD_ORD_COMMENT  = 13;
  CD_I_DATE       = 14;
  CD_ORDER_NO     = 15;

procedure TFSM100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFSM100.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSM100.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0006';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSM100.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSM100.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSM100.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSM100.FormDestroy(Sender: TObject);
begin
  FSM100 := nil;
end;

procedure TFSM100.pr_Clear;
begin

end;

procedure TFSM100.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN       ] := 'C';
       gcMGridAlign[CD_POST_NO    ] := 'C';
       gcMGridAlign[CD_TAECBAE_NO ] := 'C';
       gcMGridAlign[CD_BOX_NAME   ] := 'C';
       gcMGridAlign[CD_RECEIVER   ] := 'C';
       gcMGridAlign[CD_RCV_ZIP    ] := 'C';
       gcMGridAlign[CD_RCV_ADDRESS] := 'L';
       gcMGridAlign[CD_RCV_TEL1   ] := 'C'; //HideColumn(CD_IMP_QTY     );
       gcMGridAlign[CD_RCV_TEL1   ] := 'C'; //HideColumn(CD_EXP_QTY     );
       gcMGridAlign[CD_ITEM_CODE  ] := 'C'; //HideColumn(CD_RET_QTY     );
       gcMGridAlign[CD_ITEM_NAME  ] := 'L'; //HideColumn(CD_CHN_QTY     );
       gcMGridAlign[CD_ORD_QTY    ] := 'R'; //HideColumn(CD_BACK_QTY    );
       gcMGridAlign[CD_DANGA      ] := 'R';
       gcMGridAlign[CD_ORD_COMMENT] := 'L';
       gcMGridAlign[CD_I_DATE     ] := 'C';
       gcMGridAlign[CD_ORDER_NO   ] := 'C';
    end;
end;

procedure TFSM100.pr_qryOpen;
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

    if Trim(edtORDER_NO.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtORDER_NO.Text;

    if Trim(edtPOST_NO.Text) = '' then
      Params[2].Value := '%%'
    else
      Params[2].Value := edtPOST_NO.Text;

    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);
    Open;

    SetLength(la , 2);
    la[0] := CD_ORD_QTY;
    la[1] := CD_DANGA;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);


    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM100.pr_Ready;
begin

end;

procedure TFSM100.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM100.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM100.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSM100.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSM100 ,'FSM100');
end;

procedure TFSM100.rbSt_AllClick(Sender: TObject);
begin

  Button1.Click;
end;

end.
