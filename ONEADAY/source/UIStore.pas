unit UIStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFIStore = class(TForm)
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
    Label6: TLabel;
    dpBar1: TDateTimePicker;
    Label2: TLabel;
    dpBar2: TDateTimePicker;
    Button1: TButton;
    qryMainITEM_STATE_NAME: TStringField;
    qryMainORGAN_CODE: TStringField;
    qryMainORGAN_NAME: TStringField;
    Label3: TLabel;
    cbAmba: TComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    pnlMessage: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button2: TButton;
    Button5: TButton;
    Button4: TButton;
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
  private
    { Private declarations }
    gsJOBS : string;
    giCount : Integer;
    procedure pr_qryOpen(ABarcode, AORGAN_CODE:String);
  public
    { Public declarations }
  end;

var
  FIStore: TFIStore;

implementation

uses UDM, UQMain, ULib, UDCSLib;

{$R *.dfm}

procedure TFIStore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIStore.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIStore.Button1Click(Sender: TObject);
var
  lsORGAN_CODE : String;
begin

  if cbAmba.ItemIndex = 0 then begin
    lsORGAN_CODE := '%%';
  end
  else begin
    lsORGAN_CODE := Copy(cbAmba.Text,1,4);
  end;

  pr_qryOpen('%%', lsORGAN_CODE);
end;

procedure TFIStore.Button2Click(Sender: TObject);
begin
  DBGrid2Excel('', DBGrid1);
end;

procedure TFIStore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
  end;
end;

procedure TFIStore.FormDestroy(Sender: TObject);
begin
  FIStore := nil;
end;      

procedure TFIStore.FormCreate(Sender: TObject);
begin
  edBarcode.Clear;
  dpBar1.Date := StrToDateTime(gsNowDate);
  dpBar2.Date := StrToDateTime(gsNowDate);

  giCount := 0;
  //gsJOBS  := gcStore;
  gsJOBS  := AITEM_STATE[gcStore];
  Button1Click(Self);  

  DM.qrAmba.Close;
  DM.qrAmba.Open;

  cbAmba.Items.Clear;
  cbAmba.Items.Add('     ��ü');
  while not DM.qrAmba.Eof do
  begin
    cbAmba.Items.Add(DM.qrAmba.FieldValues['ORGAN_CODE']+ ' '+ DM.qrAmba.FieldValues['ORGAN_NAME']);
    DM.qrAmba.Next;
  end;
  DM.qrAmba.Close;
  Application.ProcessMessages;

  cbAmba.ItemIndex := 0;
end;

procedure TFIStore.Button3Click(Sender: TObject);
var
  lsNowDateTime : String;
  lsORGAN_CODE  : String;
begin                               
  if Trim(edBarcode.Text) = '' then begin
    pr_SetMessage(Panel3, '���ڵ尡 �����ϴ�.');
    Exit;
  end;

  if cbAmba.ItemIndex = 0 then begin
    pr_SetMessage(Panel3, '�ŷ�ó�� �����Ͻʽÿ�.');
    Exit;
  end;

  
  with DM.qryOpen do try

    lsORGAN_CODE := fn_GetITEM_STATUS(StrToInt(gsJOBS), edBarcode.Text, Panel3, DM.qryOpen);

    if lsORGAN_CODE = '-999' then Exit;

    Close;
    SQL.Clear;
    SQL.Add('   update dbo.SPM100                '+
            '      set ITEM_STATE = :ITEM_STATE, ');
    SQL.Add(AColum_Name[gcStore]);
    SQL.Add(' = :prdt_date                       '+
            '      , ORGAN_CODE = :ORGAN_CODE    '+
            '    where barcode = :barcode                                            '+
            '                                                                        '+
            '   insert into spd101                                                   '+
            '   ([STDT_DATE],[BARCODE],[ORGAN_CODE],[ITEM_CODE],[ITEM_STATE],[I_ID]) '+
            '   values                                                               '+
            '   (:prdt_date, :barcode, :ORGAN_CODE, :ITEM_CODE, :ITEM_STATE, :I_ID ) ');
    lsNowDateTime      := gsNowDateTime;
    
    Params[0].AsString := gsJOBS;
    Params[1].AsString := lsNowDateTime;
    Params[2].AsString := Copy(cbAmba.Text,1,4);
    Params[3].AsString := edBarcode.Text;

    Params[4].AsString := lsNowDateTime;
    Params[5].AsString := edBarcode.Text;
    Params[6].AsString := Copy(cbAmba.Text,1,4);
    Params[7].AsString := Copy(edBarcode.Text,1,4);
    Params[8].AsString := gsJOBS;
    Params[9].AsString := gsUserID;
    ExecSQL;               
    pr_SetMessage(Panel3, '����ó�� �Ǿ����ϴ�.');


    pr_qryOpen(edBarcode.Text, Copy(cbAmba.Text,1,4));

    Inc(giCount);
    //pr_SetMessage(Panel3, '�԰� ó���Ǿ����ϴ�.');
  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;

procedure TFIStore.Button5Click(Sender: TObject);
var
  lsORGAN_CODE : String;
begin
{
  if qryMain.FieldByName('ITEM_STATE').AsInteger = 0 then begin
    pr_SetMessage(Panel3, '���೻���� ������ �� �����ϴ�.');
    Exit;
  end;
  }
  if not (qryMain.FieldByName('BARCODE').IsNull)         and
         (qryMain.FieldByName('BARCODE').AsString <> '') then begin
    if qryMain.FieldByName('ORGAN_CODE').AsString = '' then begin
      lsORGAN_CODE := '0000';
    end
    else begin
      lsORGAN_CODE := qryMain.FieldByName('ORGAN_CODE').AsString;
    end;
    pr_DeleteBarcode(qryMain.FieldByName('BARCODE').AsString,
                     qryMain.FieldByName('ITEM_STATE').AsInteger);

    pr_qryOpen('%%','%%');
  end;
end;

procedure TFIStore.edBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    edBarcode.SelectAll;
    Button3Click(Self);
  end;
end;

procedure TFIStore.pr_qryOpen(ABarcode, AORGAN_CODE:String);
begin
  qryMain.Close;
  qryMain.Params[0].AsString := ABarcode;
  qryMain.Params[1].AsString := gsJOBS;
  qryMain.Params[2].AsString := FormatDateTime('YYYY-MM-DD',dpBar1.Date);
  qryMain.Params[3].AsString := FormatDateTime('YYYY-MM-DD',dpBar2.Date)+'zzzzzzzzz';   
  qryMain.Params[4].AsString := AORGAN_CODE;
  qryMain.Open;            

  pr_SetCount(Panel4, qryMain);
end;

end.
