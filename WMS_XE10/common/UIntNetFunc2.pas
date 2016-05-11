unit UIntNetFunc2;

interface

uses
  Windows, Classes, Winsock, SysUtils, Registry, NB30, WinInet, UStrFunc2;

type
  TDWInternetConnectedState = (dwicsConfigured,
    dwicsLAN,
    dwicsModem,
    dwicsOffline,
    dwicsProxy,
    dwicsRASInstalled);

  TDWInternetConnectedStates = set of TDWInternetConnectedState;

  TDWHostConnectInfo = packed record
    Host: string;
    Port: Word;
  end;

  TDWInternetProxySetting = packed record
    HTTP,
      HTTPS,
      FTP,
      Gopher,
      Socks: TDWHostConnectInfo;
  end;

  //Get Ip Address
function fnGetUserIp1: string;
function fnGetUserIp2: string;

  //MacAdress
function fnGetMACAdress: string;

  //Internet Connected?
function fnIsOnline: Boolean;
function fnGetInternetConnectionState(var InternetConnectedStates: TDWInternetConnectedStates): Boolean;

function fnGetHostNameByIP(const IPAdress: string): string;
function fnGetIPByHostName(const HostName: string): string;

function fnGetInternetProxySetting(var InternetProxySetting: TDWInternetProxySetting): Boolean;
function fnGetProxyIgnoredAdresses(var Adresses: TStringList): Boolean;

implementation

//Get Ip Address

function fnGetUserIp1: string;
var
  pHostInfo: pHostEnt;
  pszHostName: array[0..40] of char;
begin
  GetHostName(pszHostName, 40);
  pHostInfo := GetHostByName(pszHostName);
  if Assigned(pHostInfo) then
  begin
    Result := IntToStr(ord(pHostInfo.h_addr_list^[0])) + '.' +
      IntToStr(ord(pHostInfo.h_addr_list^[1])) + '.' +
      IntToStr(ord(pHostInfo.h_addr_list^[2])) + '.' +
      IntToStr(ord(pHostInfo.h_addr_list^[3]));
  end;
end;

function fnGetUserIp2: string;
var
  Reg: TRegistry;
  KeyStr: TStringList;
  i: integer;
  NetKey: string;
