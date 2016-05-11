unit UDCSLib;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, registry, Mask, Buttons, CurrEdit, DB, DBTables, Gauges;

const
  REG_ROOT: string = '\software\DCS\';
  cConfigFileName = 'DCSConfig.dat';
  cDMFileName  = 'DMConfig.dat';

  PWD_C1 = '1101110324014'; //비밀번호기준키1
  PWD_C2 = '1101111074758'; //비밀번호기준키2

  gcJOBTYPE = 'CA';

  gcSeparator = '|';

  gcOn    = '0';
  gcOnOff = '1';
  gcOff   = '2';
  gcLen   = 6;

  gcUndo     = '0';  // 미결
  gcReceive  = '1';  // 수신
  gcIng      = '2';  // 진행
  gcDone     = '3';  // 완료
  gcSend     = '4';  // 전송

//  AITEM_STATE : Array[0..7] of Integer = (0,1,2,3,4,5,6,9);
  AColum_Name : Array[0..6] of String = ('BARCODE_DATE','PRDT_DATE','PRDT_BACK_DATE','STORE_DATE','STORE_BACK_DATE','AS_BACK_DATE','DISUSE_DATE');
  AITEM_STATE : Array[0..7] of char =   (   '0',   '1',       '2',   '3',       '4',      '5',   '6',    '9');
  ASTATE_NAME : Array[0..7] of String = ('발행','입고','입고반품','출고','출고반품','A/S반품','폐기', '취소');

  gcBarcode    = 0;  gcBARCODE_DATE    = 'BARCODE_DATE';   // '발행'
  gcPrdt       = 1;  gcPRDT_DATE       = 'PRDT_DATE';      // '입고'
  gcPrdt_Back  = 2;  gcPRDT_BACK_DATE  = 'PRDT_BACK_DATE'; // '입고반품'
  gcStore      = 3;  gcSTORE_DATE      = 'STORE_DATE';     // '출고'
  gcStore_Back = 4;  gcSTORE_BACK_DATE = 'STORE_BACK_DATE';// '출고반품'
  gcAs_Back    = 5;  gcAS_BACK_DATE    = 'AS_BACK_DATE';   // 'A/S반품'
  gcDiuse      = 6;  gcDISUSE_DATE     = 'DISUSE_DATE';    // '폐기'
  gcCancle     = 9;  //gcPRDT_DATE = 'PRDT_DATE';//

  gsCANCLE_STATE = '9';

type
  TProgress = packed record
  FAllJOBNO : Integer;
  FUnJOBNO  : Integer;
end;  

type
  TXY = packed record
    X : Integer;
    Y : Integer;
end;

var
  giCompany : Integer;
  gAppDir, gBackupPATH : String;

  gsMachSerial,
  gsDataBaseName,
  gsServerName,
  gsUSERNAME,
  gsPASSWORD,
  gsServerIP,
  gsPICom,
  gsPrinter,
  gsScanner,
  gsEnvirPass   : String;
  gbAutoPicking : Boolean;
  giPaperSize   : Integer;
  gbPaperList   : Boolean = False;
  gbCARTB       : Boolean = False;

  giJOBNO        : Integer; // 작업번호
  gsORDERDATE    : String;  // 주문일자
  giTRANSEQ      : Integer; // 전송차수
  {
  gsJOBTYPE      : String;  // 작업유형
  gsCONSIGNEEKEY : String;  // 거래처코드
  giBOXNO        : Integer; // BOXNO
  giPINO         : Integer; // PI ID
  gsCARTNO       : String;  // CART 구분 번호
  giFULLBOXNO    : Integer; // FULLBOX Count
  gsSTATUS       : String;  // 진행상태
  }
  // Location 정보 JOBSEQ, LOC_FR, LOC_TO, COMMENT
  gsJOBSEQ       : String;
  gsLOC_FR       : String;
  gsLOC_TO       : String;
  gsCOMMENTLOC   : String;  // Location      
  giJOBQTY       : Integer;

  giALLJOBNO     : Integer;
  giUNJOBNO      : Integer;

  procedure pr_SetTime;

  //---------------------------------------------------------------------------
  // 레지스트리관련 함수
  //---------------------------------------------------------------------------
  function  rGet(subDir, subkeyName: string): string;
  procedure rPut(subDir, subKeyName: string; value: string);

  // 문자열을 암호화 하기
//  function ft_Encrypt(const S: string): string;
  // 암호화된 문자열을 정상문자로 되돌리기
