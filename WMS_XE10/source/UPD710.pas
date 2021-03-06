unit UPD710;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, Buttons, CPort, MaskUtils, AdvObj;

type
  TFPD710 = class(TForm)
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    btnInsert: TButton;
    btnUpdate: TButton;
    Button4: TButton;
    btnDel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    edtLOC_CODE: TMaskEdit;
    Label2: TLabel;
    edtCATNO: TEdit;
    SpeedButton1: TSpeedButton;
    btnSave: TButton;
    btnCancle: TButton;
    edtITEM_NAME: TEdit;
    qryOpen: TQuery;
    btnPrint: TButton;
    Comm1Prnt1: TComPort;
    rbtup: TRadioButton;
    rbtdown: TRadioButton;
    Label3: TLabel;
    cbPort: TComboBox;
    Label4: TLabel;
    grpS01: TGroupBox;
    Label23: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Mak_Location_From: TMaskEdit;
    Mak_Location_To: TMaskEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel3: TPanel;
    btnQuery: TButton;
    GroupBox2: TGroupBox;
    rbtnOne: TRadioButton;
    rbtnALL: TRadioButton;
    btnPrint2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure sbnLine_S01Click(Sender: TObject);
    procedure edtLOC_CODEExit(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancleClick(Sender: TObject);
    procedure sgMainDblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnPrint2Click(Sender: TObject);
  private
    { Private declarations }

    giInsertMode : Integer; // 1: 추가, 2:수정
    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPD710: TFPD710;

implementation

uses UDM, ULib, UOneADay, UQMain, UPopup;

{$R *.dfm}

const
  CD_SEQN         = 0;
  CD_LOC_CODE     = 1;
  CD_CATNO        = 2;
  CD_ITEM_CODE    = 3;
  CD_ITEM_NAME    = 4;
  CD_I_DATE       = 5;
  CD_I_ID         = 6;
  CD_U_DATE       = 7;
  CD_U_ID         = 8;

procedure TFPD710.FormClose(Sender: TObject; var Action: TCloseAction);
begin           
    Comm1Prnt1.Close;
  Action := caFree;
end;

procedure TFPD710.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPD710.FormCreate(Sender: TObject);
begin      
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  //pr_qryOpen;

  Application.ProcessMessages;

        {
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
       }
  
end;

procedure TFPD710.btnInsertClick(Sender: TObject);
begin

  if fn_ChkAUTH_LEVEL then Exit;
  edtLOC_CODE.Text     := '';
  edtCATNO.Text        := '';
  edtITEM_NAME.Text    := '';
  edtLOC_CODE.ReadOnly := False;
  edtLOC_CODE.Color    := clWindow;

  giInsertMode := 1;

  btnInsert.Enabled := False;
  btnUpdate.Enabled := False;
  btnSave.Enabled   := True;
  btnCancle.Enabled := True;
  btnDel.Enabled    := True;
  //btnprint.Enabled  := False;
  edtLOC_CODE.SetFocus;
end;

procedure TFPD710.btnUpdateClick(Sender: TObject);
begin     
  if fn_ChkAUTH_LEVEL then Exit;
  with sgMain do begin
    edtLOC_CODE.Text     := Cells[CD_LOC_CODE, Row];
    edtCATNO.Text        := Cells[CD_ITEM_CODE, Row];
    edtITEM_NAME.Text    := Cells[CD_ITEM_NAME, Row];
    edtLOC_CODE.ReadOnly := True;
    edtLOC_CODE.Color    := clSilver;
       
    giInsertMode := 2; 

    btnInsert.Enabled := False;
    btnUpdate.Enabled := False;
    btnSave.Enabled   := True;
    btnCancle.Enabled := True;
    btnDel.Enabled    := False;
    //btnprint.Enabled  := False;    

    edtCATNO.SetFocus;
  end;
end;

procedure TFPD710.Button14Click(Sender: TObject);
begin
  edtLOC_CODE.Color    := clWindow;
end;

procedure TFPD710.edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFPD710.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : btnQueryClick(Sender);
    VK_F2 : btnInsertClick(Sender);
    VK_F3 : btnUpdateClick(Sender);
    VK_F4 : btnSaveClick(Sender);
    VK_F5 : btnCancleClick(Sender);
    VK_F6 : btnDelClick(Sender);
    VK_F8 : btnPrintClick(Sender);
    VK_F9 : btnPrint2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPD710.FormDestroy(Sender: TObject);
begin
  FPD710 := nil;
end;

procedure TFPD710.pr_Clear;
begin

end;

procedure TFPD710.pr_Grid_Init;
begin   

    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_LOC_CODE    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_CODE   ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_NAME   ] := 'L'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_I_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_I_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_DATE      ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_U_ID        ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
    end;