begin
  Result := '';
  NetKey := 'System\CurrentControlSet\Services\Class\NetTrans';
  Reg := TRegistry.Create;
  KeyStr := TStringList.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey(NetKey, False);

    Reg.GetKeyNames(KeyStr);
    Reg.CloseKey;
    for i := 0 to KeyStr.Count - 1 do
    begin
      Reg.OpenKey(NetKey + '\' + KeyStr[i], False);

      if Reg.ReadString('DriverDesc') = 'TCP/IP' then
        Result := Reg.ReadString('IPAddress');

      Reg.CloseKey;
    end;
  finally
    Reg.Free;
    KeyStr.Free;
  end;
end;

// MacAdress

function fnGetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;
  RetCode: char;
  I: Integer;
  Lenum: PlanaEnum;
  _SystemID: string;
begin

  Result := '';
  _SystemID := '';
  Getmem(NCB, sizeof(TNCB));
  Fillchar(NCB^, Sizeof(TNCB), 0);

  Getmem(Lenum, sizeof(TLanaEnum));
  Fillchar(Lenum^, Sizeof(TLanaEnum), 0);

  Getmem(Adapter, sizeof(TAdapterStatus));
  Fillchar(Adapter^, Sizeof(TAdapterStatus), 0);

  Lenum.Length := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer := pointer(Lenum);
  NCB.ncb_length := sizeof(Lenum);
//  RetCode:=Netbios(NCB);

  i := 0;

  repeat
    Fillchar(NCB^, Sizeof(TNCB), 0);
    Ncb.ncb_command := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[I];
//    RetCode:= Netbios(Ncb);

    Fillchar(NCB^, Sizeof(TNCB), 0);
    Ncb.ncb_command := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[I];

    // Must be 16
    Ncb.ncb_callname := '* ';
    Ncb.ncb_buffer := pointer(Adapter);
    Ncb.ncb_length := sizeof(TAdapterStatus);
    RetCode := Netbios(Ncb);

    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...

    if (RetCode = chr(0)) or (RetCode = chr(6)) then

    begin
      _SystemId := inttohex(ord(Adapter.adapter_address[0]), 2) + '-' +
        inttohex(ord(Adapter.adapter_address[1]), 2) + '-' +
        inttohex(ord(Adapter.adapter_address[2]), 2) + '-' +
        inttohex(ord(Adapter.adapter_address[3]), 2) + '-' +
        inttohex(ord(Adapter.adapter_address[4]), 2) + '-' +
        inttohex(ord(Adapter.adapter_address[5]), 2);
    end;

    inc(i);

  until (I >= ord(Lenum.length)) or (_SystemID <> '00-00-00-00-00-00');

  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  fnGetMacAdress := _SystemID;
end;

function fnIsOnline: Boolean;
var
  Size: Integer;
  PC: array[0..4] of Char;
  Key: hKey;

  function IsIPPresent: Boolean;
  type
    TaPInAddr = array[0..10] of PInAddr;
    PaPInAddr = ^TaPInAddr;

  var
    phe: PHostEnt;
    pptr: PaPInAddr;
    Buffer: array[0..63] of Char;
    I: Integer;
    GInitData: TWSAData;
    IP: string;
  begin

    WSAStartup($101, GInitData);
    Result := False;
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(buffer);

    if phe = nil then Exit;

    pPtr := PaPInAddr(phe^.h_addr_list);
    I := 0;

    while pPtr^[I] <> nil do
    begin
      IP := inet_ntoa(pptr^[I]^);
      Inc(I);
    end;

    WSACleanup;
    Result := (IP <> '') and (IP <> '127.0.0.1');
  end;

begin

  if RegOpenKey(HKEY_LOCAL_MACHINE, 'SystemCurrentControlSetServicesRemoteAccess', Key) = ERROR_SUCCESS then
  begin
    Size := 4;
    if RegQueryValueEx(Key, 'Remote Connection', nil, nil, @PC, @Size) = ERROR_SUCCESS then
      Result := PC[0] = #1
    else
      Result := IsIPPresent;
    RegCloseKey(Key);
  end
  else
    Result := IsIPPresent;
end;

function fnGetInternetConnectionState(var InternetConnectedStates: TDWInternetConnectedStates): Boolean;
const
  INTERNET_CONNECTION_MODEM = $01;
  INTERNET_CONNECTION_LAN = $02;
  INTERNET_CONNECTION_PROXY = $04;
  (*following implemented in W2k*)
  INTERNET_RAS_INSTALLED = $10;
  INTERNET_CONNECTION_OFFLINE = $20;
  INTERNET_CONNECTION_CONFIGURED = $40;
var
  Flags: DWord;
begin
  Flags := 0;
  result := InternetGetConnectedState(@Flags, 0);

  if ((Flags and INTERNET_CONNECTION_MODEM) = INTERNET_CONNECTION_MODEM) then
    Include(InternetConnectedStates, dwicsModem);

  if ((Flags and INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN) then
    Include(InternetConnectedStates, dwicsLAN);

  if ((Flags and INTERNET_CONNECTION_PROXY) = INTERNET_CONNECTION_PROXY) then
    Include(InternetConnectedStates, dwicsProxy);

  if ((Flags and INTERNET_RAS_INSTALLED) = INTERNET_RAS_INSTALLED) then
    Include(InternetConnectedStates, dwicsRASInstalled);

  if ((Flags and INTERNET_CONNECTION_OFFLINE) = INTERNET_CONNECTION_OFFLINE) then
    Include(InternetConnectedStates, dwicsOffline);

  if ((Flags and INTERNET_CONNECTION_CONFIGURED) = INTERNET_CONNECTION_CONFIGURED) then
    Include(InternetConnectedStates, dwicsConfigured);
end;

function fnGetHostNameByIP(const IPAdress: string): string;
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
  WSAData: TWSAData;
begin
  WSAStartup($101, WSAData);
  SockAddrIn.sin_addr.s_addr := inet_addr(PChar(IPAdress));
  HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);

  if HostEnt <> nil then Result := StrPas(Hostent^.h_name)
  else Result := '';

end;

function fnGetIPByHostName(const HostName: string): string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  i: Integer;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);

  Result := '';
  phe := GetHostByName(PChar(HostName));

  if phe = nil then
  begin
    WSACleanup;
    Exit;
  end;

  pPtr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pPtr^[i] <> nil do
  begin
    Result := inet_ntoa(pptr^[i]^);
    Inc(i);
  end;
  WSACleanup;
