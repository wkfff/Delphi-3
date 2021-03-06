//===============================================================================
//  프로젝트  : DAIHAN
//  파일명    : ULogin
//  파일내용  : 로그인 화면
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  : 타이틀바에 빌드버전 추가 
//===============================================================================


unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DBTables, jpeg;

type
  TFLogin = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    edt_id: TEdit;
    edt_Pwd: TEdit;
    Timer1: TTimer;
    procedure edt_idKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_PwdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses UDM, DB, UQMain, ULib, UVersionInfo;

{$R *.dfm}

procedure TFLogin.edt_idKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(sender as tWincontrol, true, true);
  if key = #13 then key := #0;
end;

procedure TFLogin.edt_PwdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1Click(Sender);
  if key = #13 then key := #0;
end;

procedure TFLogin.Button1Click(Sender: TObject);
begin
  
  DM.fn_SetDBConnect;
  
  DM.qrLogin.Close;
  DM.qrLogin.Params[0].Value := edt_id.Text ;
  DM.qrLogin.Params[1].Value := edt_pwd.Text ;
  Try
     DM.qrLogin.Open;
     if DM.qrLogin.RecordCount <> 1 then
     begin
       MessageDlg('사용자ID 또는 암호가 맞지않습니다.'+#13 +'ID와 암호를 확인하십시오.', mtWarning, [mbOk], 0);
       edt_id.SetFocus;
       exit;
     end;
     gsUserID     := edt_id.Text;
     gsUserPass   := edt_pwd.Text;
     gsAUTH_LEVEL := DM.qrLogin.FieldByName('AUTH_LEVEL').Value;
     
     //lbName.Caption := DM.qrLogin.FieldValues['NAME'];
     //Panel1.Caption := DM.qrLogin.FieldValues['NAME'];
     ModalResult    := mrOk;
  Except
     on E:EDBEngineError do Begin
        Application.MessageBox(PChar('ERROR :'+E.Message), 'ERROR', MB_OK);
        Exit;
     End;
  End;
end;

procedure TFLogin.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  edt_id.SetFocus;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin    
    
  gbTest := False;
  if FileExists(ExtractFilePath(Application.ExeName) + 'Test_2016.ini') then begin
    gbTest := True;
  end;

// 2012.03.19 ... vERSION은 BUILD로 대치
//
//  gsVersion := fnGetBuildInfoString(ParamStr(0));
//  Caption := Caption + '('+'Version '+gsVersion+')';
// 2016-02-03 dyddyd 빌드버전 추가
  Caption := '로그인 - 창고관리시스템 Build ' + fnGetVersionInfo(tvFileVersion);
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  FLogin := nil;
end;

procedure TFLogin.Timer1Timer(Sender: TObject);
begin
  if gbTest then
  begin
    edt_id.Text  := '1';
    edt_Pwd.Text := '22';
//    Button1.Click;
  end;
end;


end.
