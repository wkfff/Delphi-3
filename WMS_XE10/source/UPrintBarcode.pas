unit UPrintBarcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons,
  TFlatGroupBoxUnit, typInfo, CPort, AdvObj;

type
  TFPMPRINTBARCODE = class(TForm)
    qryOpen: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    Panel2: TPanel;
    Button3: TButton;
    sgMain: TAdvStringGrid;
    pcCondition: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    edtCATNO3: TEdit;
    sbnLine_S01: TSpeedButton;
    edtITEM_NAME3: TEdit;
    Label7: TLabel;
    dtpI_DATE3: TDateTimePicker;
    Label8: TLabel;
    edtBARCODE3: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    edtCATNO2: TEdit;
    SpeedButton2: TSpeedButton;
    edtITEM_NAME2: TEdit;
    Label2: TLabel;
    dtpI_DATE2: TDateTimePicker;
    Label3: TLabel;
    edtBARCODE2: TEdit;
    Label6: TLabel;
    Edit8: TEdit;
    UpDown2: TUpDown;
    Label4: TLabel;
    edtCATNO1: TEdit;
    SpeedButton1: TSpeedButton;
    edtITEM_NAME1: TEdit;
    Label10: TLabel;
    dtpI_DATE1: TDateTimePicker;
    Label11: TLabel;
    edtBARCODE1: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    UpDown3: TUpDown;
    edtITEM_CODE1: TEdit;
    edtITEM_CODE2: TEdit;
    edtITEM_CODE3: TEdit;
    Label13: TLabel;
    edtComport: TEdit;
    Comm1Prnt1: TComPort;
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
    procedure MakeBacodeSangfum(Sender: TObject);
    procedure MakeBacodeJefum(Sender: TObject);

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
  FPMPRINTBARCODE: TFPMPRINTBARCODE;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup, UPM100CUST;

{$R *.dfm}

const
  CD_SEQ        = 0;
  CD_CATNO      = 1;
  CD_ITEM_NAME  = 2;
  CD_CODE_SNM   = 3;
  CD_ORDER_NO   = 4;
  CD_ORDER_UNIT = 5;
  CD_QTY        = 6;
  CD_INOUT_QTY  = 7;
  CD_LOC_CODE   = 8;
  CD_EXP_DATE   = 9;
  CD_CUST_NAME  = 10;
  CD_I_ID       = 11;

              

procedure TFPMPRINTBARCODE.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPMPRINTBARCODE ,'FPMPRINTBARCODE');
end;

procedure TFPMPRINTBARCODE.FormDestroy(Sender: TObject);
begin
  FPMPRINTBARCODE := nil;
end;

procedure TFPMPRINTBARCODE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPMPRINTBARCODE.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPMPRINTBARCODE.Button1Click(Sender: TObject);
var temp : String;
begin

  if gsITEM_CODE = '' then begin
    MessageDlg(Label1.Caption+ '제상품을 선택하여 주세요.', mtWarning, [mbOk], 0);
    Exit;
  end;

  begin
    with DM.qrTemp do try

       if pcCondition.ActivePageIndex = 0 then begin
        temp :=

                 'SIZE 100 mm, 52 mm'+#$D#$A
                +'GAP 3 mm,0 mm'+#$D#$A
                +'DIRECTION 1,0'+#$D#$A
                +'CLS'+#$D#$A
                +'TEXT 150,115,"4",0,1,1,'+'"'+ edtCATNO1.Text +'"'+#$D#$A
                +'TEXT 150,157,"3",0,1,1,'+'"'+ edtITEM_NAME1.Text +'"'+#$D#$A
                +'TEXT 150,186,"3",0,1,1,'+'"'+ edtITEM_NAME1.Text +'"'+#$D#$A
                +'BARCODE 445,225,"128",35,0,0,2,1,'+'"'+ edtBARCODE1.Text +'"'+#$D#$A
                +'TEXT 520,268,"3",0,1,1,'+'"'+ edtBARCODE1.Text +'"'+#$D#$A

                +'TEXT 200,330,"3",0,1,1,'+'"'+ edtBARCODE1.Text +'"'+#$D#$A
                +'BARCODE 485,332,"128",35,0,0,2,1,'+'"'+ edtBARCODE1.Text +'"'+#$D#$A
                +'TEXT 550,372,"3",0,1,1,'+'"'+ edtBARCODE1.Text +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A
                ;
      end
      else if pcCondition.ActivePageIndex = 1 then begin
        temp :=
                 'SIZE 100 mm, 40 mm' + #$D#$A
                +'GAP 3 mm,0 mm' + #$D#$A
                +'DIRECTION 0,0' +#$D#$A
                +'CLS'+#$D#$A
                +'TEXT 150,115,"4",0,1,1,'+'"'+ edtCATNO2.Text +'"'+#$D#$A
                +'TEXT 150,159,"3",0,1,1,'+'"'+ edtITEM_NAME2.Text +'"'+#$D#$A
                +'BARCODE 530,230,"128",35,0,0,2,1,'+'"'+ edtBARCODE2.Text +'"'+#$D#$A
                +'TEXT 550,267,"3",0,1,1,'+'"'+ edtBARCODE2.Text +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A
                ;
      end
      else if pcCondition.ActivePageIndex = 2 then begin
        temp :=
                 'SIZE 35 mm, 15 mm' + #$D#$A
                +'GAP 3 mm,0 mm' + #$D#$A
                +'DIRECTION 0,0' +#$D#$A
                +'CLS'+#$D#$A
                +'TEXT 25,10,"3",0,1,1,'+'"'+ edtCATNO3.Text +'"'+#$D#$A
                +'BARCODE 22,42,"128",40,0,0,2,1,'+'"'+ edtBARCODE3.Text +'"'+#$D#$A
                +'TEXT 62,84,"2",0,1,1,'+'"'+ edtBARCODE3.Text +'"'+#$D#$A
                +'PRINT 1,1'+#$D#$A
                +'EOP'+#$D#$A
                ;
      end;

     Comm1Prnt1.Port := 'COM'+edtComport.Text;
     if not Comm1Prnt1.Connected then
      Comm1Prnt1.Open;
      Comm1Prnt1.WriteStr(temp);

      Sleep(200);

    except
      beep;
      ShowMessage('출력이 실패 했습니다. 잠시 후에 다시 시도하십시오.');
      exit;
    end;
  end;