//  function ft_Decrypt(const S: string): string;
  // 정해진시간동안 기다리기
  procedure pr_Delay(Amount: Integer);


  // 위치 포지션 찾기
  procedure pr_Position(AForm: TForm; AObject: TObject);

  // 입력창 표시        입력받은 문자열 표시    입력받은 문자 형태
  procedure pr_InputBox(AWinControl: TWinControl; AType: integer);

  // 입력창 표시 함수   입력받은 문자  입력받은 문자 형태   변경된 문자
  function fn_InputBoxs(AString: string; AType: integer): string;

  function fn_SetPopCalendar(ASpeedButton: TBitBtn; ASTDT_DATE: string; ALeft: Integer): string;

  procedure pr_ShowMessage(AMessage:String);
  function  fn_ShowMessageYN(AMessage:String):Integer;

  procedure pr_Pause(MessageS:String);
  function  fn_PauseYN(MessageS:String):LongInt;
  function  fn_AppPath:String;
  function  fn_MidStrRaw(OrgS:String;StartC:Integer;LenC:Integer=-1):String;
  function  fn_MidStr(OrgS:String;StartC:Integer;LenC:Integer):String; Overload;
  function  fn_MidStr(OrgS:String;StartC:Integer):String; Overload;
  procedure pr_Append_TextFile(FileName, Text:string);

  
  procedure proc_Log2File(FilePath, LogStr : string);     //2001-07-28 PR004.pas에서 여기로 이동
  function func_GetLogFileName( sType: string): string;

  function fn_PITORack(AX, AY : Integer):TXY;overload;
  function fn_RACKTOPI(AX, AY : Integer):TXY;
  function fn_PINOTORack(APINO : Integer):TXY; overload;
  function fn_FormatPrint(ADataSet:TDataSet):String;
  //function fn_Print(ACONSIGNEEKEY : String;AFULLBOXNO:Integer): TDataSet;


  function DirectWrite(
      pszPrinterName: pChar;
      pbyWrite: PBYTE;
      dwWrite: DWORD): Integer
    ;stdcall; external 'SRP770_API.dll';

  procedure pr_DeleteBarcode(ABarcode:String;AITEM_STATE:Integer);
  function fn_GetState(APanel:TPanel; AFrom, AITEM_STATE:Integer):Boolean;
  procedure pr_SetMessage(APanel:TPanel; AMSG:String);
  function fn_GetITEM_STATUS(ASTATUS:Integer; ABarcode:String; APanel:TPanel; AQuery:TQuery):String;
  procedure pr_SetCount(APanel:TPanel; AQuery:TQuery);

implementation

uses UScreenKb, DateSetPop, UPMSG, UPICom, UDM;



procedure pr_SetTime;
begin
end;


// 레지스터에서 값 읽기

function rGet(subDir, subkeyName: string): string;
var
  myreg: TRegistry;
  keyName: string;
begin
  myreg := TRegistry.Create;
  try
    myReg.RootKey := HKEY_LOCAL_MACHINE;
    keyName := REG_ROOT;

    if subDir <> '' then
      keyName := REG_ROOT + subDir + '\';

    result := '';
    if MyReg.OpenKey(Keyname, false) then
    begin
      result := myReg.ReadString(subKeyName);
      myReg.CloseKey;
    end;
  finally
    myReg.Free;
  end;
end;

// 레지스터에서 값 쓰기

procedure rPut(subDir, subKeyName: string; value: string);
var
  myreg: TRegistry;
  keyName: string;
begin
  myreg := TRegistry.Create;
  try
    myReg.RootKey := HKEY_LOCAL_MACHINE;
    keyName := REG_ROOT;

    if subDir <> '' then
      keyName := REG_ROOT + subDir + '\';

    if MyReg.OpenKey(KeyName, true) then
    begin
      myReg.writeString(SubkeyName, value);
      myReg.CloseKey;
    end;
  finally
    myReg.Free;
  end;
end;



//------------------------------------------------------------------------------
// 문자열을 암호화 하기
//------------------------------------------------------------------------------

function ft_Encrypt(const S: string): string;
var
  i: byte;
  sEncrypt: string;
begin
  sEncrypt := '';
  for i := 1 to Length(S) do
  begin
    sEncrypt := sEncrypt + char(byte(S[i]) + ((byte(PWD_C1[i]) + byte(PWD_C2[i])) mod 10));
  end;
  Result := sEncrypt;
end;

