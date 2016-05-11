unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables;

type
  TFUser = class(TForm)
    sgMain: TAdvStringGrid;
    pnCode: TPanel;
    Label69: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnCodeTitle: TPanel;
    Button13: TButton;
    Button14: TButton;
    edCodeName: TEdit;
    edCode: TEdit;
    cbUse: TComboBox;
    meClose: TMaskEdit;
    edPass: TEdit;
    qryOpen: TQuery;
    qryOpenUSERID: TStringField;
    qryOpenNAME: TStringField;
    qryOpenPASSWD: TStringField;
    qryOpenWORK_DEPT: TStringField;
    qryOpenJOB_TITLE: TStringField;
    qryOpenEMAIL: TStringField;
    qryOpenCELLPHONE: TStringField;
    qryOpenWORK_PHONE: TStringField;
    qryOpenCONFIRM_DATE: TStringField;
    qryOpenAUTH_LEVEL: TStringField;
    qryOpenRETIRE_DATE: TStringField;
    qryOpenI_DATE: TStringField;
    qryOpenI_ID: TStringField;
    qryOpenU_DATE: TStringField;
    qryOpenU_ID: TStringField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnCodeTitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnCodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormActivate(Sender: TObject);
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
  FUser: TFUser;

implementation

uses UDM, ULib, UOneADay, UQMain;

{$R *.dfm}

const
  CD_SEQN         =  0;
  CD_USERID       =  1;
  CD_NAME         =  2;
  CD_PASSWD       =  3;
  CD_WORK_DEPT    =  4;
  CD_JOB_TITLE    =  5;
  CD_EMAIL        =  6;
  CD_CELLPHONE    =  7;
  CD_WORK_PHONE   =  8;
  CD_CONFIRM_DATE =  9;
  CD_AUTH_LEVEL   = 10;
  CD_RETIRE_DATE  = 11;
  CD_I_DATE       = 12;
  CD_I_ID         = 13;
  CD_U_DATE       = 14;
  CD_U_ID         = 15;

procedure TFUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFUser.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFUser.FormCreate(Sender: TObject);
begin      
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0002';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFUser.Button1Click(Sender: TObject);
begin
  edCode.Text := '';
  edCodeName.Text := '';
  meClose.Text := '99991231';
  cbUse.ItemIndex := 0;
  edPass.Text := '';
  edCode.ReadOnly := false;
  DM.qrMT100.DisableControls;
  pnCodeTitle.Caption := '사용자관리 - 추가';
  pnCode.Visible := true;
end;

procedure TFUser.Button2Click(Sender: TObject);
begin
  with sgMain do begin
    edCode.Text     := Cells[CD_USERID, Row];
    edCodeName.Text := Cells[CD_NAME, Row];
    meClose.Text    := Cells[CD_RETIRE_DATE, Row];
    cbUse.ItemIndex := 0;
    edPass.Text     := Cells[CD_PASSWD, Row];
    edCode.ReadOnly := true;
    DM.qrMT100.DisableControls;
    pnCodeTitle.Caption := '사용자관리 - 수정';
    pnCode.Visible  := true;
  end;
end;

procedure TFUser.Button14Click(Sender: TObject);
begin
  DM.qrMT100.EnableControls;
  pnCode.Visible := false;
end;

