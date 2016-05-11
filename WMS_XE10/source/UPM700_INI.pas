unit UPM700_INI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables, BaseGrid, AdvGrid, Buttons, RxToolEdit, RxCurrEdit, AdvObj;

type
  TFPM700_INI = class(TForm)
    qryOpen: TQuery;
    sgMain: TAdvStringGrid;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    grpS01: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    cbLOC_GUBUN: TComboBox;
    cedtSTOCK_QTY: TCurrencyEdit;
    Label4: TLabel;
    Label9: TLabel;
    Button3: TButton;
    Label23: TLabel;
    edtCATNO: TEdit;
    SpeedButton1: TSpeedButton;
    edtITEM_NAME: TEdit;
    Label1: TLabel;
    Mak_Location_From: TMaskEdit;
    Label10: TLabel;
    Mak_Location_To: TMaskEdit;
    Label3: TLabel;
    edtLOC_CODE: TMaskEdit;
    Label5: TLabel;
    edtCATNO1: TEdit;
    SpeedButton2: TSpeedButton;
    edtITEM_NAME1: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton0: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    btnInsert: TButton;
    Button5: TButton;
    edtSTOCK_UNIT: TEdit;
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
    procedure sgMainClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    gsITEM_CODEPM700 : String;
    gsLOC_GUBUNPM700 : String;

    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    gcSGridAlign : Array[0..16] of Char;   //그리드 출력 위치 설정;
    procedure pr_Clear;
    procedure pr_Grid_Init;

    procedure pr_qryOpen;
    procedure pr_Ready;
    function  fn_InsertPM700:Boolean;
  public
    { Public declarations }
  end;

var
  FPM700_INI: TFPM700_INI;

implementation

uses UDM, UQMain, ULib, UOneADay, UPopup;

{$R *.dfm}

const
  CD_SEQN       =  0; // no
  CD_LOC_NAME   =  1; // no
  CD_LOC_CODE   =  2; // no
  CD_ITEM_GUBUN =  3;
  CD_CATNO      =  4;
  CD_ITEM_NAME  =  5;
  CD_STOCK_QTY  =  6;
  CD_STOCK_UNIT =  7;
  CD_I_DATE     =  8;
  CD_I_ID       =  9;
  CD_U_DATE     = 10;
  CD_U_ID       = 11;
  CD_LOC_GUBUN  = 12;
  CD_ITEM_CODE  = 13;   
  CD_QTY        = 14; 
  CD_QTY_UNIT   = 15;

procedure TFPM700_INI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPM700_INI.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFPM700_INI.Button1Click(Sender: TObject);
begin
  pr_qryOpen;
  
end;

procedure TFPM700_INI.Button2Click(Sender: TObject);
begin
  fn_Grid2Excell(Self , sgMain);
end;

procedure TFPM700_INI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : btnInsertClick(Sender);
    VK_F3 : Button3Click(Sender);
    VK_F4 : Button5Click(Sender);
    VK_F5 : Button2Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFPM700_INI.FormDestroy(Sender: TObject);
begin
  FPM700_INI := nil;
end;

procedure TFPM700_INI.FormCreate(Sender: TObject);
begin

    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  Width  := FQMain.ClientWidth - 4;

  //pr_qryOpen;

  Application.ProcessMessages;
  
end;

