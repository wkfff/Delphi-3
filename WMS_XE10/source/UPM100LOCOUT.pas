unit UPM100LocOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100LocOut = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtCUST_CODE: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Button3: TButton;
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
    edtCUST_NAME: TEdit;
    Label4: TLabel;
    Mak_Location_From: TMaskEdit;
    Label5: TLabel;
    Mak_Location_To: TMaskEdit;
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
  FPM100LocOut: TFPM100LocOut;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQ        = 0;
  CD_LOC_CODE   = 1;
  CD_CODE_SNM   = 2;
  CD_CATNO      = 3;
  CD_ITEM_NAME  = 4;
  CD_QTY        = 5;
  CD_ORDER_UNIT = 6;
  CD_QTY_UNIT   = 7;
  CD_EXP_DATE   = 8;
  CD_ORDER_NO   = 9;

procedure TFPM100LocOut.FormDestroy(Sender: TObject);
begin
  FPM100LocOut := nil;
end; 

procedure TFPM100LocOut.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100LocOut ,'FPM100LocOut');
end;

procedure TFPM100LocOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100LocOut.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100LocOut.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100LocOut.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100LocOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100LocOut.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  dtpI_DATE1.Date := now;


  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100LocOut.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100LocOut.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQ       ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_LOC_CODE  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY_UNIT  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_EXP_DATE  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_ORDER_NO  ] := 'C';

    end;
end;

procedure TFPM100LocOut.pr_Clear;
begin

end;

procedure TFPM100LocOut.pr_qryOpen;
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

    if length(Trim(edtCUST_CODE.Text)) = 0 then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCUST_CODE.Text;

    if RadioButton0.Checked then Params[1].Value := '%%'
    else if RadioButton1.Checked then Params[1].Value := gcSerial
    else if RadioButton2.Checked then Params[1].Value := gc88
    else if RadioButton3.Checked then Params[1].Value := gcNoSale;

    Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);

    if length(Trim(edtORDER_NO.Text)) = 0 then
      Params[3].Value := '%%'
    else
      Params[3].Value := edtORDER_NO.Text+'%';

    Params[4].Value := fn_DelCharacter(Mak_Location_From.Text);
    Params[5].Value := fn_DelCharacter(Mak_Location_To.Text);

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

procedure TFPM100LocOut.pr_Ready;
begin

end;

procedure TFPM100LocOut.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100LocOut.SpeedButton1Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 1;
    if FPopup.ShowModal = mrOK then begin

      edtCUST_CODE.Text := gsCUST_CODE;
      edtCUST_NAME.Text := gsCUST_NAME;
    end;
  finally

  end;
end;

end.
