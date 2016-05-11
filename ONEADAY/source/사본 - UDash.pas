unit UDash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, Series, DB,
  DBTables, BaseGrid, AdvGrid, Grids;

type
  TFDash = class(TForm)
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations } 
    gcMGridAlign : Array[0..27] of Char;   //�׸��� ��� ��ġ ����;
    procedure pr_Grid_Init; 
    procedure pr_qryOpen;

    procedure pr_QryToGridWithoutProgress(AQuery:TQuery; advStringGrid:TadvStringGrid; ANumeric:Array of Integer);

  public
    { Public declarations }
  end;

var
  FDash: TFDash;

implementation

uses UDM, UQMain, ULib;

{$R *.dfm}

const
  CD_IMP_EXPDAY  =  0;
  CD_IMP_EXPDATE =  1;
  CD_SET_STAT    =  2;
  CD_IMP_QTY     =  3;
  CD_DANGA_IMP   =  4;
  CD_EXP_QTY     =  5;
  CD_DANGA_EXP   =  6;
  CD_RET_QTY     =  7;
  CD_DANGA_RET   =  8;
  CD_CHN_QTY     =  9;
  CD_DANGA_CHN   = 10;
  CD_BACK_QTY    = 11;
  CD_DANGA_BACK  = 12;

procedure TFDash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;  

procedure TFDash.FormDestroy(Sender: TObject);
begin
  FDash := nil;
end;

procedure TFDash.FormCreate(Sender: TObject);
begin
  Left := (FQMain.Width - Width) div 2;
  Top := (FQMain.Height - Height - FQMain.Panel1.Height - FQMain.sbMsg.Height - 50) div 2;
  
  pr_Grid_Init;
end;

procedure TFDash.pr_Grid_Init;
var
  i,j,k:integer;
begin

  sgMain.MergeCells(0,0,1,2);  // i,0,3,1 //����x, ����y, x��, y��
  sgMain.MergeCells(1,0,1,2);  // i,0,3,1 //����x, ����y, x��, y��
  sgMain.MergeCells(2,0,1,2);  // i,0,3,1 //����x, ����y, x��, y��
                                
  sgMain.Cells[3,0] := '�԰�';
  sgMain.Cells[5,0] := '���';
  sgMain.Cells[7,0] := '��ǰ/��ȯ';
  sgMain.Cells[9,0] := '�ݼ�';

  with sgMain do begin
    k := 0;
    for i := 3 to ColCount-1 do begin
        j := i mod 2;
        case j of
           1: begin
                //1����
                sgMain.mergecells(i,0,2,1); // i,0,3,1 //����x, ����y, x��, y��
                sgMain.Cells[i,1] := '����';
              end;
           0: begin
                sgMain.Cells[i,1] := '�ݾ�';
              end;
        end;
    end;
  end;
    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_IMP_EXPDAY]  := 'C';
       gcMGridAlign[CD_IMP_EXPDATE] := 'C';
       gcMGridAlign[CD_SET_STAT]    := 'C';
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

procedure TFDash.pr_qryOpen; 

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

procedure TFDash.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    If (ARow = 0) or (ARow = 1) Then VAlign := vtaCenter
    Else Begin
       Case gcMGridAlign[ACol] Of
          'C' :  HAlign := taCenter;       //no
          'R' :  HAlign := taRightJustify;       //����
          'L' :  HAlign := taLeftJustify;  //����
       End;
    End;
end;

procedure TFDash.pr_QryToGridWithoutProgress(AQuery: TQuery;
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
    FQWait.Caption     := '�����͸� ó�����Դϴ�...';

    AGauge         := TGauge.Create(FQWait);
    AGauge.Parent  := FQWait;
    AGauge.Align   := alBottom;
    AGauge.ForeColor := clBlue;
    AGauge.Height  := 25;

    APanel         := TPanel.Create(FQWait);
    APanel.Parent  := FQWait;
    APanel.Caption := '�����͸� ó�����Դϴ�...';
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


    while not AQuery.Eof do begin  //Rowī��Ʈ����

      //AGauge.Progress := liRow;
      Application.ProcessMessages;

      for liCol := 0 to AQuery.FieldCount -1 do begin

        liMax := 0;
        for liPos := 0 to High(ANumeric) do
          if (ANumeric[liPos] = liCol) then begin
            advStringGrid.Cells[liCol, liRow+1] := FormatFloat('#,###,###,###',AQuery.Fields[liCol].Value);
            liMax := 1;
            Break;
          end;
        if liMax = 0 then
          advStringGrid.Cells[liCol,liRow+1] := AQuery.Fields[liCol].AsString;
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

procedure TFDash.FormActivate(Sender: TObject);
begin
  pr_qryOpen;
end;

end.
