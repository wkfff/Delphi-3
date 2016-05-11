unit UPM100Qry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, Buttons, ComCtrls, AdvObj;

type
  TFPM100Qry = class(TForm)
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
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TEdit;
    Edit4: TEdit;
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

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPM100Qry: TFPM100Qry;

implementation

uses UDM, ULib, UOneADay, UQMain, UPopup;

{$R *.dfm}

const
  CD_SEQN         = 0;
  CD_LOC_CODE     = 1;
  CD_ITEM_CODE    = 2;
  CD_ITEM_NAME    = 3;
  CD_I_DATE       = 4;
  CD_I_ID         = 5;
  CD_U_DATE       = 6;
  CD_U_ID         = 7;

procedure TFPM100Qry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100Qry.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100Qry.FormCreate(Sender: TObject);
begin      
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100Qry.edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFPM100Qry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100Qry.FormDestroy(Sender: TObject);
begin
  FPM100Qry := nil;
end;

procedure TFPM100Qry.pr_Clear;
begin

end;

procedure TFPM100Qry.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_LOC_CODE    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_CODE   ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_NAME   ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_I_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_I_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
    end;
end;

procedure TFPM100Qry.pr_qryOpen;
begin        
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, gcNumeric);
     
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPM100Qry.pr_Ready;
begin

end;

procedure TFPM100Qry.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100Qry.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100Qry ,'FPM100Qry');
end;

procedure TFPM100Qry.sbnLine_S01Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    if FPopup.ShowModal = mrOK then begin

      edtITEM_CODE.Text := gsITEM_CODE;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

procedure TFPM100Qry.edtLOC_CODEExit(Sender: TObject);
begin
  Abort;
end;

procedure TFPM100Qry.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFPM100Qry.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

end.
