//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : UVersionInfo
//  파일내용  : 버전관련 함수 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  : 빌드버전 추가  fnGetVersionInfo
//===============================================================================


unit UVersionInfo;

interface

uses
  Windows, Forms, SysUtils;

type
  TVerKind = (
    tvComments,         // 코멘트
    tvCompanyName,      // 회사명
    tvFileDescription,  // 설명
    tvFileVersion,      // 파일버젼
    tvInternalName,     // 내부명
    tvLegalCopyright,   // 저작권
    tvLegalTrademarks,  // 상표
    tvOriginalFilename, // 정식파일명
    tvPrivateBuild,     // Private Build
    tvProductName,      // 제품명
    tvProductVersion,   // 제품버젼
    tvSpecialBuild);    // Special Build

    procedure prGetBuildInfo(var v1, v2, v3, v4: Word; AFileName: string);
    function fnGetBuildInfoString(AFileName: string): string;
    function fnGetVersionInfo(KeyWord: TVerKind): string;

const
  csVerKey: array [TVerKind] of String = (
        'Comments',
        'CompanyName',
        'FileDescription',
        'FileVersion',
        'InternalName',
        'LegalCopyright',
        'LegalTrademarks',
        'OriginalFilename',
        'PrivateBuild',
        'ProductName',
        'ProductVersion',
        'SpecialBuild');

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

// 2016-02-03 dyddyd 추가
// 버젼 정보 얻기
function fnGetVersionInfo(KeyWord: TVerKind): string;
const
  cTranslation = '\VarFileInfo\Translation';
  cFileInfo = '\StringFileInfo\%0.4s%0.4s\';
var
  dBufSize    : DWORD;
  dHWnd       : DWORD;
  pVerInfoBuf : Pointer;
  pVerData    : Pointer;
  lVerDataLen : Longword;
  sPath       : String;
begin

  // 필요한 버퍼 사이즈 얻기
  dBufSize := GetFileVersionInfoSize(PChar(Application.ExeName), dHWnd);

  if dBufSize <> 0 then
  begin
    // 메모리확보
    GetMem(pVerInfoBuf, dBufSize);

    try
      GetFileVersionInfo(PChar(Application.ExeName), 0, dBufSize, pVerInfoBuf);

      // 변수정보 블럭안의 변환 테이블 지정
      VerQueryValue(pVerInfoBuf, PChar(cTranslation), pVerData, lVerDataLen);

      if not (lVerDataLen > 0) then
        raise Exception.Create('정보 수집 실패');

      // 8자리 16진수로 변환
      // →'\StringFileInfo\027382\FileDescription'
      sPath := Format(cFileInfo + csVerKey[KeyWord],
                      [IntToHex(Integer(pVerData^) and $FFFF, 4),
                      IntToHex((Integer(pVerData^) shr 16) and $FFFF, 4)]);
      VerQueryValue(pVerInfoBuf, PChar(sPath), pVerData, lVerDataLen);

      if lVerDataLen > 0 then
      begin
        // VerData는 제로로 끝나는 문자열이 아닌 것에 주의
        result := '';
        SetLength(result, lVerDataLen);
        StrLCopy(PChar(result), pVerData, lVerDataLen);
      end;
    finally
      // 개방
      FreeMem(pVerInfoBuf);
    end;
  end;
end;

end.