//------------------------------------------------------------------------------
// 암호화된 문자열을 정상문자로 되돌리기
//------------------------------------------------------------------------------

function ft_Decrypt(const S: string): string;
var
  i: byte;
  sDecrypt: string;
begin
  sDecrypt := '';
  for i := 1 to Length(S) do
  begin
    sDecrypt := sDecrypt + char(byte(S[i]) - ((byte(PWD_C1[i]) + byte(PWD_C2[i])) mod 10));
  end;
  Result := sDecrypt;
end;

procedure pr_Delay(Amount: Integer);
var
  GetTime: Integer;
begin
  GetTime := GetTickCount;
  while (GetTime + Amount > GetTickCount) do
    Application.ProcessMessages;
end;

procedure pr_Position(AForm: TForm; AObject: TObject);
begin
  with AForm do begin
    Left := (AObject as TWinControl).ClientOrigin.x;
    Top := (AObject as TWinControl).ClientOrigin.y + (AObject as TWinControl).Height;
    if (Left + Width) >= Screen.Width then
      Left := Screen.Width - Width;
    if (Top + Height) >= Screen.Height - 50 then
      Top := (AObject as TWinControl).ClientOrigin.y - Height;
  end;
end;


// 입력창 표시

procedure pr_InputBox(AWinControl: TWinControl; AType: integer);
var
  APanel: TPanel;
  lsSql: string;
begin

  // 화상키보드
  {
  lsSql := rGet('Screen', 'KeyBoard');
  if (lsSql = '') or
    (lsSql = '1') then Exit;
    }

  if FScreenKb <> nil then FScreenKb := nil;
  FScreenKb := TFScreenKb.Create(nil);

  FScreenKb.giValueType := AType;

  if (AWinControl is TPanel) then begin
    FScreenKb.edtInput.Text := (AWinControl as TPanel).Caption;
    FScreenKb.giValueLength := (AWinControl as TPanel).Tag;
    FScreenKb.APanel := (AWinControl as TPanel);
    pr_Position(FScreenKb, AWinControl);
  end
  else if (AWinControl is TEdit) then begin
    FScreenKb.edtInput.Text := (AWinControl as TEdit).Text;
    FScreenKb.giValueLength := (AWinControl as TEdit).MaxLength;
    FScreenKb.AWinControl := (AWinControl as TEdit);
    pr_Position(FScreenKb, AWinControl);
  end
  else if (AWinControl is TCurrencyEdit) then begin
    FScreenKb.edtInput.Text := FloatToStr((AWinControl as TCurrencyEdit).Value);
    FScreenKb.giValueLength := (AWinControl as TCurrencyEdit).MaxLength;
    FScreenKb.AWinControl   := (AWinControl as TCurrencyEdit);
    pr_Position(FScreenKb, AWinControl);
  end
  else if (AWinControl is TMaskEdit) then begin
    FScreenKb.edtMaskEdit.Text     := (AWinControl as TMaskEdit).Text;
    FScreenKb.edtMaskEdit.EditMask := (AWinControl as TMaskEdit).EditMask;
    FScreenKb.giValueLength := (AWinControl as TMaskEdit).MaxLength;
    FScreenKb.AWinControl := (AWinControl as TMaskEdit);
    pr_Position(FScreenKb, AWinControl);
  end;

  FScreenKb.ShowModal;
end;

// 입력창 표시 함수

function fn_InputBoxs(AString: string; AType: integer): string;
var
  APanel: TPanel;
  lsSql: string;
begin
  // 화상키보드
  lsSql := rGet('Screen', 'KeyBoard');

  if (lsSql = '') or
    (lsSql = '1') then Exit;

  if FScreenKb <> nil then FScreenKb := nil;

  try
    FScreenKb := TFScreenKb.Create(nil);

    FScreenKb.giValueType := AType;
    FScreenKb.edtInput.Text := AString;
    FScreenKb.ShowModal;
  finally
    Result := FScreenKb.edtInput.Text;
  end;
end;

function fn_SetPopCalendar(ASpeedButton: TBitBtn; ASTDT_DATE: string; ALeft: Integer): string;
begin
  frmDateSetPop := TfrmDateSetPop.Create(Application);
  frmDateSetPop.gsSTDT_DATE := ASTDT_DATE;
  if ALeft > 0 then
    frmDateSetPop.Left := ALeft
  else
    frmDateSetPop.Left := ASpeedButton.Left;
  frmDateSetPop.Top := ASpeedButton.Top + ASpeedButton.Height + 75;

  try
    if (frmDateSetPop.ShowModal = mrOK) and
      (frmDateSetPop.fkey <> '') then
    begin
      Result := frmDateSetPop.fkey;
    end
    else
    begin
