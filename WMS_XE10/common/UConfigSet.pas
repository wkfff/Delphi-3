unit UConfigSet;

interface

uses dxConfigManager;

type
  TConfigSet = class(TCustomConfigManager)
  private
    FMachSerial   : String; //����ȣ
    FDataBaseName : String; //
    FServerName   : String; //
    FUSERNAME     : String; //
    FPASSWORD     : String; //
    FServerIP     : String; //
    FPICom        : String; // ǥ�ñ�
    FPrinter      : String; //
    FScanner      : String; //
    FEnvirPass    : String; // ȯ�漳����ȣ
    FAutoPicking  : Boolean; // ��ŷ�۾�� �����̼� �ڵ�ǥ��
    FVersionCode  : String; // ��������
    FPathKeep     : String; // �����ڷ�
    FPathSend     : String; // �����ڷ�
    FPaperSize    : Integer; // ��¿��� ������
    FPaperList    : Integer; // ����������� 1:���, 0: ��¾���.
    procedure SetDefault;
  published
    //
    // ���Ͽ� ��ϵǴ� ���� published ���� �ִ� ������Ƽ�� ����˴ϴ�.
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
 