end;

procedure TFPD710.pr_qryOpen;
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
                            

    if RadioButton0.Checked then begin
      Params[0].Value := 1;
      Params[1].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[0].Value := 2;
      Params[1].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[0].Value := 2;
      Params[1].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[0].Value := 2;
      Params[1].Value := gcNoSale;
    end;

    if Trim(edtCATNO.Text) = '' then
      Params[2].Value := '%%'
    else
      Params[2].Value := edtCATNO.Text+'%';

    Params[3].Value := fn_DelCharacter(Mak_Location_From.Text);
    Params[4].Value := fn_DelCharacter(Mak_Location_To.Text);

    pr_QryToGridWithoutProgress(qryOpen, sgMain, gcNumeric);
     
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPD710.pr_Ready;
begin

end;

procedure TFPD710.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPD710.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPD710 ,'FPD710');
end;

procedure TFPD710.sbnLine_S01Click(Sender: TObject);
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

procedure TFPD710.edtLOC_CODEExit(Sender: TObject);
begin
  Abort;
end;

procedure TFPD710.btnDelClick(Sender: TObject);
begin
      
  if fn_ChkAUTH_LEVEL then Exit;
  if MessageDlg('삭제 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with DM.qrTemp do try
      Close;
      SQL.Clear;
      SQL.Add(' declare @liCnt int            '+
              ' select @liCnt = count(*)      '+
              '   from pm700                  '+
              '  where loc_code = :LOC_CODE   '+
              ' if @liCnt = 0    begin        '+
              '   DELETE FROM PD710           '+
              '   WHERE LOC_CODE = :LOC_CODE  '+
              '   select 1                    '+
              ' end                           '+
              ' else select 0                 ');

      ParamByName('LOC_CODE').Value := fn_DelCharacter(sgMain.Cells[CD_LOC_CODE, sgMain.Row]);
      Open;
      if Fields[0].Value = 0 then begin
        MessageDlg('사용중인 Loc 정보는 삭제할 수 없습니다.', mtWarning, [mbOk], 0);
        Exit;
      end;
      Application.ProcessMessages;
      pr_qryOpen;

    except
      beep;
      ShowMessage('실패했습니다. 잠시 후에 다시 시도하십시오.');
      exit;
    end;
  end;

end;



procedure TFPD710.btnSaveClick(Sender: TObject);
begin  
  if fn_ChkAUTH_LEVEL then Exit;
  if Length(fn_DelCharacter(edtLOC_CODE.Text)) <> 6 then begin
    MessageDlg(Label1.Caption+ '를 입력하지 않았거나'+#13#10
                              +'잘못 입력 하였습니다.', mtWarning, [mbOk], 0);
    Exit;
  end;
  {
  if edtCATNO.Text = '' then begin
    ShowMessage(Label2.Caption+ '를 선택하지 않았습니다.');
    Exit;
  end;
   }
  if giInsertMode = 1 then
  begin
  // Insert
    if fn_DelCharacter(edtLOC_CODE.Text) = '' then exit;
    try

      DM.qrTemp.Close;
      DM.qrTemp.SQL.Clear;
      DM.qrTemp.SQL.Add(' INSERT INTO PD710                      '+
                        '( LOC_CODE, ITEM_CODE, I_ID, U_ID )     '+
                        'VALUES                                  '+
                        '( :LOC_CODE, :ITEM_CODE, :I_ID, :U_ID ) ');
      DM.qrTemp.Params[0].Value := fn_DelCharacter(edtLOC_CODE.Text);
      DM.qrTemp.Params[1].Value := gsITEM_CODE;
      DM.qrTemp.Params[2].Value := gsUserID;
      DM.qrTemp.Params[3].Value := gsUserID;
      DM.qrTemp.ExecSQL;
      Application.ProcessMessages;

    except
      on E : Exception do begin
        ShowMessage (E.Message);
        edtLOC_CODE.Color    := clWindow;
        Exit;
      end;
    end;
  end
  else
  begin
  // Update
    try
      DM.qrTemp.Close;
      DM.qrTemp.SQL.Clear;
      DM.qrTemp.SQL.Add(
          'UPDATE PD710                                      '+
          'SET                                               '+
          'ITEM_CODE              = :ITEM_CODE,              '+
          'U_DATE                 = CONVERT(VARCHAR(20), GETDATE(), 120), '+
          'U_ID                   = :U_ID                    '+
          'WHERE LOC_CODE         = :LOC_CODE                ');

      DM.qrTemp.Params[0].Value := gsITEM_CODE;
      DM.qrTemp.Params[1].Value := gsUserID;
      DM.qrTemp.Params[2].Value := fn_DelCharacter(edtLOC_CODE.Text);
      DM.qrTemp.ExecSQL;
      Application.ProcessMessages;
     except 
      on E : Exception do begin
        ShowMessage (E.Message);
        edtLOC_CODE.Color    := clWindow;
        Exit;
      end;
    end;
  end;
  Application.ProcessMessages;
  //ShowMessage(' 되었습니다.');
               

  btnInsert.Enabled := True;
  btnUpdate.Enabled := True;
  btnSave.Enabled   := False;
  btnCancle.Enabled := False;
  btnDel.Enabled    := True;
  //btnPrint.Enabled  := True;

  pr_qryOpen;
end;

procedure TFPD710.btnCancleClick(Sender: TObject);
begin   
  if fn_ChkAUTH_LEVEL then Exit;
  edtLOC_CODE.Text     := '';
  edtCATNO.Text        := '';
  edtITEM_NAME.Text    := '';
  edtLOC_CODE.ReadOnly := False;
  edtLOC_CODE.Color    := clSilver;
  gsITEM_CODE          := '';

  giInsertMode := 0;  
               

  btnInsert.Enabled := True;
  btnUpdate.Enabled := True;
  btnSave.Enabled   := False;
  btnCancle.Enabled := False;
  btnDel.Enabled    := True;
  btnPrint.Enabled  := True;
end;

procedure TFPD710.sgMainDblClick(Sender: TObject);
begin
  with sgMain do begin
    edtLOC_CODE.Text  := Cells[CD_LOC_CODE, Row];
    edtCATNO.Text     := Cells[CD_CATNO, Row];
    edtITEM_NAME.Text := Cells[CD_ITEM_NAME, Row];
  end;
end;

procedure TFPD710.btnPrintClick(Sender: TObject);
var
  temp : String;
  liRow : Integer;
begin

   Comm1Prnt1.Port := cbPort.Text;

  if not Comm1Prnt1.Connected then
    Comm1Prnt1.Open;

        {
  if Length(fn_DelCharacter(edtLOC_CODE.Text)) <> 6 then begin
    MessageDlg(Label1.Caption+ '를 선택하지 않았거나'+#13#10
                              +'잘못 입력 하였습니다.', mtWarning, [mbOk], 0);
    Exit;
  end;
       }
  if rbtnOne.Checked then begin  
    if rbtup.Checked = true then begin
      temp :=
               'SIZE 80 mm, 40 mm'+#$D#$A
              +'GAP 3 mm,0 mm'+#$D#$A
              +'SPEED 4'+#$D#$A
              +'DIRECTION 1,0'+#$D#$A
              +'CLS'+#$D#$A
              +'TEXT 185,50,"3",0,3,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'BARCODE 280,210,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'PRINT 1,1'+#$D#$A
              +'EOP'+#$D#$A;
    end
    else if rbtdown.Checked = true then begin
      temp :=
               'SIZE 80 mm, 40 mm' + #$D#$A
              +'GAP 3 mm,0 mm' + #$D#$A
              +'SPEED 4' +#$D#$A
              +'DIRECTION 0,0' +#$D#$A
              +'CLS'+#$D#$A
              +'TEXT 10,50,"3",0,3,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'BARCODE 130,210,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'PRINT 1,1'+#$D#$A
              +'EOP'+#$D#$A;

    end;

    Comm1Prnt1.WriteStr(temp);

    Sleep(200);
  end
  else begin    
    if MessageDlg(FQMain.sbMsg.Panels[0].Text+ '을 출력하시겠습니까?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Exit;
    end;
    for liRow := 1 to sgMain.RowCount do try

        if rbtup.Checked = true then begin
          temp :=
                   'SIZE 80 mm, 40 mm'+#$D#$A
                  +'GAP 3 mm,0 mm'+#$D#$A
                  +'SPEED 4'+#$D#$A
                  +'DIRECTION 1,0'+#$D#$A
                  +'CLS'+#$D#$A
                  +'TEXT 185,50,"3",0,3,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'BARCODE 280,210,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'PRINT 1,1'+#$D#$A
                  +'EOP'+#$D#$A
                  ;
        end
        else if rbtdown.Checked = true then begin
          temp :=
                   'SIZE 80 mm, 40 mm' + #$D#$A
                  +'GAP 3 mm,0 mm' + #$D#$A
                  +'SPEED 4' +#$D#$A
                  +'DIRECTION 0,0' +#$D#$A
                  +'CLS'+#$D#$A
                  +'TEXT 10,50,"3",0,3,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'BARCODE 130,210,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'PRINT 1,1'+#$D#$A
                  +'EOP'+#$D#$A
                  ;

        end;

        Comm1Prnt1.WriteStr(temp);

        Sleep(200);

      except
        beep;
        ShowMessage('출력이 실패 했습니다. 잠시 후에 다시 시도하십시오.');
        exit;
      end;
    end;
end;

procedure TFPD710.btnPrint2Click(Sender: TObject);
var
  temp : String;
  liRow : Integer;
begin

   Comm1Prnt1.Port := cbPort.Text;

  if not Comm1Prnt1.Connected then
    Comm1Prnt1.Open;

        {
  if Length(fn_DelCharacter(edtLOC_CODE.Text)) <> 6 then begin
    MessageDlg(Label1.Caption+ '를 선택하지 않았거나'+#13#10
                              +'잘못 입력 하였습니다.', mtWarning, [mbOk], 0);
    Exit;
  end;
       }
  if rbtnOne.Checked then begin  
    if rbtup.Checked = true then begin
      temp :=
               'SIZE 100 mm, 25 mm'+#$D#$A
              +'GAP 3 mm,0 mm'+#$D#$A
              +'SPEED 4'+#$D#$A
              +'DIRECTION 1,0'+#$D#$A
              +'CLS'+#$D#$A
              +'TEXT 150,20,"3",0,2,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'BARCODE 500,50,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'PRINT 1,1'+#$D#$A
              +'EOP'+#$D#$A;
    end  // 100,30 650,50
    else if rbtdown.Checked = true then begin
      temp :=
               'SIZE 100 mm, 25 mm' + #$D#$A
              +'GAP 3 mm,0 mm' + #$D#$A
              +'SPEED 4' +#$D#$A
              +'DIRECTION 0,0' +#$D#$A
              +'CLS'+#$D#$A
              +'TEXT 20,10,"3",0,2,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'BARCODE 370,60,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, sgMain.Row] +'"'+#$D#$A
              +'PRINT 1,1'+#$D#$A
              +'EOP'+#$D#$A;
    end; // 70,40 430,60

    Comm1Prnt1.WriteStr(temp);

    Sleep(200);
  end
  else begin
    if MessageDlg(FQMain.sbMsg.Panels[0].Text+ '을 세로라벨 출력하시겠습니까?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Exit;
    end;
    for liRow := 1 to sgMain.RowCount do try

        if rbtup.Checked = true then begin
          temp :=
                   'SIZE 100 mm, 25 mm'+#$D#$A
                  +'GAP 3 mm,0 mm'+#$D#$A
                  +'SPEED 4'+#$D#$A
                  +'DIRECTION 1,0'+#$D#$A
                  +'CLS'+#$D#$A
                  +'TEXT 150,20,"3",0,2,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'BARCODE 500,50,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'PRINT 1,1'+#$D#$A
                  +'EOP'+#$D#$A
                  ;
        end
        else if rbtdown.Checked = true then begin
          temp :=
                   'SIZE 100 mm, 25 mm' + #$D#$A
                  +'GAP 3 mm,0 mm' + #$D#$A
                  +'SPEED 4' +#$D#$A
                  +'DIRECTION 0,0' +#$D#$A
                  +'CLS'+#$D#$A
                  +'TEXT 20,10,"3",0,2,6,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'BARCODE 370,60,"128",70,1,0,2,2,'+'"'+ sgMain.Cells[CD_LOC_CODE, liRow] +'"'+#$D#$A
                  +'PRINT 1,1'+#$D#$A
                  +'EOP'+#$D#$A
                  ;
        end;

        Comm1Prnt1.WriteStr(temp);

        Sleep(200);

      except
        beep;
        ShowMessage('출력이 실패 했습니다. 잠시 후에 다시 시도하십시오.');
        exit;
      end;
    end;
end;

procedure TFPD710.btnQueryClick(Sender: TObject);
begin
  pr_qryOpen;
end;

end.
