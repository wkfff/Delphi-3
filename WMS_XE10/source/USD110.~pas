unit USD110;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, Series, DB,
  DBTables, BaseGrid, AdvGrid, Grids, StdCtrls, ComCtrls, Buttons, Gauges, comobj;
  
type
  TFSD110 = class(TForm)
    qryOpen: TQuery;
    Panel2: TPanel;
    grpS01: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Label1: TLabel;
    edtFileName: TEdit;
    Button3: TButton;
    dlgOpenFile: TOpenDialog;
    sgMain: TAdvStringGrid;
    Button5: TButton;
    Gauge1: TGauge;
    pnlSend: TPanel;
    gaugeProgress: TGauge;
    Label54: TLabel;
    lblSndSts: TLabel;
    memLog: TMemo;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure btnFileOpenClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Grid_Init;
    procedure pr_qryOpen;

    procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Array of Integer);
    
    procedure pr_OpenExcelFile;

  public
    { Public declarations }
  end;

var
  FSD110: TFSD110;

implementation

uses UDM, UQMain, ULib, UOneADay;

{$R *.dfm}

const
  CD_SEQN       = 0;
  CD_ORDER_NO   = 24;
  CD_POST_NO    = 2;
  CD_TAECBAE_NO = 3;
  CD_BOX_NAME   = 4;

procedure TFSD110.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;  

procedure TFSD110.FormDestroy(Sender: TObject);
begin
  FSD110 := nil;
end;

procedure TFSD110.FormCreate(Sender: TObject);
begin
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
           
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  //FFJOBS := '0004';
  
  //pr_qryOpen;

  Application.ProcessMessages;
end;

procedure TFSD110.pr_Grid_Init;
begin
    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN      ] := 'C';
       gcMGridAlign[CD_ORDER_NO  ] := 'C';
       gcMGridAlign[CD_POST_NO   ] := 'C';
       gcMGridAlign[CD_TAECBAE_NO] := 'C';
       gcMGridAlign[CD_BOX_NAME  ] := 'L';
    end;

end;

procedure TFSD110.pr_qryOpen;

  procedure pr_ClearGrid(AGrid:TAdvStringGrid);
  var
    liRow, liCol : Integer;
  begin
    with AGrid do begin
      for liRow := 2 to AGrid.RowCount - 1 do begin
        for liCol := 1 to AGrid.ColCount - 1 do begin
            AGrid.Cells[liCol, liRow] := '';
        end;
      end;
    end;
    AGrid.RowCount := 3;
  end;
var
  la : Array of Integer;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;
    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSD110.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If (ARow = 0) or (ARow = 1) Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify;       //선택
          'L' :  HAlign := taLeftJustify;  //공장
       End;
    End;
end;

procedure TFSD110.pr_QryToGridWithoutProgress(AQuery: TQuery;
  advStringGrid: TadvStringGrid; ANumeric: array of Integer);
var
  //FQWait : TForm;
  //APanel : TPanel;
  //AGauge : TGauge;

  liCol : integer;
  liRow : integer;
  liMax : integer;

  liPos : integer;
  liNumeric : integer;
begin

  //FQWait := TForm.Create(Application);

  try
  {
    FQWait.Height      := 100;
    FQWait.BorderIcons := [];
    FQWait.Position    := poScreenCenter;
    FQWait.Caption     := '데이터를 처리중입니다...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '데이터를 처리중입니다...';
    APanel.Align   := alClient;

    FQWait.Show;
    FQWait.Update;
   }

    liRow := 1;

    AQuery.Open;
    if AQuery.IsEmpty then begin
      //FQWait.Close;
      Exit;
    end;

    if AQuery.Fields.FieldByNumber(1).AsString = '0' then begin
      //FQWait.Close;
      Exit;
    end;

    advStringGrid.RowCount := AQuery.RecordCount + 2;
    //AGauge.MaxValue        := AQuery.RecordCount;


    liMax := High(ANumeric);      

    liPos := 0;

    if liMax = 0 then
      liNumeric := gcNumeric
    else
      liNumeric := ANumeric[liPos];


    while not AQuery.Eof do begin  //Row카운트증가

      //AGauge.Progress := liRow;
      Application.ProcessMessages;

      case liNumeric of
        44 : begin

                for liCol := 0 to AQuery.FieldCount -1 do begin
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
        else begin
                for liCol := 0 to AQuery.FieldCount -1 do begin

                  liMax := 0;
                  for liPos := 0 to High(ANumeric) do
                    if (ANumeric[liPos] = liCol+1) then begin
                      advStringGrid.Cells[liCol+1, liRow+1] := FormatFloat('#,###,###,###',AQuery.Fields[liCol].Value);
                      liMax := 1;
                      Break;
                    end;
                  if liMax = 0 then
                    advStringGrid.Cells[liCol+1,liRow+1] := AQuery.Fields[liCol].AsString;
                end;
             end;
      end;

      liRow := liRow+1;
      AQuery.Next;
      
    end;                             
    advStringGrid.AutoNumberCol(0);
    advStringGrid.AutoSize := True;


    //FQWait.Close;
  finally
    //FQWait.Free;
    //FQWait := nil;
  end;

end;

procedure TFSD110.FormActivate(Sender: TObject);
begin
  //pr_qryOpen;
end;

procedure TFSD110.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSD110.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSD110.Button1Click(Sender: TObject);
begin

  pr_qryOpen;
end;

procedure TFSD110.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSD110.Button3Click(Sender: TObject);
begin

  Try
     If dlgOpenFile.Execute Then
        edtFileName.Text := dlgOpenFile.FileName;
  Except
     Exit;
  End;
  pr_OpenExcelFile;

  //FormCreate(Self);
