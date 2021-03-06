unit UPD122;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ExtCtrls, Mask, DB, DBTables,
  AdvObj, RxToolEdit, RxCurrEdit;

type
  TFPD122 = class(TForm)
    Panel2: TPanel;
    grpS01: TGroupBox;
    Label5: TLabel;
    edtCATNO: TEdit;
    edtITEM_NAME: TEdit;
    sgMain: TAdvStringGrid;
    Label1: TLabel;
    cedtVBELN: TCurrencyEdit;
    Panel1: TPanel;
    Button4: TButton;
    qryOpen: TQuery;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }  
    gsORDER_TYPE : String;

    gcMGridAlign : Array[0..4] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
    dtpI_DATE1, dtpI_DATE2 : TDateTime;
    gsCATNO : String;
    gsORDER_NO : String;
  end;

var
  FPD122: TFPD122;

implementation

uses ULib, UOneADay;

{$R *.dfm}   

const
  CD_SEQ        = 0;
  CD_CATNO      = 1;
  CD_ITEM_NAME  = 2;
  CD_CODE_SNM   = 3;

procedure TFPD122.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPD122.FormDestroy(Sender: TObject);
begin
  FPD122 := nil;
end;

procedure TFPD122.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : Button1Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPD122.pr_Clear;
begin

end;

procedure TFPD122.pr_Grid_Init;
begin
    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQ       ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
    end;
end;

procedure TFPD122.pr_qryOpen;
begin
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;

    Params[0].Value := gsORDER_TYPE;

    Params[1].Value := FormatDateTime('YYYYMMDD',dtpI_DATE1);
    Params[2].Value := FormatDateTime('YYYYMMDD',dtpI_DATE2);
    Params[3].Value := edtCATNO.Text;
    Params[4].Value := gsORDER_NO;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, gcNumeric);
    cedtVBELN.Value := sgMain.RowCount - 1;

    //pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPD122.pr_Ready;
begin

end;

procedure TFPD122.FormCreate(Sender: TObject);
begin


  gsORDER_TYPE := gcSell;

  pr_Grid_Init;

  //Left   := 0;
  //Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  //pr_qryOpen;

  Application.ProcessMessages;
end;

procedure TFPD122.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFPD122.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPD122.Button4Click(Sender: TObject);
begin
  Close;
end;

end.
