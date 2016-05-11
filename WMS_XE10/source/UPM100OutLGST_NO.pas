unit UPM100OutLGST_NO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100OutLGST_NO = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Panel2: TPanel;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtLGST_NO: TEdit;
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
  FPM100OutLGST_NO: TFPM100OutLGST_NO;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQN         = 0;
  CD_CUST_NAME    = 1;
  CD_ORDER_NO     = 2;
  CD_CUST_TRANS   = 3;
  CD_LGST_COMPANY = 4;
  CD_LGST_NO      = 5;
  CD_ITEM_GUBUN   = 6;
  CD_CATNO        = 7;
  CD_ITEM_NAME    = 8;
  CD_ORDER_UNIT   = 9;
  CD_QTY          = 10;
  CD_INOUT_QTY    = 11;
  CD_LOC_CODE     = 12;
  CD_EXP_DATE     = 13;
  CD_I_ID         = 14;


procedure TFPM100OutLGST_NO.FormDestroy(Sender: TObject);
begin
  FPM100OutLGST_NO := nil;
end;

procedure TFPM100OutLGST_NO.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100OutLGST_NO ,'FPM100OutLGST_NO');
end;

procedure TFPM100OutLGST_NO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100OutLGST_NO.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100OutLGST_NO.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100OutLGST_NO.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100OutLGST_NO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100OutLGST_NO.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  //dtpI_DATE1.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100OutLGST_NO.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100OutLGST_NO.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CUST_NAME   ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_NO    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CUST_TRANS  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_LGST_COMPANY] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_LGST_NO     ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_CATNO       ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_ITEM_NAME   ] := 'L'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_ORDER_UNIT  ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_QTY         ] := 'R'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_INOUT_QTY   ] := 'R'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_LOC_CODE    ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_EXP_DATE    ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_I_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
    end;
end;

procedure TFPM100OutLGST_NO.pr_Clear;
begin

end;

procedure TFPM100OutLGST_NO.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  if length(Trim(edtLGST_NO.Text)) = 0 then begin
     MessageDlg(Label2.Caption + '를 입력하십시오.', MtWarning, [mbok], 0);
     Exit;
  end;

  with qryOpen do try
    Close;
    
    Params[0].Value := edtLGST_NO.Text;

    SetLength(la , 2);

    la[0] := CD_QTY;
    la[1] := CD_INOUT_QTY;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100OutLGST_NO.pr_Ready;
begin

end;

procedure TFPM100OutLGST_NO.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

end.
