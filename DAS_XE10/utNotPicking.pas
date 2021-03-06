//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utNotPicking
//  파일내용  : DAS 미피킹 내역조회 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utNotPicking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, CheckLst, DB, DBTables, DBGrids;

type
  TfrmNotPicking = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button3: TButton;
    qryItemScan: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    qryItemScanORDER_NO: TStringField;
    qryItemScanITEM_CODE: TStringField;
    qryItemScanITEM_NAME: TStringField;
    qryItemScanCATNO: TStringField;
    qryItemScanORDER_UNIT: TStringField;
    qryItemScanPICK_QTY: TFloatField;
    qryItemScanLOC_CODE: TStringField;
    qryItemScanUSERID: TStringField;
    qryItemScanNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotPicking: TfrmNotPicking;

implementation

{$R *.dfm}

uses utDAIHAN_MAIN, utDM;

procedure TfrmNotPicking.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmNotPicking.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNotPicking.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNotPicking.Button1Click(Sender: TObject);
begin
  qryItemScan.Close;
  qryItemScan.Params[0].AsString := frmDAIHAN_MAIN.Label6.Caption;
  qryItemScan.Open;
end;

end.
