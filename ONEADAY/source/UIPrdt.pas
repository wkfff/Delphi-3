unit UIPrdt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFIPrdt = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    qryMain: TQuery;
    edBarcode: TEdit;
    Label9: TLabel;
    Button3: TButton;
    sb0001: TScrollBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    qryMainBARCODE: TStringField;
    qryMainITEM_STATE: TStringField;
    qryMainITEM_CODE: TStringField;
    qryMainITEM_NAME: TStringField;
    qryMainBARCODE_DATE: TStringField;
    qryMainPRDT_DATE: TStringField;
    qryMainPRDT_BACK_DATE: TStringField;
    qryMainSTORE_DATE: TStringField;
    qryMainSTORE_BACK_DATE: TStringField;
    qryMainAS_BACK_DATE: TStringField;
    qryMainCLOSE_DATE: TStringField;
    qryMainREMARKS: TStringField;
    qryMainI_DATE: TStringField;
    qryMainU_DATE: TStringField;
    qryMainI_NAME: TStringField;
    qryMainU_NAME: TStringField;
    qryMainITEM_STATE_NAME: TStringField;
    qryMainORGAN_CODE: TStringField;
    qryMainORGAN_NAME: TStringField;
    Panel1: TPanel;
    pnlMessage: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button2: TButton;
    Button5: TButton;
    Button4: TButton;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    dpBar1: TDateTimePicker;
    dpBar2: TDateTimePicker;
    Label4: TLabel;
    cbAmba: TComboBox;
    Label5: TLabel;
    cbITEM_STATE: TComboBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure edBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    gsJOBS : string;
    giCount : Integer;
    procedure pr_qryOpen(ABarcode, AORGAN_CODE, AITEM_STATE:String);
  public
    { Public declarations }
  end;

var
  FIPrdt: TFIPrdt;

implementation

uses UDM, UQMain, ULib, UDCSLib;

{$R *.dfm}

procedure TFIPrdt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIPrdt.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIPrdt.Button1Click(Sender: TObject);
var
  lsAmba, lsITEM_STATE : String;
begin
  if cbAmba.ItemIndex = 0 then
    lsAmba := '%%'
  else
    lsAmba := Copy(cbAmba.Text,1,4);

  if cbITEM_STATE.ItemIndex = 0 then
    lsITEM_STATE := '%%'
  else
    lsITEM_STATE := Copy(cbITEM_STATE.Text,1,4);
    //lsITEM_STATE := Copy(cbITEM_STATE.Text,1,1);

  pr_qryOpen('%%', lsAmba, lsITEM_STATE);
end;

procedure TFIPrdt.Button2Click(Sender: TObject);
begin
  DBGrid2Excel('', DBGrid1);
end;

procedure TFIPrdt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
  end;
end;

procedure TFIPrdt.FormDestroy(Sender: TObject);
begin
  FIPrdt := nil;
end;     

procedure TFIPrdt.FormCreate(Sender: TObject);
var
  li : integer;
begin
  edBarcode.Clear;
  dpBar1.Date := StrToDateTime(gsNowDate);
  dpBar2.Date := StrToDateTime(gsNowDate);

  giCount := 0;

  //gsJOBS  := gcPrdt;
  gsJOBS  := AITEM_STATE[gcPrdt];

  // 거래처
  DM.qrAmba.Close;
  DM.qrAmba.Open;

  cbAmba.Items.Clear;
  cbAmba.Items.Add('     전체');
  while not DM.qrAmba.Eof do
  begin
    cbAmba.Items.Add(DM.qrAmba.FieldValues['ORGAN_CODE']+ ' '+ DM.qrAmba.FieldValues['ORGAN_NAME']);
    DM.qrAmba.Next;
  end;
  DM.qrAmba.Close;
  Application.ProcessMessages;

  cbAmba.ItemIndex := 0;

  // 제품
  DM.qrSTH003.Close;
  DM.qrSTH003.Open;

  cbITEM_STATE.Items.Clear;
  cbITEM_STATE.Items.Add('     전체');
  while not DM.qrSTH003.Eof do
  begin
    cbITEM_STATE.Items.Add(DM.qrSTH003.FieldValues['ITEM_CODE']+ ' '+ DM.qrSTH003.FieldValues['ITEM_NAME']);
    DM.qrSTH003.Next;
  end;
  DM.qrSTH003.Close;
  Application.ProcessMessages;

  cbITEM_STATE.ItemIndex := 0;
  {

  // 상태
  cbITEM_STATE.Items.Clear;
  cbITEM_STATE.Items.Add('     전체');
  for li := 0 to 7 do
    cbITEM_STATE.Items.Add(AITEM_STATE[li]+' '+ASTATE_NAME[li]);

  cbITEM_STATE.ItemIndex := 0;}
    
  //Button1Click(Self);
