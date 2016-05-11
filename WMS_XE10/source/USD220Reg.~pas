unit USD220Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, ComCtrls, Buttons, ToolEdit, CurrEdit;

type
  TFSD220Reg = class(TForm)
    qryOpen: TQuery;
    Panel1: TPanel;
    btnClose: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    grpS01: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label23: TLabel;
    sbnLine_S01: TSpeedButton;
    Shape8: TShape;
    dtpI_DATE1: TDateTimePicker;
    dtpI_DATE2: TDateTimePicker;
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TStaticText;
    edtPNO: TEdit;
    sgMain: TAdvStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    dtpBACK_DATE: TDateTimePicker;
    edtITEM_CODEsub: TEdit;
    edtITEM_NAMEsub: TStaticText;
    edtPNOsub: TEdit;
    sgSub: TAdvStringGrid;
    Panel6: TPanel;
    Button5: TButton;
    Label7: TLabel;
    edtCUST_CODE: TEdit;
    cedtBACK_QTY: TCurrencyEdit;
    Label9: TLabel;
    cbSET_STAT: TComboBox;
    subqryOpen: TQuery;
    Button3: TButton;
    Button7: TButton;
    Button6: TButton;
    Label2: TLabel;
    Button4: TButton;
    cedtBACK_DATE_SEQ: TCurrencyEdit;
    Label8: TLabel;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Button1Click(Sender: TObject);
    procedure sbnLine_S01Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sgSubGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure sgMainClick(Sender: TObject);
    procedure sgSubClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FFJOBS : string;

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;

    procedure pr_subqryOpen;
  public
    { Public declarations }
  end;

var
  FSD220Reg: TFSD220Reg;

implementation

uses UDM, ULib, UQMain, UOneADay, UPopup;

{$R *.dfm}

const
  // Main
  CD_SEQN        =  0;
  CD_PNO         =  1;
  CD_CUST_CODE   =  2;
  CD_ITEM_CODE   =  3;
  CD_ITEM_NAME   =  4;
  CD_IMP_EXPDATE =  5;
  CD_IMP_EXPQTY  =  6;
  CD_IMP_QTY     =  7;
  CD_EXP_QTY     =  8;
  CD_RET_QTY     =  9;
  CD_CHN_QTY     = 10;
  CD_BACK_QTY    = 11;
  CD_I_DATE      = 12;
  CD_I_ID        = 13;
  CD_U_DATE      = 14;
  CD_U_ID        = 15;

  // Sub
  CD_SUB_SEQN          =  0;
  CD_SUB_PNO           =  1;
  CD_SUB_CUST_CODE     =  2;
  CD_SUB_ITEM_CODE     =  3;
  CD_SUB_ITEM_NAME     =  4;
  CD_SUB_BACK_DATE     =  5;
  CD_SUB_BACK_DATE_SEQ =  6;
  CD_SUB_BACK_QTY      =  7;
  CD_SUB_SEND_EXP_DATE =  8;
  CD_SUB_BACK_COMMENT  =  9;
  CD_SUB_I_DATE        = 10;
  CD_SUB_I_ID          = 11;
  CD_SUB_U_DATE        = 12;
  CD_SUB_U_ID          = 13;


procedure TFSD220Reg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFSD220Reg.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFSD220Reg.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  dtpI_DATE1.Date := now - 7;
  dtpI_DATE2.Date := now;

  dtpBACK_DATE.Date := now;


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0010';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSD220Reg.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSD220Reg.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSD220Reg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
    VK_F4 : Button5Click(Button4);
    VK_F5 : Button5Click(Button5);
    VK_F6 : Button6Click(Sender);
    VK_F7 : Button7Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSD220Reg.FormDestroy(Sender: TObject);
begin
  FSD220Reg := nil;
end;

procedure TFSD220Reg.pr_Clear;
begin
  edtPNOsub.Clear;
  edtCUST_CODE.Clear;
  edtITEM_CODEsub.Clear;
end;

