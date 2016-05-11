//===============================================================================
//  프로젝트  : DAIHAN
//  파일명    : UDM
//  파일내용  : 데이터모듈 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit UDM;

interface

uses
  SysUtils, Classes, DB, DBTables, IniFiles, Forms;

type
  TDM = class(TDataModule)
    dbMain: TDatabase;
    qrJob: TQuery;
    qryOpen: TQuery;
    qrAmba: TQuery;
    qrDate: TQuery;
    qrDash: TQuery;
    qrSTH002: TQuery;
    qrSTH002ORGAN_CODE: TStringField;
    qrSTH002ORGAN_NAME: TStringField;
    qrSTH002AREA: TStringField;
    qrSTH002CLOSE_DATE: TStringField;
    qrSTH002I_DATE: TStringField;
    qrSTH002I_ID: TStringField;
    qrSTH002U_DATE: TStringField;
    qrSTH002U_ID: TStringField;
    qrMT100: TQuery;
    StringField103: TStringField;
    StringField107: TStringField;
    StringField108: TStringField;
    StringField109: TStringField;
    StringField110: TStringField;
    qrMT100USERID: TStringField;
    qrMT100NAME: TStringField;
    qrMT100PASSWD: TStringField;
    qrMT100JOB_CODE: TStringField;
    qrMT100RETIRE_DATE: TStringField;
    qrLogin: TQuery;
    qrCommon: TQuery;
    qrCommonCODE_TP: TStringField;
    qrCommonCODE_CD: TStringField;
    qrCommonCODE_SNM: TStringField;
    qrCommonCODE_LNM: TStringField;
    qrCommonCODE_ENM: TStringField;
    qrCommonCHG_CD: TStringField;
    qrCommonACC_CD: TStringField;
    qrCommonREM_NM: TStringField;
    qrCommonVAL_D1: TStringField;
    qrCommonVAL_D2: TStringField;
    qrCommonVAL_C1: TStringField;
    qrCommonVAL_C2: TStringField;
    qrCommonVAL_N1: TFloatField;
    qrCommonVAL_N2: TFloatField;
    qrCommonUSE_YN: TStringField;
    qrCommonI_DATE: TStringField;
    qrCommonI_ID: TStringField;
    qrCommonU_DATE: TStringField;
    qrCommonU_ID: TStringField;
    qrTemp: TQuery;
    qrSTH003: TQuery;
    qrSTH003ITEM_CODE: TStringField;
    qrSTH003ITEM_NAME: TStringField;
    qrSTH003CLOSE_DATE: TStringField;
    qrSTH003I_DATE: TStringField;
    qrSTH003I_ID: TStringField;
    qrSTH003U_DATE: TStringField;
    qrSTH003U_ID: TStringField;
    qrSTH003REMARKS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function fn_SetDBConnect:Boolean;
  end;

var
  DM: TDM;

implementation

uses ULib;

{$R *.dfm}

function TDM.fn_SetDBConnect: Boolean;
var
  lsSERVER_NAME, lsPASSWORD : String;
  function fn_GetDBIni:Boolean;
  var
      DAIHANIni: TIniFile;
  begin
    Result := True;
    DAIHANIni :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'DBCNF.ini');
    try
      with DAIHANIni do begin
         lsSERVER_NAME := ReadString('WMS', 'SERVER NAME',  'ZIN-PC\SQLEXPRESS');
         lsPASSWORD    := ReadString('WMS', 'SERVER PASS',  'sapass');
      end;

      Result := True;
    except
      Result := False;
      DAIHANIni.Free;
    end;
  end;
begin
  if not fn_GetDBIni then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
  with dbMain do try
    if dbMain.Connected then dbMain.Connected := False;
    //dbMain.Params.Clear;
    with Params do begin

      if gbTest then
      begin
        Add('SERVER NAME=52.79.56.98');
        Add('PASSWORD=tsvr2201@pts');
      end
      else
      begin
        Add('SERVER NAME='+lsSERVER_NAME);
        Add('PASSWORD='+lsPASSWORD);
      end;
    end;

    dbMain.Connected := True;
  except
    
    Result := False;
  end;
end;

end.
