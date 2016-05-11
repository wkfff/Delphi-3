unit UConfigSet;

interface

uses dxConfigManager;

type
  TConfigSet = class(TCustomConfigManager)
  private
    FMachSerial   : String; //장비번호
    FDataBaseName : String; //
    FServerName   : String; //
    FUSERNAME     : String; //
    FPASSWORD     : String; //
    FServerIP     : String; //
    FPICom        : String; // 표시기
    FPrinter      : String; //
    FScanner      : String; //
    FEnvirPass    : String; // 환경설정암호
    FAutoPicking  : Boolean; // 피킹작어시 로케이션 자동표시
    FVersionCode  : String; // 버젼정보
    FPathKeep     : String; // 보관자료
    FPathSend     : String; // 전송자료
    FPaperSize    : Integer; // 출력용지 사이즈
    FPaperList    : Integer; // 내역출력유무 1:출력, 0: 출력안함.
    procedure SetDefault;
  published
    //
    // 파일에 기록되는 것은 published 절에 있는 프로퍼티만 저장됩니다.
    //
    property MachSerial   : String  read FMachSerial    write FMachSerial;
    property DataBaseName : String  read FDataBaseName  write FDataBaseName;
    property ServerName   : String  read FServerName    write FServerName;
    property USERNAME     : String  read FUSERNAME      write FUSERNAME;
    property PASSWORD     : String  read FPASSWORD      write FPASSWORD;
    property ServerIP     : String  read FServerIP      write FServerIP;
    property PICom        : String  read FPICom         write FPICom;
    property Printer      : String  read FPrinter       write FPrinter;
    property Scanner      : String  read FScanner       write FScanner;
    property EnvirPass    : String  read FEnvirPass     write FEnvirPass;
    property AutoPicking  : Boolean read FAutoPicking   write FAutoPicking;
    property VersionCode  : String  read FVersionCode   write FVersionCode;
    property PathKeep     : String  read FPathKeep      write FPathKeep;
    property PathSend     : String  read FPathSend      write FPathSend;
    property DPaperSize   : Integer read FPaperSize     write FPaperSize;
    property DPaperList   : Integer read FPaperList     write FPaperList;
  end;

implementation

{ TConfigSet }

procedure TConfigSet.SetDefault;
var
  i, j : Integer;
begin
  {
  for i:=0 to 23 do
     for j:=0 to 59 do
        FSend_Hour_Array[I,J] := INIF.ReadString(Data.SectionName,'Send_'+FormatFloat('00',I*1.0)+FormatFloat('00',J*1.0), 'Send.Txt');
  }
end;

end.
 