unit UIItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, ToolEdit, CurrEdit;

type
  TFIItem = class(TForm)
    qryOpen: TQuery;
    qryOpenITEM_CODE: TStringField;
    qryOpenITEM_NAME: TStringField;
    qryOpenDANGA: TFloatField;
    qryOpenTAX_GUBUN: TStringField;
    qryOpenIMAGE_URL: TStringField;
    qryOpenKAN_CODE: TStringField;
    qryOpenI_DATE: TStringField;
    qryOpenI_ID: TStringField;
    qryOpenU_DATE: TStringField;
    qryOpenU_ID: TStringField;
    sgMain: TAdvStringGrid;
    pnCode: TPanel;
    Label75: TLabel;
    Label76: TLabel;
    Label1: TLabel;
    pnCodeTitle: TPanel;
    Button13: TButton;
    Button14: TButton;
    edITEM_NAME: TEdit;
    edITEM_CODE: TEdit;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    edDANGA: TCurrencyEdit;
    Label3: TLabel;
    cbTAX_GUBUN: TComboBox;
    Label4: TLabel;
    edIMAGE_URL: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edKAN_CODE: TEdit;
    dtpI_DATE: TDateTimePicker;
    pnRX100: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    pnRX100Title: TPanel;
    Button5: TButton;
    Button6: TButton;
    edITEM_NAMERX100: TEdit;
    edITEM_CODERX100: TEdit;
    edDANGARX100: TCurrencyEdit;
    cbTAX_GUBUNRX100: TComboBox;
    edIMAGE_URLRX100: TEdit;
    edtCUST_TEL1: TEdit;
    edtCUST_CODE: TEdit;
    Label13: TLabel;
    edtPNO: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    dtpIMP_DATE: TDateTimePicker;
    cedtIMP_EXPQTY: TCurrencyEdit;
    Label16: TLabel;
    Label17: TLabel;
    meCUST_ZIP: TMaskEdit;
    edtCUST_ADDRESS: TEdit;
    Label18: TLabel;
    edtCUST_TEL2: TEdit;
    Label19: TLabel;
    edtCUST_PER: TEdit;
    Label20: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    FFJOBS : string;    

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
  FIItem: TFIItem;

implementation

uses UDM, UQMain, ULib, UOneADay;

{$R *.dfm}

const 
  CD_SEQN      =  0; // no
  CD_ITEM_CODE =  1; // no
  CD_ITEM_NAME =  2;
  CD_DANGA     =  3;
  CD_TAX_GUBUN =  4;
  CD_IMAGE_URL =  5;
  CD_KAN_CODE  =  6;
  CD_I_DATE    =  7;
  CD_I_ID      =  8;
  CD_U_DATE    =  9;
  CD_U_ID      = 10;

procedure TFIItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIItem.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIItem.Button1Click(Sender: TObject);
  procedure pr_GetReceive;
  begin         
    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' exec dbo.SP_GET_IMP_PLAN :CP_USERID');
      Params[0].Value := gsUSERID;
      Open;

      if Fields.FieldByNumber(1).AsString = '0' then begin
        ShowMessage(Fields.FieldByNumber(2).AsString);
        Exit;
      end;

    except
      on E : Exception do begin
        ShowMessage (E.Message);
        Exit;
      end;
    end;
  end;
begin

  pnRX100Title.Caption := '제품 관리 - 추가';
  pnRX100.Visible      := True;
  edtPNO.SetFocus;


  // 수신 sp_procedure call
  //pr_GetReceive;
end;

procedure TFIItem.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFIItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button3Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFIItem.FormDestroy(Sender: TObject);
begin
  FIItem := nil;
end;

procedure TFIItem.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pnCode.Left   := 203;
  pnCode.Top    := 89;
  pnCode.Height := 337;
  pnCode.Width  := 597;

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0001';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFIItem.Button3Click(Sender: TObject);
begin
  with sgMain do begin
    edITEM_CODE.Text   := Cells[CD_ITEM_CODE, Row];
    edITEM_NAME.Text   := Cells[CD_ITEM_NAME, Row];
    edDANGA.Text       := Cells[CD_DANGA,     Row];
    cbTAX_GUBUN.Text   := Cells[CD_TAX_GUBUN, Row];
    edIMAGE_URL.Text   := Cells[CD_IMAGE_URL, Row];
    edKAN_CODE.Text    := Cells[CD_KAN_CODE,  Row];
    dtpI_DATE.DateTime := StrToDateTime(Cells[CD_I_DATE,    Row]);
  end;

  edITEM_CODE.ReadOnly := True;
  pnCodeTitle.Caption := '제품 관리 - 수정';
  pnCode.Visible := true;
  edITEM_NAME.SetFocus;
end;