//        Result := 'False';
    end;
  finally
    frmDateSetPop.Free;
    frmDateSetPop := nil;
  end;
end;

procedure pr_ShowMessage(AMessage:String);
begin
  FPMSG := TFPMSG.Create(Application);
  try
  FPMSG.gsMessage  := AMessage;
  FPMSG.ShowModal;
  finally
    FPMSG.Free;
    FPMSG := nil;
  end;
end;

function fn_ShowMessageYN(AMessage:String):Integer;
begin
  Result := 2;
  FPMSG := TFPMSG.Create(Application);
  FPMSG.giYN       := 1;
  FPMSG.gsMessage  := AMessage;
  if FPMSG.ShowModal = mrOK then begin
    Result := 1;
  end;
end;

procedure pr_Pause(MessageS:String);
begin
  MessageBoxEx(0,PChar(StringReplace(MessageS,'\n',#13,[rfReplaceAll])),'알림',
               MB_OK+MB_ICONEXCLAMATION+MB_DEFBUTTON1+MB_TASKMODAL+MB_SETFOREGROUND+MB_TOPMOST,LANG_KOREAN);
end;

function fn_PauseYN(MessageS:String):LongInt;
begin
  Result := MessageBoxEx(0,PChar(StringReplace(MessageS,'\n',#13,[rfReplaceAll])),'알림',
                         MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_TASKMODAL+MB_SETFOREGROUND+MB_TOPMOST,LANG_KOREAN);
end;

function fn_AppPath:String;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function fn_MidStrRaw(OrgS:String;StartC:Integer;LenC:Integer=-1):String;
var
  I : Integer;
  R : String;
begin
  R := '';
  if LenC=-1 then LenC := Length(OrgS)-StartC+1;
  if (StartC>0) and
     (LenC>0)   then begin
     for I:=StartC to StartC+LenC-1 do begin
        if I>Length(OrgS) then Break;
        R := R + OrgS[I];
     end;
  end;
  Result := R;
end;

function fn_MidStr(OrgS:String;StartC:Integer;LenC:Integer):String; Overload;
begin
  Result := fn_MidStrRaw(OrgS,StartC,LenC);
end;

function fn_MidStr(OrgS:String;StartC:Integer):String; Overload;
begin
  Result := fn_MidStrRaw(OrgS,StartC);
end;

procedure pr_Append_TextFile(FileName, Text:String);
var
  wFile : TStringList;
begin
  wFile := TStringList.Create;
  if FileExists(FileName) then
    wFile.LoadFromFile(FileName);
  wFile.Insert(wFile.Count,Text);
  ForceDirectories(ExtractFilePath(FileName));
  wFile.SaveToFile(FileName);
  wFile.Destroy;
end;


{   이름 :  proc_Log2File
    기능 :  로그파일에 로그 기록
            파일명을 지정하지 않으면 기록하지 않는다.
    인수 :  FileName: 기록할 로그파일명
            LogStr  : 파일에 기록할 문자열
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
procedure proc_Log2File(FilePath, LogStr : string);
var
    f:TextFile;
begin
    if FilePath = '' then exit;

    AssignFile(f,FilePath);
    if not FileExists(FilePath) then begin
        rewrite(f);
        CloseFile(f);
    end;
    Append(f);
    writeln(f, LogStr);
    Flush(f);
    CloseFile(f);
end;

function func_GetLogFileName( sType: string): string;
begin
    result := FormatDateTime('yyyymmdd_hh',Now) + sType + '.txt';
end;


function fn_PITORack(AX, AY : Integer):TXY;
begin
  if (AX = 1) and (AY = 1) then begin
    Result.X := 1;
    Result.Y := 2;
  end
  else if (AX = 1) and (AY = 2) then begin
    Result.X := 2;
    Result.Y := 2;
  end
  else if (AX = 1) and (AY = 3) then begin
    Result.X := 3;
    Result.Y := 2;
  end
  else if (AX = 1) and (AY = 4) then begin
    Result.X := 4;
    Result.Y := 2;
  end
  else if (AX = 1) and (AY = 5) then begin
    Result.X := 5;
    Result.Y := 2;
  end
  else if (AX = 2) and (AY = 1) then begin
    Result.X := 1;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 2) then begin
    Result.X := 2;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 3) then begin
    Result.X := 3;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 4) then begin
    Result.X := 4;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 5) then begin
    Result.X := 5;
    Result.Y := 1;
  end
end;


function fn_RACKTOPI(AX, AY : Integer):TXY;
begin
  if (AX = 1) and (AY = 2) then begin
    Result.X := 1;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 2) then begin
    Result.X := 1;
    Result.Y := 2;
  end
  else if (AX = 3) and (AY = 2) then begin
    Result.X := 1;
    Result.Y := 3;
  end
  else if (AX = 1) and (AY = 1) then begin
    Result.X := 2;
    Result.Y := 1;
  end
  else if (AX = 2) and (AY = 1) then begin
    Result.X := 2;
    Result.Y := 2;
  end
  else if (AX = 3) and (AY = 1) then begin
    Result.X := 2;
    Result.Y := 3;
  end
