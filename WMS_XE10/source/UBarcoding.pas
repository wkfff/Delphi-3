unit UBarcoding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls;

type
  TFBarcoding = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarcoding: TFBarcoding;

implementation

{$R *.dfm}

procedure TFBarcoding.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFBarcoding.FormDestroy(Sender: TObject);
begin
  FBarcoding := nil;
end;

end.