procedure TFPM700_INI.edITEM_CODEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFPM700_INI.pr_Grid_Init;
begin


    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN      ] := 'C'; //ColWidths[M_SEQN_NUMB  ] := 50;
       gcMGridAlign[CD_LOC_NAME  ] := 'C'; //ColWidths[M_VBELN      ] := 41;
       gcMGridAlign[CD_LOC_CODE  ] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_ITEM_GUBUN] := 'C'; //ColWidths[M_DLV_CUST_NM] := 160;
       gcMGridAlign[CD_CATNO     ] := 'C'; //ColWidths[M_MATNR_CONT ] := 0;
       gcMGridAlign[CD_ITEM_NAME ] := 'L'; //ColWidths[M_MATNR_CNT  ] := 0;
       gcMGridAlign[CD_STOCK_QTY ] := 'R'; //ColWidths[M_MATNR_PCS  ] := 0;
       gcMGridAlign[CD_STOCK_UNIT] := 'C'; //ColWidths[M_RCV_DT     ] := 50;
       gcMGridAlign[CD_I_DATE    ] := 'C'; HideColumn(CD_I_DATE    );
       gcMGridAlign[CD_I_ID      ] := 'C'; HideColumn(CD_I_ID      );
       gcMGridAlign[CD_U_DATE    ] := 'C'; HideColumn(CD_U_DATE    );
       gcMGridAlign[CD_U_ID      ] := 'C'; HideColumn(CD_U_ID      );
       gcMGridAlign[CD_LOC_GUBUN ] := 'C'; HideColumn(CD_LOC_GUBUN);
       gcMGridAlign[CD_ITEM_CODE ] := 'C'; HideColumn(CD_ITEM_CODE);

    end;
end;

procedure TFPM700_INI.pr_Clear;
begin
  edtLOC_CODE.Clear;
  cbLOC_GUBUN.ItemIndex := 0;
  cedtSTOCK_QTY.Value := 0;
  //cedtQTY_EA.Value := 0;
  edtSTOCK_UNIT.Clear;
  edtCATNO1.Clear;
  edtITEM_NAME1.Clear;
  gsITEM_CODEPM700 := '';
  gsLOC_GUBUNPM700 := '';
  gsSTOCK_UNIT     := '';
end;

procedure TFPM700_INI.pr_qryOpen;
var
  la : Array of Integer;
begin                   

  if fn_DelCharacter(Mak_Location_From.Text) = '' then
    Mak_Location_From.Text := FormatMaskText('0-00-00-0;0', 'A00000');
  if fn_DelCharacter(Mak_Location_To.Text) = ''   then
    Mak_Location_To.Text := FormatMaskText('0-00-00-0;0', 'Z99999');
  if Mak_Location_From.Text > Mak_Location_To.Text then begin
    ShowMessage('From이 To보다 큽니다..');
    Exit;
  end;
  
  pr_ClearGrid(sgMain);

  with qryOpen do try
    Close;

    Params[0].Value := fn_DelCharacter(Mak_Location_From.Text);
    Params[1].Value := fn_DelCharacter(Mak_Location_To.Text); 

    if RadioButton0.Checked then begin
      Params[2].Value := 1;
      Params[3].Value := '%%';
    end
    else if RadioButton1.Checked then begin
      Params[2].Value := 2;
      Params[3].Value := gcSerial
    end
    else if RadioButton2.Checked then begin
      Params[2].Value := 2;
      Params[3].Value := gc88
    end
    else if RadioButton3.Checked then begin
      Params[2].Value := 2;
      Params[3].Value := gcNoSale;
    end;

    if Trim(edtCATNO.Text) = '' then
      Params[4].Value := '%%'
    else
      Params[4].Value := '%'+edtCATNO.Text+'%';


    pr_QryToGridWithoutProgress(qryOpen, sgMain, CD_STOCK_QTY);
    
    pr_SetRecordCount(sgMain);

  except
    on E : Exception do begin
      ShowMessage (E.Message);
      Exit;
    end;
  end;

end;

procedure TFPM700_INI.pr_Ready;
begin

end;

procedure TFPM700_INI.sgMainGetAlignment(Sender: TObject; ARow, ACol: Integer;
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

procedure TFPM700_INI.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFPM700_INI ,'FPM700_INI');
end;

