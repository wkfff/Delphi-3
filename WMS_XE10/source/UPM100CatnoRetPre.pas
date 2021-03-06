unit UPM100CatnoRetPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100CatnoRetPre = class(TForm)
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
    Label1: TLabel;
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
    procedure sbnLine_S01Click(Sender: TObject);
  
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
  FPM100CatnoRetPre: TFPM100CatnoRetPre;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const

  CD_SEQN       = 0;
  CD_CATNO      = 1;
  CD_ITEM_NAME  = 2;
  CD_CODE_SNM   = 3;
  CD_ORDER_NO   = 4;
  CD_QTY        = 5;
  CD_ORDER_UNIT = 6;
  CD_QTY_UNIT   = 7;
  CD_CUST_NAME  = 8;

procedure TFPM100CatnoRetPre.FormDestroy(Sender: TObject);
begin
  FPM100CatnoRetPre := nil;
end;

procedure TFPM100CatnoRetPre.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100CatnoRetPre ,'FPM100CatnoRetPre');
end;

procedure TFPM100CatnoRetPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100CatnoRetPre.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100CatnoRetPre.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100CatnoRetPre.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100CatnoRetPre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100CatnoRetPre.FormCreate(Sender: TObject);
begin           
  gsORDER_TYPE := gcReturn;

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  //dtpI_DATE1.Date := now - 7;
  //dtpI_DATE2.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100CatnoRetPre.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl,  True, True);
  end;
end;

procedure TFPM100CatnoRetPre.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ORDER_NO  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY_UNIT  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CUST_NAME ] := 'L'; //ColWidths[M_RCV_DT     ] := 50;
    end;
end;

procedure TFPM100CatnoRetPre.pr_Clear;
begin

end;

procedure TFPM100CatnoRetPre.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;             
      
    Params[0].Value := gsORDER_TYPE;

    if RadioButton0.Checked then Params[1].Value := '%%'
    else if RadioButton1.Checked then Params[1].Value := gcSerial
    else if RadioButton2.Checked then Params[1].Value := gc88
    else if RadioButton3.Checked then Params[1].Value := gcNoSale;

    if length(Trim(edtCATNO.Text)) = 0 then
      Params[2].Value := '%%'
    else
      Params[2].Value := edtCATNO.Text+'%';

    SetLength(la , 2);

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

procedure TFPM100CatnoRetPre.pr_Ready;
begin

end;

procedure TFPM100CatnoRetPre.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100CatnoRetPre.sbnLine_S01Click(Sender: TObject);
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

end.
