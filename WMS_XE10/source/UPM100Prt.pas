unit UPM100Prt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, Buttons, ComCtrls, AdvObj;

type
  TFPM100Prt = class(TForm)
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
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TEdit;
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label14: TLabel;
    dtpI_DATE2: TDateTimePicker;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
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
    procedure sgMainClick(Sender: TObject);
  private
    { Private declarations }

    gcMGridAlign : Array[0..30] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPM100Prt: TFPM100Prt;

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
  CD_SERIAL_NO     = 7;
  CD_ORDER_STAT    = 8;
  CD_ORDER_EA_UNIT = 9;
  CD_QTY           = 10;
  CD_INOUT_QTY     = 11;
  CD_CHECK_QTY     = 12;
  CD_CUST_CODE     = 13;
  CD_CUST_NAME     = 14;
  CD_CUST_TRANS    = 15;
  CD_MANAGER       = 16;
  CD_REMARKS       = 17;
  CD_PRE_INOUT     = 18;
  CD_RETURN_EX_NO  = 19;
  CD_ITEM_GUBUN    = 20;
  CD_I_DATE        = 21;
  CD_I_ID          = 22;
  CD_U_DATE        = 23;
  CD_U_ID          = 24;
  CD_DANGA         = 25;
  CD_TORDER_PRICE  = 26;
  CD_ORDER_CLOSE   = 27;
  CD_RDY_LOC       = 28;
  CD_ORDER_STAT1   = 29;
  CD_ITEM_GUBUN1   = 30;

procedure TFPM100Prt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100Prt.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100Prt.FormCreate(Sender: TObject);
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

procedure TFPM100Prt.edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFPM100Prt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100Prt.FormDestroy(Sender: TObject);
begin
  FPM100Prt := nil;
end;

procedure TFPM100Prt.pr_Clear;
begin

end;

procedure TFPM100Prt.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN         ] := 'C';
       gcMGridAlign[CD_EXP_DATE     ] := 'C';
       gcMGridAlign[CD_ORDER_NO     ] := 'C';
       gcMGridAlign[CD_ITEM_CODE    ] := 'C';
       gcMGridAlign[CD_ITEM_NAME    ] := 'L'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CATNO        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_ORDER_UNIT   ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_ORDER_STAT   ] := 'C';
       gcMGridAlign[CD_ORDER_EA_UNIT] := 'R';
       gcMGridAlign[CD_QTY          ] := 'R';
       gcMGridAlign[CD_INOUT_QTY    ] := 'R';
       gcMGridAlign[CD_CHECK_QTY    ] := 'R';
       gcMGridAlign[CD_CUST_CODE    ] := 'C';
       gcMGridAlign[CD_CUST_NAME    ] := 'L';
       gcMGridAlign[CD_CUST_TRANS   ] := 'C';
       gcMGridAlign[CD_MANAGER      ] := 'C';
       gcMGridAlign[CD_REMARKS      ] := 'L'; HideColumn(CD_REMARKS);
       gcMGridAlign[CD_PRE_INOUT    ] := 'C';
       gcMGridAlign[CD_RETURN_EX_NO ] := 'C'; HideColumn(CD_RETURN_EX_NO);
       gcMGridAlign[CD_ITEM_GUBUN   ] := 'C';
       gcMGridAlign[CD_I_DATE       ] := 'C';
       gcMGridAlign[CD_I_ID         ] := 'C';
       gcMGridAlign[CD_U_DATE       ] := 'C';
       gcMGridAlign[CD_U_ID         ] := 'C';
       gcMGridAlign[CD_DANGA        ] := 'C'; HideColumn(CD_DANGA       );
       gcMGridAlign[CD_TORDER_PRICE ] := 'C'; HideColumn(CD_TORDER_PRICE);
       gcMGridAlign[CD_ORDER_CLOSE  ] := 'C'; HideColumn(CD_ORDER_CLOSE );
       gcMGridAlign[CD_RDY_LOC      ] := 'C'; HideColumn(CD_RDY_LOC     );
       gcMGridAlign[CD_ORDER_STAT1  ] := 'C'; HideColumn(CD_ORDER_STAT1 );
       gcMGridAlign[CD_ITEM_GUBUN1  ] := 'C'; HideColumn(CD_ITEM_GUBUN1 );
    end;
end;

procedure TFPM100Prt.pr_qryOpen;
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

    SetLength(la , 4);

    la[0] := CD_ORDER_EA_UNIT;
    la[1] := CD_QTY          ;
    la[2] := CD_INOUT_QTY    ;
    la[3] := CD_CHECK_QTY    ;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);
     
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPM100Prt.pr_Ready;
begin

end;

procedure TFPM100Prt.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100Prt.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100Prt ,'FPM100Prt');
end;

procedure TFPM100Prt.sbnLine_S01Click(Sender: TObject);
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

procedure TFPM100Prt.edtLOC_CODEExit(Sender: TObject);
begin
  Abort;
end;

procedure TFPM100Prt.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFPM100Prt.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100Prt.sgMainClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(sgMain.Cells[CD_REMARKS, sgMain.Row]);
  SendMessage(Memo1.Handle, WM_KEYDOWN, VK_PRIOR , 0);
end;

end.



