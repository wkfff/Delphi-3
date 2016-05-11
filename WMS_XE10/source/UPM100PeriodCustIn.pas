unit UPM100PeriodCustIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100PeriodCustIn = class(TForm)
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
    dtpI_DATE2: TDateTimePicker;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
    edtCUST_NAME: TEdit;
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
  FPM100PeriodCustIn: TFPM100PeriodCustIn;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQ             = 0;
  CD_EXP_DATE        = 1;
  CD_CUST_NAME       = 2;
  CD_SUM_EA_QTY      = 3;
  CD_SUM_EA_INOUT    = 4;
  CD_SUM_DANGA       = 5;
  CD_SUM_DANGA_INOUT = 6;    

procedure TFPM100PeriodCustIn.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100PeriodCustIn ,'FPM100PeriodCustIn');
end;

procedure TFPM100PeriodCustIn.FormDestroy(Sender: TObject);
begin
  FPM100PeriodCustIn := nil;
end;

procedure TFPM100PeriodCustIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100PeriodCustIn.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100PeriodCustIn.Button1Click(Sender: TObject);
begin

 pr_qryOpen;

end;

procedure TFPM100PeriodCustIn.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100PeriodCustIn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100PeriodCustIn.FormCreate(Sender: TObject);
begin               
  gsORDER_TYPE := gcPurchase;

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

procedure TFPM100PeriodCustIn.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100PeriodCustIn.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQ            ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_EXP_DATE       ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_CUST_NAME      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_SUM_EA_QTY     ] := 'R'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_SUM_DANGA      ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_SUM_EA_INOUT   ] := 'R'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_SUM_DANGA_INOUT] := 'R'; //ColWidths[M_SEQN_NUMB  ] := 50;
    end;
end;

procedure TFPM100PeriodCustIn.pr_Clear;
begin

end;

procedure TFPM100PeriodCustIn.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;        
      
    Params[0].Value := gsORDER_TYPE;

    if length(Trim(edtCUST_CODE.Text)) = 0 then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtCUST_CODE.Text;

    if RadioButton0.Checked then Params[2].Value := '%%'
    else if RadioButton1.Checked then Params[2].Value := gcSerial
    else if RadioButton2.Checked then Params[2].Value := gc88
    else if RadioButton3.Checked then Params[2].Value := gcNoSale;

    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);

    SetLength(la , 4);

    la[0] := CD_SUM_EA_QTY     ;
    la[1] := CD_SUM_EA_INOUT   ;
    la[2] := CD_SUM_DANGA      ;
    la[3] := CD_SUM_DANGA_INOUT;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM100PeriodCustIn.pr_Ready;
begin

end;

procedure TFPM100PeriodCustIn.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100PeriodCustIn.SpeedButton1Click(Sender: TObject);
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
