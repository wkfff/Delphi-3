{
--------------------------------------------------------------------------------
 1.버젼관련함수






--------------------------------------------------------------------------------
}
unit UVersionInfo;

interface

uses
  Windows, Forms, SysUtils;

procedure prGetBuildInfo(var v1, v2, v3, v4: Word; AFileName: string);
function fnGetBuildInfoString(AFileName: string): string;

implementation

procedure prGetBuildInfo(var v1, v2, v3, v4: Word; AFileName: string);
var
  VerInfoSize: DWord;
  VerInfo: Pointer;
  VerValueSize: DWord;
  VerValue: PVSFixedFileInfo;
  Dummy: DWord;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(AFileName), dummy);

  if VerInfoSize <= 0 then Exit;

  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(AFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

  with VerValue^ do begin
    v1 := dwFileVersionMS shr 16;
    v2 := dwFileVersionMS and $FFFF;
    v3 := dwFileVersionLS shr 16;
    v4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);
end;

function fnGetBuildInfoString(AFileName: string): string;
var
  v1, v2, v3, v4: Word;
begin
  prGetBuildInfo(v1, v2, v3, v4, AFileName);
  Result := Format('%d.%d.%d.%d', [v1, v2, v3, v4]);
end;

end.