end;


function fn_PINOTORack(APINO : Integer):TXY;
begin
  case APINO of
    1 : begin
          Result.X := 1;
          Result.Y := 2;
        end;
    2 : begin     
          Result.X := 2;
          Result.Y := 2;
        end;
    3 : begin   
          Result.X := 3;
          Result.Y := 2;
        end;
    4 : begin
          Result.X := 1;
          Result.Y := 1;
        end;
    5 : begin
          Result.X := 2;
          Result.Y := 1;
        end;
    6 : begin
          Result.X := 3;
          Result.Y := 1;
        end;
  end;
end;

function fn_FormatPrint(ADataSet:TDataSet):String;
var
  tempStr : string;            // String for command by string
  li      : Integer;
  liDefault : Integer;
  liInterval : Integer;
begin
  tempStr := '';
  tempStr := tempStr + 'CB' + #13;              // 버퍼내용 삭제
  tempStr := tempStr + 'SB0' + #13;             // 버퍼모드 설정 0,1(더블, 싱글)
  tempStr := tempStr + 'SD20' + #13;            // 농도설정 0~20
  tempStr := tempStr + 'SW800' + #13;           // 라벨폭 설정
  tempStr := tempStr + 'SL1600,24,G' + #13;     // 라벨길이 설정
  tempStr := tempStr + 'SM0,0' + #13;           // 이미지버퍼 마진 설정
  tempStr := tempStr + 'SOT' + #13;             // 이미지를 top 에서 bottom으로 인쇄
  tempStr := tempStr + 'CS0,0' + #13;           // chracter Set선택
                                                          

  with ADataSet do begin
    tempStr := tempStr + 'T54,197,a,9,9,9,0,N,B,'     + ''''+ADataSet.FieldByName('ROUTENAME').AsString+'''' + #13;  // '''B1덕''' + #13;
    tempStr := tempStr + 'T20,66,b,2,2,0,0,N,B,'      + ''''+ADataSet.FieldByName('ROUTENAME').AsString+''''+ #13;   //'''엔프라니 [소분BOX]     1/4''' + #13;
    tempStr := tempStr + 'T20,114,b,2,2,0,0,N,B,'     + ''''+ADataSet.FieldByName('PLANTNM').AsString+''''+ #13;     //'''엔프라니화장품''' + #13;
    tempStr := tempStr + 'T22,388,a,2,3,8,0,N,B,'     + ''''+ADataSet.FieldByName('CUSTNAME').AsString+''''+ #13;    //'''주문)이마트월계''' + #13;
    tempStr := tempStr + 'T22,436,a,2,3,8,0,N,B,'     + ''''+ADataSet.FieldByName('STRITEM').AsString+''''+ #13;     //''' 571585''' + #13;
    tempStr := tempStr + 'T22,484,a,2,3,8,0,N,B,'     + ''''+ADataSet.FieldByName('CUSTADDRESS').AsString+''''+ #13; //'''서울특별시 노원구 월계동 333-1''' + #13;
    tempStr := tempStr + 'T393,185,a,2,3,2,0,N,B,'    + ''''+ADataSet.FieldByName('PHONE').AsString+''''+ #13;       //'''02-380-1234''' + #13;
    tempStr := tempStr + 'T393,233,a,2,3,2,0,N,B,'    + ''''+ADataSet.FieldByName('PLANTCD').AsString+''''+ #13;     // '''EP9999''' + #13;
    tempStr := tempStr + 'T394,305,a,2,3,2,0,N,B,'    + ''''+ADataSet.FieldByName('ORDERDATE').AsString+''''+ #13;   //'''2007-05-31''' + #13;
    tempStr := tempStr + 'T410,442,0,3,3,0,0,N,N,'    + ''''+ADataSet.FieldByName('STRITEM').AsString+''''+ #13;     //'''A01-0110''' + #13;
    tempStr := tempStr + 'B1102,554,4,3,6,122,0,1,0,' + ''''+ADataSet.FieldByName('BOXBARCODE').AsString+''''+ #13;  //'''A0000571595EP0140C''' + #13;
    tempStr := tempStr + 'T14,851,b,1,2,20,0,N,B,'    + ''''+ADataSet.FieldByName('STRITEM').AsString+''''+ #13;     //'''상품리스트 [주문)이마트월] 1/4''' + #13;

    liDefault  := 922;
    liInterval := 48;
    li         := liDefault;
    while not Eof do begin
      tempStr := tempStr + 'T29,'+IntToStr(li) + ',b,1,2,4,0,N,B,' + ''''+ADataSet.FieldByName('STRITEM').AsString+''''+ #13;
      li := li + liInterval;
      Next;
    end;
  end;

  tempStr := tempStr + 'P1' + #13;
  Result  := tempStr;
end;
    
procedure pr_DeleteBarcode(ABarcode:String;AITEM_STATE:Integer);
var
  lsDate : String;
  lsITEM_STATE : String;
  liITEM_STATE : Integer;

begin
  if MessageDlg('취소 하시겠습니까?', mtCustom, [mbYes, mbNo], 0) = mrNo then begin
    Exit;
  end;

  with DM.qryOpen do try
    // 해당 프로세스의 일자 가져오기
    Close;
    SQL.Clear;
    SQL.Add(' select PRDT_DATE, PRDT_BACK_DATE, STORE_DATE, STORE_BACK_DATE, AS_BACK_DATE, CLOSE_DATE from dbo.SPM100 '+
            '  where barcode = :barcode       '); 
    Params[0].AsString := ABarcode;
    Open;
    if IsEmpty then begin
      ShowMessage('ERROR : 정보가 없습니다.');
      Exit;
    end;

    case AITEM_STATE of
      1 : begin lsDate := Fields[0].AsString; end; // 입고'
      2 : begin lsDate := Fields[1].AsString; end; // 입고반품'
      3 : begin lsDate := Fields[2].AsString; end; // 출고'
      4 : begin lsDate := Fields[3].AsString; end; // 출고반품'
      5 : begin lsDate := Fields[4].AsString; end; // A/S반품'
      6 : begin lsDate := Fields[5].AsString; end; // 폐기'
    end;

    // 마지막 작업 여부 판단
    Close;
    SQL.Clear;
    SQL.Add(' select ITEM_STATE from dbo.SPD101 '+
            '    where STDT_DATE  > :STDT_DATE  '+
            //'      and ORGAN_CODE = :ORGAN_CODE '+
            '      and BARCODE    = :BARCODE    ');
    Params[0].AsString := lsDate;
    //Params[1].AsString := AORGAN_CODE;
    Params[1].AsString := ABarcode;
    Open;
    if not IsEmpty then begin
      
      ShowMessage('WARNING : 이후 작업정보가 존재합니다.');
      Exit;
    end;

    // 해당 프로세스의 작업상태 가져오기
    Close;
    SQL.Clear;
    SQL.Add(' select ITEM_STATE from dbo.SPD101 '+
            '  where STDT_DATE  <= :STDT_DATE   '+
//            '    and ORGAN_CODE = :ORGAN_CODE   '+
            '    and BARCODE    = :BARCODE      '+
            '  order by STDT_DATE desc          ');
    Params[0].AsString := lsDate;
//    Params[1].AsString := AORGAN_CODE;
    Params[1].AsString := ABarcode;
    Open;
    if IsEmpty then begin
      ShowMessage('이력 정보가 없습니다.');
      Exit;
    end;

    liITEM_STATE := Fields[0].AsInteger;
    // 이전상태
    while not Eof do begin
      Next;
      if Fields[0].AsString <> '9' then begin
        lsITEM_STATE := Fields[0].AsString;
        Break;
      end;
    end;

    Close;
    SQL.Clear;
    SQL.Add('   update dbo.SPM100                '+
            '      set ITEM_STATE = :ITEM_STATE, ');

    case liITEM_STATE of
      gcBarcode    : begin SQL.Add(' BARCODE_DATE = ''''  ');     end;// 발행
      gcPrdt       : begin SQL.Add(' PRDT_DATE = ''''  ');        end;// 입고'
      gcPrdt_Back  : begin SQL.Add(' PRDT_BACK_DATE = ''''   ');  end;// 입고반품'
      gcStore      : begin SQL.Add(' STORE_DATE = ''''   ');      end;// 출고'
      gcStore_Back : begin SQL.Add(' STORE_BACK_DATE = ''''   '); end;// 출고반품'
      gcAs_Back    : begin SQL.Add(' AS_BACK_DATE = ''''   ');    end;// A/S반품'
      gcDiuse      : begin SQL.Add(' CLOSE_DATE = ''''   ');      end;// 폐기'
      gcCancle     : begin end;
    end;

    SQL.Add('    where barcode = :barcode       ');
    Params[0].AsString := lsITEM_STATE;
    Params[1].AsString := ABarcode;
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('   update spd101                   '+
            '      set ITEM_STATE = :ITEM_STATE '+
            '    where STDT_DATE  = :STDT_DATE  '+
            '      and BARCODE    = :BARCODE    ');
    Params[0].AsString := gsCANCLE_STATE;
    Params[1].AsString := lsDate;
    Params[2].AsString := ABarcode;
    ExecSQL;

  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;