procedure TFSD220Reg.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN       ] := 'C';
       gcMGridAlign[CD_PNO        ] := 'C';
       gcMGridAlign[CD_CUST_CODE  ] := 'C';
       gcMGridAlign[CD_ITEM_CODE  ] := 'C';
       gcMGridAlign[CD_ITEM_NAME  ] := 'L';
       gcMGridAlign[CD_IMP_EXPDATE] := 'C';
       gcMGridAlign[CD_IMP_EXPQTY ] := 'R';
       gcMGridAlign[CD_IMP_QTY    ] := 'R';
       gcMGridAlign[CD_EXP_QTY    ] := 'R';
       gcMGridAlign[CD_RET_QTY    ] := 'R';
       gcMGridAlign[CD_CHN_QTY    ] := 'R';
       gcMGridAlign[CD_BACK_QTY   ] := 'R';
       gcMGridAlign[CD_I_DATE     ] := 'C';
       gcMGridAlign[CD_I_ID       ] := 'C'; HideColumn(CD_I_ID        );
       gcMGridAlign[CD_U_DATE     ] := 'C';
       gcMGridAlign[CD_U_ID       ] := 'C'; HideColumn(CD_U_ID        );
    end;

    with sgSub do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcSGridAlign[CD_SUB_SEQN         ] := 'C';
       gcSGridAlign[CD_SUB_PNO          ] := 'C';HideColumn(CD_SUB_PNO      );
       gcSGridAlign[CD_SUB_CUST_CODE    ] := 'C';HideColumn(CD_SUB_CUST_CODE);
       gcSGridAlign[CD_SUB_ITEM_CODE    ] := 'C';HideColumn(CD_SUB_ITEM_CODE);
       gcSGridAlign[CD_SUB_ITEM_NAME    ] := 'L';HideColumn(CD_SUB_ITEM_NAME);
       gcSGridAlign[CD_SUB_BACK_DATE    ] := 'C';
       gcSGridAlign[CD_SUB_BACK_DATE_SEQ] := 'C';
       gcSGridAlign[CD_SUB_BACK_QTY     ] := 'R';
       gcSGridAlign[CD_SUB_SEND_EXP_DATE] := 'C';
       gcSGridAlign[CD_SUB_BACK_COMMENT ] := 'L'; HideColumn(CD_SUB_BACK_COMMENT        );
       gcSGridAlign[CD_SUB_I_DATE       ] := 'C';
       gcSGridAlign[CD_SUB_I_ID         ] := 'C'; HideColumn(CD_SUB_I_ID        );
       gcSGridAlign[CD_SUB_U_DATE       ] := 'C';
       gcSGridAlign[CD_SUB_U_ID         ] := 'C'; HideColumn(CD_SUB_U_ID        );
    end;
end;

procedure TFSD220Reg.pr_qryOpen;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;

    case cbSET_STAT.ItemIndex of
      gciALL    : Params[0].Value := '%%';
      gciReady  : Params[0].Value := '01';
      gciCancel : Params[0].Value := '02';
      gciIng    : Params[0].Value := '03';
      gciDone   : Params[0].Value := '04';
    end;
    
    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;

    if Trim(edtPNO.Text) = '' then
      Params[2].Value := '%%'
    else
      Params[2].Value := edtPNO.Text;
      
    Params[3].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1.Date);
    Params[4].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2.Date);
    Open;

    SetLength(la , 7);
    
    la[0] := CD_IMP_EXPQTY  ;
    la[1] := CD_IMP_QTY     ;
    la[2] := CD_EXP_QTY     ;
    la[3] := CD_RET_QTY     ;
    la[4] := CD_CHN_QTY     ;
    la[6] := CD_BACK_QTY    ;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSD220Reg.pr_Ready;
begin

end;

procedure TFSD220Reg.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSD220Reg.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
      {
  if sgMain.Cells[CD_RETIRE_DATE, ARow] <> '99991231' then begin
    if (ARow > CD_SEQN) and
       (ACol > CD_SEQN) then begin
      AFont.Color := clRed;
    end;
  end;
  }
end;

procedure TFSD220Reg.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSD220Reg.sbnLine_S01Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    if FPopup.ShowModal = mrOK then begin

      edtITEM_CODE.Text    := gsITEM_CODE;
      edtITEM_NAME.Caption := gsITEM_NAME;
    end;
  finally

  end;

end;

procedure TFSD220Reg.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSD220Reg,'FSD220Reg');
end;

procedure TFSD220Reg.pr_subqryOpen;
var
  la    : Array of Integer;
  liRow : Integer;
