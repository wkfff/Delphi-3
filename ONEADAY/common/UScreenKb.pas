unit UScreenKb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TFlatButtonUnit, UBBlankFrm, Mask, CurrEdit;

type
  TFScreenKb = class(TForm)
    Panel24: TPanel;
    Panel1: TPanel;
    edtInput: TEdit;
    Panel2: TPanel;
    fbt_A: TFlatButton;
    fbt_B: TFlatButton;
    fbt_C: TFlatButton;
    fbt_9: TFlatButton;
    fbt_7: TFlatButton;
    fbt_8: TFlatButton;
    fbt_G: TFlatButton;
    fbt_F: TFlatButton;
    fbt_D: TFlatButton;
    fbt_E: TFlatButton;
    fbt_H: TFlatButton;
    fbt_I: TFlatButton;
    fbt_J: TFlatButton;
    fbt_6: TFlatButton;
    fbt_4: TFlatButton;
    fbt_5: TFlatButton;
    fbt_N: TFlatButton;
    fbt_M: TFlatButton;
    fbt_K: TFlatButton;
    fbt_L: TFlatButton;
    fbt_O: TFlatButton;
    fbt_P: TFlatButton;
    fbt_Q: TFlatButton;
    fbt_3: TFlatButton;
    fbt_1: TFlatButton;
    fbt_2: TFlatButton;
    fbt_U: TFlatButton;
    fbt_T: TFlatButton;
    fbt_R: TFlatButton;
    fbt_S: TFlatButton;
    fbt_V: TFlatButton;
    fbt_W: TFlatButton;
    fbt_X: TFlatButton;
    fbt_0: TFlatButton;
    fbt_Dot: TFlatButton;
    fbt_Y: TFlatButton;
    fbt_Z: TFlatButton;
    fbtSpace: TFlatButton;
    fbtBackSpace: TFlatButton;
    fbtClear: TFlatButton;
    fbtInput: TFlatButton;
    fbtClose: TFlatButton;
    Label9: TLabel;
    edtMaskEdit: TMaskEdit;
    fbtnHyphen: TFlatButton;
    procedure fbtInputClick(Sender: TObject);
    procedure fbtCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fbt_AClick(Sender: TObject);
    procedure fbtClearClick(Sender: TObject);
    procedure fbtSpaceClick(Sender: TObject);
    procedure fbtBackSpaceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    giInputType: Integer;
  public
    { Public declarations }
    AWinControl: TWinControl;
    APanel: TPanel;
    giValueLength: Integer;
    giValueType: Integer; // 1:영문가능 2:숫자
  end;

var
  FScreenKb: TFScreenKb;

implementation

{$R *.DFM}

procedure TFScreenKb.fbtInputClick(Sender: TObject);
begin
  if (AWinControl is TEdit) then begin
    (AWinControl as TEdit).Text := edtInput.Text;
  end
  else if (AWinControl is TPanel) then begin
    (AWinControl as TPanel).Caption := edtInput.Text;
  end
  else if (AWinControl is TCurrencyEdit) then begin
    if Trim(edtInput.Text) = '' then
      edtInput.Text := '0';
    (AWinControl as TCurrencyEdit).Value := StrToFloat(edtInput.Text);
  end;

  Close;
end;

procedure TFScreenKb.fbtCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFScreenKb.FormShow(Sender: TObject);
  procedure pr_LeftMove(AWinControl: TWinControl; ALeft: integer);
  begin
    AWinControl.Left := AWinControl.Left + ALeft;
  end;
