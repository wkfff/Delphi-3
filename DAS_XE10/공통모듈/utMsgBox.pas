//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utMsgBox
//  파일내용  :  
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utMsgBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TfmMsgBox = class(TForm)
    imgMSG: TImage;
    memMSG: TMemo;
    lblTitle: TLabel;
    btnOk: TSpeedButton;
    btnClose: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    iType : Integer;
    iRlt : Integer;
    sMSG, sCAP : String;
    function func_Msgbox(as_Msg, as_Caption : String; ai_iType : Integer) : Boolean;
    { Public declarations }
  end;

var
  fmMsgBox: TfmMsgBox;

implementation

uses Common, Common_Frm;

{$R *.dfm}

function TfmMsgBox.func_Msgbox(as_Msg, as_Caption : String; ai_iType : Integer) : Boolean;
begin
    try
        fmMsgBox := TfmMsgBox.Create(Application);
        fmMsgBox.memMSG.Lines.Add(as_Msg);
        fmMsgBox.lblTitle.Caption := as_Caption;
        fmMsgBox.iType := ai_iType;
        fmMsgBox.ShowModal;
        func_Msgbox := (fmMsgBox.iRlt = IDOK) or (fmMsgBox.iRlt = IDYES);
    finally
        fmMsgBox.Free;
    end;
end;

procedure TfmMsgBox.btnCloseClick(Sender: TObject);
begin
    if (iType = OK) Or (iType = ERROK) then
    begin
        proc_PlayErrSoundOff;
        fmMsgBox.iRlt := IDOK;
    end
    else
    begin
        fmMsgBox.iRlt := IDNO;
    end;
    Close;
end;

procedure TfmMsgBox.btnOKClick(Sender: TObject);
begin
    fmMsgBox.iRlt := IDYES;
    Close;
end;

procedure TfmMsgBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        btnClose.Click;
    end;
end;

procedure TfmMsgBox.FormActivate(Sender: TObject);
begin
    if iType = OK then
    begin
        btnClose.Left := 204;
        btnOk.Visible := False;
    end;

    if iType = ERROK then
    begin
        proc_PlayErrBellSoundLOOP('DPS_ERR');
        btnClose.Left := 204;
        btnOk.Visible := False;
    end;

    if iType = YESNO then
    begin
        btnClose.Left := 274;
        btnOk.Visible := True;
    end
end;

end.
