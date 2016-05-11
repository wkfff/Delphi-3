unit UPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, TFlatButtonUnit, StdCtrls,
  TFlatEditUnit, ExtCtrls, TFlatGroupBoxUnit, DB, DBTables, ComCtrls, AdvObj;

type
  TFPopup = class(TForm)
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
    qryOpen: TQuery;
    pcCondition: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    FlatGroupBox9: TFlatGroupBox;
    Shape1: TShape;
    Label3: TLabel;
    Shape7: TShape;
    Label8: TLabel;
    Shape8: TShape;
    Label10: TLabel;
    edtCATNO: TEdit;
    edtITEM_NAME: TEdit;
    FlatGroupBox1: TFlatGroupBox;
    Shape4: TShape;
    Label1: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    shpNm_W: TShape;
    lblNm_W: TLabel;
    edtCUST_CODE: TEdit;
    edtCUST_NAME: TEdit;
    Button1: TButton;
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure sgMainClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtCUST_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgMainDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pcConditionChange(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  CD_SEQN      = 0;
  CD_CATNO     = 1;
  CD_ITEM_NAME = 2;
  CD_ITEM_CODE = 3;
  CD_STOCK_UNIT= 4;

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
       gcMGridAlign[CD_SEQN]      := 'C';
       gcMGridAlign[CD_CATNO]     := 'C';
       gcMGridAlign[CD_ITEM_NAME] := 'L';
       gcMGridAlign[CD_ITEM_CODE] := 'C';
       HideColumn(CD_ITEM_CODE);
       gcMGridAlign[CD_STOCK_UNIT] := 'C';
       HideColumn(CD_STOCK_UNIT);  
                            
       case pcCondition.ActivePageIndex of
         0 : begin   
               sgMain.Cells[CD_CATNO,     0] := 'CAT NO.';
               sgMain.Cells[CD_ITEM_CODE, 0] := '코드';
               sgMain.Cells[CD_ITEM_NAME, 0] := '코드명';
             end;
         1 : begin
               sgMain.Cells[CD_CATNO,     0] := '코드';
               sgMain.Cells[CD_ITEM_CODE, 0] := '코드명';
             end;
       end;
    end;
{
    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       case pcCondition.ActivePageIndex of
         0..1 : begin
                   gcMGridAlign[CD_SEQN]      := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
                   gcMGridAlign[CD_CATNO]     := 'C'; ColWidths[CD_CATNO    ] := 104;
                   gcMGridAlign[CD_ITEM_CODE] := 'C'; ColWidths[CD_ITEM_CODE] := 102;
                   UnHideColumn(CD_ITEM_NAME);
                   gcMGridAlign[CD_ITEM_NAME] := 'L'; ColWidths[CD_ITEM_NAME] := 609;

                   sgMain.Cells[CD_CATNO,     0] := 'CAT NO.';
                   sgMain.Cells[CD_ITEM_CODE, 0] := '코드';
                   sgMain.Cells[CD_ITEM_NAME, 0] := '코드명';
                end;
         2    : begin
                   gcMGridAlign[CD_SEQN]      := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
                   gcMGridAlign[CD_CATNO]     := 'C'; ColWidths[CD_CATNO    ] := 102;
                   gcMGridAlign[CD_ITEM_CODE] := 'L'; ColWidths[CD_ITEM_CODE] := 608;
                   HideColumn(CD_ITEM_NAME);

                   sgMain.Cells[CD_CATNO,     0] := '코드';
                   sgMain.Cells[CD_ITEM_CODE, 0] := '코드명';
                end;
       end;
    end;
 }
end;

procedure TFPopup.pr_qryOpen;
begin
         
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    SQL.Clear;
    case pcCondition.ActivePageIndex of
      0 : begin
            SQL.Add(' SELECT CATNO, ITEM_NAME, ITEM_CODE, QTY_UNIT '+
                    '   FROM MT300                       '+
                    '  WHERE CATNO     like :CATNO       '+
                    '    AND ITEM_NAME like :ITEM_NAME   ');
            if Length(Trim(edtCATNO.Text)) = 0 then
              Params[0].Value := '%%'
            else
              Params[0].Value := '%' + edtCATNO.Text + '%';

            if Length(Trim(edtITEM_NAME.Text)) = 0 then
              Params[1].Value := '%%'
            else
              Params[1].Value := '%' + edtITEM_NAME.Text + '%';
          end;
      1 : begin  
            SQL.Add(' SELECT CUST_CODE, CUST_NAME, CUST_ADDRESS '+
                    '   FROM MT200                       '+
                    '  WHERE CUST_CODE like :CUST_CODE   '+
                    '    AND CUST_NAME like :CUST_NAME   ');
            if Length(Trim(edtCUST_CODE.Text)) = 0 then
              Params[0].Value := '%%'
            else
              Params[0].Value := '%' + edtCUST_CODE.Text + '%';

            if Length(Trim(edtCUST_NAME.Text)) = 0 then
              Params[1].Value := '%%'
            else
              Params[1].Value := '%' + edtCUST_NAME.Text + '%';
          end;

    end;

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
  case pcCondition.ActivePageIndex of
    0 : begin
              if Trim(edtCATNO.Text) = '' then begin

                gsCATNO     := '';
                gsITEM_CODE := '';
                gsITEM_NAME := '';
                gsCUST_CODE := '';
                gsCUST_NAME := '';
                gsSTOCK_UNIT:= '';

                ModalResult := mrCancel;
                Close;
                Exit;
              end;
           end;
    1    : begin
              if Trim(edtCUST_CODE.Text) = '' then begin

                gsCATNO     := '';
                gsITEM_CODE := '';
                gsITEM_NAME := '';
                gsCUST_CODE := '';
                gsCUST_NAME := '';
                gsSTOCK_UNIT:= '';

                ModalResult := mrCancel;
                Close;
                Exit;
              end;
           end;
  end;
  gsCATNO     := edtCATNO.Text;
  //gsITEM_CODE := edtITEM_CODE.Text;
  gsITEM_NAME := edtITEM_NAME.Text;
  gsCUST_CODE := edtCUST_CODE.Text;
  gsCUST_NAME := edtCUST_NAME.Text; 
  
  ModalResult := mrOK;
end;

procedure TFPopup.sgMainClick(Sender: TObject);
begin
  case pcCondition.ActivePageIndex of
    0 : begin
             edtCATNO.Text     := sgMain.Cells[CD_CATNO,     sgMain.Row];
             edtITEM_NAME.Text := sgMain.Cells[CD_ITEM_NAME, sgMain.Row];
             gsITEM_CODE       := sgMain.Cells[CD_ITEM_CODE, sgMain.Row];
             gsSTOCK_UNIT      := sgMain.Cells[CD_STOCK_UNIT, sgMain.Row];
           end;
    1 : begin
          edtCUST_CODE.Text := sgMain.Cells[CD_CATNO, sgMain.Row];
          edtCUST_NAME.Text := sgMain.Cells[CD_ITEM_NAME, sgMain.Row];
        end;
  end;
end;

procedure TFPopup.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFPopup.edtCUST_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : pr_qryOpen;
  end;
end;

procedure TFPopup.sgMainDblClick(Sender: TObject);
begin
  btnConfirmClick(Self);
end;

procedure TFPopup.FormCreate(Sender: TObject);
begin
  pr_Grid_Init;
end;

procedure TFPopup.pcConditionChange(Sender: TObject);
begin
  sgMain.UnHideColumn(CD_ITEM_NAME);
  pr_ClearGrid(sgMain);
  pr_Grid_Init;

  case pcCondition.ActivePageIndex of
    0 : edtCATNO.SetFocus;
    1 : edtCUST_CODE.SetFocus;
  end;
end;

procedure TFPopup.btnInsertClick(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFPopup.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

end.
