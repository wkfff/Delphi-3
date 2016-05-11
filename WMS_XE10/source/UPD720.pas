unit UPD720;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPD720 = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtCATNO: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    edtITEM_NAME: TEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Button3: TButton;
    Label2: TLabel;
    Mak_Location_From: TMaskEdit;
    Mak_Location_To: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label14: TLabel;
    dtpI_DATE2: TDateTimePicker;
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
    procedure SpeedButton1Click(Sender: TObject);
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
  FPD720: TFPD720;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const 
  CD_SEQN          = 0;
  CD_WORK_DATE     = 1;
  CD_WORK_NO       = 2;
  CD_LOC_CODE      = 3;
  CD_CATNO         = 4;
  CD_ITEM_NAME     = 5;
  CD_ITEM_GUBUN    = 6;
  CD_QTY           = 7;
  CD_QTY_UNIT      = 8;
  CD_MV_LOC_CODE   = 9;
  CD_MV_QTY        = 10;
  CD_I_DATE        = 11;
  CD_I_ID          = 12;
  CD_U_DATE        = 13;
  CD_U_ID          = 14;

procedure TFPD720.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPD720.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPD720.Button1Click(Sender: TObject);
begin
 pr_qryOpen;

end;

procedure TFPD720.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPD720.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPD720.FormDestroy(Sender: TObject);
begin
  FPD720 := nil;
end;

procedure TFPD720.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  
  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;

  
  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPD720.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPD720.pr_Grid_Init;
begin
    

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN         ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_WORK_DATE    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_WORK_NO      ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_LOC_CODE     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME    ] := 'L'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_CATNO        ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_ITEM_GUBUN   ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_QTY          ] := 'R'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_QTY_UNIT  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_MV_LOC_CODE  ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_MV_QTY       ] := 'R'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_I_DATE       ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_I_ID         ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_U_DATE       ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_U_ID         ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
    end;
end;

procedure TFPD720.pr_Clear;
begin

end;

procedure TFPD720.pr_qryOpen; 
var
  la : Array of Integer;
begin  
  pr_ClearGrid(sgMain);  

  if fn_DelCharacter(Mak_Location_From.Text) = '' then
    Mak_Location_From.Text := FormatMaskText('0-00-00-0;0', 'A00000');
  if fn_DelCharacter(Mak_Location_To.Text) = ''   then
    Mak_Location_To.Text := FormatMaskText('0-00-00-0;0', 'Z99999');
  if Mak_Location_From.Text > Mak_Location_To.Text then begin
    ShowMessage('From이 To보다 큽니다..');
    Exit;
  end;


  with qryOpen do try
    Close;
    if Trim(edtCATNO.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCATNO.Text;
    {
    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;
     }
    Params[1].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    Params[3].Value := fn_DelCharacter(Mak_Location_From.Text);
    Params[4].Value := fn_DelCharacter(Mak_Location_To.Text);


    if RadioButton0.Checked then begin
      Params[5].Value := 1;
      Params[6].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[5].Value := 2;
      Params[6].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[5].Value := 2;
      Params[6].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[5].Value := 2;
      Params[6].Value := gcNoSale;
    end;

    SetLength(la , 6);

    la[0] := CD_QTY;
    la[1] := CD_MV_QTY;

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

procedure TFPD720.pr_Ready;
begin

end;

procedure TFPD720.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPD720.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPD720 ,'FPD720');
end;

procedure TFPD720.SpeedButton1Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 0;
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

end.
