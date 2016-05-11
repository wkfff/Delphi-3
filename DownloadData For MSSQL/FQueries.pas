unit FQueries;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.DateUtils;

type
  TQueryForm = class(TForm)
    Panel_mt100: TPanel;
    Panel_mt200: TPanel;
    Panel_mt300: TPanel;
    Panel_pd120: TPanel;
    Panel_pd124: TPanel;
    Panel_pd126: TPanel;
    Panel_pm100: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel_mt100Click(Sender: TObject);
    procedure Panel_mt200Click(Sender: TObject);
    procedure Panel_mt300Click(Sender: TObject);
    procedure Panel_pd120Click(Sender: TObject);
    procedure Panel_pd124Click(Sender: TObject);
    procedure Panel_pd126Click(Sender: TObject);
    procedure Panel_pm100Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    selQuery : string;
    { Public declarations }
  end;

var
  QueryForm: TQueryForm;

implementation

{$R *.dfm}

procedure TQueryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TQueryForm.FormShow(Sender: TObject);
begin
  selQuery := '';
end;

procedure TQueryForm.Panel_mt100Click(Sender: TObject);
begin
  selQuery := 'select * from mt100';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_mt200Click(Sender: TObject);
begin
  selQuery := 'select * from mt200';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_mt300Click(Sender: TObject);
begin
  selQuery := 'select * from mt300';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_pd120Click(Sender: TObject);
begin
  selQuery := 'select * from pd120';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_pd124Click(Sender: TObject);
begin
  selQuery := 'select * from pd124';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_pd126Click(Sender: TObject);
begin
  selQuery := 'select * from pd126';
  ModalResult := mrOk;
end;

procedure TQueryForm.Panel_pm100Click(Sender: TObject);
begin
  selQuery := 'select * from pm100';
  ModalResult := mrOk;
end;

end.
