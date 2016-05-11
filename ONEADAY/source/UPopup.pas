unit UPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, TFlatButtonUnit, StdCtrls,
  TFlatEditUnit, ExtCtrls, TFlatGroupBoxUnit, DB, DBTables;

type
  TFPopup = class(TForm)
    FlatGroupBox1: TFlatGroupBox;
    Shape4: TShape;
    Label1: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    shpNm_W: TShape;
    lblNm_W: TLabel;
    FlatGroupBox2: TFlatGroupBox;
    FlatGroupBox3: TFlatGroupBox;
    FlatGroupBox4: TFlatGroupBox;
    btnClose: TFlatButton;
    FlatGroupBox5: TFlatGroupBox;
    btnConfirm: TFlatButton;
    FlatGroupBox6: TFlatGroupBox;
    Label27: TLabel;
    Shape42: TShape;
    Label2: TLabel;
    lblCnt: TLabel;
    sgMain: TAdvStringGrid;
    edtITEM_CODE: TEdit;
    edtITEM_NAME: TEdit;
    qryOpen: TQuery;
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure sgMainClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtITEM_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgMainDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
  public
    { Public declarations }
  end;

var
  FPopup: TFPopup;

implementation

uses ULib, UOneADay;

{$R *.dfm}

const
  CD_SEQN      =  0;
  CD_ITEM_CODE =  1;
  CD_ITEM_NAME =  2;

procedure TFPopup.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPopup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPopup.FormDestroy(Sender: TObject);
begin
  FPopup := nil;
end;

procedure TFPopup.pr_Clear;
begin

end;

procedure TFPopup.pr_Grid_Init;
begin 
    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_ITEM_CODE] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_NAME] := 'L'; //ColWidths[M_DLV_CUST_NM] := 160;
    end;

end;

procedure TFPopup.pr_qryOpen;
begin

  with qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add(' select item_code, item_name   '+
            '   from MT200                  '+
            '  where item_code like :item_code '+
            '    and item_name like :item_name ');
    if Length(Trim(edtITEM_CODE.Text)) = 0 then
      Params[0].Value := '%%'
    else
      Params[0].Value := '%' + edtITEM_CODE.Text + '%';

    if Length(Trim(edtITEM_NAME.Text)) = 0 then
      Params[1].Value := '%%'
    else
      Params[1].Value := '%' + edtITEM_NAME.Text + '%';

    Open;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, gcNumeric);

    lblCnt.Caption := IntToStr(sgMain.RowCount-1);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPopup.pr_Ready;
begin

end;

procedure TFPopup.btnConfirmClick(Sender: TObject);
begin
  if Trim(edtITEM_CODE.Text) = '' then begin
    ModalResult := mrCancel;
    Close;
    Exit;
  end;
  gsITEM_CODE := edtITEM_CODE.Text;
  gsITEM_NAME := edtITEM_NAME.Text;
  ModalResult := mrOK;
end;

procedure TFPopup.sgMainClick(Sender: TObject);
begin
  edtITEM_CODE.Text := sgMain.Cells[CD_ITEM_CODE, sgMain.Row];
  edtITEM_NAME.Text := sgMain.Cells[CD_ITEM_NAME, sgMain.Row];
end;

procedure TFPopup.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFPopup.edtITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : pr_qryOpen;
  end;
end;

procedure TFPopup.sgMainDblClick(Sender: TObject);
begin
  btnConfirm.Click;
end;

procedure TFPopup.FormCreate(Sender: TObject);
begin
  pr_Grid_Init;
end;

end.
