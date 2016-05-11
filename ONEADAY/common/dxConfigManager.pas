//INI��� �����ϰ� ����� ������Ʈ
//���ø����̼ǿ��� ����ϴ� Ư���� ������� ���� .INI �����̳� ������Ʈ���� �����ϴµ�
//�ϴٺ��� ������ �������ϴ�(�������� ���).
//
//Ư��, ����, ���� ���� �ƴ� �������̳� �������� �а� ������ ���� ��������.
//�׷��� �����̰� ������Ʈ�� ������ ��(DFM)�� ����Ǵ� ����� ��� �� �����ϰ� ����� �� �ֵ���
//Ŭ������ �ѹ� ����� �ý��ϴ�.
//
//::�Ʒ� �ڵ�::
//
//
// Unit        : dxConfigManager.pas
// Description : INI�� ����ϴ� ����
//               ������ �����Ӱ� ����ϰ� ���ľ� �� �ֽ��ϴ�.
// Author      : �ȿ���(civilian@korea.com)
// History
//   1.0   2005.07.11 ó�� ����
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
// ���Ͽ��� �о����
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
// ���Ͽ� ����
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

 