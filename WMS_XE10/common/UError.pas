//****************************************************************************//
//*                                                                          *//
//*   Unit        ID : FError                                                *//
//*                                                                          *//
//*   프로그램    ID : PV (Process View)                                     *//
//*                                                                          *//
//*   Unit   설   명 : 공통 Error Display Program                            *//
//*                                                                          *//
//*   전  역  변  수 : 없음.                                                 *//
//*                                                                          *//
//*   외  부  함  수 : 없음.                                                 *//
//*                                                                          *//
//*   Input     파일 : 없음.                                                 *//
//*                                                                          *//
//*   Output    파일 : 없음.                                                 *//
//*                                                                          *//
//*   링크(DLL) 함수 : 없음.                                                 *//
//*                                                                          *//
//*   사용 테이블    : 없음.                                                 *//
//*                                                                          *//
//*   Special Logic  : 없음.                                                 *//
//*                                                                          *//
//*                                                                          *//
//****************************************************************************//
//*                              수정 변경내역                               *//
//*                                                                          *//
//*    변경일자          작  성  자               비           고            *//
//*   ------------    ----------------  -----------------------------------  *//
//*                                                                          *//
//*                                                                          *//
//****************************************************************************//

unit UError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, Db, ExtCtrls;

type
  TFError = class(TForm)
    ST_Error: TStaticText;
    M_Error: TMemo;
    B_Confirm: TButton;
    B_Print: TButton;
    E_Error: TEdit;
    BV_BOX: TBevel;
    M_Process: TMemo;
    SysName: TLabel;
    Bevel1: TBevel;
    qryMain: TQuery;
    Timer1: TTimer;
    procedure B_PrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowError(const SubSystem: string; ADBError: EDBEngineError; const LocationName: string);
  end;

var
  FError: TFError;

implementation

uses UDCSLib;

{$R *.DFM}

procedure TFError.ShowError(const SubSystem: string; ADBError: EDBEngineError; const LocationName: string);
var
  i: integer;
  lsErrorText: string;
begin
  {
  case SubSystem[1] of
   'A': SysName.Caption := 'E3VIEW';
   'T': SysName.Caption := 'E3VIEW';
   'N': SysName.Caption := 'E3VIEW';
   'U': SysName.Caption := 'E3VIEW';
   'C': SysName.Caption := 'E3VIEW';
   'E': SysName.Caption := 'E3VIEW';
   'F': SysName.Caption := 'E3VIEW';
   'Q': SysName.Caption := 'E3VIEW';
   'R': SysName.Caption := 'E3VIEW';
   'M': SysName.Caption := 'E3VIEW';
   'D': SysName.Caption := 'E3VIEW';
  end;
  }

  M_Error.Lines.Clear;
  M_Error.Lines.Add('Error Count:' + IntToStr(ADBError.ErrorCount));
  M_Error.Lines.Add('');
  {Iterate through the Errors records}
  for i := 0 to ADBError.ErrorCount - 1 do begin
    M_Error.Lines.Add('Message: ' + ADBError.Errors[i].Message);
    M_Error.Lines.Add('   Category: ' +
      IntToStr(ADBError.Errors[i].Category));
    M_Error.Lines.Add('   Error Code: ' +
      IntToStr(ADBError.Errors[i].ErrorCode));
    M_Error.Lines.Add('   SubCode: ' +
      IntToStr(ADBError.Errors[i].SubCode));
    M_Error.Lines.Add('   Native Error: ' +
      IntToStr(ADBError.Errors[i].NativeError));
    M_Error.Lines.Add('');
  end;
  E_Error.Text := LocationName;

  i := ADBError.ErrorCount;
  if i > 0 then begin
  end;

  if ShowModal = mrOK then Exit;
end;

procedure TFError.B_PrintClick(Sender: TObject);
begin
  Print;
  ModalResult := mrNone;
end;


procedure TFError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFError.FormDestroy(Sender: TObject);
begin
//  FError := nil;
end;

procedure TFError.Timer1Timer(Sender: TObject);
begin
  pr_SetTime;
end;

procedure TFError.FormCreate(Sender: TObject);
begin
  pr_SetTime;
end;

end.
