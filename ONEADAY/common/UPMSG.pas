unit UPMSG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBBlankFrm, StdCtrls, TFlatButtonUnit, ExtCtrls;

const
    cFontSize = 16;

type
  TFPMSG = class(TFBBlankFrm)
    pnlMsg: TPanel;
    Panel2: TPanel;
    lblMsg: TLabel;
    fbtnOK: TButton;
    fbtnCancel: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure fbtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    giYN       : Integer;
    gsMessage  : String;
  end;

var
  FPMSG: TFPMSG;

implementation

{$R *.dfm}

procedure TFPMSG.FormDestroy(Sender: TObject);
begin
  inherited;
  FPMSG := nil;
end;

procedure TFPMSG.fbtnOKClick(Sender: TObject);
begin
//  Close;
end;

procedure TFPMSG.FormShow(Sender: TObject);
begin
  Caption          := '알림';
  if Pos(#13, gsMessage) > 0 then begin
    lblMsg.Top    := lblMsg.Height;
    lblMsg.Height := lblMsg.Height * 2 + lblMsg.Height div 2 ;
  end;
  lblMsg.Caption   := gsMessage;
  lblMsg.Font.Size := cFontSize;
//  pnlMsg.Caption   := gsMessage;
//  pnlMsg.Font.Size := cFontSize;
  case giYN of
    // 메시지 일반
    0 : begin
          fbtnCancel.Visible := False;
          fbtnOK.Left := Width div 2 - (fbtnOK.Width div 2);
        end;
    // Yes or No
    1 : begin
        end;
  end;
end;

procedure TFPMSG.FormCreate(Sender: TObject);
begin
  giYN := 0;
end;

end.