procedure TFUser.Button13Click(Sender: TObject);
begin
  if pos('추가', pnCodeTitle.Caption) > 0 then
  begin
  // Insert
    if edCode.Text = '' then exit;
    try
      DM.qrTemp.Close;
      DM.qrTemp.SQL.Clear;
      DM.qrTemp.SQL.Add(
          'INSERT INTO MT100                                                                      '+ #13+
          '( USERID, NAME, PASSWD, RETIRE_DATE, I_ID, U_ID ) '+ #13+
          'VALUES                                                                                  '+ #13+
          '( :USERID, :NAME, :PASSWD, :RETIRE_DATE, :I_ID, :U_ID ) ' );

      DM.qrTemp.Params[0].Value := edCode.Text;
      DM.qrTemp.Params[1].Value := edCodeName.Text;
      DM.qrTemp.Params[2].Value := edPass.Text;
      DM.qrTemp.Params[3].Value := meClose.Text;
      DM.qrTemp.Params[4].Value := gsUserID;
      DM.qrTemp.Params[5].Value := gsUserID;
      DM.qrTemp.ExecSQL;
      Application.ProcessMessages;  
      
    except
      beep;
      DM.qrMT100.EnableControls;
      ShowMessage(pnCodeTitle.Caption+ '에 실패했습니다. 잠시 후에 다시 시도하십시오.');
      exit;
    end;
  end
  else
  begin
  // Update
    try
      DM.qrTemp.Close;
      DM.qrTemp.SQL.Clear;
      DM.qrTemp.SQL.Add(
          'UPDATE MT100                                      '+ #13+
          'SET                                               '+ #13+
          'NAME                   = :NAME,                   '+ #13+
          'PASSWD                 = :PASSWD,                 '+ #13+
          'RETIRE_DATE            = :RETIRE_DATE,            '+ #13+
          'U_DATE                 = CONVERT(VARCHAR(20), GETDATE(), 120), '+ #13+
          'U_ID                   = :U_ID                    '+ #13+
          'WHERE USERID           = :USERID                  '+ #13+
          '  AND RETIRE_DATE      = :RETIRE_DATE             ');

      DM.qrTemp.Params[0].Value := edCodeName.Text;
      DM.qrTemp.Params[1].Value := edPass.Text;
      DM.qrTemp.Params[2].Value := meClose.Text;
      DM.qrTemp.Params[3].Value := gsUserID;
      DM.qrTemp.Params[4].Value := edCode.Text;
      DM.qrTemp.Params[5].Value := '99991231';
      DM.qrTemp.ExecSQL;
      Application.ProcessMessages;
     except
      beep;
      DM.qrMT100.EnableControls;
      ShowMessage(pnCodeTitle.Caption+ '에 실패했습니다. 잠시 후에 다시 시도하십시오.');
      exit;
    end;
  end;
  DM.qrMT100.Close;
  Application.ProcessMessages;
  ShowMessage(pnCodeTitle.Caption+ ' 되었습니다.');
  pnCode.Visible := false;
  DM.qrMT100.Open;
  DM.qrMT100.EnableControls;
end;

procedure TFUser.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender); 
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFUser.pnCodeTitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  SetCapture(pnCode.Handle);
end;

procedure TFUser.pnCodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(pnCode.Handle,WM_SYSCOMMAND, $F012, 0);
end;

procedure TFUser.FormDestroy(Sender: TObject);
begin
  FUser := nil;
end;

procedure TFUser.pr_Clear;
begin

end;

procedure TFUser.pr_Grid_Init;
begin

    pnCode.Left   := 218;
    pnCode.Top    := 92;
    pnCode.Height := 243;
    pnCode.Width  := 482;
    

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_USERID      ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_NAME        ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_PASSWD      ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_WORK_DEPT   ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_JOB_TITLE   ] := 'C'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_EMAIL       ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_CELLPHONE   ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_WORK_PHONE  ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_CONFIRM_DATE] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_AUTH_LEVEL  ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_RETIRE_DATE ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_I_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_I_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
    end;
end;

procedure TFUser.pr_qryOpen;
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

procedure TFUser.pr_Ready;
begin

end;

procedure TFUser.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFUser.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin

  if sgMain.Cells[CD_RETIRE_DATE, ARow] <> '99991231' then begin
    if (ARow > CD_SEQN) and
       (ACol > CD_SEQN) then begin
      AFont.Color := clRed;
    end;
  end;
end;

procedure TFUser.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFUser ,'FUser');
end;

end.