begin
  pr_ClearGrid(sgSub);

  with subqryOpen do try
    Close;

    if Trim(edtPNOsub.Text) = '' then
      Params[0].Value := '%%'
    else
      subqryOpen.Params[0].Value := edtPNOsub.Text;

    if Trim(edtCUST_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      subqryOpen.Params[1].Value := edtCUST_CODE.Text;

    if Trim(edtITEM_CODEsub.Text) = '' then
      Params[2].Value := '%%'
    else
      subqryOpen.Params[2].Value := edtITEM_CODEsub.Text;

    pr_QryToGridWithoutProgress(subqryOpen, sgSub, CD_SUB_BACK_QTY);

    for liRow := 1 to sgMain.RowCount - 1 do
      sgMain.CellTypes[CD_SUB_BACK_QTY, liRow];


    pr_SetRecordCount(sgSub);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSD220Reg.sgSubGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin

    HAlign := taCenter;
    If ARow = 0 Then VAlign := vtaCenter
    Else Begin
       Case gcSGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify;       //선택
          'L' :  HAlign := taLeftJustify;  //공장
       End;
    End;
end;

procedure TFSD220Reg.Button3Click(Sender: TObject);
begin

  pr_subqryOpen;

  sgSubClick(Self);
end;

procedure TFSD220Reg.Button5Click(Sender: TObject);
  function fn_Valid:Boolean;
  begin 
    Result := False;
    if cedtBACK_QTY.Value <= 0 then begin
      ShowMessage(Label2.Caption + '은 0보다 커야합니다.');
      Result := True;
    end;
  end;
begin
    if fn_Valid then Exit;

    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' declare @liBACK_DATE_SEQ int                                                        '+
              '   select @liBACK_DATE_SEQ = max(BACK_DATE_SEQ)                                      '+
              '   from dbo.SD220                                                                    '+
              ' where PNO           = :PNO                                                          '+
              '   and CUST_CODE     = :CUST_CODE                                                    '+
              '   and ITEM_CODE     = :ITEM_CODE                                                    '+
              '   and BACK_DATE     = :BACK_DATE                                                    '+
              '   and BACK_DATE_SEQ = :BACK_DATE_SEQ                                                '+
              ' if @@ROWCOUNT = 0 begin                                                            '+
              '   select 0, ''수정할 데이터가 없습니다.''                                           '+
              '   return                                                                            '+
              ' end                                                                                 '+
              ' else begin                                                                          '+
              '   update dbo.SD220                                                                  '+
              '      set BACK_QTY = :BACK_QTY, U_DATE = CONVERT(varchar(20), getdate(),120),        '+
              '          U_ID = :U_ID                                                               '+
              '   where PNO           = :PNO                                                        '+
              '     and CUST_CODE     = :CUST_CODE                                                  '+
              '     and ITEM_CODE     = :ITEM_CODE                                                  '+
              '     and BACK_DATE     = :BACK_DATE                                                  '+
              '     and BACK_DATE_SEQ = :BACK_DATE_SEQ                                              '+
              '   update SM200                                                                      '+
              '      set BACK_QTY = (select sum(BACK_QTY)                                           '+
              '                        from SD220                                                   '+
              '                       where PNO       = :PNO                                        '+
              '                         and CUST_CODE = :CUST_CODE                                  '+
              '                         and ITEM_CODE = :ITEM_CODE),                                '+
              '          U_DATE = CONVERT(varchar(20), getdate(),120),                              '+                          
              '          U_ID = :U_ID                                                               '+
              '    where PNO           = :PNO                                                       '+
              '      and CUST_CODE     = :CUST_CODE                                                 '+
              '      and ITEM_CODE     = :ITEM_CODE                                                 '+
              '   select 1, ''성공''                                                                '+
              ' end                                                                                 ');

      ParamByName('PNO').AsString           := edtPNOsub.Text;
      ParamByName('CUST_CODE').AsString     := edtCUST_CODE.Text;
      ParamByName('ITEM_CODE').AsString     := edtITEM_CODEsub.Text;
      ParamByName('BACK_DATE').AsString     := FormatDateTime('YYYYMMDD',dtpBACK_DATE.DateTime);
      ParamByName('BACK_DATE_SEQ').AsString := FloatToStr(cedtBACK_DATE_SEQ.Value);
      ParamByName('BACK_QTY').Value         := cedtBACK_QTY.Value;
      ParamByName('U_ID').Value             := gsUserID;
      Open;

      if Fields.FieldByNumber(1).Value = 0 then begin
        ShowMessage(Fields.FieldByNumber(2).AsString);
        Exit;
      end;

      Button1Click(Self);
      Button3Click(Self);
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'+E.Message), 'ERROR', MB_OK);
          Exit;
       end;
    end;
end;

procedure TFSD220Reg.Button7Click(Sender: TObject);
begin
  pr_Clear;
end;

