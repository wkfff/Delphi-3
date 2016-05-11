unit UPM100OutOrderNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFPM100OutOrderNo = class(TForm)
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Panel2: TPanel;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtORDER_NO: TEdit;
    edtITEM_NAME: TEdit;
    sbnLine_S01: TSpeedButton;
    edtCATNO: TEdit;
    Label5: TLabel;
    Label23: TLabel;
    edtCUST_CODE: TEdit;
    SpeedButton1: TSpeedButton;
    edtCUST_NAME: TEdit;
    COMM_Proc: TStoredProc;
    Label3: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label4: TLabel;
    dtpI_DATE2: TDateTimePicker;
    chkEnd: TCheckBox;
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
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..16] of Char;   //그리드 출력 위치 설정;
    procedure SP_DAIHAN2_PM100_QRY_06(Sender: TObject; as_DATE_FROM, as_DATE_TO, as_ORDER_NO, as_CUST_NAME, as_CATNO, as_ORDER_STAT : String);
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPM100OutOrderNo: TFPM100OutOrderNo;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQN         = 0;
  CD_CUST_NAME    = 1;
  CD_ORDER_NO     = 2;
  CD_ITEM_GUBUN   = 3;
  CD_CATNO        = 4;
  CD_ITEM_NAME    = 5;
  CD_ORDER_UNIT   = 6;
  CD_QTY          = 7;
  CD_EXP_DATE     = 8;
  CD_I_DATE       = 9;
  CD_I_ID         = 10;
  CD_P_DATE       = 11;
  CD_P_ID         = 12;
  CD_P_PICK_QTY   = 13;
  CD_D_DATE       = 14;
  CD_D_ID         = 15;
  CD_D_SORT_QTY   = 16;
  CD_C_DATE       = 17;
  CD_C_ID         = 18;
  CD_C_INOUT_QTY  = 19;


procedure TFPM100OutOrderNo.FormDestroy(Sender: TObject);
begin
  FPM100OutOrderNo := nil;
end;

procedure TFPM100OutOrderNo.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM100OutOrderNo ,'FPM100OutOrderNo');
end;

procedure TFPM100OutOrderNo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM100OutOrderNo.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM100OutOrderNo.Button1Click(Sender: TObject);
var
    sORDER_STAT : String;
begin
    if chkEND.Checked = True then sORDER_STAT := '25'
    else sORDER_STAT := '%%';

    SP_DAIHAN2_PM100_QRY_06(sgMain
                            , FormatDateTime('YYYYMMDD',dtpI_DATE1.Date)
                            , FormatDateTime('YYYYMMDD',dtpI_DATE2.Date)
                            , edtORDER_NO.Text
                            , edtCUST_NAME.Text
                            , edtCATNO.Text
                            , sORDER_STAT);
 //pr_qryOpen;

end;

procedure TFPM100OutOrderNo.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM100OutOrderNo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM100OutOrderNo.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  //dtpI_DATE1.Date := now;

  dtpI_DATE1.Date := now;
  dtpI_DATE2.Date := now;

  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM100OutOrderNo.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM100OutOrderNo.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CUST_NAME   ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_NO    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CATNO       ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_ITEM_NAME   ] := 'L'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_ORDER_UNIT  ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_QTY         ] := 'R'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_EXP_DATE    ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_I_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_I_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_P_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_P_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_P_PICK_QTY  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_D_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_D_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_D_SORT_QTY  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_C_DATE      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_C_ID        ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_C_INOUT_QTY  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
    end;
end;

procedure TFPM100OutOrderNo.pr_Clear;
begin

end;

procedure TFPM100OutOrderNo.SP_DAIHAN2_PM100_QRY_06(Sender: TObject; as_DATE_FROM, as_DATE_TO, as_ORDER_NO, as_CUST_NAME, as_CATNO, as_ORDER_STAT : String);
var
    iCnt, iLoop : Integer;
    grid  : TAdvStringGrid;
begin
    grid := Sender As TAdvStringGrid;
    Grid_Clear(grid);
    try
        with COMM_Proc do
        begin
            Close;
            Unprepare;
            StoredProcName := 'dbo.SP_DAIHAN2_PM100_QRY_06';
            Params.Clear;
            Params.CreateParam(ftString,'@A_DATE_FROM' , ptinput).AsString := as_DATE_FROM;   // 출고 순번
            Params.CreateParam(ftString,'@A_DATE_TO'   , ptinput).AsString := as_DATE_TO;    // 출고 일자
            Params.CreateParam(ftString,'@A_ORDER_NO'  , ptinput).AsString := as_ORDER_NO;   // 출고 순번
            Params.CreateParam(ftString,'@A_CUST_NAME' , ptinput).AsString := as_CUST_NAME;    // 출고 일자
            Params.CreateParam(ftString,'@A_CATNO'     , ptinput).AsString := as_CATNO;    // 출고 일자
            Params.CreateParam(ftString,'@A_ORDER_STAT', ptinput).AsString := as_ORDER_STAT;    // 출고 일자
            Open;
            grid.RowCount := 2;
            if isEmpty = False then
            begin
                iCnt := 1;
                while not eof do
                begin
                    grid.Cells[0,iCnt] := IntToStr(iCnt);
                    For iLoop := 1 To grid.ColCount - 1 Do
                    begin
                        grid.Cells[iLoop,iCnt] := Trim(Fields.FieldByNumber(iLoop).AsString);
                    end;

                    if iCnt <> 1 then grid.RowCount := grid.RowCount + 1;
                    Inc(iCnt);
                    Next;
                end;
            end
            else
            begin
//                proc_StatusMSG('검색된 자료가 없습니다.');
//                gsErrMsg := '검색된 자료가 없습니다.';
            end;
            Close;
            UnPrepare;

            grid.AutoNumberCol(0);
            grid.AutoSize := True;

            pr_SetRecordCount(grid)
        end;
        COMM_Proc.Close;
    except
        on E: Exception do
        begin
//            func_ShowMsg(E.Message,'Continental',ERROK);
            Exit;
        end;
    end;
end;

procedure TFPM100OutOrderNo.pr_Ready;
begin

end;

procedure TFPM100OutOrderNo.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM100OutOrderNo.sbnLine_S01Click(Sender: TObject);
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

procedure TFPM100OutOrderNo.SpeedButton1Click(Sender: TObject);
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
