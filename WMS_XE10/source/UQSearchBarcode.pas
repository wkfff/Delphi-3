unit UQSearchBarcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFQSearchBarcode = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    qryMain: TQuery;
    qryMainSTDT_DATE: TStringField;
    qryMainBARCODE: TStringField;
    qryMainITEM_STATE_NAME: TStringField;
    qryMainITEM_STATE: TStringField;
    qryMainITEM_CODE: TStringField;
    qryMainITEM_NAME: TStringField;
    qryMainORGAN_CODE: TStringField;
    qryMainORGAN_NAME: TStringField;
    qryMainCLOSE_DATE: TStringField;
    qryMainREMARKS: TStringField;
    qryMainI_DATE: TStringField;
    qryMainI_NAME: TStringField;
    qryMainU_DATE: TStringField;
    qryMainU_NAME: TStringField;
    Panel2: TPanel;
    sb0001: TScrollBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    edBarcode: TEdit;
    dpBar1: TDateTimePicker;
    dpBar2: TDateTimePicker;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    Panel1: TPanel;
    pnlMessage: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button2: TButton;
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
    procedure edBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFJOBS : string;
  public
    { Public declarations }
  end;

var
  FQSearchBarcode: TFQSearchBarcode;

implementation

uses UDM, UQMain, ULib, UDCSLib;

{$R *.dfm}

procedure TFQSearchBarcode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFQSearchBarcode.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFQSearchBarcode.Button1Click(Sender: TObject);
begin
  if edBarcode.Text <> '' then begin
    qryMain.Close;
    qryMain.Params[0].AsString := edBarcode.Text;
    qryMain.Params[1].AsString := FormatDateTime('YYYY-MM-DD',dpBar1.Date);
    qryMain.Params[2].AsString := FormatDateTime('YYYY-MM-DD',dpBar2.Date)+'zzzzzzzzz';
    qryMain.Open;
    
    pr_SetCount(Panel4, qryMain);

    if qryMain.IsEmpty then begin
      pr_SetMessage(Panel3, '조회 내역이 없습니다.');
      Exit;
    end;

  end
  else begin

      pr_SetMessage(Panel3, '바코드가 없습니다.');
  end;
end;

procedure TFQSearchBarcode.Button2Click(Sender: TObject);
begin
  DBGrid2Excel('', DBGrid1);
end;

procedure TFQSearchBarcode.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
  end;
end;

procedure TFQSearchBarcode.FormDestroy(Sender: TObject);
begin
  FQSearchBarcode := nil;
end;

procedure TFQSearchBarcode.Button3Click(Sender: TObject);
begin
//
end;

procedure TFQSearchBarcode.FormCreate(Sender: TObject);
begin
  dpBar1.Date := StrToDateTime(gsNowDate)-7;
  dpBar2.Date := StrToDateTime(gsNowDate);
end;

procedure TFQSearchBarcode.edBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Button1Click(Self);
  end;
end;

end.
