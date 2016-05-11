unit UDM;

interface

uses
  System.SysUtils, System.Classes, UniProvider, SQLServerUniProvider, Data.DB,
  MemDS, DBAccess, Uni, Controls, Dialogs;

type
  TDM = class(TDataModule)
    UniConnection1: TUniConnection;
    UniDataSource1: TUniDataSource;
    UniQuery1: TUniQuery;
    SQLServerUniProvider1: TSQLServerUniProvider;
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

    ProviderName  := 'SQL Server';

    if FDB.ShowModal = mrOk then
    begin
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
end;

procedure TDM.ClearSql;
begin
  UniQuery1.Active := False;
  UniQuery1.SQL.Text := '';
end;

end.
