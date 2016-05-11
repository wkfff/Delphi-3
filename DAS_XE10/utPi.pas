unit utPi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmPi = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPi: TfrmPi;

implementation

uses
  utDAIHAN_MAIN;

{$R *.dfm}

procedure TfrmPi.FormShow(Sender: TObject);
var
  i : Integer;
begin
  frmPi.Left := frmDAIHAN_MAIN.Left + frmDAIHAN_MAIN.Width;
  frmPi.Top := frmDAIHAN_MAIN.Top;

  for i := 0 to frmPi.ComponentCount -1 do
    if (frmPi.Components[i] is TButton) and (Pos('Button1', TButton(frmPi.Components[i]).Caption) > 0) then
    begin
      TButton(frmPi.Components[i]).Caption := StringReplace(TButton(frmPi.Components[i]).Name,'Button','Pi',[rfReplaceAll]);
      // Event
      TButton(frmPi.Components[i]).OnClick := ButtonClick;
    end;
end;

procedure TfrmPi.ButtonClick(Sender: TObject);
var
  btnNo : Integer;
begin
//  ShowMessage((Sender as TButton).Caption);
  Edit1.Text := StringReplace((Sender as TButton).Name,'Button','',[rfReplaceAll]);
  frmDAIHAN_MAIN.Button11.Caption := StringReplace((Sender as TButton).Name,'Button','',[rfReplaceAll]);
end;

procedure TfrmPi.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