end;



function fnGetInternetProxySetting(var InternetProxySetting: TDWInternetProxySetting): Boolean;
var
  proxyString: string;

  function HostStrToHostConnectInfo(const Str: string): TDWHostConnectInfo;
  begin
    ZeroMemory(@result, SizeOf(TDWHostConnectInfo));
    with TStringList.Create do
    begin
      Assign(fnStrToList(Str, ':'));
      with result do
      begin
        Host := Strings[0];
        Port := StrToIntDef(Strings[1], 0);
      end;
      Free;
    end;
  end;

  function ExtractOverSet(const Str: string; var Typ: string): string;
  begin
    with TStringList.Create do
    begin
      Assign(fnStrToList(Str, '='));
      Typ := Strings[0];
      result := Strings[1];
      Free;
    end;
  end;

  function ProxyStrToProxySetting(const Str: string): TDWInternetProxySetting;
  var
    I: Integer;
    Typ, Host: string;
  begin
    with TStringList.Create do
    begin
      if Pos('=', Str) > 0 then
      begin
        Assign(fnStrToList(Str, ';'));
        for I := 0 to Count - 1 do
        begin
          Host := ExtractOverSet(Strings[I], Typ);

          if Typ = 'ftp' then result.FTP := HostStrToHostConnectInfo(Host);
          if Typ = 'gopher' then result.Gopher := HostStrToHostConnectInfo(Host);
          if Typ = 'http' then result.HTTP := HostStrToHostConnectInfo(Host);
          if Typ = 'https' then result.HTTPS := HostStrToHostConnectInfo(Host);
          if Typ = 'socks' then result.Socks := HostStrToHostConnectInfo(Host);
        end;
      end
      else
      begin
        with result do
        begin
          HTTP := HostStrToHostConnectInfo(Str);
          HTTPS := HTTP;
          FTP := HTTP;
          Gopher := HTTP;
          Socks := HTTP;
        end;
      end;
      Free;
    end;
  end;

begin
{
  result := FALSE;
  with TRegistry.Create(KEY_READ) do
  begin
    RootKey := HKEY_CURRENT_USER;
    if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings\', FALSE) then
    begin
      result := ReadBool('ProxyEnable');
      if result then
      begin
        proxyString := ReadString('ProxyServer');
        InternetProxySetting := ProxyStrToProxySetting(proxyString);
      end;
    end;
    Free;
  end;
  }
end;

function fnGetProxyIgnoredAdresses(var Adresses: TStringList): Boolean;
var
  I: Integer;
begin
{
  with Adresses do
  begin
    with TRegistry.Create(KEY_READ) do
    begin
      RootKey := HKEY_CURRENT_USER;
      if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings\', FALSE) then
      begin
        Assign(fnStrToList(ReadString('ProxyOverride'), ';'));
      end;
      Free;
    end;

    for I := 0 to Count - 1 do
    begin
      if Strings[I] = '<local>' then Strings[I] := '127.0.0.1';
    end;
    result := (Count > 0);
  end;
  }
end;

end.
