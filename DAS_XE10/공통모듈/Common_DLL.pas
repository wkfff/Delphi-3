{*******************************************************************************
 *
 * Unit Name: CommonDLL
 * Purpose  :
 * Author   : Shim HanWoo
 * History  : 2002.10.14 Created
 *
 *==============================================================================*
      수정일자    수정자       수정내역
  ------------------------------------------------------------------------------*
********************************************************************************}
unit Common_DLL;

interface

uses graphics, Windows, SysUtils, Forms, RxFileUtil;

const
  BARCODE_WIDTH = 1;
  bcCode_2_5_interleaved =  1;
  bcCode_2_5_industrial  =  2;
  bcCode_2_5_matrix      =  3;
  bcCode39               =  4;
  bcCode39Extended       =  5;
  bcCode128A             =  6;
  bcCode128B             =  7;
  bcCode128C             =  8;
  bcCode93               =  9;
  bcCode93Extended       = 10;
  bcCodeMSI              = 11;
  bcCodePostNet          = 12;
  bcCodeCodabar          = 13;
  bcCodeEAN8             = 14;
  bcCodeEAN13            = 15;

  BARCODE_FILENAME       = 'BARCODE.BMP';

var
  iBarcodeType         : Integer;
  sBarcode, sFileName  : String;
  iHeigth, ibwidth     : Integer;
  bCheckSum, sTextShow : Boolean;

  gBmpPath : String;

function  func_CALL_DLL(psDLLName, psProcName:String):Integer;
function  func_Get_BarCode(psBarcode: String; piHeight: Integer): Integer;
procedure proc_GET_BMP_PATH;

implementation

function func_CALL_DLL(psDLLName, psProcName:String):Integer;
type
  TDLLBarcode = function(piBarcodeType : Integer;
                         psBarcode, psFilename : String;
                         piHeigth, pibwidth: Integer;
                         pbCheckSum, psTextShow: Boolean):Integer;StdCall;

var
    gCallDLL   : TDLLBarcode;
    gDLLHandle : THandle;
    gProcPtr   : TFarProc;
begin
  gDLLHandle  := LoadLibrary(PChar( psDLLName ));
  if (gDLLHandle > 32) then
  begin
    gProcPtr := GetProcAddress( gDLLHandle, PChar( psProcName ) );
    @gCallDLL := gProcPtr;
    if (@gCallDLL <> nil ) then
    begin
        Result := gCallDLL(iBarcodeType, sBarcode, sFileName, iHeigth, ibwidth, bCheckSum, sTextShow);
    end
    else
    begin
        Result := -2 ; // DLL에서 함수나 프로시져를 찾지 못한 경우
    end;
    FreeLibrary( gDLLHandle );
  end
  else
  begin
      Result := -1; // // DLL을 찾지 못한 경우
  end;
end;

function func_Get_BarCode(psBarcode: String; piHeight: Integer): Integer;
begin
  sBarcode := psBarcode;
  iHeigth  := piHeight;
  result   := func_CALL_DLL('Barcode.DLL', 'func_Barcode_FILE');
end;


procedure proc_GET_BMP_PATH;
begin
  gBmpPath := ExtractFilePath(Application.ExeName)+'Bmp\';
  // Log 디렉토리가 없으면 강제로 만든다.
  if not DirExists(gBmpPath) then  ForceDirectories(gBmpPath);
end;

end.
 