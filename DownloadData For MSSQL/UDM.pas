unit UDM;

interface

uses
  System.SysUtils, System.Classes, UniProvider, SQLServerUniProvider, Data.DB,
  MemDS, DBAccess, Uni, Controls, Dialogs, OracleUniProvider;

type
  TDM = class(TDataModule)
    UniConnection1: TUniConnection;
    UniDataSource1: TUniDataSource;
    UniQuery1: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
    OracleUniProvider1: TOracleUniProvider;
    UniDataSource2: TUniDataSource;
    UniQuery2: TUniQuery;
    UniConnection2: TUniConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearSql;
    function fn_SetDBConnect: Boolean;
  end;

var
  DM: TDM;

implementation

uses
  FDBLogin;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.fn_SetDBConnect: Boolean;
var
  FDB : TDBLogin;
begin
  ClearSql;
  Result := False;

  FDB := TDBLogin.Create(nil);

  with UniConnection1 do
  try
    if UniConnection1.Connected then Connected := False;

    if FDB.ShowModal = mrOk then
    begin
      ProviderName:= FDB.AdvComboBox1.Text;
      Server      := FDB.eServerName.Text;
      Port        := StrToInt(FDB.eServerPort.Text);
      Username    := FDB.eUsername.Text;
      Password    := FDB.ePassword.Text;
      Database    := FDB.eDatabase.Text;
      Connect;

      if Connected then
        Result := True;
    end;
  except
    Result := False;
  end;

//  with UniConnection2 do
//  try
//    if UniConnection2.Connected then Connected := False;
//
//    if FDB.ShowModal = mrOk then
//    begin
//      ProviderName  := 'SQL Server';
//      Server      := FDB.eServerName.Text;
//      Port        := StrToInt(FDB.eServerPort.Text);
//      Username    := FDB.eUsername.Text;
//      Password    := FDB.ePassword.Text;
//      Database    := FDB.eDatabase.Text;
//      Connect;
//
//      if Connected then
//        Result := True;
//    end;
//  except
//    Result := False;
//  end;
end;

procedure TDM.ClearSql;
begin
  UniQuery1.Active := False;
  UniQuery1.SQL.Text := '';

//  UniQuery2.Active := False;
//  UniQuery2.SQL.Text := '';
end;

end.