procedure TFIItem.Button13Click(Sender: TObject);
begin

  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add('   update dbo.MT200                                                      '+
            '      set ITEM_NAME = :ITEM_NAME, DANGA = :DANGA, TAX_GUBUN = :TAX_GUBUN '+
            '         ,IMAGE_URL = :IMAGE_URL, KAN_CODE = :KAN_CODE, I_DATE = :I_DATE '+
            '         ,U_DATE    = CONVERT(VARCHAR(20), GETDATE(), 120), U_ID = :U_ID '+
            '    where ITEM_CODE = :ITEM_CODE                                         ');
    ParamByName('ITEM_CODE').AsString  := edITEM_CODE.Text;
    ParamByName('ITEM_NAME').AsString  := edITEM_NAME.Text;
    ParamByName('DANGA').Value         := edDANGA.Value;
    ParamByName('TAX_GUBUN').AsString  := cbTAX_GUBUN.Text;
    ParamByName('IMAGE_URL').AsString  := edIMAGE_URL.Text;

    ParamByName('KAN_CODE').AsString   := edKAN_CODE.Text;
    ParamByName('I_DATE').AsString     := FormatDateTime('YYYY-MM-DD HH:MM:SS', dtpI_DATE.DateTime);
    ParamByName('U_ID').AsString       := gsUserID;
    ExecSQL;

  except
     on E:EDBEngineError do begin
        beep;
        qryOpen.EnableControls;
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
  ShowMessage(pnCodeTitle.Caption+ ' 되었습니다.');
  pnCode.Visible := false;

  pr_qryOpen;
end;

procedure TFIItem.Button14Click(Sender: TObject);
begin
  pnCode.Visible := false;
end;

procedure TFIItem.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFIItem.pr_Grid_Init;
begin

    pnCode.Left   := 247;
    pnCode.Top    := 92;
    pnCode.Height := 274;
    pnCode.Width  := 482;
    

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN     ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_ITEM_CODE] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_NAME] := 'L'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_DANGA    ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_TAX_GUBUN] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_IMAGE_URL] := 'L'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_KAN_CODE ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_I_DATE   ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_I_ID     ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_U_DATE   ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_U_ID     ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
    end;
end;

procedure TFIItem.pr_Clear;
begin

end;

procedure TFIItem.pr_qryOpen;
begin  
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, CD_DANGA);
    
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFIItem.pr_Ready;
begin

end;

procedure TFIItem.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFIItem.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFIItem ,'FIItem');
end;

procedure TFIItem.Button5Click(Sender: TObject);
begin
  with DM.qryOpenIF do try
    Close;
    SQL.Clear;
    SQL.Add('   INSERT INTO oneaday_ord.imp_plan '+
            '	(INS_DATETIME,                   '+
            '	PNO,                             '+
            '	cust_code,                       '+
            '	ITEM_CODE,                       '+
            '	ITEM_NAME,                       '+
            '	IMP_EXPDATE,                     '+
            '	IMP_EXPQTY,                      '+
            '	DANGA,                           '+
            '	TAX_GUBUN,                       '+
            '	IMAGE_URL,                       '+
            '	CUST_ZIP,                        '+
            '	CUST_ADDRESS,                    '+
            '	CUST_TEL1,                       '+
            '	CUST_TEL2,                       '+
            '	CUST_PER,                        '+
            '	RCV_DATETIME                     '+
            '	)                                '+
            '	VALUES                           '+
            '	(:INS_DATETIME,                  '+
            '	:PNO,                            '+
            '	:cust_code,                      '+
            '	:ITEM_CODE,                      '+
            '	:ITEM_NAME,                      '+
            '	:IMP_EXPDATE,                    '+
            '	:IMP_EXPQTY,                     '+
            '	:DANGA,                          '+
            '	:TAX_GUBUN,                      '+
            '	:IMAGE_URL,                      '+
            '	:CUST_ZIP,                       '+
            '	:CUST_ADDRESS,                   '+
            '	:CUST_TEL1,                      '+
            '	:CUST_TEL2,                      '+
            '	:CUST_PER,                       '+
            '	''99991231''                     '+
            '	)                                ');
            
    ParamByName('ITEM_CODE').AsString  := edITEM_CODE.Text;
    ParamByName('ITEM_NAME').AsString  := edITEM_NAME.Text;
    ParamByName('DANGA').Value         := edDANGA.Value;
    ParamByName('TAX_GUBUN').AsString  := cbTAX_GUBUN.Text;
    ParamByName('IMAGE_URL').AsString  := edIMAGE_URL.Text;

    ParamByName('KAN_CODE').AsString   := edKAN_CODE.Text;
    ParamByName('I_DATE').AsString     := FormatDateTime('YYYY-MM-DD HH:MM:SS', dtpI_DATE.DateTime);
    ParamByName('U_ID').AsString       := gsUserID;
    ExecSQL;

  except
     on E:EDBEngineError do begin
        beep;
        qryOpen.EnableControls;
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
  ShowMessage(pnCodeTitle.Caption+ ' 되었습니다.');
  pnCode.Visible := false;

  pr_qryOpen;
end;

procedure TFIItem.Button6Click(Sender: TObject);
begin
  pnRX100.Visible := false;
end;

end.
