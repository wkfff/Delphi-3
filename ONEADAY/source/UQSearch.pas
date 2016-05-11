unit UQSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFQSearch = class(TForm)
    cbPummok: TComboBox;
    Label1: TLabel;
    cbAmba: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    cbStock: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    qrSPM100: TQuery;
    qrSPM100BARCODE: TStringField;
    qrSPM100PROPERTY_SECTION: TStringField;
    qrSPM100PROPERTY_GUBUN: TStringField;
    qrSPM100PROPERTY_STATE: TStringField;
    qrSPM100PROPERTY_SERIAL: TStringField;
    qrSPM100PROPERTY_NAME: TStringField;
    qrSPM100IMPORT_DATE: TStringField;
    qrSPM100IMPORT_PRICE: TFloatField;
    qrSPM100RENT_DATE: TStringField;
    qrSPM100ORGAN_CODE: TStringField;
    qrSPM100REPAIR_DATE: TStringField;
    qrSPM100MAINTENANCE_GUBUN: TStringField;
    qrSPM100MAINTENANCE_START_DATE: TStringField;
    qrSPM100MAINTENANCE_END_DATE: TStringField;
    qrSPM100VERSIONS: TStringField;
    qrSPM100CERTIFICATE_END_DATE: TStringField;
    qrSPM100SECURITY_USERID: TStringField;
    qrSPM100REMARKS: TStringField;
    qrSPM100RETIRE_DATE: TStringField;
    qrSPM100I_DATE: TStringField;
    qrSPM100I_ID: TStringField;
    qrSPM100U_DATE: TStringField;
    qrSPM100U_ID: TStringField;
    qrSPM100ORGAN_NAME: TStringField;
    qrSPM100CODE_SNM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFJOBS : string;
  public
    { Public declarations }
  end;

var
  FQSearch: TFQSearch;

implementation

uses UMain, UDM, UQRSearch;

{$R *.dfm}

procedure TFQSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFQSearch.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Height := FMain.ClientHeight - FMain.Panel1.Height - FMain.sbMsg.Height - 7;
  Width := Fmain.ClientWidth - 4;

  FFJOBS := '0001';

  DataModule1.qrJob.Close;
  DataModule1.qrJob.Params[0].Value := FFJOBS;
  DataModule1.qrJob.Open;

  cbPummok.Items.Clear;
  cbPummok.Items.Add('     전체');
  while not DataModule1.qrJob.Eof do
  begin
    cbPummok.Items.Add(DataModule1.qrJob.FieldValues['CODE_CD']+ ' '+ DataModule1.qrJob.FieldValues['CODE_SNM']);
    DataModule1.qrJob.Next;
  end;
  DataModule1.qrJob.Close;
  Application.ProcessMessages;
// 공관
  DataModule1.qrAmba.Close;
  DataModule1.qrAmba.Open;

  cbAmba.Items.Clear;
  cbAmba.Items.Add('     전체');
  while not DataModule1.qrAmba.Eof do
  begin
    cbAmba.Items.Add(DataModule1.qrAmba.FieldValues['ORGAN_CODE']+ ' '+ DataModule1.qrAmba.FieldValues['ORGAN_NAME']);
    DataModule1.qrAmba.Next;
  end;
  DataModule1.qrAmba.Close;
  Application.ProcessMessages;
  cbPummok.ItemIndex := 0;
  cbAmba.ItemIndex := 0;
end;

procedure TFQSearch.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFQSearch.Button1Click(Sender: TObject);
begin
  qrSPM100.Close;
  qrSPM100.Params[0].Value := FFJOBS;
  if cbPummok.ItemIndex = 0 then qrSPM100.Params[1].Value := '%%' else qrSPM100.Params[1].Value := copy(cbPummok.Text, 1, 4);
  if cbStock.ItemIndex = 0 then qrSPM100.Params[2].Value := '%%' else qrSPM100.Params[2].Value := cbStock.Text;
  if cbAmba.ItemIndex = 0 then qrSPM100.Params[3].Value := '%%' else qrSPM100.Params[3].Value := copy(cbAmba.Text, 1, 4);
  qrSPM100.Open;
end;

procedure TFQSearch.Button2Click(Sender: TObject);
begin
  FMain.DBGrid2Excel('', DBGrid1);
end;

procedure TFQSearch.Button3Click(Sender: TObject);
begin
  Application.CreateForm(TFQRSearch, FQRSearch);
  FQRSearch.qrLabel_Period.Caption := cbStock.Text;
  FQRSearch.QuickRep1.Preview;
end;

procedure TFQSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);
    VK_F3 : Button3Click(Sender);
  end;
end;

end.
