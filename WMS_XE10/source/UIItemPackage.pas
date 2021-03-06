unit UIItemPackage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, AdvObj;

type
  TFIItemPackage = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Label23: TLabel;
    edtCATNO: TEdit;
    edtITEM_NAME: TEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }

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
  FIItemPackage: TFIItemPackage;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const
      CD_SEQN       =  0;
      CD_CATNO      =  1;
      CD_ITEM_NAME  =  2;
      CD_CODE_SNM   =  3;
      CD_UNIT       =  4;
      CD_UNIT_CS    =  5;
      CD_UNIT_PK    =  6;
      CD_KAN_CODE   =  7;
      CD_I_DATE     =  8;
      CD_I_ID       =  9;
      CD_U_DATE     = 10;
      CD_U_ID       = 11;
      CD_ITEM_GUBUN = 12;

procedure TFIItemPackage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIItemPackage.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIItemPackage.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
end;

procedure TFIItemPackage.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFIItemPackage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F3 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFIItemPackage.FormDestroy(Sender: TObject);
begin
  FIItemPackage := nil;
end;

procedure TFIItemPackage.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;


//  pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFIItemPackage.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFIItemPackage.pr_Grid_Init;
begin
    
    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_CODE_SNM  ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_UNIT      ] := 'C'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_UNIT_CS   ] := 'L'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_UNIT_PK   ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_KAN_CODE  ] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_I_DATE    ] := 'C'; //ColWidths[M_QUICK_STAT ] := 41;
       gcMGridAlign[CD_I_ID      ] := 'C'; HideColumn(CD_I_DATE    );
       gcMGridAlign[CD_U_DATE    ] := 'C'; HideColumn(CD_I_ID      );
       gcMGridAlign[CD_U_ID      ] := 'C'; HideColumn(CD_U_DATE    );
       gcMGridAlign[CD_ITEM_GUBUN] := 'C'; HideColumn(CD_U_ID      );
    end;
end;

procedure TFIItemPackage.pr_Clear;
begin

end;

procedure TFIItemPackage.pr_qryOpen;   
var
  la : Array of Integer;
begin  
  pr_ClearGrid(sgMain);
  
  with qryOpen do try
    Close;
    

    if Trim(edtCATNO.Text) = '' then
      Params[0].Value := '%%'
    else
      Params[0].Value := edtCATNO.Text;
                        {
    if Trim(edtITEM_CODE.Text) = '' then
      Params[1].Value := '%%'
    else
      Params[1].Value := edtITEM_CODE.Text;
                         }
    if RadioButton0.Checked then begin
      Params[1].Value := 1;
      Params[2].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[1].Value := 2;
      Params[2].Value := gcNoSale;
    end;

    SetLength(la , 2);

    la[0] := CD_UNIT_CS;
    la[1] := CD_UNIT_PK;

    pr_QryToGridWithoutProgress(qryOpen, sgMain, la);
    
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFIItemPackage.pr_Ready;
begin

end;

procedure TFIItemPackage.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFIItemPackage.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFIItemPackage ,'FIItemPackage');
end;

procedure TFIItemPackage.SpeedButton1Click(Sender: TObject);
begin
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 0;
    if FPopup.ShowModal = mrOK then begin

      edtCATNO.Text     := gsCATNO;
      //edtITEM_CODE.Text := gsITEM_CODE;
      edtITEM_NAME.Text := gsITEM_NAME;
    end;
  finally

  end;
end;

end.