var liLeftMove: integer;
begin
{
  if (AWinControl is TwMaskEdit) then begin

    wedtMaskEdit.Visible := True;

    giInputType := 1;
  end;
  }
  if giValueType = 2 then begin
    fbt_A.Enabled := False;
    fbt_B.Enabled := False;
    fbt_C.Enabled := False;
    fbt_D.Enabled := False;
    fbt_E.Enabled := False;
    fbt_F.Enabled := False;
    fbt_G.Enabled := False;
    fbt_H.Enabled := False;
    fbt_I.Enabled := False;
    fbt_J.Enabled := False;
    fbt_K.Enabled := False;
    fbt_L.Enabled := False;
    fbt_M.Enabled := False;
    fbt_N.Enabled := False;
    fbt_O.Enabled := False;
    fbt_P.Enabled := False;
    fbt_Q.Enabled := False;
    fbt_R.Enabled := False;
    fbt_S.Enabled := False;
    fbt_T.Enabled := False;
    fbt_U.Enabled := False;
    fbt_V.Enabled := False;
    fbt_W.Enabled := False;
    fbt_X.Enabled := False;
    fbt_Y.Enabled := False;
    fbt_Z.Enabled := False;
    fbtSpace.Enabled := False;
    fbt_Dot.Enabled := False;
    fbtnHyphen.Enabled := False;
{
    liLeftMove := -240;
    pr_LeftMove(fbt_0       ,liLeftMove);
    pr_LeftMove(fbt_1       ,liLeftMove);
    pr_LeftMove(fbt_2       ,liLeftMove);
    pr_LeftMove(fbt_3       ,liLeftMove);
    pr_LeftMove(fbt_4       ,liLeftMove);
    pr_LeftMove(fbt_5       ,liLeftMove);
    pr_LeftMove(fbt_6       ,liLeftMove);
    pr_LeftMove(fbt_7       ,liLeftMove);
    pr_LeftMove(fbt_8       ,liLeftMove);
    pr_LeftMove(fbt_9       ,liLeftMove);
    pr_LeftMove(fbt_Dot     ,liLeftMove);
    pr_LeftMove(fbtBackSpace,liLeftMove);
    pr_LeftMove(fbtClear    ,liLeftMove);
}
  end;

  if Length(edtInput.Text) > 0 then begin
    edtInput.SetFocus;
    edtInput.SelStart := Length(edtInput.Text);
  end;
end;

procedure TFScreenKb.fbt_AClick(Sender: TObject);
  function ft_SetCharacter(AChar: string): string;
  var
    li: Integer;
  begin
    Result := '';

    for li := 1 to length(edtMaskEdit.Text) do begin
      if Copy(edtMaskEdit.Text, li, 1) = ' ' then begin
        if li = 1 then
          Result := AChar + Copy(edtMaskEdit.Text, 2, Length(edtMaskEdit.Text))
        else
          Result := Copy(edtMaskEdit.Text, 1, li - 1) + AChar
            + Copy(edtMaskEdit.Text, li + 1, Length(edtMaskEdit.Text));
        Break;
      end;
    end;

  end;
begin
  if (giValueType = 2) and
    (edtInput.Text = '0') then begin
//    edtInput.Text := (Sender as TFlatButton).Caption;
    if giInputType = 1 then
      edtMaskEdit.Text := (Sender as TFlatButton).Caption
    else begin
      edtInput.Text := (Sender as TFlatButton).Caption;
      edtInput.SetFocus;
      edtInput.SelStart := Length(edtInput.Text);
    end;
  end
  else begin
    //입력문자열 길이 측정
    if (giValueLength = 0) or
      (giValueLength <> Length(edtInput.Text)) then begin
      if giInputType = 1 then begin
        edtMaskEdit.Text := ft_SetCharacter((Sender as TFlatButton).Caption);
      end
      else begin
        edtInput.Text := edtInput.Text + (Sender as TFlatButton).Caption;
        edtInput.SetFocus;   
        edtInput.SelStart := Length(edtInput.Text);
      end;
    end;
  end;
end;

procedure TFScreenKb.fbtClearClick(Sender: TObject);
begin
  if giValueType = 2 then edtInput.Text := '0'
  else if giValueType = 1 then edtInput.Text := '';
  edtInput.SetFocus;
end;

procedure TFScreenKb.fbtSpaceClick(Sender: TObject);
begin
  edtInput.Text := edtInput.Text + ' ';
  edtInput.SetFocus;  
      edtInput.SelStart := Length(edtInput.Text);
end;

procedure TFScreenKb.fbtBackSpaceClick(Sender: TObject);
begin
  edtInput.Text := Copy(edtInput.Text, 1, length(edtInput.Text) - 1);
  if (giValueType = 2) and (edtInput.Text = '') then edtInput.Text := '0';
  edtInput.SetFocus;  
      edtInput.SelStart := Length(edtInput.Text);
end;

procedure TFScreenKb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFScreenKb.FormDestroy(Sender: TObject);
begin
  FScreenKb := nil;
end;

procedure TFScreenKb.edtInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then fbtInput.Click;
end;

end.