function fn_GetState(APanel:TPanel; AFrom, AITEM_STATE:Integer):Boolean;
begin
  Result := False;

  case AFrom of
    gcPrdt  : begin    
                case AITEM_STATE of
                  // 발행
                  //gcBarcode    : begin
                  //                 pr_SetMessage(APanel'바코드 발행 처리만된 제품입니다.'+#13#10+
                  //                             '입고처리 이후 출고 하십시오.');
                  //                Result := True;
                  //               end;
                  // 입고'
                  gcPrdt       : begin
                                   pr_SetMessage(APanel, '이미 입고처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 입고반품'
                  //gcPrdt_Back  : begin
                  //                 pr_SetMessage(APanel, '입고반품 제품입니다.'+#13#10+
                  //                             '입고처리 이후 출고 하십시오.');
                  //                 Result := True;
                  //               end;
                  // 출고'
                  gcStore      : begin
                                   pr_SetMessage(APanel, '출고처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고반품'
                  //gcStore_Back : begin
                  //                 pr_SetMessage(APanel, '출고반품 제품입니다.'+#13#10+
                  //                            '입고처리 이후 출고 하십시오.');
                  //                 Result := True;
                  //               end;
                  // A/S반품'
                  //gcAs_Back    : begin
                  //                 pr_SetMessage(APanel, 'A/S반품 제품입니다.'+#13#10+
                  //                             '입고처리 이후 출고 하십시오.');
                  //                 Result := True;
                  //               end;
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '폐기 처리한 제품입니다.'+#13#10+
                                               '입고하실 수 없습니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;
    gcPrdt_Back  : begin
                case AITEM_STATE of
                  // 발행
                  gcBarcode    : begin
                                  pr_SetMessage(APanel, '바코드 발행 처리만된 제품입니다. 입고처리 이후 출고 하십시오.');
                                  Result := True;
                                 end;
                  // 입고'
                  //gcPrdt       : begin
                  //                 pr_SetMessage(APanel, '이미 입고처리한 제품입니다.');
                  //                 Result := True;
                  //               end;
                  // 입고반품'
                  gcPrdt_Back  : begin
                                   pr_SetMessage(APanel, '이미 입고반품처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고'
                  gcStore      : begin
                                   pr_SetMessage(APanel, '출고처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고반품'
                  gcStore_Back : begin
                                   pr_SetMessage(APanel, '출고반품 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  // A/S반품'
                  gcAs_Back    : begin
                                   pr_SetMessage(APanel, 'A/S반품 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '폐기 처리한 제품입니다. 입고하실 수 없습니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;
    gcStore : begin
                case AITEM_STATE of
                  // 발행
                  gcBarcode    : begin
                                   pr_SetMessage(APanel, '바코드 발행 처리만한 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  //gcPrdt       : begin SQL.Add(' PRDT_DATE = ''''  ');        end;// 입고'
                  // 입고반품'
                  gcPrdt_Back  : begin
                                   pr_SetMessage(APanel, '입고반품 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  // 출고'
                  gcStore      : begin
                                   pr_SetMessage(APanel, '이미 출고처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고반품'
                  gcStore_Back : begin
                                   pr_SetMessage(APanel, '출고반품 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  // A/S반품'
                  gcAs_Back    : begin
                                   pr_SetMessage(APanel, 'A/S반품 제품입니다. 입고처리 이후 출고 하십시오.');
                                   Result := True;
                                 end;
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '폐기 처리한 제품입니다. 출고하실 수 없습니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;  
    gcStore_Back  : begin
                case AITEM_STATE of
                  // 발행
                  //gcBarcode    : begin
                  //                 pr_SetMessage(APanel, '바코드 발행 처리만된 제품입니다.'+#13#10+
                  //                             '입고처리 이후 출고 하십시오.');
                  //                Result := True;
                  //               end;
                  // 입고'
                  gcPrdt       : begin
                                   pr_SetMessage(APanel, '입고 제품입니다.');
                                   Result := True;
                                 end;
                  // 입고반품'
                  gcPrdt_Back  : begin
                                   pr_SetMessage(APanel, '입고반품 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고'
                  //gcStore      : begin
                  //                 pr_SetMessage(APanel, '출고처리한 제품입니다.');
                  //                 Result := True;
                  //               end;
                  // 출고반품'
                  gcStore_Back : begin
                                   pr_SetMessage(APanel, '이미 출고반품 처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // A/S반품'
                  gcAs_Back    : begin
                                   pr_SetMessage(APanel, 'A/S반품 제품입니다.');
                                   Result := True;
                                 end;
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '폐기 처리한 제품입니다. 출고반품 하실 수 없습니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;  
    gcAs_Back  : begin
                case AITEM_STATE of
                  // 발행
                  //gcBarcode    : begin
                  //                 pr_SetMessage(APanel, '바코드 발행 처리만된 제품입니다.'+#13#10+
                  //                             '입고처리 이후 출고 하십시오.');
                  //                Result := True;
                  //               end;
                  // 입고'
                  gcPrdt       : begin
                                   pr_SetMessage(APanel, '입고 제품입니다.');
                                   Result := True;
                                 end;
                  // 입고반품'
                  gcPrdt_Back  : begin
                                   pr_SetMessage(APanel, '입고반품 제품입니다.');
                                   Result := True;
                                 end;
                  // 출고'
                  //gcStore      : begin
                  //                 pr_SetMessage(APanel, '출고처리한 제품입니다.');
                  //                 Result := True;
                  //               end;
                  // 출고반품'
                  gcStore_Back : begin
                                   pr_SetMessage(APanel, '출고반품 제품입니다.');
                                   Result := True;
                                 end;
                  // A/S반품'
                  gcAs_Back    : begin
                                   pr_SetMessage(APanel, '이미 A/S반품 처리한 제품입니다.');
                                   Result := True;
                                 end;
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '폐기 처리한 제품입니다. A/S반품처리를 하실 수 없습니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;
    gcDiuse  : begin
                case AITEM_STATE of
                  // 폐기'
                  gcDiuse      : begin
                                   pr_SetMessage(APanel, '이미 폐기 처리한 제품입니다.');
                                   Result := True;
                                 end;
                  gcCancle     : begin end;
                end;
              end;
  end;


end;


procedure pr_SetMessage(APanel:TPanel; AMSG:String);
begin
  APanel.Caption := '';
  APanel.Caption := AMSG;
end;

function fn_GetITEM_STATUS(ASTATUS:Integer; ABarcode:String; APanel:TPanel; AQuery:TQuery):String;
var
  liITEM_STATE  : Integer;
begin
  Result := '-999';
  with AQuery do try

    Close;
    SQL.Clear;
    SQL.Add(' select ');
    SQL.Add(AColum_Name[ASTATUS]);
    SQL.Add(' , BARCODE_DATE, ITEM_STATE, ORGAN_CODE '+
            '   from dbo.SPM100                      '+
            ' where barcode = :barcode               ');
    Params[0].AsString := ABarcode;
    Open;
    if IsEmpty then begin
      pr_SetMessage(APanel, '발행내역이 없습니다.');
    end
    else begin
      // 상테 체크
      liITEM_STATE := Fields[2].AsInteger;
      if not fn_GetState(APanel, ASTATUS, liITEM_STATE) then Result := Fields[3].AsString;
    end;
  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;

procedure pr_SetCount(APanel:TPanel; AQuery:TQuery);
begin
  APanel.Caption := '조회건수 : '+IntToStr(AQuery.RecordCount);
end;

end.
