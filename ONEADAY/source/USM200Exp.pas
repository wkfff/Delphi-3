unit USM200Exp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables;

type
  TFSM200Exp = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  FSM200Exp: TFSM200Exp;

implementation

uses UDM, ULib, UQMain, UOneADay;

{$R *.dfm}

const
  CD_SEQN         =  0;
  CD_PNO          =  1;
  CD_CUST_CODE    =  2;
  CD_ITEM_NAME    =  3;
  CD_IMP_EXPDATE  =  4;
  CD_CODE_SNM     =  5;
  CD_IMP_EXPQTY   =  6;
  CD_IMP_QTY      =  7;
  CD_EXP_QTY      =  8;
  CD_RET_QTY      =  9;
  CD_CHN_QTY      = 10;
  CD_BACK_QTY     = 11;
  CD_DANGA        = 12;
  CD_TAX_GUBUN    = 13;
  CD_CUST_ZIP     = 14;
  CD_CUST_ADDRESS = 15;
  CD_CUST_TEL1    = 16;
  CD_CUST_TEL2    = 17;
  CD_CUST_PER     = 18;
  CD_I_DATE       = 19;
  CD_I_ID         = 20;
  CD_U_DATE       = 21;
  CD_U_ID         = 22;
  CD_ITEM_CODE    = 23;


procedure TFSM200Exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qrMT100.Close;
  DM.qrMT100.EnableControls;
  Application.ProcessMessages;
  Action := caFree;
end;

procedure TFSM200Exp.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFSM200Exp.FormCreate(Sender: TObject);
begin    
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0003';

  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFSM200Exp.Button2Click(Sender: TObject);
begin
  fn_Save2Excell(Self, sgMain);
end;

procedure TFSM200Exp.edCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFSM200Exp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFSM200Exp.FormDestroy(Sender: TObject);
begin
  FSM200Exp := nil;
end;

procedure TFSM200Exp.pr_Clear;
begin

end;

procedure TFSM200Exp.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C';
       gcMGridAlign[CD_PNO         ] := 'C';
       gcMGridAlign[CD_CUST_CODE   ] := 'C';
       gcMGridAlign[CD_ITEM_NAME   ] := 'L';
       gcMGridAlign[CD_IMP_EXPDATE ] := 'C';
       gcMGridAlign[CD_CODE_SNM    ] := 'C';
       gcMGridAlign[CD_IMP_EXPQTY  ] := 'R';
       gcMGridAlign[CD_IMP_QTY     ] := 'R'; HideColumn(CD_IMP_QTY     );
       gcMGridAlign[CD_EXP_QTY     ] := 'R'; HideColumn(CD_EXP_QTY     );
       gcMGridAlign[CD_RET_QTY     ] := 'R'; HideColumn(CD_RET_QTY     );
       gcMGridAlign[CD_CHN_QTY     ] := 'R'; HideColumn(CD_CHN_QTY     );
       gcMGridAlign[CD_BACK_QTY    ] := 'R'; HideColumn(CD_BACK_QTY    );
       gcMGridAlign[CD_DANGA       ] := 'R';
       gcMGridAlign[CD_TAX_GUBUN   ] := 'C';
       gcMGridAlign[CD_CUST_ZIP    ] := 'C';
       gcMGridAlign[CD_CUST_ADDRESS] := 'L';
       gcMGridAlign[CD_CUST_TEL1   ] := 'C';
       gcMGridAlign[CD_CUST_TEL2   ] := 'C';
       gcMGridAlign[CD_CUST_PER    ] := 'C';
       gcMGridAlign[CD_I_DATE      ] := 'C'; 
       gcMGridAlign[CD_I_ID        ] := 'C'; HideColumn(CD_I_ID        );
       gcMGridAlign[CD_U_DATE      ] := 'C'; HideColumn(CD_U_DATE      );
       gcMGridAlign[CD_U_ID        ] := 'C'; HideColumn(CD_U_ID        );
       gcMGridAlign[CD_ITEM_CODE   ] := 'C'; HideColumn(CD_ITEM_CODE   );
    end;
end;

procedure TFSM200Exp.pr_qryOpen;
var
  la : Array of Integer;
begin   
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    Open;

    SetLength(la , 2);
    la[0] := CD_IMP_EXPQTY;
    la[1] := CD_DANGA;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);


    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFSM200Exp.pr_Ready;
begin

end;

procedure TFSM200Exp.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM200Exp.sgMainGetCellColor(Sender: TObject; ARow, ACol: Integer;
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

procedure TFSM200Exp.Button1Click(Sender: TObject);
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
  // 수신 sp_procedure call
  //pr_GetReceive;

  pr_qryOpen;

end;

procedure TFSM200Exp.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFSM200Exp ,'FSM200Exp');
end;

end.
