//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utMonitor
//  파일내용  : 모니터링 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, jpeg, ExtCtrls, TFlatPanelUnit,
  TFlatGaugeUnit, DB, DBTables;

type
  TfrmMonitor = class(TForm)
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    fpIN2: TFlatPanel;
    fpIN1: TFlatPanel;
    fpIN3: TFlatPanel;
    fgPick: TFlatGauge;
    fpPick2: TFlatPanel;
    fpPick1: TFlatPanel;
    fpPick3: TFlatPanel;
    fgDAS: TFlatGauge;
    fpDAS2: TFlatPanel;
    fpDAS1: TFlatPanel;
    fpDAS3: TFlatPanel;
    fgCheck: TFlatGauge;
    fpCheck2: TFlatPanel;
    fpCheck1: TFlatPanel;
    fpCheck3: TFlatPanel;
    qrJob: TQuery;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonitor: TfrmMonitor;

implementation

uses utDM;

{$R *.dfm}

procedure TfrmMonitor.FormCreate(Sender: TObject);
begin
  //Left := 1064; //1064;
  //Top := 0;
  
  WebBrowser1.Navigate('http://www.daihan-sci.com/newproduct_wms.html');
  Application.ProcessMessages;
end;

procedure TfrmMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMonitor.Timer1Timer(Sender: TObject);
begin
  qrJob.Close;
  qrJob.ParamByName('EXP_DATE').AsString := FormatDateTime('YYYYMMDD', now);
  qrJob.ParamByName('ORDER_DT').AsString := FormatDateTime('YYYYMMDD', now)+ '000000';
  qrJob.Open;
  fpIN1.Caption := qrJob.FieldByName('TOT').AsString;
  fpIN2.Caption := qrJob.FieldByName('DONE').AsString;
  fpIN3.Caption := qrJob.FieldByName('YET').AsString;
  qrJob.Next;
  fpPick1.Caption := qrJob.FieldByName('TOT').AsString;
  fpPick2.Caption := qrJob.FieldByName('DONE').AsString;
  fpPick3.Caption := qrJob.FieldByName('YET').AsString;
  if qrJob.FieldByName('DONE').AsInteger = 0 then fgPick.Progress := 0
  else fgPick.Progress := (qrJob.FieldByName('DONE').AsInteger div qrJob.FieldByName('TOT').AsInteger) * 100;
  qrJob.Next;
  fpDAS1.Caption := qrJob.FieldByName('TOT').AsString;
  fpDAS2.Caption := qrJob.FieldByName('DONE').AsString;
  fpDAS3.Caption := qrJob.FieldByName('YET').AsString;
  if qrJob.FieldByName('DONE').AsInteger = 0 then fgDAS.Progress := 0
  else fgDAS.Progress := (qrJob.FieldByName('DONE').AsInteger div qrJob.FieldByName('TOT').AsInteger) * 100;
  qrJob.Next;
  fpCheck1.Caption := qrJob.FieldByName('TOT').AsString;
  fpCheck2.Caption := qrJob.FieldByName('DONE').AsString;
  fpCheck3.Caption := qrJob.FieldByName('YET').AsString;
  if qrJob.FieldByName('DONE').AsInteger = 0 then fgCheck.Progress := 0
  else fgCheck.Progress := (qrJob.FieldByName('DONE').AsInteger div qrJob.FieldByName('TOT').AsInteger) * 100;
  qrJob.Close;
end;

end.
