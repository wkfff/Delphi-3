unit UMT200;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, BaseGrid,
  AdvGrid, DBTables, Buttons, AdvObj;

type
  TFMT200 = class(TForm)
    sgMain: TAdvStringGrid;
    qryOpen: TQuery;
    Panel1: TPanel;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    grpS01: TGroupBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel2: TPanel;
    Label23: TLabel;
    edtCUST_CODE: TEdit;
    SpeedButton1: TSpeedButton;
    edtCUST_NAME: TEdit;
    Label1: TLabel;
    cbCUST_TRANS: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  FMT200: TFMT200;

implementation

uses UDM, ULib, UOneADay, UQMain, UPopup;

{$R *.dfm}

const
  CD_SEQN         = 0;
  CD_CUST_CODE    = 1;
  CD_CUST_NAME    = 2;
  CD_CUST_GUBUN   = 3;
  CD_CUST_DETAIL  = 4;
  CD_CUST_TRANS   = 5;
  CD_CUST_ZIP     = 6;
  CD_CUST_ADDRESS = 7;
  CD_CUST_TEL     = 8;
  CD_CUST_FAX     = 9;
  CD_CUST_OWNER   = 10;
  CD_I_DATE       = 11;
  CD_I_ID         = 12;
  CD_U_DATE       = 13;
  CD_U_ID         = 14;



procedure TFMT200.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMT200.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFMT200.FormCreate(Sender: TObject);
begin      
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);
    
  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  cbCUST_TRANS.ItemIndex := fn_TableToTCombo(1, gcCUST_TRANS, cbCUST_TRANS);

  Application.ProcessMessages;

end;

procedure TFMT200.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFMT200.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFMT200.edtLOC_CODEKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFMT200.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFMT200.FormDestroy(Sender: TObject);
begin
  FMT200 := nil;
end;

procedure TFMT200.pr_Clear;
begin

end;

procedure TFMT200.pr_Grid_Init;
begin   

    with sgMain do begin
       Options:=Options+[goRowSelect];

       gcMGridAlign[CD_SEQN        ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CUST_CODE   ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CUST_NAME   ] := 'L'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_CUST_GUBUN  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_CUST_DETAIL ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CUST_TRANS  ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CUST_ZIP    ] := 'C'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CUST_ADDRESS] := 'L'; //HideColumn(CD_PROPERTY_STATE_OLD);
       gcMGridAlign[CD_CUST_TEL    ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_CUST_FAX    ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_CUST_OWNER  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_I_DATE      ] := 'C'; HideColumn(CD_I_DATE);
       gcMGridAlign[CD_I_ID        ] := 'C'; HideColumn(CD_I_ID  );
       gcMGridAlign[CD_U_DATE      ] := 'C'; HideColumn(CD_U_DATE);
       gcMGridAlign[CD_U_ID        ] := 'C'; HideColumn(CD_U_ID  );
    end;
end;

procedure TFMT200.pr_qryOpen;
begin        
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;

    if Trim(edtCUST_CODE.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCUST_CODE.Text;

    if Trim(cbCUST_TRANS.Text) = 'ALL' then begin
      Params[1].Value := 1;
      Params[2].Value := '%%';
    end
    else begin
      Params[1].Value := 2;
      Params[2].Value := Copy(cbCUST_TRANS.Text,2,4);
    end;

    if RadioButton0.Checked then begin
      Params[3].Value := 1;
      Params[4].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[3].Value := 2;
      Params[4].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[3].Value := 2;
      Params[4].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[3].Value := 2;
      Params[4].Value := gcNoSale;
    end;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, gcNumeric);
     
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFMT200.pr_Ready;
begin

end;

procedure TFMT200.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFMT200.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFMT200 ,'FMT200');
end;

procedure TFMT200.SpeedButton1Click(Sender: TObject);
begin

  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 1;
    if FPopup.ShowModal = mrOK then begin

      edtCUST_CODE.Text := gsCUST_CODE;
      edtCUST_NAME.Text := gsCUST_NAME;
    end;
  finally

  end;
end;

end.
