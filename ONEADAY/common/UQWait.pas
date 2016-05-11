//****************************************************************************//
//*                                                                          *//
//*   Unit        ID : FQWait                                                *//
//*                                                                          *//
//*   ���α׷�    ID : PV (Process View)                                     *//
//*                                                                          *//
//*   Unit   ��   �� : �۾��� ���������� ǥ���ϴ� ȭ��                       *//
//*                                                                          *//
//*   ��  ��  ��  �� : ����.                                                 *//
//*                                                                          *//
//*   ��  ��  ��  �� : ����.                                                 *//
//*                                                                          *//
//*   Input     ���� : ����.                                                 *//
//*                                                                          *//
//*   Output    ���� : ����.                                                 *//
//*                                                                          *//
//*   ��ũ(DLL) �Լ� : ����.                                                 *//
//*                                                                          *//
//*   ��� ���̺�    : ����.                                                 *//
//*                                                                          *//
//*   Special Logic  : ����.                                                 *//
//*                                                                          *//
//*                                                                          *//
//****************************************************************************//
//*                              ���� ���泻��                               *//
//*                                                                          *//
//*    ��������          ��  ��  ��               ��           ��            *//
//*   ------------    ----------------  -----------------------------------  *//
//*                                                                          *//
//*                                                                          *//
//****************************************************************************//

unit UQWait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Gauges;

type
  TFQWait = class(TForm)
    PLMessage: TPanel;
    Panel1: TPanel;
    LBTITL: TLabel;
    Panel2: TPanel;
    LBPName: TLabel;
    Amp: TAnimate;
    Panel3: TPanel;
    v_speed: TGauge;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  //  procedure CreateParams(var Params : TCreateParams);override;
    gbOnoff: Boolean;
  public
    { Public declarations }
    gbOnAndOn: Boolean;
  end;

var
  FQWait: TFQWait;

implementation

{$R *.DFM}
 {
procedure TFQWait.CreateParams(var Params : TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not WS_OVERLAPPEDWINDOW or WS_BORDER;
end;
}

procedure TFQWait.FormCreate(Sender: TObject);
begin
//  Left := (Screen.Width - Width) div 2;
//  Top  := (Screen.Height - Height) div 2;
  AMP.active := True;
  //gbOnAndOn := True;
  Timer1.Enabled := False;
  Timer1.Interval := 300;
  Timer1.Enabled := True;
//  LBPName.Caption := gsDisplay_Code[134];
//  LBTITL.Caption := gsDisplay_Code[135];

end;

procedure TFQWait.Timer1Timer(Sender: TObject);
begin
  if not gbOnAndOn then Exit;

  if (LBPName.Tag < 20) then
  begin
    if gbOnoff then
    begin            
      Application.ProcessMessages;
      LBPName.Font.Color := $00BEDDAA;
      gbOnoff := False;
    end
    else
    begin           
      Application.ProcessMessages;
      LBPName.Font.Color := clBlack;
      gbOnoff := True;
    end;
  end;
  LBPName.Tag := LBPName.Tag + 1;
end;

procedure TFQWait.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFQWait.FormDestroy(Sender: TObject);
begin
  FQWait := nil;
end;

end.
