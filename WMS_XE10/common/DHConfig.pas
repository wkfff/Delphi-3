unit DHConfig;

interface

uses Windows, IniFiles;

const
  IniFileName = 'C:\DCS\NRUN_CODE.Ini';
  
type
  TDHConfig = class(TObject)
  private
    FDHInterval : Integer;
    FDHValue    : String;

    procedure SetInterval( Value : Integer );
  public
    DHIniFile : TIniFile;
    constructor Create(AFileName:String);
    destructor Destroy; override;
    procedure Save(ASetion, AIdent, AValue:String);
    procedure Load(ASetion, AIdent, AValue:String);

    property DHInterval : Integer read FDHInterval write SetInterval;
  end;

implementation

constructor TDHConfig.Create(AFileName:String);
begin
//  inherited;
  DHIniFile := TIniFile.Create(AFileName);
end;

destructor TDHConfig.Destroy;
begin
 DHIniFile.Free;
 inherited Destroy;
end;

procedure TDHConfig.SetInterval( Value : Integer );
begin
  if FDHInterval <> Value then
    FDHInterval := Value;
end;

// 저장하기
procedure TDHConfig.Save(ASetion, AIdent, AValue:String);
begin
  if (ASetion <> '') and
     (AIdent  <> '') and
     (AValue  <> '') then
  DHIniFile.WriteString(ASetion, AIdent, AValue);
end;

//불러오기
procedure TDHConfig.Load(ASetion, AIdent, AValue:String);
begin
  FDHValue := DHIniFile.ReadString(ASetion, AIdent, AValue);
end;

end.
