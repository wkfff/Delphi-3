unit USM200Month;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, Series, DB,
  DBTables, BaseGrid, AdvGrid, Grids, StdCtrls, ComCtrls, Buttons;

type
  TFSM200Month = class(TForm)
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel2: TPanel;
    grpS01: TGroupBox;
    Label3: TLabel;
    cbYear: TComboBox;
    qryYEAR: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Grid_Init;
    procedure pr_qryOpen;
    procedure pr_qryOpenYear;

    procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Array of Integer);

  public
    { Public declarations }
  end;

var
  FSM200Month: TFSM200Month;

implementation

uses UDM, UQMain, ULib, UOneADay;

{$R *.dfm}

const
  CD_SEQN        =  0;
  CD_IMP_EXPDATE =  1;
  CD_IMP_QTY     =  2;
  CD_DANGA_IMP   =  3;
  CD_EXP_QTY     =  4;
  CD_DANGA_EXP   =  5;
  CD_RET_QTY     =  6;
  CD_DANGA_RET   =  7;
  CD_CHN_QTY     =  8;
  CD_DANGA_CHN   =  9;
  CD_BACK_QTY    = 10;
  CD_DANGA_BACK  = 11;

procedure TFSM200Month.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;  

procedure TFSM200Month.FormDestroy(Sender: TObject);
begin
  FSM200Month := nil;
end;

procedure TFSM200Month.FormCreate(Sender: TObject);
begin
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);


  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  //FFJOBS := '0004';
  pr_qryOpenYear;
  
  pr_qryOpen;

  Application.ProcessMessages;
end;

procedure TFSM200Month.pr_Grid_Init;
var
  i,j,k:integer;
begin

  sgMain.MergeCells(0,0,1,2);  // i,0,3,1 //시작x, 시작y, x개, y개
  sgMain.MergeCells(1,0,1,2);  // i,0,3,1 //시작x, 시작y, x개, y개
                                
  sgMain.Cells[2,0] := '입고';
  sgMain.Cells[4,0] := '출고';
  sgMain.Cells[6,0] := '반품/교환';
  sgMain.Cells[8,0] := '반송';

  with sgMain do begin
    k := 0;
    for i := 2 to ColCount-1 do begin
        j := i mod 2;
        case j of
           0: begin
                //1병합
                sgMain.mergecells(i,0,2,1); // i,0,3,1 //시작x, 시작y, x개, y개
                sgMain.Cells[i,1] := '수량';
              end;
           1: begin
                sgMain.Cells[i,1] := '금액';
              end;
        end;
    end;
  end;
    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN]        := 'C';
       gcMGridAlign[CD_IMP_EXPDATE] := 'C';
       gcMGridAlign[CD_IMP_QTY]     := 'R';
       gcMGridAlign[CD_DANGA_IMP]   := 'R';
       gcMGridAlign[CD_EXP_QTY]     := 'R';
       gcMGridAlign[CD_DANGA_EXP]   := 'R';
       gcMGridAlign[CD_RET_QTY]     := 'R'; //HideColumn(CD_IMP_QTY     );
       gcMGridAlign[CD_DANGA_RET]   := 'R'; //HideColumn(CD_EXP_QTY     );
       gcMGridAlign[CD_CHN_QTY]     := 'R'; //HideColumn(CD_RET_QTY     );
       gcMGridAlign[CD_DANGA_CHN]   := 'R'; //HideColumn(CD_CHN_QTY     );
       gcMGridAlign[CD_BACK_QTY]    := 'R'; //HideColumn(CD_BACK_QTY    );
       gcMGridAlign[CD_DANGA_BACK]  := 'R';
    end;

end;

procedure TFSM200Month.pr_qryOpen;

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
    Params[0].Value := cbYear.Text+'0101';
    Params[1].Value := cbYear.Text+'1231';
    Open;

    SetLength(la , 10);
    
    la[0] := CD_IMP_QTY   ;
    la[1] := CD_DANGA_IMP ;
    la[2] := CD_EXP_QTY   ;
    la[3] := CD_DANGA_EXP ;
    la[4] := CD_RET_QTY   ;
    la[5] := CD_DANGA_RET ;
    la[6] := CD_CHN_QTY   ;
    la[7] := CD_DANGA_CHN ;
    la[8] := CD_BACK_QTY  ;
    la[9] := CD_DANGA_BACK;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM200Month.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM200Month.pr_QryToGridWithoutProgress(AQuery: TQuery;
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

procedure TFSM200Month.FormActivate(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFSM200Month.pr_qryOpenYear;
begin
  cbYear.Items.Clear;
  with qryYear do try
    Close;
    Open;

    if IsEmpty then begin
      cbYear.Items.Add(Copy(gsNowDate,1,4));
      Exit;
    end;

    while not Eof do begin
      cbYear.Items.Add(Fields[0].AsString);
      Next;
    end;

    cbYear.ItemIndex := 0;

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM200Month.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFSM200Month.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSM200Month.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSM200Month.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

end.
