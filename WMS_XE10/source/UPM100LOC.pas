unit UPM100LOC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, Buttons, ComCtrls, AdvObj;

type
  TFPM100LOC = class(TForm)
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    sbnLine_S01: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtCATNO: TEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TEdit;
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label14: TLabel;
    dtpI_DATE2: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure sbnLine_S01Click(Sender: TObject);
    procedure edtLOC_CODEExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    gcMGridAlign : Array[0..29] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPM100LOC: TFPM100LOC;

implementation

uses UDM, ULib, UOneADay, UQMain, UPopup;

{$R *.dfm}

const
  CD_SEQN          = 0;
  CD_EXP_DATE      = 1;
  CD_ORDER_NO      = 2;
  CD_ITEM_CODE     = 3;
  CD_ITEM_NAME     = 4;
  CD_CATNO         = 5;
  CD_ORDER_UNIT    = 6;
  CD_ORDER_STAT    = 7;
  CD_LOC_CODE      = 8;
  CD_INOUT_QTY     = 9;
  CD_CHECK_QTY     = 10;
  CD_LOC_GUBUN     = 11;
  CD_LOC_CODE1     = 12;
  CD_QTY           = 13;
  CD_QTY_EA        = 14;
  CD_ITEM_GUBUN    = 15;
  CD_I_DATE        = 16;
  CD_I_ID          = 17;
  CD_U_DATE        = 18;
  CD_U_ID          = 19;
  CD_ORDER_STAT1   = 20;
  CD_ITEM_GUBUN1   = 21;

procedure TFPM100LOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100LOC.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100LOC.FormCreate(Sender: TObject);
begin      
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);  

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  Application.ProcessMessages;
  
end;

procedure TFPM100LOC.edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFPM100LOC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100LOC.FormDestroy(Sender: TObject);
begin
  FPM100LOC := nil;
end;

procedure TFPM100LOC.pr_Clear;
begin

end;

procedure TFPM100LOC.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN       ] := 'C';
       gcMGridAlign[CD_EXP_DATE   ] := 'C';
       gcMGridAlign[CD_ORDER_NO   ] := 'C';
       gcMGridAlign[CD_ITEM_CODE  ] := 'C';
       gcMGridAlign[CD_ITEM_NAME  ] := 'L'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CATNO      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_ORDER_UNIT ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_ORDER_STAT ] := 'C';
       gcMGridAlign[CD_LOC_CODE   ] := 'C';
       gcMGridAlign[CD_INOUT_QTY  ] := 'R';
       gcMGridAlign[CD_CHECK_QTY  ] := 'R';
       gcMGridAlign[CD_LOC_GUBUN  ] := 'C';
       gcMGridAlign[CD_LOC_CODE1  ] := 'C';
       gcMGridAlign[CD_QTY        ] := 'R';
       gcMGridAlign[CD_QTY_EA     ] := 'C';
       gcMGridAlign[CD_ITEM_GUBUN ] := 'C';
       gcMGridAlign[CD_I_DATE     ] := 'C';
       gcMGridAlign[CD_I_ID       ] := 'C';
       gcMGridAlign[CD_U_DATE     ] := 'C';
       gcMGridAlign[CD_U_ID       ] := 'C';
       gcMGridAlign[CD_ORDER_STAT1] := 'C'; HideColumn(CD_ORDER_STAT1);
       gcMGridAlign[CD_ITEM_GUBUN1] := 'C'; HideColumn(CD_ITEM_GUBUN1);
    end;
end;

procedure TFPM100LOC.pr_qryOpen;
var
  la : Array of Integer;
begin        
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    

    if Trim(edtCATNO.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCATNO.Text;

    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;

    Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    if RadioButton0.Checked then begin
      Params[4].Value := 1;
      Params[5].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[4].Value := 2;
      Params[5].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[4].Value := 2;
      Params[5].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[4].Value := 2;
      Params[5].Value := gcNoSale;
    end;

    SetLength(la , 3);

    la[0] := CD_QTY          ;
    la[1] := CD_INOUT_QTY    ;
    la[2] := CD_CHECK_QTY    ;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);
     
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPM100LOC.pr_Ready;
begin

end;

procedure TFPM100LOC.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100LOC.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100LOC ,'FPM100LOC');
end;

procedure TFPM100LOC.sbnLine_S01Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    if (Sender = SpeedButton1) then
      FPopup.pcCondition.ActivePageIndex := 0
    else
      FPopup.pcCondition.ActivePageIndex := 1;
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      edtITEM_CODE.Text := gsITEM_CODE;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

procedure TFPM100LOC.edtLOC_CODEExit(Sender: TObject);
begin
  Abort;
end;

procedure TFPM100LOC.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFPM100LOC.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

end.