end;

procedure TFSD110.pr_OpenExcelFile;
var
  Excel, Wbk, Sht: Variant;
  i, iTotCnt, iNorCnt, iDupCnt, iErrCnt, j : integer;
  sOrderNo : String;
  bEofFile : boolean;
  liCol, liRow : Integer;
begin
  lblSndSts.Caption := 'Excel File Examine....';
  pnlSend.Visible := True;
  Application.ProcessMessages;
  Try
    Excel := CreateOleObject('Excel.Application');
  Except
    On EOleError Do Begin
       pnlSend.Visible := False;
       Exit;
    End;
  End;

  Try
    Wbk := Excel.Workbooks.Open[edtFileName.Text];
  Except
    ShowMessage('Not Find Excel Files');
    pnlSend.Visible := False;
    Exit;
  End;

  bEofFile := True;
  Sht := Wbk.Worksheets[1];
  i := 1; iNorCnt := 0; iErrCnt := 0; iDupCnt := 0;
  While bEofFile Do Begin
        sOrderNo := Trim(Sht.Cells[i,2]);
        If Length(sOrderNo) = 0 Then bEofFile := False
        Else Inc(i);
  End;

  If i = 1 Then Begin
     pnlSend.Visible := False;
     Exit;
  End Else iTotCnt := i -1;

  lblSndSts.Caption := 'Excel Data ===>  Temp Table Change';
  memLog.Lines.Add('== Data Convert Start ==');
  Gauge1.MaxValue := iTotCnt;
  gaugeProgress.MaxValue := iTotCnt;
  memLog.Lines.Add('Excel Data : ' + IntToStr(iTotCnt));

  sgMain.RowCount := iTotCnt;

  With sgMain Do Begin
       For liRow := 1 To iTotCnt Do Begin
           Try
              Application.ProcessMessages;
              for liCol := 1 to sgMain.ColCount do begin
                 Cells[liCol, liRow-1] := Sht.Cells[liRow, liCol];
              end;
           Except
              Inc(iErrCnt);
           End;   
           Gauge1.Progress := liRow*liCol;
           gaugeProgress.Progress := liRow*liCol;
           Application.ProcessMessages;
     End;
     Button5.Enabled := True;
  End;
  Wbk.Close;
  With memLog Do Begin
       Lines.Add('Normal Data : ' + IntToStr(iNorCnt));
       Lines.Add('Duplicate Data : ' + IntToStr(iDupCnt));
       Lines.Add('Error Data : ' + IntToStr(iErrCnt));
  End;
  Gauge1.Progress := 0;
  gaugeProgress.Progress := iNorCnt;
    
  sgMain.AutoNumberCol(0);
  sgMain.AutoSize := True;
    
  pnlSend.Visible := False; 
    pr_SetRecordCount(sgMain);
end;

procedure TFSD110.btnFileOpenClick(Sender: TObject);
begin

  Try
     If dlgOpenFile.Execute Then
        edtFileName.Text := dlgOpenFile.FileName;
  Except
     Exit;
  End;
  pr_OpenExcelFile;

  //FormCreate(Self);
end;

procedure TFSD110.Button5Click(Sender: TObject);
var
  liRow : Integer;
begin
  if sgMain.RowCount <= 2 then
    if Trim(sgMain.Cells[CD_ORDER_NO, 1]) = '' then begin
      ShowMessage ('적용할 데이터가 없습니다.');
      Exit;
    end;

  Gauge1.MaxValue := sgMain.RowCount;
                                            
  if not DM.dbMain.InTransaction then
    DM.dbMain.StartTransaction;

  with DM.qryOpen, sgMain do try
    for liRow := 1 to sgMain.RowCount do begin

      if Cells[CD_ORDER_NO  , liRow] = '' then Continue;

      Close;
      SQL.Clear;
      SQL.Add(' update dbo.SD110                                           '+
              '    set POST_NO    = :POST_NO                               '+
              '      , TAECBAE_NO = :TAECBAE_NO                            '+
              '      , BOX_NAME   = :BOX_NAME                              '+
              '      , U_DATE     = CONVERT([varchar](20),getdate(),(120)) '+
              '      , U_ID       = :U_ID                                  '+
              '  where ORDER_NO   = :ORDER_NO                              '+
              ' if @@ROWCOUNT = 0 begin                                    '+
              '   insert into dbo.SD110                                    '+
              '   (ORDER_NO, POST_NO, TAECBAE_NO, BOX_NAME)                '+
              '   values (:ORDER_NO, :POST_NO, :TAECBAE_NO, :BOX_NAME)     '+
              ' end                                                        ');
      ParamByName('ORDER_NO').Value   := Cells[CD_ORDER_NO  , liRow];
      ParamByName('POST_NO').Value    := Cells[CD_POST_NO   , liRow];
      ParamByName('TAECBAE_NO').Value := Cells[CD_TAECBAE_NO, liRow];
      ParamByName('BOX_NAME').Value   := Cells[CD_BOX_NAME  , liRow];
      ParamByName('U_ID').Value       := gsUserID;
      ExecSQL;
      Gauge1.Progress := liRow;
    end;
  except
    on E : Exception do begin
      ShowMessage (E.Message);
      DM.dbMain.Rollback;
      Exit;
    end;
  end;
  DM.dbMain.Commit;
  ShowMessage ('엑셀데이터 적용이 완료되었습니다.');
  Gauge1.Progress := 0;

end;

end.

