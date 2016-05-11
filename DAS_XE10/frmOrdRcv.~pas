//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : frmOrdRcv
//  파일내용  : PI 테스트 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit frmOrdRcv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, ExtCtrls, DB, DBTables, frmLogIn;

type
  TFPITest = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    memRcv: TMemo;
    timBCU: TTimer;
    Button9: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure timBCUTimer(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  OFF = $40;
  REDON = $41;
  GREENON = $42;
  REDGREENON = $43;
  REDFLASH = $45;
  GREENFLASH = $46;
  REDGREENFLASH = $47;

var
  FPITest: TFPITest;
{
// 2011.07.21 삭제

  gbFTP_DOWN    : Boolean;
  giSTSCAN      : Integer;
  giHDSCAN      : Integer;
  giWEIGHT      : Integer;
  giBCU2        : Integer;
  giBCU1         : Integer;

  giBCU_ID      : Array of Integer;
  gsBCU_ZONE    : Array of String;


  giBCU_CNT     : Integer;
  giPI_CNT      : Integer;
 }
const
  PISTART = 1;
  PIEND = 50;

implementation

uses Common, Common_Frm, Common_Opt, Common_Xls, utDAIHAN_MAIN;

{$R *.dfm}

procedure TFPITest.FormCreate(Sender: TObject);
begin
{
// 2011.07.21 삭제

 tmCOMMON.proc_Init(frmDAIHAN_MAIN);

//통신설정 가져오기
  giSTSCAN := func_txtGETIndex('고정스캐너', 1);
  giHDSCAN := func_txtGETIndex('핸드스캐너', 1);
  giWEIGHT := func_txtGETIndex('전자저울', 1);
  giBCU1   := func_txtGETIndex('BCU1', 1);
  giBCU2   := func_txtGETIndex('BCU2', 1);

  giPI_CNT := 0;
}
end;

procedure TFPITest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFPITest.Button9Click(Sender: TObject);
begin
  Close;
end;

procedure TFPITest.Button2Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_GetPiOff(gcCOMM[giBCU1], 1,  i);
    end;

    // memRcv.Clear;
end;

procedure TFPITest.Button3Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDON, '888888');
    end;

end;

procedure TFPITest.Button4Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', GREENON, '888888');
    end;

end;

procedure TFPITest.Button5Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDGREENON, '888888');
    end;

end;

procedure TFPITest.Button6Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDFLASH, '888888');
    end;

end;

procedure TFPITest.Button7Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', GREENFLASH, '888888');
    end;

end;

procedure TFPITest.Button8Click(Sender: TObject);
var
    i : Integer;
begin
    for i := PISTART to  PIEND do
    begin
        func_PutDataPi(gcCOMM[giBCU1], 1,  i,  1,  '0', REDGREENFLASH, '888888');
    end;

end;

procedure TFPITest.timBCUTimer(Sender: TObject);
var
    buff : Array[0..45] of Byte;
begin
    timBCU.Enabled := False;

    if func_GetPiSts( gcCOMM[giBCU1], 1, giPI_CNT, Buff) then
    begin
        if (Buff[6] = 49) then
        begin
            proc_MemoLog(memRcv,'PI 상태',IntToStr(1) + '번 BCU ID ' + IntToStr(giPI_CNT) + '번 PI 눌림', 'log_bcu');
        end;
    end;

    giPI_CNT := giPI_CNT + 1;
    if giPI_CNT = PIEND + 1 then giPI_CNT := 0;
    timBCU.Enabled := True;
end;

procedure TFPITest.Button1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 3 do
  begin
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, LEFTGREEN);
    sleep(200);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, LEFTRED);
    sleep(200);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, RIGHTGREEN);
    sleep(200);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, RIGHTRED);
    sleep(200);
    func_PutTowerLamp(gcCOMM[giBCU1], 1, CLEARLAMP, CLEARLAMP, CLEARLAMP, CLEARLAMP);
  end;
end;

end.
