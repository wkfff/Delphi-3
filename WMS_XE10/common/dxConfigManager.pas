//INI대신 간편하게 사용할 컴포넌트
//어플리케이션에서 사용하는 특정한 내용들은 보통 .INI 파일이나 레지스트리에 저장하는데
//하다보면 무진장 귀찮습니다(귀차니즘 모드).
//
//특히, 정수, 문자 등이 아닌 열거형이나 집합형을 읽고 쓰려면 더욱 귀찮지요.
//그래서 델파이가 컴포넌트의 정보를 폼(DFM)에 저장되는 방식을 빌어서 좀 간편하게 사용할 수 있도록
//클래스를 한번 만들어 봤습니다.
//
//::아래 코드::
//
//
// Unit        : dxConfigManager.pas
// Description : INI를 대신하는 유닛
//               누구든 자유롭게 사용하고 고쳐쓸 수 있습니다.
// Author      : 안영제(civilian@korea.com)
// History
//   1.0   2005.07.11 처음 만듦
//

unit dxConfigManager;

interface

uses
  Windows, SysUtils, Classes;

type
  TCustomConfigManager = class(TComponent)
  private
    FFileName: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromFile;
    procedure SaveToFile;

    property FileName: String read FFileName write FFileName;
  end;

implementation

{ TCustomConfigManager }

constructor TCustomConfigManager.Create(AOwner: TComponent);
begin
 inherited;

 FFileName := '';
end;

//
// 파일에서 읽어오기
//
destructor TCustomConfigManager.Destroy;
begin
  inherited;
end;

procedure TCustomConfigManager.LoadFromFile;
var
 Stream: TFileStream;
 BinStream: TMemoryStream;
begin
 if FileExists(FFileName) then begin
   Stream    := TFileStream.Create(FFileName, fmOpenRead);
   BinStream := TMemoryStream.Create;
   try
     ObjectTextToBinary(Stream, BinStream);
     BinStream.Seek(0, soFromBeginning);
     BinStream.ReadComponent(Self);
   finally
     Stream.Free;
     BinStream.Free;
   end;
 end;
end;

//
// 파일에 저장
//
procedure TCustomConfigManager.SaveToFile;
var
  Stream    : TFileStream;
  BinStream : TMemoryStream;
begin
  Stream    := TFileStream.Create(FFileName, fmCreate);
  BinStream := TMemoryStream.Create;

  try
    BinStream.WriteComponent(Self);
    BinStream.Seek(0, soFromBeginning);
    ObjectBinaryToText(BinStream, Stream);
  finally
    Stream.Free;
    BinStream.Free;
  end;
end;

end. 

 