procedure TFPM700_INI.SpeedButton1Click(Sender: TObject);
begin
  
  try
    FPopup := TFPopup.Create(Self);
    FPopup.pcCondition.ActivePageIndex := 0;
    if FPopup.ShowModal = mrOK then begin
      if (Sender = SpeedButton1) then begin
        edtCATNO.Text     := gsCATNO;
        edtITEM_NAME.Text := gsITEM_NAME;
      end
      else begin
        edtCATNO1.Text     := gsCATNO;
        edtITEM_NAME1.Text := gsITEM_NAME;
        gsITEM_CODEPM700   := gsITEM_CODE;
        
        edtSTOCK_UNIT.Text := gsSTOCK_UNIT;
      end;
    end;
  finally

  end;
end;

procedure TFPM700_INI.sgMainClick(Sender: TObject);
begin
  with sgMain do begin
    gsITEM_CODEPM700   := Cells[CD_ITEM_CODE, Row];

    gsLOC_GUBUNPM700      := Cells[CD_LOC_GUBUN, Row];
    edtLOC_CODE.Text      := Cells[CD_LOC_CODE,   Row];
    cbLOC_GUBUN.ItemIndex := fn_FindIndex(cbLOC_GUBUN, Cells[CD_LOC_NAME,   Row]);
    if (Cells[CD_STOCK_QTY, Row] = '') or
       (Trim(Cells[CD_STOCK_QTY, Row]) = '') then
      cedtSTOCK_QTY.Value      := 0
    else
      cedtSTOCK_QTY.Value      := StrToFloat(fn_GetNumber(Cells[CD_STOCK_QTY,        Row]));
    edtSTOCK_UNIT.Text := Cells[CD_QTY_UNIT, Row];

    edtCATNO1.Text     := Cells[CD_CATNO,   Row];
    edtITEM_NAME1.Text := Cells[CD_ITEM_NAME,   Row];
  end;
end;

procedure TFPM700_INI.Button3Click(Sender: TObject);
begin  
  if fn_ChkAUTH_LEVEL then Exit;
  if fn_InsertPM700 then begin
    SpeedButton2.Enabled := False;
    pr_Clear;
  end;
end;

procedure TFPM700_INI.btnInsertClick(Sender: TObject);
begin 
  if fn_ChkAUTH_LEVEL then Exit;
  edtLOC_CODE.ReadOnly := False;
  edtLOC_CODE.Color    := clWindow;
  SpeedButton2.Enabled := True;
  
  pr_Clear;
end;

function TFPM700_INI.fn_InsertPM700:Boolean;
begin

  if length(Trim(edtCATNO1.Text)) = 0 then begin
     MessageDlg(Label5.Caption + '를 입력하십시오.', MtWarning, [mbok], 0);
     Result := False;
     Exit;
  end;

  if cedtSTOCK_QTY.Value <= 0 then begin
     MessageDlg(Label4.Caption + '을 입력하십시오.', MtWarning, [mbok], 0);
     Result := False;
     Exit;
  end;

  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add(' exec SP_STOCK_RESULT :LOC_CODE, :ITEM_CODE, :STOCK_QTY, :STOCK_QTY_UNIT, :CP_USERID');
    ParamByName('LOC_CODE').Value       := fn_DelCharacter(edtLOC_CODE.Text);
    ParamByName('ITEM_CODE').Value      := gsITEM_CODEPM700;
    ParamByName('STOCK_QTY').Value      := cedtSTOCK_QTY.Value;
    ParamByName('STOCK_QTY_UNIT').Value := edtSTOCK_UNIT.Text;
    ParamByName('CP_USERID').Value      := gsUserID;
    Open;

    if Fields[0].Value = 0 then begin
      ShowMessage(Fields[1].AsString);   
      Result := False;
      Exit;
    end;    

    SpeedButton2.Enabled := False;
    edtLOC_CODE.ReadOnly := True;
    edtLOC_CODE.Color    := clSilver;
    
    Result := True;
    pr_qryOpen;
    ShowMessage('저장 하였습니다.');
  except
    on E : Exception do begin 
      Result := False;
      ShowMessage (E.Message);
      Exit;
    end;
  end;
end;

procedure TFPM700_INI.Button5Click(Sender: TObject);
begin
  pr_Clear;    
  SpeedButton2.Enabled := False;
end;

end.
