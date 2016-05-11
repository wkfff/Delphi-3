unit USD130;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, Buttons;

type
  TFSD130 = class(TForm)
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
    Label1: TLabel;
    dtpACC_DATE1: TDateTimePicker;
    dtpACC_DATE2: TDateTimePicker;
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    rbRET_QTY: TRadioButton;
    rb_All: TRadioButton;
    rbCHN_QTY: TRadioButton;
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
  FSD130: TFSD130;

implementation

uses UDM, ULib, UQMain, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN          =  0;
  CD_ACC_NO        =  1;
  CD_ACC_DATE      =  2;
  CD_ACC_PER       =  3;
  CD_REQ_NAME      =  4;
  CD_ORDER_NO      =  5;
  CD_ITEM_CODE     =  6;
  CD_ITEM_NAME     =  7;
  CD_REQ_TEL       =  8;
  CD_ACC_COMMENT   =  9;
  CD_GUBUN         = 10;
  CD_GUBUN_DET     = 11;
  CD_ORDER_STAT    = 12;
  CD_IMP_POST_NO   = 13;
  CD_IMP_DATE      = 14;
  CD_IMP_QTY       = 15;
  CD_EXP_POST_NO   = 16;
  CD_SEND_IMP_DATE = 17;
  CD_EXP_DATE      = 18;
  CD_I_DATE        = 19;
  CD_I_ID          = 20;
  CD_U_DATE        = 21;
  CD_U_ID          = 22;

procedure TFSD130.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFSD130.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSD130.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  dtpACC_DATE1.Date := now - 7;
  dtpACC_DATE2.Date := now;

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0008';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSD130.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSD130.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSD130.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSD130.FormDestroy(Sender: TObject);
begin
  FSD130 := nil;
end;

procedure TFSD130.pr_Clear;
begin

end;

procedure TFSD130.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;
       
       gcMGridAlign[CD_SEQN         ] := 'C';
       gcMGridAlign[CD_ACC_NO       ] := 'C';
       gcMGridAlign[CD_ACC_DATE     ] := 'C';
       gcMGridAlign[CD_ACC_PER      ] := 'C';
       gcMGridAlign[CD_REQ_NAME     ] := 'C';
       gcMGridAlign[CD_ORDER_NO     ] := 'C';
       gcMGridAlign[CD_ITEM_CODE    ] := 'C';
       gcMGridAlign[CD_ITEM_NAME    ] := 'L';
       gcMGridAlign[CD_REQ_TEL      ] := 'C';
       gcMGridAlign[CD_ACC_COMMENT  ] := 'L';
       gcMGridAlign[CD_GUBUN        ] := 'C';
       gcMGridAlign[CD_GUBUN_DET    ] := 'C';
       gcMGridAlign[CD_ORDER_STAT   ] := 'C';
       gcMGridAlign[CD_IMP_POST_NO  ] := 'C';
       gcMGridAlign[CD_IMP_DATE     ] := 'C';
       gcMGridAlign[CD_IMP_QTY      ] := 'R';
       gcMGridAlign[CD_EXP_POST_NO  ] := 'C';
       gcMGridAlign[CD_SEND_IMP_DATE] := 'C';
       gcMGridAlign[CD_EXP_DATE     ] := 'C';
       gcMGridAlign[CD_I_DATE       ] := 'C';
       gcMGridAlign[CD_I_ID         ] := 'C';
       gcMGridAlign[CD_U_DATE       ] := 'C';
       gcMGridAlign[CD_U_ID         ] := 'C';
    end;
end;

procedure TFSD130.pr_qryOpen;
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

    Params[2].Value := FormatDateTime('YYYYMMDD',dtpACC_DATE1.Date);
    Params[3].Value := FormatDateTime('YYYYMMDD',dtpACC_DATE2.Date);

    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[5].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);
                      
    if rb_All.Checked then
      Params[6].Value := '%%'
    else if rbRET_QTY.Checked then
      Params[6].Value := '01'
    else if rbCHN_QTY.Checked then
      Params[6].Value := '02';
    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, CD_IMP_QTY);


    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSD130.pr_Ready;
begin

end;

procedure TFSD130.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSD130.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSD130.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSD130 ,'FSD130');
end;

procedure TFSD130.rbSt_AllClick(Sender: TObject);
begin

  Button1.Click;
end;

end.