end;

procedure TFPMPRINTBARCODE.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPMPRINTBARCODE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPMPRINTBARCODE.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;
  dtpI_DATE1.Date := now;
  dtpI_DATE2.Date := now;
  dtpI_DATE2.Date := now;

  //pr_qryOpen;

  Application.ProcessMessages;
  
    with DM.qrTemp do try
      Close;
      SQL.Clear;
      SQL.Add(
              ' select CODE_CD from mt900     '+
              ' where code_tp = :code_tp      ');

      ParamByName('code_tp').Value := '5000';
      Open;
      edtComport.Text := 'COM'+Fields[0].AsString;
    except
      beep;
      ShowMessage('프린터 포트 불러오기 실패! 포트를 입력해 주시기 바랍니다.');
      exit;
    end;
  
end;

procedure TFPMPRINTBARCODE.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPMPRINTBARCODE.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQ       ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ORDER_NO  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ORDER_UNIT] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_QTY       ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_INOUT_QTY ] := 'R'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_LOC_CODE  ] := 'C';
       gcMGridAlign[CD_EXP_DATE  ] := 'C';
       gcMGridAlign[CD_CUST_NAME ] := 'L';
       gcMGridAlign[CD_I_ID      ] := 'C';

    end;
end;

procedure TFPMPRINTBARCODE.pr_Clear;
begin

end;

procedure TFPMPRINTBARCODE.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;
       {
    Params[1].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);

    if length(Trim(edtCATNO.Text)) = 0 then
      qryOpen.Params[2].Value := '%%'
    else
      qryOpen.Params[2].Value := edtCATNO.Text+'%';

    SetLength(la , 1);

    la[0] := CD_QTY;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);
    }

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPMPRINTBARCODE.pr_Ready;
begin

end;

procedure TFPMPRINTBARCODE.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPMPRINTBARCODE.sbnLine_S01Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);

    if FPopup.ShowModal = mrOK then begin
      if pcCondition.ActivePageIndex = 0 then begin
        edtCATNO1.Text := gsCATNO;
        edtITEM_NAME1.Text := gsITEM_NAME;
        edtITEM_CODE1.Text := gsITEM_CODE;
      end;
      if pcCondition.ActivePageIndex = 1 then begin
        edtCATNO2.Text := gsCATNO;
        edtITEM_NAME2.Text := gsITEM_NAME;
        edtITEM_CODE2.Text := gsITEM_CODE;
      end;
      if pcCondition.ActivePageIndex = 2 then begin
        edtCATNO3.Text := gsCATNO;
        edtITEM_CODE3.Text := gsITEM_CODE;
      end;

    end;
  finally

  end;
end;

procedure TFPMPRINTBARCODE.MakeBacodeJefum;
var month, day : String;
begin
  try
     if gsITEM_CODE = '' then begin
       exit;
     end;

     edtBARCODE1.Text := copy(FormatDateTime('YYYYMMDD',dtpI_DATE1.Date),2,2);

     month := copy(FormatDateTime('YYYYMMDD',dtpI_DATE1.Date),4,2);
     day   := copy(FormatDateTime('YYYYMMDD',dtpI_DATE1.Date),6,2);


  finally

  end;
end;

procedure TFPMPRINTBARCODE.MakeBacodeSangfum;
begin
  try
    FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);

  finally

  end;
end;

end.
