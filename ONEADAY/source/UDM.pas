unit UDM;

interface

uses
  SysUtils, Classes, DB, DBTables, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

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
    ZConnection1: TZConnection;
    qryOpenIF: TZQuery;
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
begin
  Result := True;
  with dbMain do try
    if dbMain.Connected then dbMain.Connected := False;
    //dbMain.Params.Clear;
    with Params do begin

     if gbTest then
       Add('SERVER NAME=61.97.143.41\SQLEXPRESS')
     else
       Add('SERVER NAME=localhost\SQLEXPRESS')
    end;

    dbMain.Connected := True;
  except
    
    Result := False;
  end;
end;

end.