end;

procedure TFIPrdt.Button3Click(Sender: TObject);
var
  lsNowDateTime : String;
  lsORGAN_CODE  : String;
begin                  
  if Trim(edBarcode.Text) = '' then begin
    pr_SetMessage(Panel3, '바코드가 없습니다.');  
    Exit;
  end;

  with DM.qryOpen do try

    lsORGAN_CODE := fn_GetITEM_STATUS(StrToInt(gsJOBS), edBarcode.Text, Panel3, DM.qryOpen);

    if lsORGAN_CODE = '-999' then Exit;
    
    Close;
    SQL.Clear;
    SQL.Add('   update dbo.SPM100                '+
            '      set ITEM_STATE = :ITEM_STATE, ');   
    SQL.Add(AColum_Name[gcPrdt]);
    SQL.Add(' = :prdt_date                       '+
            '    where barcode = :barcode                                            '+
            '                                                                        '+
            '   insert into spd101                                                   '+
            '   ([STDT_DATE],[BARCODE],[ORGAN_CODE],[ITEM_CODE],[ITEM_STATE],[I_ID]) '+
            '   values                                                               '+
            '   (:prdt_date, :barcode, :ORGAN_CODE, :ITEM_CODE, :ITEM_STATE, :I_ID ) ');
    lsNowDateTime      := gsNowDateTime;
    
    Params[0].AsString := gsJOBS;
    Params[1].AsString := lsNowDateTime;
    Params[2].AsString := edBarcode.Text;
    
    Params[3].AsString := lsNowDateTime;
    Params[4].AsString := edBarcode.Text;
    Params[5].AsString := lsORGAN_CODE;
    Params[6].AsString := Copy(edBarcode.Text,1,4);
    Params[7].AsString := gsJOBS;
    Params[8].AsString := gsUserID;
    ExecSQL;
              
    pr_SetMessage(Panel3, '정상처리 되었습니다.');

    pr_qryOpen(edBarcode.Text, '%%', '%%');

    Inc(giCount);
    //pr_SetMessage(Panel3, '입고 처리되었습니다.');
  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;

procedure TFIPrdt.Button5Click(Sender: TObject);
var
  lsORGAN_CODE : String;
begin
{
  if qryMain.FieldByName('ITEM_STATE').AsInteger = 0 then begin
    pr_SetMessage(Panel3, '발행내역은 삭제할 수 없습니다.');
    Exit;
  end;
  }
  if not (qryMain.FieldByName('BARCODE').IsNull)         and
         (qryMain.FieldByName('BARCODE').AsString <> '') then begin
    if qryMain.FieldByName('ORGAN_CODE').AsString = '' then begin
      lsORGAN_CODE := '0000';
    end;
    pr_DeleteBarcode(qryMain.FieldByName('BARCODE').AsString,
                     qryMain.FieldByName('ITEM_STATE').AsInteger);

    
    Button1Click(Self);
  end;
end;

procedure TFIPrdt.edBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    edBarcode.SelectAll;
    Button3Click(Self);
  end;
end;

procedure TFIPrdt.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // 출고
  if qryMain.FieldByName('ITEM_STATE').AsString = AITEM_STATE[gcStore] then
    DBGrid1.Canvas.Font.Color := clBlue
  else
    DBGrid1.Canvas.Font.Color := clBlack;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFIPrdt.pr_qryOpen(ABarcode, AORGAN_CODE, AITEM_STATE:String);
begin
  try
    qryMain.Close;
    qryMain.Params[0].AsString := ABarcode;
    qryMain.Params[1].AsString := AORGAN_CODE;
    qryMain.Params[2].AsString := AITEM_STATE;
    qryMain.Params[3].AsString := FormatDateTime('YYYY-MM-DD',dpBar1.Date);//+' zzzzzzzz';
    qryMain.Params[4].AsString := FormatDateTime('YYYY-MM-DD',dpBar2.Date);//+' zzzzzzzz';
    qryMain.Open;
    pr_SetCount(Panel4, qryMain);
  except
  end;

end;

end.