procedure TFSD220Reg.Button6Click(Sender: TObject);
begin
    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' insert into SD220    '+
              ' (PNO                 '+
              '       ,CUST_CODE     '+
              '       ,ITEM_CODE     '+
              '       ,BACK_DATE     '+
              '       ,BACK_DATE_SEQ '+
              '       ,BACK_QTY      '+
              '       ,SEND_EXP_DATE '+
              '       ,BACK_COMMENT  '+
              '       ,I_DATE        '+
              '       ,I_ID)         '+
              ' (:PNO                '+
              '       ,CUST_CODE     '+
              '       ,ITEM_CODE     '+
              '       ,BACK_DATE     '+
              '       ,BACK_DATE_SEQ '+
              '       ,BACK_QTY      '+
              '       ,SEND_EXP_DATE '+
              '       ,BACK_COMMENT  '+
              '       ,I_DATE        '+
              '       ,I_ID)         ');
      ExecSQL;
    except
      on E : EDBEngineError do
      begin
        ShowMessage('FSD220Reg : Button5Click');
        Exit;
      end;
    end;
end;

procedure TFSD220Reg.sgMainClick(Sender: TObject);
begin
  with sgMain do begin
    edtPNOsub.Text          := Cells[CD_PNO, Row];
    edtCUST_CODE.Text       := Cells[CD_CUST_CODE, Row];
    edtITEM_CODEsub.Text    := Cells[CD_ITEM_CODE, Row];
    edtITEM_CODEsub.Text    := Cells[CD_ITEM_CODE, Row];
    edtITEM_NAMEsub.Caption := Cells[CD_ITEM_NAME, Row];
  end;

  Button3Click(Self);
end;

procedure TFSD220Reg.sgSubClick(Sender: TObject);
begin
  with sgSub do begin
    dtpBACK_DATE.DateTime   := StrToDateTime(Cells[CD_SUB_BACK_DATE, Row]);
    cedtBACK_DATE_SEQ.Value := StrToFloat(Cells[CD_SUB_BACK_DATE_SEQ, Row]);
    cedtBACK_QTY.Value      := StrToFloat(Cells[CD_SUB_BACK_QTY, Row]);
  end;
end;

procedure TFSD220Reg.Button4Click(Sender: TObject);
  function fn_Valid:Boolean;
  begin 
    Result := False;
    if cedtBACK_QTY.Value <= 0 then begin
      ShowMessage(Label2.Caption + '은 0보다 커야합니다.');
      Result := True;
    end;
  end;
begin
    if fn_Valid then Exit;

    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' declare @liBACK_DATE_SEQ int                                                        '+
              '   select @liBACK_DATE_SEQ = max(BACK_DATE_SEQ)                                      '+
              '   from dbo.SD220                                                                    '+
              ' where PNO           = :PNO                                                          '+
              '   and CUST_CODE     = :CUST_CODE                                                    '+
              '   and ITEM_CODE     = :ITEM_CODE                                                    '+
              '   and BACK_DATE     = :BACK_DATE                                                    '+
              ' if @@ROWCOUNT = 0 begin                                                             '+
              '   set @liBACK_DATE_SEQ = 0                                                          '+
              ' end                                                                                 '+
              ' insert into dbo.SD220                                                               '+
              ' (  PNO, CUST_CODE, ITEM_CODE, BACK_DATE, BACK_DATE_SEQ, BACK_QTY, I_ID)             '+
              ' values                                                                              '+
              ' ( :PNO, :CUST_CODE, :ITEM_CODE, :BACK_DATE, @liBACK_DATE_SEQ+1, :BACK_QTY, :I_ID)   '+
              '   update SM200                                                                      '+
              '      set BACK_QTY = (select sum(BACK_QTY)                                           '+
              '                        from SD220                                                   '+
              '                       where PNO       = :PNO                                        '+
              '                         and CUST_CODE = :CUST_CODE                                  '+
              '                         and ITEM_CODE = :ITEM_CODE),                                '+
              '          U_DATE = CONVERT(varchar(20), getdate(),120),                              '+                          
              '          U_ID = :I_ID                                                               '+
              '    where PNO           = :PNO                                                       '+
              '      and CUST_CODE     = :CUST_CODE                                                 '+
              '      and ITEM_CODE     = :ITEM_CODE                                                 ');

      ParamByName('PNO').AsString        := edtPNOsub.Text;
      ParamByName('CUST_CODE').AsString  := edtCUST_CODE.Text;
      ParamByName('ITEM_CODE').AsString  := edtITEM_CODEsub.Text;
      ParamByName('BACK_DATE').AsString  := FormatDateTime('YYYYMMDD',dtpBACK_DATE.DateTime);
      //ParamByName('BACK_DATE_SEQ').Value := cedtBACK_DATE_SEQ.Value;
      ParamByName('BACK_QTY').Value      := cedtBACK_QTY.Value;
      ParamByName('I_ID').Value          := gsUserID;
      ExecSQL;

      
      Button1Click(Self);
      Button3Click(Self);
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'+E.Message), 'ERROR', MB_OK);
          Exit;
       end;
    end;
end;

end.
