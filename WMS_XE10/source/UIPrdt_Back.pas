unit UIPrdt_Back;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFIPrdt_Back = class(TForm)
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
    DBEdit2: TDBEdit;
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
    procedure pr_qryOpen(ABarcode:String);
  public
    { Public declarations }
  end;

var
  FIPrdt_Back: TFIPrdt_Back;

implementation

uses UDM, UQMain, ULib, UDCSLib;

{$R *.dfm}

procedure TFIPrdt_Back.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIPrdt_Back.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFIPrdt_Back.Button1Click(Sender: TObject);
begin
  pr_qryOpen('%%');
end;

procedure TFIPrdt_Back.Button2Click(Sender: TObject);
begin
  DBGrid2Excel('', DBGrid1);
end;

procedure TFIPrdt_Back.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
  end;
end;

procedure TFIPrdt_Back.FormDestroy(Sender: TObject);
begin
  FIPrdt_Back := nil;
end;  

procedure TFIPrdt_Back.FormCreate(Sender: TObject);
begin
  edBarcode.Clear;
  dpBar1.Date := StrToDateTime(gsNowDate);
  dpBar2.Date := StrToDateTime(gsNowDate);

  giCount := 0;
  //gsJOBS  := gcPrdt_Back;
  gsJOBS  := AITEM_STATE[gcPrdt_Back];
  Button1Click(Self);
end;

procedure TFIPrdt_Back.Button3Click(Sender: TObject);
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
    SQL.Add(AColum_Name[gcPrdt_Back]);
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


    pr_qryOpen(edBarcode.Text);

    Inc(giCount);
    //pr_SetMessage(Panel3, '입고 처리되었습니다.');
  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;

procedure TFIPrdt_Back.Button5Click(Sender: TObject);
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

    pr_qryOpen('%%');
  end;
end;

procedure TFIPrdt_Back.edBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    edBarcode.SelectAll;
    Button3Click(Self);
  end;
end;

procedure TFIPrdt_Back.pr_qryOpen(ABarcode:String);
begin
  qryMain.Close;
  qryMain.Params[0].AsString := ABarcode;
  qryMain.Params[1].AsString := gsJOBS;
  qryMain.Params[2].AsString := FormatDateTime('YYYY-MM-DD',dpBar1.Date);
  qryMain.Params[3].AsString := FormatDateTime('YYYY-MM-DD',dpBar2.Date)+'zzzzzzzzz';
  qryMain.Open;             

  pr_SetCount(Panel4, qryMain);
end;

end.
