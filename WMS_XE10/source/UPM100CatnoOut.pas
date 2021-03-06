unit UPM100CatnoOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid,Buttons, AdvObj;

type
  TFPM100CatnoOut = class(TForm)
    qryOpen: TQuery;
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
    sgMain: TAdvStringGrid;
    Label5: TLabel;
    edtCATNO: TEdit;
    sbnLine_S01: TSpeedButton;
    edtITEM_NAME: TEdit;
    dtpI_DATE2: TDateTimePicker;
    Label2: TLabel;
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
    procedure sgMainDblClick(Sender: TObject);

  private
    { Private declarations }
    gsORDER_TYPE : String;


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
  FPM100CatnoOut: TFPM100CatnoOut;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST, UPD122;

{$R *.dfm}

const
  CD_SEQ        = 0;
  CD_CATNO      = 1;
  CD_ITEM_NAME  = 2;
  CD_CODE_SNM   = 3;
  CD_ORDER_NO   = 4;
  CD_QTY        = 5;
  CD_INOUT_QTY  = 6;
  CD_ORDER_UNIT = 7;
  CD_QTY_UNIT   = 8;
  CD_LOC_CODE   = 9;
  CD_EXP_DATE   = 10;
  CD_CUST_NAME  = 11;
  CD_I_DATE     = 12;
  CD_I_ID       = 13;
  CD_P_DATE     = 14;
  CD_P_ID       = 15;
  CD_D_DATE     = 16;
  CD_D_ID       = 17;
  CD_C_DATE     = 18;
  CD_C_ID       = 19;

              

procedure TFPM100CatnoOut.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CatnoOut ,'FPM100CatnoOut');
end;

procedure TFPM100CatnoOut.FormDestroy(Sender: TObject);
begin
  FPM100CatnoOut := nil;
end;

procedure TFPM100CatnoOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100CatnoOut.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CatnoOut.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100CatnoOut.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CatnoOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CatnoOut.FormCreate(Sender: TObject);
begin

  gsORDER_TYPE := gcSell;

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  dtpI_DATE1.Date := now;
  dtpI_DATE2.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100CatnoOut.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100CatnoOut.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQ       ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ORDER_NO  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_INOUT_QTY ] := 'R'; //ColWidths[M_RCV_DT     ] := 50
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;       ;
       gcMGridAlign[CD_QTY_UNIT  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_LOC_CODE  ] := 'C';
       gcMGridAlign[CD_EXP_DATE  ] := 'C';
       gcMGridAlign[CD_CUST_NAME ] := 'L';
       gcMGridAlign[CD_I_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_I_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_P_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_P_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_D_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_D_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_C_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_C_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;

    end;
end;

procedure TFPM100CatnoOut.pr_Clear;
begin

end;

procedure TFPM100CatnoOut.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;

    Params[0].Value := gsORDER_TYPE;

    if RadioButton0.Checked = true then Params[1].Value := '%%';
    if RadioButton1.Checked = true then Params[1].Value := gcSerial;
    if RadioButton2.Checked = true then Params[1].Value := gc88;
    if RadioButton3.Checked = true then Params[1].Value := gcNoSale;

    Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    if length(Trim(edtCATNO.Text)) = 0 then
      qryOpen.Params[4].Value := '%%'
    else
      qryOpen.Params[4].Value := edtCATNO.Text+'%';

    SetLength(la , 1);

    la[0] := CD_QTY;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la); 
    sgMain.ColWidths[CD_ITEM_NAME] := gcITEM_NAMEWidth;

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100CatnoOut.pr_Ready;
begin

end;

procedure TFPM100CatnoOut.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100CatnoOut.sbnLine_S01Click(Sender: TObject);
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

procedure TFPM100CatnoOut.sgMainDblClick(Sender: TObject);
begin
  FPD122 := TFPD122.Create(Self);
  FPD122.edtCATNO.Text     := sgMain.Cells[CD_CATNO,     sgMain.Row];
  FPD122.edtITEM_NAME.Text := sgMain.Cells[CD_ITEM_NAME, sgMain.Row];
  FPD122.dtpI_DATE1        := dtpI_DATE1.Date;
  FPD122.dtpI_DATE2        := dtpI_DATE2.Date;
  FPD122.gsORDER_NO        := sgMain.Cells[CD_ORDER_NO, sgMain.Row];
  FPD122.ShowModal;
end;

end.
