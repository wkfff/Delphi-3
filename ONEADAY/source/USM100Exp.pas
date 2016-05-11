unit USM100Exp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables;

type
  TFSM100Exp = class(TForm)
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure edCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Button1Click(Sender: TObject);
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
  FSM100Exp: TFSM100Exp;

implementation

uses UDM, ULib, UQMain, UOneADay;

{$R *.dfm}

const

  CD_SEQN         =  0;
  CD_ORDER_NO     =  1;
  CD_RECEIVER     =  2;
  CD_RCV_ZIP      =  3;
  CD_RCV_ADDRESS  =  4;
  CD_RCV_TEL1     =  5;
  CD_RCV_TEL2     =  6;
  CD_ORDERER      =  7;
  CD_ORD_TEL      =  8;
  CD_ORD_QTY      =  9;
  CD_ITEM_CODE    = 10;
  CD_ITEM_NAME    = 11;
  CD_ORD_COMMENT  = 12;
  CD_I_DATE       = 13;

procedure TFSM100Exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFSM100Exp.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSM100Exp.FormCreate(Sender: TObject);
begin     
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0005';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSM100Exp.Button2Click(Sender: TObject);
begin
  with sgMain do begin
  end;
end;

procedure TFSM100Exp.Button13Click(Sender: TObject);
begin
    try
      DM.qrTemp.Close;
      DM.qrTemp.SQL.Clear;
      DM.qrTemp.SQL.Add(
          'INSERT INTO MT100                                                                      '+ #13+
          '( USERID, NAME, PASSWD, RETIRE_DATE, I_ID, U_ID ) '+ #13+
          'VALUES                                                                                  '+ #13+
          '( :USERID, :NAME, :PASSWD, :RETIRE_DATE, :I_ID, :U_ID ) ' );
{
      DM.qrTemp.Params[0].Value := edCode.Text;
      DM.qrTemp.Params[1].Value := edCodeName.Text;
      DM.qrTemp.Params[2].Value := edPass.Text;
      DM.qrTemp.Params[3].Value := meClose.Text;
      DM.qrTemp.Params[4].Value := gsUserID;
      DM.qrTemp.Params[5].Value := gsUserID;
      DM.qrTemp.ExecSQL;
      }
      Application.ProcessMessages;

    except
      beep;
      DM.qrMT100.EnableControls;
      ShowMessage('에 실패했습니다. 잠시 후에 다시 시도하십시오.');
      exit;
    end;
  DM.qrMT100.Close;
  Application.ProcessMessages;
  ShowMessage(' 되었습니다.');
  DM.qrMT100.Open;
  DM.qrMT100.EnableControls;
end;

procedure TFSM100Exp.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSM100Exp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    //VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSM100Exp.FormDestroy(Sender: TObject);
begin
  FSM100Exp := nil;
end;

procedure TFSM100Exp.pr_Clear;
begin

end;

procedure TFSM100Exp.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN       ] := 'C';
       gcMGridAlign[CD_ORDER_NO   ] := 'C';
       gcMGridAlign[CD_RECEIVER   ] := 'C';
       gcMGridAlign[CD_RCV_ZIP    ] := 'C';
       gcMGridAlign[CD_RCV_ADDRESS] := 'L';
       gcMGridAlign[CD_RCV_TEL1   ] := 'C';
       gcMGridAlign[CD_RCV_TEL2   ] := 'C';
       gcMGridAlign[CD_ORDERER    ] := 'C';
       gcMGridAlign[CD_ORD_TEL    ] := 'C';
       gcMGridAlign[CD_ORD_QTY    ] := 'R';
       gcMGridAlign[CD_ITEM_CODE  ] := 'C';
       gcMGridAlign[CD_ITEM_NAME  ] := 'L';
       gcMGridAlign[CD_ORD_COMMENT] := 'L';
       gcMGridAlign[CD_I_DATE     ] := 'C';
       
    end;
end;

procedure TFSM100Exp.pr_qryOpen;
var
  la : Array of Integer;
  liRow : Integer;
  ls : String;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;
    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, CD_ORD_QTY);
                                                                     {
    with sgMain do begin
      for liRow := 1 to RowCount -1 do begin
        ls := sgMain.Cells[CD_ITEM_NAME, liRow];
        sgMain.Cells[CD_ITEM_NAME, liRow] := Copy(ls, 1, LastDelimiter(',', ls)-1);
      end;
    end;
}
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM100Exp.pr_Ready;
begin

end;

procedure TFSM100Exp.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM100Exp.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM100Exp.Button1Click(Sender: TObject);
begin

  pr_qryOpen;

end;

procedure TFSM100Exp.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSM100Exp ,'FSM100Exp');
end;

end.
