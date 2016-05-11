{*******************************************************************************
*
* 프로젝트 :
* 파 일 명 : 공통내역
* 기    능 : 프로그램에서 공통적으로 사용되는 프로시져와 함수를 기술한다.
* 작 성 자 : Shim HanWoo
* 작 성 일 : 2001-04-03
* 수정이력
*
  작업일자     작업자    버전    수정내역
 *----------------------------------------------------------------------------*
  2001.04.30   Shim              1.TBitBtn에서 TButton으로 변경
  2001-05-19   Lim               1.QuotedStr  함수 추가
  2001-05-21   Lim               1.func_GetCalendarDate 추가
                                 2.CalendarJ --> CalendarK로 변경
               ******* 주의(전체 프로그램에 영향을 준다) *******
                                 3.proc_GetInitialParams에서
                                   DateSeparator의 값에 따라 날짜 관련 함수 모두 수정.
                                   날짜 구분자에 '/'나 '-'등을 사용하지 말고
                                   DateSeparator 변수로 사용할 것.
  2001-05-23   Lim               1.proc_GetInitialParams에서 날짜 형식을 지정한 전역 변수 수정
  2001-05-28   Lim               1.날짜 변환 함수에서, 에러일 때 리턴하는 결과값을 ''로 수정
                                 2.버튼의 Enabled속성 제어 프로시져 추가
  2001-06-07   Lim               1.DateSeparator를 '-'에서 '/'로 전체 변경
  2001.06.28    Shim             1. Local DB의 Alias함수 추가
                                 2. Oracle Server DB의 Alias함수 추가

  2001-07-05    Lim             1.업체에 의존하는 변수,상수,함수들은 별도의 Unit으로 분리
                                2.불필요한 변수,상수등은 삭제
  2001-07-28    Lim             1.proc_Log2File를 PR004.pas에서 이곳으로 이동
  2001-08-15    Lim             1.func_strFillZeroL 함수를 2가지로 작성 (overload)
*******************************************************************************}


unit Common;

interface

{$I Common.inc}

uses
   Windows,Messages,Forms,SysUtils,IniFiles,DB,DBTables,Classes, ScktComp,
   Dialogs,ExtCtrls,DBCtrls,StdCtrls,Graphics, Controls, Mask,
   ShellAPI, ShlObj, Grids, comobj, MMSystem;

var
    sRcv_buff : String;
    sEdt_buff : String;
    G_ServerName     : String ;                  //NETWORK SERVER NAME or IP address or Service Name etc.
    G_UserID, G_PassWord : String ;              //DB Connect:LOG ON Default USER,PASSWORD
    G_ServerDB       : String;                   //Alias of Server DB
    G_LocalDB        : String;                   //Alias of Local DB

    TbNames          : TStringList ;
    QRY              : String;
    BBookMk          : TBookmark;

   const

//== Message Box ===============================================================
    OK       = MB_OK       + MB_DEFBUTTON1 + MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_TASKMODAL
    ERROK    = MB_OK       + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_SYSTEMMODAL
    OKCANCEL = MB_OKCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_APPLMODAL
    YESNO    = MB_YESNO    + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_SYSTEMMODAL
//==============================================================================

    ActiveColor     = $00DDDDBB ;                 // Active Cursor Color
    ErrorColor      = clRed     ;                 // Error항목Color
    deActiveColor   = clWindow ;                  // Default Cursor Color
    FnKeyColor      = $00C08000 ;                 // Function Key or Button Color

    CR  = $0d;
    LF  = $0a;
    STX = $02;
    ETX = $03;
    EOT = $04;
    ENQ = $05;
    ACK = $06;
    NAK = $15;
    SYN = $16;
    TAB = $09;
    NUL = $00;
    ESC = $1b;

(* User Function *)

function SetToBookmark(ADataSet: TDataSet; ABookmark: TBookmark): Boolean;

function func_CalcDateTimeToMin ( FromTime, ToTime: TDateTime ) : LongInt;  //두 날짜사이의 시간차(분)구하기2001-06-12
Function func_DaysPerMonth(AYear, AMonth: Integer) : Integer;               // 해당월의 알수를 취득한다
Function func_IsLeapYear(AYear: Integer) : Boolean;                         // 윤년의 판단
Function func_Date_10_8(str :string):String;                                // '1997/01/01' -> '19970101'
Function func_Date_8_10(str, ins_char :string):String;                      // '19970101' -> '1997/01/01'
Function func_date_add(str :string ;day :integer):string;                   // 일자를 더해주는 함수
Function func_subtract_date(org1_date:string ;org2_date:string ) :integer;  // 일자를 빼주는 함수
Function func_isDate(str :string):boolean;                                  // 일자형식으로 변경가능한지체크
Function func_MON_add(str :string ;mon :integer):string;                    // 월을 더해주는 함수
function func_HidukeHensyu(iDate:String):String ;                           // 일자를 편집한다
Function func_yyyymm(yyyymm:integer;var start_date :Tdatetime;var end_date :Tdatetime):boolean;
                                                                            // 월의 시작일과 마지막일을 찾아준다
Function func_isnumeric(str :string):boolean;                               // 숫자형식으로 변경가능하지체크
Function func_s_ifix(num :longint ;n :smallint ;typ :integer):longint;      // 정수형 단수처리
Function func_s_ffix(num :Extended ;n :smallint ;typ :integer):Extended;    // 실수형 단수처리
function func_SiteiSyosu(sOrgVal,sTrcVal :String):String ;                  // 지정한소수점형식으로 표시한다

function func_strFillZeroL( s: string  ;  max_len: integer ) : string ; overload;    // fill character '0' to left
function func_strFillZeroL( i: integer ;  max_len: integer ) : string ; overload;    // fill character '0' to left
function func_alstrLeftF( s: string  ;  max_len: integer ) : string ;       // align to Left  with fixed length
function func_alstrRightF( s: string  ;  max_len: integer ) : string ;      // align to Right with fixed length
function func_alstrCenterF( s: string  ;  max_len: integer ) : string ;       // align to Left  with fixed length
function func_CutStr( cLine:String ; cLen: Cardinal ): string;              // Split string (한글2바이트처리를 위하여 문자열을 나눈다)
Function func_strim(Str:string ;del_str:string):string;                     // 문자열에서 지정된 문자를 삭제한다

Function func_GetAge( Birthday, CurrDate: string ):Integer;                 // 생년월일에서 나이를 계산한다
Function func_CurGetAge( Birthday, CurrDate: string ):String;               // 생년월일에서 나이를 계산한다 (Return값nnn세nn월)

Function func_AppExec(ExeFileName :string):integer ;                        // 다른 어플리케이션 실행하고 어플리케이션의 종료를 기다리지않는 함수
Function func_AppExec_Wait(FormName :Tform ;ExeFileName :string):integer ;  // 다른 어플리케이션 실행하고 어플리케이션의 종료를 기다리는 함수
function func_AppExec_Search(sClassName, sWindowName : String): HWND;       // 다른 어플리케이션 실행시 현재실행상태를 체크한다

Function func_Login(DB: TDataBase ; User, passwd:string):Boolean ;          // Login function
function TableExists ( DBAlias,tbName : string ) : Boolean  ;               // Check whether the specified Table is Exists or Not
function IsDataSetEmpty(DataSet: TDataSet): Boolean;                        // Data가 존재하는 체크
function func_Msg(Msg, Cap: string; uType: integer): boolean;               // Error Message 처리

function IsFieldExists(DataSet: TDataSet ; FieldName : String ): Boolean;   // DataSet중에서 특정Field의 존재유무를 체크
Function func_isAlphaNum(str :string):boolean;                              // [0..9],[a..z],[A..Z]값인지 아닌지를 체크

function func_Color2Str( Color : TColor): string ;                          // 스트링값을 RGB값으로 변경하는 함수{'RRRGGGBBB'}
function func_Str2Color( Color : string): TColor ;                          // RGB값을 스트링값으로 변경하는 함수

function func_GetCurrLine(Control:TCustomEdit): Integer;                    // 메모장에서 현재커서의 라인번호를 얻는 함수
function func_MemoScrollUpDown(Control:TCustomEdit; iKey:Word):Integer;     // 메모장에서 PageUp과 PageDown을 키보드로 제어하는 함수

function QuotedStr(const S:string): string ;                                // 따옴표로(') 둘러싼 문자열 구하기 2001-05-19 Lim

function func_Dec2Hex64(N: Int64; Digits: integer): string;
function func_Hex2Dec64(const S: string): Int64;
function func_GetFolder() : String;
function func_IniSave(const Folder, Filename, Section, Ident, Value: String): Boolean;
function func_IniStringRead(const Folder, Filename, Section, Ident, Default: String): String;
function func_IniIntegerRead(const Folder, Filename, Section, Ident: String; Default: Integer): Integer;

function func_hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string;
function func_UnicodeZPL(Data, strRET : String; XPos, YPos, XAxis, YAxis : Integer; Rotation : Boolean) : String;
function func_HanToUnicode(Data : String) : String;

function func_Chkum(Txt: string) : string;

//파일 컨트롤
function func_FileDelete(strFILE : string) : Boolean;
function func_IntToBin(valor,digitos:integer):string;

function func_kcWeekOfYear( dDate: TdateTime ): Integer;
function func_kcMonthDays( nMonth, nYear: Integer ): Integer;
function func_kcIsLeapYear( nYear: Integer ): Boolean;
function func_LANSend(Sender: TObject; sSnd : String; sIP : String) : Boolean;
function func_ActiveLANSend(Sender: TObject; sSnd : String) : Boolean;
function func_TableCreate(fmCONTROL: TObject; intINDEX: Integer; TableName: String; FieldName: String) : Boolean;

function OKPostExec(ACommand: string; cShow: Word): Integer;                //외부 프로그램 실행하기...
function Browsedialog(const Title: string; const Flag: integer): string;

function func_SEQ_Query(fmCONTROL: TObject; sl_Query:String):String;        //순번 구하기
function func_CNT_Query(fmCONTROL: TObject; sl_Query:String):String;
function func_ExecSQL(fmCONTROL: TObject; sSQL:String): Boolean;                                      //SQL 문장을 실행 하고 성공여부를 리턴한다.

function CheckTimeOver(LastTime, Elapsed: Dword): Boolean;                      // 현재 시간이 LastTime에서 Elapsed만큼 경과한 경우 True를 반환한다.
function func_GetFontsFolder() : String;
function func_SetSystemTime(sDateTime : String) : Boolean;

(* User Procedure *)

procedure ColorOnEnter(Sender: TObject);                                    // 항목에 커서가 위치하는 경우에 항목의색을 변경한다
procedure ColorOnExit(Sender: TObject);                                     // 항목에 커서가 빠져나가는 경우에 항목의색을 변경한다

procedure TokenString(const S: String; TokenSeparator: String; Tokens: TStringList);
procedure DateDiff(Date1, Date2: TDateTime; var Days, Months, Years: Word);

procedure RefreshDataSet(Tab: TDataSet);                                   // 화면에 Refresh현재 위치로 이동하도록하는 함수

procedure proc_Log2File(FilePath, LogStr : string);     //2001-07-28 PR004.pas에서 여기로 이동
procedure proc_LptSend(sSnd : String);                  //2002-11-29 박정진 추가
procedure proc_data_distinction(strBUFF, strGUBUN : String; var arrDATA :Array of String; var intSEND : Integer);
procedure FNExcelToStrGrid(sFileName: String; svGrid: TStringGrid);
procedure FNExcelToPDX(fmCONTROL: TObject; sFileName: String);

procedure proc_MemoLog(memLog : TObject; sCaption, sLog, sFileName : String);
procedure proc_PlayErrBellSound(sResource : String);
procedure proc_PlayErrBellSoundLOOP(sResource : String);
procedure proc_PlayErrSoundOff;
procedure proc_FontRegistry(sFontFile : String);


implementation
    uses rxStrUtils;

{    이름 : SetToBookmark
     기능 : BookMark해주는 함수
     인수 :
   결과값 : True, False
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function SetToBookmark(ADataSet: TDataSet; ABookmark: TBookmark): Boolean;
begin
  Result := False;
  with ADataSet do
    if Active and (ABookmark <> nil) and not (Bof and Eof) and
      BookmarkValid(ABookmark) then
    try
      ADataSet.GotoBookmark(ABookmark);
      Result := True;
    except
    end;
end;

{   이름 :  func_CalcDateTimeToMin
    기능 :  FromTime부터 ToTime까지의 분계산
    인수 :
  결과값 :  두 시간값의 차(분)
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_CalcDateTimeToMin ( FromTime, ToTime: TDateTime ) : LongInt;
var
  FromTimeStamp, ToTimeStamp : TTimeStamp;
begin
  FromTimeStamp := DateTimeToTimeStamp(FromTime);
  ToTimeStamp   := DateTimeToTimeStamp(ToTime);

  Result := (ToTimeStamp.Date - FromTimeStamp.Date) * 24 * 60
          + ( (ToTimeStamp.Time div 60000) - (FromTimeStamp.Time div 60000) )
end;

{    이름 : func_DaysPerMonth
     기능 : 월의 일수를 계산하는 함수
     인수 : 년도와 월의 정수값
   결과값 : 해당년도와 월의 일수
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_DaysPerMonth(AYear, AMonth: Integer) : Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and func_IsLeapYear(AYear)  then
    Inc(Result);  {윤년의 일수}
end;

{    이름 : func_IsLeapYear
     기능 : 윤년을 판단하는 함수
     인수 : 년도의 정수값
   결과값 : True - 윤년 False - 평년
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_IsLeapYear(AYear: Integer) : Boolean;
begin
  Result  := (AYear mod  4 = 0)  and  ((AYear mod 100 <> 0)  or  (AYear mod 400 = 0));
end;

{    이름 : func_Date_10_8
     기능 : YYYY/MM/DD의 형식을 YYYYMMDD형식으로 변환하는 함수
     인수 : YYYY/MM/DD의 형식의년월일의 문자값
   결과값 : YYYYMMDD의 형식의 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-28  Lim                1.에러일 때 결과값을 ''로 수정
}
Function func_Date_10_8(str :string):String;
var
  S : string;
begin
  try
    S := Trim(str);
    if length(S) = 10 then
    begin
      S := Copy(S,1,4) + Copy(S,6,2) + Copy(S,9,2) ; {yyyymmdd}
      Result  := S;
    end
    else
      Result  := '';

  except
    On EConvertError do begin
      Result := '';
    end;
  end;
end;

{    이름 : func_Date_8_10
     기능 : YYYYMMDD의 형식을 YYYY/MM/DD형식으로 변환하는 함수
     인수 : YYYYMMDD의 형식의년월일의 문자값
   결과값 : YYYY/MM/DD의 형식의 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-28  Lim                1.에러일 때 결과값을 ''로 수정
}
Function func_Date_8_10(str,ins_char :string):String;
var
  S : string;
begin
  try
    S := Trim(str);
    if length(S) = 8 then
    begin
      S := Copy(S,1,4) + Ins_Char + Copy(S,5,2) +  Ins_Char + Copy(S,7,2) ; {yyyy/mm/dd}
      Result  := S;
    end
    else
      Result  := '';
  except
    On EConvertError do begin
      Result := '';
    end;
  end;
end;

{    이름 : func_date_add
     기능 : 날짜를 더해준다
     인수 : YYYYMMDD형식의 문자값, 더할일수의 정수값
   결과값 : YYYYMMDD의 형식의 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
Function func_date_add( str :string ;day :integer):string;
var
  new_date: TDateTime;
  new_str :string;
begin
  try
    new_str := copy(str,1, 4) + FormatSettings.DateSeparator + copy(str,5, 2) + FormatSettings.DateSeparator + copy(str,7, 2);
    new_date := StrToDate(new_str);
    new_str := FormatDateTime('yyyymmdd',new_date+day);
    Result := func_strim( new_str,FormatSettings.DateSeparator);
  except
    On EConvertError do begin
      Result := '';
    end;
  end;
end;


{    이름 : func_subtract_date
     기능 : 두 날짜의 차이를 월로 환산(x개월)함.
     인수 : 날짜 문자열(YYYYMMDD)
   결과값 : x개월(정수)
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_subtract_date(org1_date:string ;org2_date:string ) :integer;
var
  dumy_long1 :integer;
  dumy_long2 :integer;
begin
  result := 0;
  dumy_long1 := strToInt(copy(org1_date,1,4)) * 12;
  dumy_long1 := dumy_long1 + strToInt(copy(org1_date,5,2));
  dumy_long2 := strToInt(copy(org2_date,1,4)) * 12;
  dumy_long2 := dumy_long2 + strToInt(copy(org2_date,5,2));

  result :=  dumy_long1 - dumy_long2;
end;

{    이름 : func_isDate
     기능 : 날짜형식 검증 함수
            DateTime으로 변환 가능하면 날짜 데이터이고 불가능하면 날짜 형식이 아님.
     인수 : 날짜형식으로 변경할 문자값(YYYYMMDD)
   결과값 : True - 날짜형식 False - 날짜형식이 아님
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
Function func_isDate(str :string):boolean;
var
  S : string;
//
//  dummy_d : TDateTime;
begin
  try
    S := Trim(str);
    if length(S) = 8 then
       begin
       Insert(FormatSettings.DateSeparator,S,5); {yyyy/mmdd}
       Insert(FormatSettings.DateSeparator,S,8); {yyyy/mm/dd}
       end;

//
//    dummy_d := strToDate(S);
    Result := true;

    if  Length(s) <> 10  then  Result := False ;

  except
    On EConvertError do begin
      Result := false;
    end;
  end;
end;

{    이름 : func_MON_add
     기능 :
     인수 : 년도월일의 문자값(YYYYMMDD), 더할 월의 정수값
   결과값 : 계산된 년도월일의 문자값(YYYYMMDD)
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
Function func_MON_add( str :string ;mon :integer):string;
var
  Old_Date, New_Date : TDateTime ;
begin
  Old_Date := StrToDate( func_Date_8_10( str,FormatSettings.DateSeparator));
  New_Date := IncMonth( Old_Date, mon );
  result   := FormatDateTime('YYYYMMDD', New_date);
end;

{    이름 : func_HidukeHensyu
     기능 : 날자형식으로 입력할때 월과 일에서 0을 입력하지 않은 경우에 0을 붙여준다
     인수 : 날짜형식의 문자값(YYYY/MM/DD)
   결과값 : 0가 채워진 날자형식의 문자값(YYYY/MM/DD)
      예)   func_HidukeHensyu(2001/4/5) --> 2001/04/05
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
function func_HidukeHensyu(iDate:String):String ;
var
 iYear,iMonth,iDay :String ;
 oYear,oMonth,oDay :String ;
 oDate :String ;
begin
  iYear  := Copy(iDate,1,4) ;
  iMonth := Copy(iDate,6,2) ;
  iDay   := Copy(iDate,9,2) ;
  While  POS(' ',iMonth) > 0  do  begin  //space, . , _  is Truncate
    Delete(iMonth,POS(' ',iMonth),1);
  end ;
  While  POS('.',iMonth) > 0  do  begin
    Delete(iMonth,POS(' ',iMonth),1);
  end ;
  While  POS('_',iMonth) > 0  do  begin
    Delete(iMonth,POS(' ',iMonth),1);
  end ;

  While  POS(' ',iDay) > 0  do  begin
    Delete(iDay,POS(' ',iDay),1);
  end ;

  While  POS('.',iDay) > 0  do  begin
    Delete(iDay,POS(' ',iDay),1);
  end ;

  While  POS('_',iDay) > 0  do  begin
    Delete(iDay,POS(' ',iDay),1);
  end ;

  oYear := iYear ;
  if Length(iMonth) = 1 then
    oMonth := '0' + iMonth
  else
    oMonth := iMonth ;
  if Length(iDay) = 1 then
    oDay   := '0' + iDay
  else
    oDay   := iDay ;
 oDate := oYear + FormatSettings.DateSeparator + oMonth + FormatSettings.DateSeparator + oDay ;
 Result := oDate ;
end ;

{    이름 : func_yyyymm
     기능 : 년월의 시작일과 마지막일을 찾아준다
     인수 : 년월의 문자값(YYYYMM)
   결과값 : 시작일과 마지막일의 Date형식의 값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_yyyymm(yyyymm:integer;var start_date :Tdatetime;var end_date :Tdatetime):boolean;
var
  year,month,day :word;
begin
   result     :=  True;
   try
      start_date :=  EncodeDate(strtoint(copy(inttostr(yyyymm),1,4)),strtoint(copy(inttostr(yyyymm),5,2)),01);
      DecodeDate(start_date + 31,year,month,day);
      end_date   :=  start_date + 31 -  day;
   except
      result   :=  False;
      raise;
   end;
end;


{    이름 : func_isnumeric
     기능 : 숫자형식 검증 함수
            지수형식은 제외
     인수 : 숫자형식으로 변경할 문자값
   결과값 : True - 숫자형식 False - 숫자형식이 아님
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_isnumeric( str :string):boolean;
//var
//  dumy_r :Extended;
begin
  try
    if  POS( 'E', uppercase(str)) > 0 then begin
        Result := False;
        Exit;
    end;

//
//    dumy_r := StrToFloat(str);
//    dumy_r := dumy_r + 1;
    Result := true;

  except
    On EConvertError do begin

      Result := false;
    end;
  end;
end;


{    이름 : func_s_ifix
     기능 : 정수형 단수처리
     인수 : num:변경가능한수치 n:자리수 typ:단수처리 방법(1: 절삭 2:사사오입 3: 반올림) 의 정수형
   결과값 : 단수처리된 정수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_s_ifix(num :longint ;n :smallint ;typ :integer):longint;
var
  dumy_int :longint;
  dumy_real :Extended;
  keta :integer;

begin
  keta := trunc(Exp(n*LN(10)));

  case typ of
   1: begin
        dumy_real := num / keta;
        dumy_int  := trunc(dumy_real);
        Result    := dumy_int * keta;
   end;
   2:begin
        dumy_real := num / keta;
        //dumy_int := round(dumy_real);
        dumy_int  := trunc(dumy_real+ 0.5);
        Result    := dumy_int * keta;
   end;
   3:begin
        dumy_real := num / keta;
        dumy_real := dumy_real + 0.9;
        dumy_int  := trunc(dumy_real);
        Result    := dumy_int * keta;
   end;
   else Result    := -1;
 end;
end;

{    이름 : func_s_ffix
     기능 : 실수형 단수처리
     인수 : num:변경가능한수치의 실수형, n:자리수 typ:단수처리 방법(1: 절삭 2:사사오입 3: 반올림) 의 정수형
   결과값 : 단수처리된 실수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_s_ffix(num :Extended ;n :smallint ;typ :integer):Extended;
var
  dumy_real :Extended;
  keta :integer;
begin

  keta := trunc(Exp((n-1)*LN(10)));

  case typ of
   1: begin
        dumy_real := num * keta;
        dumy_real := trunc(dumy_real);
   end;
   2:begin
        dumy_real := num * keta ;
        if (dumy_real < 0) then
           dumy_real := dumy_real - 0.5
        else
           dumy_real := dumy_real + 0.5;
        dumy_real :=  trunc(dumy_real);
   end;
   3:begin
        dumy_real := num * keta;
        if (dumy_real < 0) then
            dumy_real := dumy_real - 0.9
        else
            dumy_real := dumy_real + 0.9;

        dumy_real := trunc(dumy_real);
   end;
  end;
  Result := dumy_real / keta;
end;

{    이름 : func_SiteiSyosu
     기능 : 지정한소수점형식으로 표시한다
     인수 : 원래값과 소수점자리수의 문자값
   결과값 : 지정한소수점형식으로 표시된 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function  func_SiteiSyosu(sOrgVal,sTrcVal :String):String ;
var
  ReVal   : Real ;
  iIntVal : Integer ;
  sIntVal,sFormat: String ;
begin
  Result := '' ;

  Reval := StrToFloat(sOrgVal) ;
  if POS('.',sOrgVal) > 0 then begin
      sIntVal := Copy(sOrgVal,1,POS('.',sOrgVal)-1);
  end
  else begin
      sIntVal := sOrgVal ;
  end ;

  iIntVal := Length(sIntVal);
  sFormat := '%' + intToStr(iIntVal) + '.' + sTrcVal + 'f' ;

  Result := Format(sFormat,[Reval]) ;
end;

{    이름 : func_strFillZeroL
     기능 : 왼쪽에0을 붙여주는 함수
     인수 : 0를 붙일 문자값, 0롤 채울 자릿수의 정수값
   결과값 : 0가 채워진 문자값
       예 - func_strFillZeroL('2', 4) ===> '0002'
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_strFillZeroL( s: string  ;  max_len: integer ) : string ; overload;
begin
     if  Length(s) > max_len then  begin
         result := 'Error';
         Exit;
     end;

     result := AddChar( '0', s, max_len );
end ;

//2001-08-15 Lim 추가
function func_strFillZeroL( i: integer ;  max_len: integer ) : string ; overload;
var
    s:string;
begin
     s := IntTostr(i);
     if  Length(s) > max_len then  begin
         result := 'Error';
         Exit;
     end;

     result := AddChar( '0', s, max_len );
end ;

{    이름 : func_alstrLeftF
     기능 : 문자열 왼쪽 정렬
     인수 : Space를 붙일 문자값, Space롤 채울 자릿수의 정수값
   결과값 : Space가 채워진 문자값
       예 - func_alstrLeftF('2', 4) ===> '2   '
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_alstrLeftF( s: string  ;  max_len: integer ) : string ;
begin
     if  Length(s) > max_len  then  begin
             result := func_CutStr( s, max_len);
             Exit;
     end;
     result := LeftStr(s, max_len);
end ;

{    이름 : func_alstrRightF
     기능 : 문자열 오른쪽 정렬
     인수 : Space를 붙일 문자값, Space롤 채울 자릿수의 정수값
   결과값 : Space가 채워진 문자값
       예 - func_alstrRightF('2', 4) ===> '    2'
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_alstrRightF( s: string  ;  max_len: integer ) : string ;             // align to Right
begin
     if  Length(s) > max_len  then  begin
             result := func_CutStr( s, max_len);
             Exit;
     end;
     result := RightStr(s, max_len);
end ;

{    이름 : func_alstrCenterF
     기능 : 문자열 가운데 정렬
     인수 : Space를 붙일 문자값, Space롤 채울 자릿수의 정수값
   결과값 : Space가 채워진 문자값
       예 - func_alstrRightF('2', 4) ===> '    2'
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_alstrCenterF( s: string  ;  max_len: integer ) : string ;       // align to Left  with fixed length
var
    iStrHelf, iMaxHelf : Integer;
    sTemp : String;
begin
     if  Length(s) > max_len  then  begin
         result := func_CutStr( s, max_len);
         Exit;
     end;
     iStrHelf := Length(s) div 2;
     iMaxHelf := max_len div 2;
     sTemp := RightStr(Copy(s,1,iStrHelf), iMaxHelf);

     sTemp := sTemp + LeftStr(Copy(s,iStrHelf+1,Length(s)), iMaxHelf);


     result := sTemp;
end ;

{    이름 : func_CutStr
     기능 : 문자열에서 지정한 Byte만큼 문자열을 끊어준다
     인수 : 문자열의 문자값과 표시할 정수값
   결과값 : 지정한 Byte만큼의 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function  func_CutStr( cLine:String ; cLen: Cardinal ): string;  // Cardinal : Integer형
var
   Len: Cardinal ;
   buf: String ;
//
//   Switch: Boolean ;
//   i, j : Integer ;
begin
   if Length(cLine) > cLen  then begin
      buf := Copy( cLine, 1, cLen ) ;
      Len := Length(buf) ;

      if  StrByteType( PChar(Buf), Len - 1 ) = mbLeadByte then begin
          buf := Copy( cLine, 1, Len - 1 );
      end
      else  begin
          buf := Copy( cLine, 1, Len );
      end;
      result := buf ;
   end
   else  result := cLine ;

end;


{    이름 : func_strim
     기능 : 문자열에서 특정 문자 제거
     인수 : 입력문자열, 제거할 문자열
   결과값 : 지정한 문자열이 제거된 문자열
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_strim(Str:string ;del_str:string):string;
begin
  while Pos(del_str,Str) > 0 do delete(Str,Pos(Del_Str,Str),1);
  Result := Str;
end;


{    이름 : func_GetAge
     기능 : 나이를 구하는 함수 (nnn살)
     인수 : 생년월일(YYYYMMDD)과 현재월일(YYYYMMDD)의 문자값
   결과값 : 나이의 정수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
Function  func_GetAge( Birthday, CurrDate: string ):Integer;
var
   nenrei, Getu,Days : word;
begin
   Nenrei := 0;
   Getu   := 0;
   Days   := 0;
   if  Birthday < CurrDate then
        DateDiff( StrToDate(func_Date_8_10(Birthday,FormatSettings.DateSeparator)),
                  StrToDate(func_Date_8_10(CurrDate,FormatSettings.DateSeparator)),
                  Days, Getu, Nenrei);

   if  nenrei < 0 then  nenrei := 0;
   reSult := nenrei ;

end;

{    이름 : func_CurGetAge
     기능 : 나이를 구하는 함수 (nnn살nn개월)
     인수 : 생년월일(YYYYMMDD)과 현재월일(YYYYMMDD)의 문자값
   결과값 : 나이와 개월수의 문자값 (yyymm)
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
            2001-05-21  Lim                1.무조건 '/'가 아니라 DateSeparator 사용
}
Function  func_CurGetAge( Birthday, CurrDate: string ):String;
var
   nenrei, Getu,Days : word;
begin
   Nenrei := 0;
   Getu   := 0;
   Days   := 0;
   if  Birthday < CurrDate then
        DateDiff( StrToDate(func_Date_8_10(Birthday,FormatSettings.DateSeparator)),
                  StrToDate(func_Date_8_10(CurrDate,FormatSettings.DateSeparator)),
                  Days, Getu, Nenrei);

   Result := func_strFillZeroL(intToStr(Nenrei),3) + func_strFillZeroL(intToStr(Getu),2) ;
end;


{    이름 : func_AppExec
     기능 : 다른 어플리케이션 실행하고 어플리케이션의 종료를 기다리지않는 함수
     인수 : 실행할 Exe화일명과 파라메터
   결과값 : 실행할 Exe화일의 핸들값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function  func_AppExec(ExeFileName :string):integer ;
var
//
//   wk_Char          : array[0..200] of Char;
   startupinfo      :   TStartupinfo;
   processinfo      :   TProcessInformation;
begin
  try
    begin
      fillchar(startupinfo,sizeof(Tstartupinfo),0);
      if  createprocess(nil,
                        Pchar(ExeFileName), //strpcopy(wk_Char,ExeFileName),
                        nil,
                        nil,
                        false,
                        NORMAL_PRIORITY_CLASS,
                        nil,
                        nil,
                        startupinfo,
                        processinfo)  then
         begin
             application.processmessages;
      end;
    end;
    Result   :=   processinfo.hprocess;
  except
    Result   :=   1;
    MessageDlg(ExeFileName + '을 실행할수 없습니다',mtError,[mbOK],0);
  end;
end;

{    이름 : func_AppExec_Wait
     기능 : 다른 어플리케이션 실행하고 어플리케이션의 종료를 기다리는 함수
     인수 : 실행할 Exe화일명과 파라메터
   결과값 : 0- Exe화일을 실행함 1- Exe화일을 실행하지 못함
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function  func_AppExec_Wait(FormName :Tform ;ExeFileName :string):integer ;
var
//
//   wk_Char          : array[0..200] of Char;
   startupinfo      :   TStartupinfo;
   processinfo      :   TProcessInformation;
begin
  try
    begin
      fillchar(startupinfo,sizeof(Tstartupinfo),0);
      if  createprocess(nil,
                        Pchar(ExeFileName), //strpcopy(wk_Char,ExeFileName),
                        nil,
                        nil,
                        false,
                        NORMAL_PRIORITY_CLASS,
                        nil,
                        nil,
                        startupinfo,
                        processinfo)  then
         begin
           FormName.enabled  :=  false;
           while  Waitforsingleobject(processinfo.hprocess,0) = WAIT_TIMEOUT  do
             application.processmessages;
           FormName.enabled  :=  True;
      end;
    end;
    Result   :=   0;
  except
    Result   :=   1;
    MessageDlg(ExeFileName + '을 실행할수 없습니다',mtError,[mbOK],0);
  end;
end;

{    이름 : func_AppExec_Search
     기능 : 다른 어플리케이션 실행시 현재실행상태를 체크한다
     인수 : 실행할 폼의 Class명과 폼의 Caption명의 문자값
   결과값 : 실행한Exe화일의 핸들값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function  func_AppExec_Search(sClassName, sWindowName :string):HWND ;
begin
  Result      := 0;
  Result      := FindWindow(PChar(sClassName),PChar(sWindowName));
end;


{    이름 : func_Login
     기능 : 로근인을 해주는 함수
     인수 : 로그인할 데이타베이스명, 사용자와 패스워드의 문자값
   결과값 : True - 로그인성공 False - 로그인 실패
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function  func_Login( DB: TDataBase ; User, passwd:string):boolean ;
var
    serveridx, useridx, passidx: integer;
//    sQry   : TQuery;
begin
    DB.AliasName := G_ServerDB ;
    DB.LoginPrompt := False ;
    if DB.Params.Values['DEFAULT DRIVER']<> 'PARADOX' then begin
        serveridx := DB.Params.IndexOfName('SERVER NAME');
        useridx := DB.Params.IndexOfName('USER NAME');
        passidx := DB.Params.IndexOfName('PASSWORD');

        DB.Params.Strings[serveridx] := 'SERVER NAME=' + G_ServerName ;
        DB.Params.Strings[useridx] := 'USER NAME=' + User ;
        DB.Params.Strings[passidx] := 'PASSWORD=' + passwd ;
    end;

    try
       DB.Open ;
       Result := True ;
    except
       Result := False ;
    end;

end;


{    이름 : TableExists
     기능 : 테이블의 존재여부를 체크하는 함수
     인수 : 데이타베이스와 테이블의 문자값
   결과값 : True- 테이블이 존재함 False- 테이블이 존재하지 않음
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function TableExists ( DBAlias,tbName : string ) : Boolean ;
begin
  TbNames := TstringList.Create ;
  Session.GetTableNames( DBAlias, '', false, false, TbNames ) ;
  if TbNames.IndexOf(tbName) >= 0 then
  	TableExists := true
  else
  	TableExists := false ;
  TbNames.Free ;
end ;


{    이름 : IsDataSetEmpty
     기능 : 데이터가 존재하는지를 체크한다.
     인수 : 테이블명의 Dataset
   결과값 : True - 데이터가 없음 False - 데아터가 존재함
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function IsDataSetEmpty(DataSet: TDataSet): Boolean;
begin
  with DataSet do Result := (not Active) or (Eof and Bof);
end;


{    이름 : IsFieldExists
     기능 : DataSet중에서 특정Field의 존재유무를 체크
     인수 : 테이블명의 DataSet값과 해당필드이름이 문자값
   결과값 : True- 해당필드가 존재한다 False- 해당필드가 존재하지 않는다
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function IsFieldExists(DataSet: TDataSet ; FieldName : String ): Boolean;
var
   Field : TField ;
begin

   if  not DataSet.Active then DataSet.Active := True ;

   Field := DataSet.FindField(FieldName);
   if  Field = nil then result := False
   else                 result := True ;

end;

{    이름 : func_isAlphaNum
     기능 : [0..9],[a..z],[A..Z]값인지 아닌지를 체크
     인수 : 체크할 문자값
   결과값 : True- 에러가 없음 False- 에러가 있음
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
Function func_isAlphaNum(str :string):boolean;
var
    i, Len : integer ;
begin
    result := false;
    Len := Length(Str);
    if Len > 0 then begin
        result := true;
        for i := 1 to Len do begin
            if Str[i] in ['0'..'9', 'A'..'Z','a'..'z'] then result := result and True
            else result := false;
        end;
    end;
end;

{    이름 : func_Color2Str
     기능 : RGB값을 스트링값으로 변경하는 함수
     인수 : RGB의 정수값
   결과값 : RGB의 변환된 문자값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_Color2Str( Color : TColor): string ;  {'RRRGGGBBB'}
begin
    result := AddChar('0', IntToStr(GetRValue(Color)) ,3) +
              AddChar('0', IntToStr(GetGValue(Color)) ,3) +
              AddChar('0', IntToStr(GetBValue(Color)) ,3) ;
end;

{    이름 : func_Str2Color
     기능 : 스트링값을 RGB값으로 변경하는 함수
     인수 : RGB로 바꿀 문자값
   결과값 : RGB로 바뀐 정수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_Str2Color( Color : string): TColor ;
begin
    result := RGB(Byte(StrToInt(Copy(Color,1,3))),
                  Byte(StrToInt(Copy(Color,4,3))),
                  Byte(StrToInt(Copy(Color,7,3))) );
end;

{    이름 : func_Msg
     기능 : 메세지를 표시하는 함수
     인수 : 메세지와 Title의Caption명의 문자값과 메세지표시형태의 정수값
   결과값 : OK나 Yes
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_Msg(Msg, Cap: string; uType: integer): boolean;
var
  Rlt: integer;
begin
  case uType of
    OK:       Rlt := MessageDlg(Msg, mtWarning,[mbOK],0);
    ERROK:    Rlt := MessageDlg(Msg, mtError,[mbOK],0);
    OKCANCEL: Rlt := MessageDlg(Msg, mtConfirmation, [mbOK, mbCANCEL],0);
    YESNO:    Rlt := MessageDlg(Msg, mtConfirmation, [mbYES, mbNO],0);
  end;
  func_Msg := (Rlt = mrOK) or (Rlt = mrYES);

end;



{    이름 : func_GetCurrLine
     기능 : 메모장에서 현재커서의 라인번호를 얻는 함수
     인수 : 메모장의 이름
   결과값 : 라인번호의 정수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_GetCurrLine(Control:TCustomEdit): Integer;
begin
  Result := Control.Perform(EM_LINEFROMCHAR,Control.selstart ,0);
end;

{    이름 : func_MemoScrollUpDown
     기능 : 메모장에서 PageUp과 PageDown을 키보드로 제어하는 함수
     인수 : 메모장의 이름과 PageUp, PageDownKey이 정수값
   결과값 : PageUp, PageDownKey을 실행한후에 이동한 정수값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_MemoScrollUpDown(Control:TCustomEdit; iKey:Word):Integer;
begin
  If iKey = VK_PRIOR then begin
     Result := Control.Perform(EM_SCROLL,SB_PAGEUP,0);
  end;
  If iKey = VK_NEXT  then begin
     Result := Control.Perform(EM_SCROLL,SB_PAGEDOWN,0);
  end;

end;

{   이름 : QuotedStr
    기능 : 문자열을 작은 따옴표(')로 둘러싼 문자열로 변환
    인수 : 입력문자열
  결과값 : 소괄호로 둘러싼 문자열
}
function QuotedStr(const S:string): string ;
begin
    QuotedStr := QuotedString( S, char(''''));
end;


{   이름 :  func_Dec2Hex64
    기능 :  64비트 정수값을 지정한 자릿수만큼의 16진수 문자열로 변환
            주) 32비트 정수값을 변환해주는 함수는 이미 RxLib의 StrUtils.pas에 있다.
    인수 :  Unsigned 64bits 정수, 표현할 자릿수
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_Dec2Hex64(N: Int64; Digits: integer): string;
begin
  Result := IntToHex(N, Digits);
end;

{   이름 :  func_Hex2Dec64
    기능 :  16진수 문자열을 64비트 정수값(10진수)으로 돌려줌.
            주) 32비트 정수값으로 변환해주는 함수는 이미 RxLib의 StrUtils.pas에 있다.
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_Hex2Dec64(const S: string): Int64;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToInt64Def(HexStr, 0);
end;

{   이름 :  func_GetFolder
    기능 :  현재 폴더 가져오기...
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_GetFolder() : String;
var
    S : String;
begin
    S := Application.ExeName;
    Result := ExtractFilePath(S);
end;

{   이름 :  func_IniSave
    기능 :  환경파일 저장...
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_IniSave(const Folder, Filename, Section, Ident, Value: String): Boolean;
var
    IniHandle : TIniFile;
begin
    IniHandle := TIniFile.Create(Folder + Filename);
    try
        IniHandle.WriteString(Section,Ident,Value);
    finally
        IniHandle.Free;
        Result := True;
    end;
end;

{   이름 :  func_IniStringRead
    기능 :  환경파일 읽어오기...(String)
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_IniStringRead(const Folder, Filename, Section, Ident, Default: String): String;
var
    IniHandle : TIniFile;
    sTemp : String;
begin
    IniHandle := TIniFile.Create(Folder + Filename);
    try
        sTemp := IniHandle.ReadString(Section, Ident, Default);
    finally
        IniHandle.Free;
        Result := sTemp;
    end;
end;

{   이름 :  func_IniIntegerRead
    기능 :  환경파일 읽어오기...(Integer)
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_IniIntegerRead(const Folder, Filename, Section, Ident: String; Default: Integer): Integer;
var
    IniHandle : TIniFile;
    sTemp : Integer;
begin
    IniHandle := TIniFile.Create(Folder + Filename);
    try
        sTemp := IniHandle.ReadInteger(Section,Ident,Default);
    finally
        IniHandle.Free;
        Result := sTemp;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// Txt      : 인쇄할 문자열
// Xpos     : X 좌표
// Ypos     : Y 좌표
// Xaxis    : 이미지 확대 X 좌표 비율 (Default : 1)
// Yaxis    : 이미지 확대 Y 좌표 비율 (Default : 1)
// Rotation : 인쇄이미지의 회전 ( False : 'N'-- 정방향인쇄, True : 'Y'-- 90도 회전 인쇄 )
//
// 사용예제 : hangulZpl('진코퍼레이션 주식회사', 200,100,1,1,True);
////////////////////////////////////////////////////////////////////////////////
function func_hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string;
var
   i, Len, Gap  : integer;
   KorTxt, Str1 : String;
   j    : array[0..100] of integer;
begin
   Gap  := 24;                 //글자사이의 간격 이미지확대가 없을때 24가 Default Value
   i    := 1;
   Len  := length(Txt);

   While Len >= i do
   begin
       j[i] := Ord(Txt[i]);
       j[i+1] := Ord(Txt[i+1]);
       if j[i] >= 176 then //문자일경우
       begin
           Str1   := intTostr(j[i]);
           Str1   := Str1 + intTostr(j[i+1]);
           if Not Rotation then
           begin
               Xpos   := Xpos + (Gap * Xaxis);
               KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                       + '^XGE:N' + Str1 + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
           end else
           begin
               Ypos   := Ypos + (Gap * Yaxis);
               KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                       + '^XGE:R' + Str1 + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
           end;
           i      := i + 2;
       end else
       begin
           Str1   := IntToStr(j[i]);
           if Not Rotation then
           begin
               Xpos   := Xpos + (Gap * Xaxis);
               KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                       + '^XGE:N0000' + Str1 + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
           end else
           begin
               Ypos   := Ypos + (Gap * Yaxis);
               KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                       + '^XGE:R0000' + Str1 + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
           end;
           i      := i + 1;
       end;
   end;

   Result := KorTxt;

end;

function funHangle_Conversion(Hangle, Han_Font, Eng_Font, Pitch : String) : String;
var
    Count                  : Integer;      //문자위치를 나타냄 (순차적으로.....)
    Before_Hangle          : String;       //데이타파일에서 비교하기 위해 읽은 1문자
    Result_Hangle          : String;       //Conversion된 한글 Hex값
    Total_Hangle           : String;       //Conversion된 한글 Hex값 계속 누적
    Han_Font_Flag          : Boolean;      //앞 문자가 한글임을 명시 (True일때)
    Eng_Font_Flag          : Boolean;      //앞 문자가 영문임을 명시 (True일때)
begin
    Result_Hangle := '';
    Han_Font_Flag := False;
    Eng_Font_Flag := False;

    for Count := 0 to Length(Hangle) do
    begin
        Before_Hangle := Copy(Hangle, Count, 1);
        if Before_Hangle > Char($80) Then
        begin
            if Han_Font_Flag = False Then
            begin
                If Pitch = '' Then                                //상위 비트를 마스크 시킴.
//                    Result_Hangle := ESC + Han_Font + Hex(Ord(Before_Hangle) And $H7F7F)
                else
//                    Result_Hangle := ESC + Pitch + ESC + Han_Font + Hex(Ord(Before_Hangle) And $H7F7F);
                Han_Font_Flag := True;
                Eng_Font_Flag := False;
            end
            else
            begin
//                Result_Hangle := Hex(Ord(Before_Hangle) And &H7F7F);
            end;
        end
        else
        begin
            If Eng_Font_Flag = False Then
            begin
                If Pitch = '' Then
                    Result_Hangle := Char(ESC) + Eng_Font + Before_Hangle
                else
                    Result_Hangle := Char(ESC) + Pitch + Char(ESC) + Eng_Font + Before_Hangle;
                Eng_Font_Flag := True;
                Han_Font_Flag := False;
            end
            else
            begin
                Result_Hangle := Before_Hangle;
            end;
        end;
        Total_Hangle := Total_Hangle + Result_Hangle;
    end;

    Result := Total_Hangle;     //Conversion된 한글 리턴
end;

function func_UnicodeZPL(Data, strRET : String; XPos, YPos, XAxis, YAxis : Integer; Rotation : Boolean) : String;
var
  retString : String;
  HexString : String;
  s, str1 : String;
  i,Len : Integer;
  j    : array[0..100] of integer;
begin
//    '^FO20,0^AJN,80,80' +
//    '^FH^FD_AC_00_AC_01_AC_00_AC_01_AC_00_AC_01_AC_00_AC_01_AC_00_AC_01^FS' +
    retString := retString + '^FO' + IntToStr(XPos) + ',' + IntToStr(YPos);
    retString := retString + '^AJ'+strRET+',' + IntToStr(XAxis) + ',' + IntToStr(YAxis);
    retString := retString + '^FH^FD';

    i := 1;
    s := '';
    HexString := '';

    Len := Length(Data);

    While Len >= i do
    begin
       j[i] := Ord(Data[i]);
       j[i+1] := Ord(Data[i+1]);
       if j[i] >= 176 then //문자일경우
       begin
           str1 := Data[i] + Data[i+1];
           HexString := HexString + func_HanToUnicode(str1);

           i := i + 2;
       end else
       begin
           HexString := HexString + Data[i];

           i := i + 1;
       end;
   end;

    retString := retString + HexString + '^FS';
    Result := retString;
end;

{*******************************************************************************
 기능 :한글을 Zebra 170PAX2 프린터 출력에 맞게끔 유니코드로 변환해주는 함수
 인수 : Data - 변환하고자 하는 한글 스트링
 결과 : 유니코드 헥사값을 변환한 데이타    예)'가' -> _AC_00
 사용예제 : func_HanToUnicode('진코퍼레이션 주식회사');
 주의 : 아직 한글만 파라미터로 입력해야 됨... 나중에 수정요망
*******************************************************************************}
function func_HanToUnicode(Data : String) : String;
var
  len, i : Integer;
  pwcData : pWideChar;
  HexString, tmp : String;
begin
    len := Length(Data);
    GetMem(pwcData, len+1);
    StringToWideChar(Data, pwcData, len+1);     // 스트링을 유니코드로 변경하는 함수
    tmp := '';
    For i:=0 to (Length(Data) div 2)-1 do begin
        tmp := tmp + IntToHex(Ord(pwcData[i]), 4);  // 유니코드값을 하나씩 읽어서 헥사로 변경
    end;

    HexString := '';
    For i:=1 to Length(tmp) do begin
        if i mod 2 = 1 then begin
            HexString := HexString + '_' + Copy(tmp, i, 1);
        end
        else begin
            HexString := HexString + Copy(tmp, i, 1);
        end;
    end;

    Result := HexString;
end;

{    이름 : func_Chkum
     기능 : 2 of 5 바코드에 체크썸을 구한다...
     인수 : 이동할 항목명
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_Chkum(Txt: string) : string;
Var
    i,iRes,iStr : Integer;
Const
    arrGAJUNG : array[0..1] of Integer = (1,3);

begin
    iRes := 0;
    iStr := length(Txt) mod 2;
    if iStr = 1 then
    begin
        for i := 1 to length(Txt) do
        begin
            iRes := iRes + StrtoInt(Txt[i]) * arrGAJUNG[i mod 2];
        end;
        if IntToStr(10-(iRes mod 10)) = '10' then Result := '0'
        else Result := IntToStr(10-(iRes mod 10));
    end
    else Result := '-1';
end;

{    이름 : func_FileDelete
     기능 : 파일 지우기
     인수 : 이동할 항목명
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_FileDelete(strFILE: string) : Boolean;
var
    txtFile : TextFile;
begin
    AssignFile(txtFile,strFILE);
    if FileExists(strFILE) then
    begin
        Reset(txtFile);
        CloseFile(txtFile);
        Erase(txtFile);
        Result := True;
    end
    else Result := False;
end;

{*****************************************************************************
*   함 수 명  : IntToBin
*   함수 기능 : 10진수->2진수로 변환
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.03.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
function func_IntToBin(valor,digitos:integer):string;
var
    resultado:string;
    i:integer;
begin
    if valor = 65 then valor := $a;
    if valor = 66 then valor := $b;
    if valor = 67 then valor := $c;
    if valor = 68 then valor := $d;
    if valor = 69 then valor := $e;
    if valor = 70 then valor := $f;

    if digitos>32 then
        digitos:=32;
        Resultado:='';
        i:=0;
    while i< digitos do
    begin
        if ((1 shl i) and valor)>0 then
            Resultado:='1'+resultado
        else
            Resultado:='0'+resultado;
        inc(i);
    end;
    Result:=resultado;
end;

{    이름 : func_kcIsLeapYear
     기능 : 1년에 주가 몇개인지 계산
     인수 : 계산할 년도
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_kcIsLeapYear( nYear: Integer ): Boolean;
begin
    Result := (nYear mod 4 = 0) and ((nYear mod 100 <> 0) or (nYear mod 400 = 0));
end;

{    이름 : func_kcMonthDays
     기능 : 달에 몇째 주 인지
     인수 : 월,년
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_kcMonthDays( nMonth, nYear: Integer ): Integer;
const
    DaysPerMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
    Result := DaysPerMonth[nMonth];
    if (nMonth = 2) and func_kcIsLeapYear(nYear) then Inc(Result);
end;

{    이름 : func_kcWeekOfYear
     기능 : 년에 몇째주 인지
     인수 : 오늘날짜 항목
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_kcWeekOfYear( dDate: TdateTime ): Integer;
var
    X, nDayCount: Integer;
    nMonth, nDay, nYear: Word;
begin
    nDayCount := 0;
    deCodeDate( ddate, nYear, nMonth, nDay );
    For X := 1 to( nMonth - 1 ) do
    nDayCount := nDayCount + func_kcMonthDays( X, nYear );

    nDayCount := nDayCount + nDay;
    Result := ( ( nDayCount div 7 ) + 1 );
end;

{    이름 : func_LANSend
     기능 : 소켓오픈후 데이터 송신후 소켓 끊기
     인수 : 소켓 컨퍼넌트명, 보낼데이터
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_LANSend(Sender: TObject; sSnd : String; sIP : String) : Boolean;
var
    i,j : integer;
begin
    with TClientSocket(Sender) do
    begin
        Address := sIP;
        Active := True;
        j:=0; i:=0;
        while i <> Length(sSnd) do
        begin
            if j = 4 then
            begin
                i := Length(sSnd);
                Active := False;
                Result := False;
            end;
            i := Socket.SendText(sSnd);
            if i = Length(sSnd) then
            begin
                Active := False;
                Result := True;
            end;
            inc(j);
            Application.ProcessMessages;
        end;
    end;
end;

{    이름 : func_ActiveLANSend
     기능 : 소켓오픈후 데이터 송신후 소켓 끊기
     인수 : 소켓 컨퍼넌트명, 보낼데이터
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_ActiveLANSend(Sender: TObject; sSnd : String) : Boolean;
var
    i : integer;
begin
    with TClientSocket(Sender) do
    begin
        i := Socket.SendText(sSnd);
        if i = Length(sSnd) then Result := True
        else Result := False;
    end;
end;

function OKPostExec(ACommand: string; cShow: Word): Integer;
var
    Rslt: LongBool;
    StartUpInfo: TStartUpInfo; // Win32의 STARTUPINFO 구조체
    ProcessInfo: TProcessInformation; // Win32의 PROCESS_INFORMATION
//
//    strCommand : string;
begin
    FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
    with StartupInfo do
    begin
        cb := SizeOf(TStartupInfo); // 구조체의 크기
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := cShow
    end;
    Rslt := CreateProcess(nil, PChar(ACommand), nil, nil, False,
    NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
    if Rslt then
        with ProcessInfo do
        begin
            WaitForInputIdle(hProcess, INFINITE);
            CloseHandle(hThread); // hThread 핸들을 해제한다.
            CloseHandle(hProcess);// hProcess 핸들을 해제한다.
            Result := 0; // 성공을 뜻하는 0을 리턴값으로 돌려준다.
        end
    else Result := GetLastError; // 에러 코드를 돌려준다.
end;

function BrowsedialogCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM) : integer stdcall;
var
    wa, rect : TRect;
    dialogPT : TPoint;
begin
    //center in work area
    if uMsg = BFFM_INITIALIZED then
    begin
        wa := Screen.WorkAreaRect;
        GetWindowRect(Wnd, Rect);
        dialogPT.X := ((wa.Right-wa.Left) div 2) -
                      ((rect.Right-rect.Left) div 2);
        dialogPT.Y := ((wa.Bottom-wa.Top) div 2) -
                      ((rect.Bottom-rect.Top) div 2);
        MoveWindow(Wnd,
                   dialogPT.X,
                   dialogPT.Y,
                   Rect.Right - Rect.Left,
                   Rect.Bottom - Rect.Top,
                   True);
    end;

    Result := 0;
end; (*BrowsedialogCallBack*)

///////////////////////////////////////////////////////////////////

function Browsedialog(const Title: string; const Flag: integer): string;
var
    lpItemID : PItemIDList;
    BrowseInfo : TBrowseInfo;
    DisplayName : array[0..MAX_PATH] of char;
    TempPath : array[0..MAX_PATH] of char;
begin
    Result:='';
    FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
    with BrowseInfo do
    begin
        hwndOwner := Application.Handle;
        pszDisplayName := @DisplayName;
        lpszTitle := PChar(Title);
        ulFlags := Flag;
        lpfn := BrowsedialogCallBack;
    end;
    lpItemID := SHBrowseForFolder(BrowseInfo);
    if lpItemId <> nil then
    begin
        SHGetPathFromIDList(lpItemID, TempPath);
        Result := TempPath;
        GlobalFreePtr(lpItemID);
    end;
end;

function func_TableCreate(fmCONTROL: TObject; intINDEX: Integer; TableName: String; FieldName: String) : Boolean;
var
    strSQL  : String;
    arrBUFF : Array[0..99] of String;
    intCNT, intMAX : Integer;
begin
    proc_data_distinction(FieldName,'|',arrBUFF,intMAX);
    if intINDEX <> 0 then
    begin
        strSQL := Format('CREATE TABLE "%s" (',[TableName]);
        for intCNT := 0 to intMAX - 1 do strSQL := strSQL + Format('    %s Char(30), ',[arrBUFF[intCNT]]);
        strSQL := strSQL + '    PRIMARY KEY(';
        for intCNT := 0 to intINDEX - 1 do
        begin
            strSQL := strSQL + Format('%s',[arrBUFF[intCNT]]);
            if intCNT = intINDEX - 1 then strSQL := strSQL + '))'
            else strSQL := strSQL + ',';
        end;
    end
    else
    begin
        strSQL := Format('CREATE TABLE "%s" (',[TableName]);
        for intCNT := 0 to intMAX - 1 do
        begin
            if intCNT <> intMAX - 1 then strSQL := strSQL + Format('    %s Char(30), ',[arrBUFF[intCNT]])
            else strSQL := strSQL + Format('    %s Char(15) ',[arrBUFF[intCNT]]);
        end;
        strSQL := strSQL + ')';
    end;
    TQuery(fmCONTROL).Close;
    TQuery(fmCONTROL).SQL.Clear;
    TQuery(fmCONTROL).SQL.Add(strSQL);
    TQuery(fmCONTROL).ExecSQL;
    Result := False;
end;

//****************************************************************
//seq 번호 구하기....
//****************************************************************
function func_SEQ_Query(fmCONTROL: TObject; sl_Query:String):String;
var
    sl_Seq : String;
begin
    with TQuery(fmCONTROL) do
    begin
        Close;
        Sql.Clear;
        Sql.Add(sl_Query);

        Open;
        if FieldByName('CNT').AsString = '' then
            sl_Seq := '1'
        else
        if FieldByName('CNT').AsString = ' ' then
            sl_Seq := '1'
        else
            sl_Seq := IntToStr(StrToInt(FieldByName('CNT').AsString) + 1);

        result := sl_Seq;

        Close;
    end;
end;

//****************************************************************
//데이터 카운터 가져오기....
//****************************************************************
function func_CNT_Query(fmCONTROL: TObject; sl_Query:String):String;
var
    sl_Seq : String;
begin
    with TQuery(fmCONTROL) do
    begin
        Close;
        Sql.Clear;
        Sql.Add(sl_Query);

        Open;
        sl_Seq := FieldByName('CNT').AsString;

        if sl_Seq = '' then sl_Seq := '0';
        if sl_Seq = ' ' then sl_Seq := '0';

        result := sl_Seq;

        Close;
    end;
end;

//*********************************************************************
// 기능   : SQL 문장을 실행 하고 성공여부를 리턴한다.
// input  : SQL 문장
// output : True/False
// example: f_ExecSQL('update cust set cunm = ''홍길동''')
//*********************************************************************
function func_ExecSQL(fmCONTROL: TObject; sSQL:String): Boolean;
begin
    result := True;
    with TQuery(fmCONTROL) do
    begin
        Close;
        Sql.Clear;
        Sql.Add(sSQL);
        try
            Execsql;
        except
            result := False;
            Close;
            exit;
        end;
        Close;
    end;
end;

// 현재 시간이 LastTime에서 Elapsed만큼 경과한 경우 True를 반환한다.
function CheckTimeOver(LastTime, Elapsed: Dword): Boolean;
var
  Tm, Sum : Dword;
begin
  Tm := GetTickCount;

  Sum := LastTime + Elapsed;
  // 오버 플로우?
  if (Sum < LastTime) then Result := (Sum < Tm) And (Tm < (LastTime div 2))
  else Result := Sum < Tm;
end;


function func_GetFontsFolder() : String;
var
    kResutlStr : String;
begin
    SetLength (kResutlStr, MAX_PATH);
    SHGetSpecialFolderPath(Application.Handle , PChar(kResutlStr), CSIDL_FONTS, FALSE);
    SetLength (kResutlStr, StrLen (PChar(kResutlStr)));

    Result := kResutlStr;
end;

function func_SetSystemTime(sDateTime : String) : Boolean;
var
    imsi : _SYSTEMTIME;
begin
    GetSystemTime( imsi );
    with imsi do
    begin
        wYear := StrToInt(Copy(sDateTime,1,4));
        wMonth := StrToInt(Copy(sDateTime,5,2));
        wDay := StrToInt(Copy(sDateTime,7,2));
        wHour := StrToInt(Copy(sDateTime,9,2));
        wMinute := StrToInt(Copy(sDateTime,12,2));
        wSecond := StrToInt(Copy(sDateTime,15,2));
        wMilliseconds := StrToInt(Copy(sDateTime,18,3));
    end;
    Result := SetSystemTime( imsi );
end;


////////////////////////////////////////////////////////////////////////////////
(* Procedure 모음 *)
////////////////////////////////////////////////////////////////////////////////

{    이름 : RefreshDataSet
     기능 : 화면에 Refresh한후에 현재 위치로 이동하도록하는 프로시져
     인수 : 테이블명
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
procedure RefreshDataSet(Tab: TDataSet);
var
  BookMk: TBookmark;
begin
  with Tab do begin
    DisableControls;
    try
      if Active then BookMk := GetBookmark else BookMk := nil;
      try
        Close;
        Open;
        SetToBookmark(tab, BookMk);
      finally
        if BookMk <> nil then FreeBookmark(BookMk);
      end;
    finally
      EnableControls;
    end;
  end;
end;


{    이름 : ColorOnEnter
     기능 : 항목에 커서가 위치하는 경우에 항목의색을 변경한다
     인수 : 이동할 항목명
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
procedure ColorOnEnter(Sender: TObject);
begin
   if Sender is TEdit       then   With  Sender as TEdit do  Color     := ActiveColor ;

   if Sender is TMaskEdit   then   With  Sender as TMaskEdit do Color     := ActiveColor ;

   if Sender is TComboBox   then   With  Sender as TComboBox do  Color     := ActiveColor ;
   if Sender is TMemo       then   With  Sender as TMemo     do  Color     := ActiveColor ;
   if Sender is TCheckBox   then   With  Sender as TCheckBox do  font.Color     := clBlue ;
   if Sender is TDBCheckBox then   With  Sender as TDBCheckBox do  font.Color := clBlue ;
   if Sender is TDBEdit     then
      With  Sender as TDBEdit     do
      begin
         Color     := ActiveColor ;
      end;
   if Sender is TDBMemo     then   With  Sender as TDBMemo do Color     := ActiveColor ;

end;

{    이름 : ColorOnExit
     기능 : 항목에 커서가 빠져나가는 경우에 항목의색을 변경한다
     인수 : 이동할 항목명
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
procedure ColorOnExit(Sender: TObject);
begin
   if  Sender is TEdit     then
       With  Sender as TEdit     do  Color := deActiveColor;
   if  Sender is TMaskEdit     then
       With  Sender as TMaskEdit     do  Color := deActiveColor;
   if  Sender is TComboBox then
       With  Sender as TComboBox do  Color := deActiveColor;
   if  Sender is TMemo     then
       With  Sender as TMemo     do  Color := deActiveColor;
   if  Sender is TCheckBox   then
       With  Sender as TCheckBox do  font.Color     := clBlack;
   if  Sender is TDBCheckBox then   With  Sender as TDBCheckBox do  font.Color := clBlack;
   if  Sender is TDBEdit     then   With  Sender as TDBEdit     do  Color := deActiveColor;
   if  Sender is TDBMemo     then   With  Sender as TDBMemo     do  Color := deActiveColor;
end;


{    이름 : TokenString
     기능 : 문자열을 구분자로 구분해서 StringList로 돌려준다
     인수 : 문자열의 문자값, 구분자의 문자값, 표시할 스트링리스트
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
procedure TokenString(const S: String; TokenSeparator: String;
          Tokens: TStringList);
var
   i, j, Len: Cardinal;
   CurToken: String;
   aCH: array [1..10] of char ;
   CHFound: Boolean ;
begin
     fillchar( aCH, sizeof(aCH), #0 );
     for i := 1  to  Length( TokenSeparator )  do
         aCH[i] := TokenSeparator[i] ;

     Tokens.Clear;
     CurToken:='';
     Len:=Length(S);
     for i:=1 to Len do
     begin
          CHFound := False ;
          for j := 1  to  10  do begin
              if  s[i] = aCH[j]  then  begin
                  CHFound := True ;
                  break ;
              end;
          end;

          if CHFound then
          begin
               Tokens.Add(CurToken);
               CurToken:='';
          end
          else
              CurToken:=CurToken+S[i];
     end;
     Tokens.Add(CurToken);
end;

{    이름 : DateDiff
     기능 : 두 년월일로 일자수를 계산한다
     인수 : 비교할 년월일의 Date값
   결과값 : 일자수의 Word값
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
procedure DateDiff(Date1, Date2: TDateTime; var Days, Months, Years: Word);
var
  DtSwap: TDateTime;
  Day1, Day2, Month1, Month2, Year1, Year2: Word;
begin
  if Date1 > Date2 then begin
    DtSwap := Date1;
    Date1 := Date2;
    Date2 := DtSwap;
  end;
  DecodeDate(Date1, Year1, Month1, Day1);
  DecodeDate(Date2, Year2, Month2, Day2);
  Years := Year2 - Year1;
  Months := 0;
  Days := 0;
  if Month2 < Month1 then begin
    Inc(Months, 12);
    Dec(Years);
  end;
  Inc(Months, Month2 - Month1);
  if Day2 < Day1 then begin
    Inc(Days, func_DaysPerMonth(Year1, Month1));
    if Months = 0 then begin
      Dec(Years);
      Months := 11;
    end
    else Dec(Months);
  end;
  Inc(Days, Day2 - Day1);
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

procedure proc_LptSend(sSnd : String);
var
    outfile : textfile;
begin
    assignfile(outfile, 'LPT1');
    rewrite(outfile);
    writeln(outfile, sSnd);
    closefile(outfile);
end;

procedure proc_data_distinction(strBUFF, strGUBUN : String; var arrDATA :Array of String; var intSEND : Integer);
var
    strTEMP : String;
    intCNT : integer;
begin
    intSEND := 0;

    for intCNT := 1 to Length(strBUFF) do
    begin
        if Copy(strBUFF,intCNT,1) <> strGUBUN then
            strTEMP := strTEMP + Copy(strBUFF,intCNT,1)
        else
        begin
            arrDATA[intSEND]  := strTEMP;
            inc(intSEND);
            strTEMP := '';
        end;
    end;
    arrDATA[intSEND]  := strTEMP;
    inc(intSEND);
end;

procedure FNExcelToStrGrid(sFileName: String; svGrid: TStringGrid);
const
    Cols = 55;
var
    XL, WorkBK, worksheet: Variant;
    idx, jdx: Integer;
    sOrderNo : String;
    bEofFile : boolean;
begin
    try
        //엑셀을 실행
        XL := CreateOLEObject('Excel.Application');
    except
        ShowMessage('Excel이 설치되어 있지 않습니다!!!');
        Exit;
    end;
    XL.Visible := false;
    XL.WorkBooks.Open(sFileName);
    WorkBK := XL.WorkBooks.item[1]; //워크 쉬트 설정


    // 워크시트의 시트의 갯수에 따른 쉬트명 얻어오기
    for idx := 1 to WorkBK.WorkSheets.Count do
    begin
        WorkSheet := WorkBK.WorkSheets.Item[idx];
//        FXlsChoose.LBSheet.Items.Add(WorkSheet.Name);
    end;
    WorkSheet := WorkBK.WorkSheets.Item[1];
    // 워크시트의 시트의 갯수에 따른 쉬트명 얻어오기

    WorkSheet := WorkBK.WorkSheets.Item[WorkSheet.Name];

    for idx := 0 to svGrid.ColCount-1 do svGrid.Cols[idx].Clear;

    bEofFile := True;

    idx := 0;
    while bEofFile do
    begin
        sOrderNo := Trim(WorkSheet.Cells[idx+1,2]);
        If Length(sOrderNo) = 0 then bEofFile := False
        else Inc(idx);
    end;

    svGrid.RowCount := idx;
    svGrid.ColCount := Cols;

    for idx := 1 to svGrid.RowCount do
    for jdx := 1 to Cols do
    svGrid.Cells[jdx, idx-1] := WorkSheet.Cells[idx, jdx];

    XL.WorkBooks.Close;
    XL.quit;
end;

procedure FNExcelToPDX(fmCONTROL: TObject; sFileName: String);
const
    Cols = 58;
var
    XL, WorkBK, worksheet: Variant;
    idx, jdx: Integer;
    iRowCnt: Integer;
//
//    iRowCnt, iColCnt: Integer;
    strTEMP, strSQL : String;
    bEofFile : boolean;
begin
    try
        //엑셀을 실행
        XL := CreateOLEObject('Excel.Application');
    except
        ShowMessage('Excel이 설치되어 있지 않습니다!!!');
        Exit;
    end;
    XL.Visible := false;
    XL.WorkBooks.Open(sFileName);
    WorkBK := XL.WorkBooks.item[1]; //워크 쉬트 설정


    // 워크시트의 시트의 갯수에 따른 쉬트명 얻어오기
    for idx := 1 to WorkBK.WorkSheets.Count do
    begin
        WorkSheet := WorkBK.WorkSheets.Item[idx];
//        FXlsChoose.LBSheet.Items.Add(WorkSheet.Name);
    end;
    WorkSheet := WorkBK.WorkSheets.Item[1];
    // 워크시트의 시트의 갯수에 따른 쉬트명 얻어오기

    WorkSheet := WorkBK.WorkSheets.Item[WorkSheet.Name];


    bEofFile := True;

    idx := 0;
    while bEofFile do
    begin
        strTEMP := Trim(WorkSheet.Cells[idx+1,2]);
        If Length(strTEMP) = 0 then bEofFile := False
        else Inc(idx);
    end;

    strTEMP := '';
    iRowCnt := idx;
//    svGrid.ColCount := Cols;

    for idx := 1 to iRowCnt do
    for jdx := 1 to Cols do
    begin
        if idx = 1 then
        begin
            if jdx = Cols then
            begin
                strTEMP := strTEMP + Trim(WorkSheet.Cells[idx, jdx]) + '|작업여부|순번';
                func_TableCreate(TQuery(fmCONTROL),0,'TDK01.db',strTEMP);
            end
            else strTEMP := strTEMP + Trim(WorkSheet.Cells[idx, jdx]) + '|';
        end
        else
        begin
            if jdx = 1 then
            begin
                strSQL := 'INSERT        ';
                strSQL := strSQL + 'INTO TDK01 ';
                strSQL := strSQL + ' VALUES ( ';
            end;
            if jdx <> Cols then strSQL := strSQL + '''' + Trim(WorkSheet.Cells[idx, jdx]) + '''' + ', ';
            if jdx = Cols then
            begin
                strSQL := strSQL + '''' + Trim(WorkSheet.Cells[idx, jdx]) + '''' + ',';
                strSQL := strSQL + '''' + '작업중' + '''' + ',';
                strSQL := strSQL + '''' + func_strFillZeroL(IntToStr(idx - 1),2) + '''';
                strSQL := strSQL + ' )';
                with TQuery(fmCONTROL) do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add(strSQL);
                    ExecSQL;
                end;
            end;
        end;
    end;
//            svGrid.Cells[jdx, idx-1] := WorkSheet.Cells[idx, jdx];

    XL.WorkBooks.Close;
    XL.quit;
end;


{   이름	: proc_MemoLog
    기능	: 메모장에 로그 표시
    인수	: 메모장컴퍼넌트,로그
    결과값	: 없음
수정이력	:
--------------------------------------------------------------------
수정일자     수정자    수정내역
--------------------------------------------------------------------
}
procedure proc_MemoLog(memLog : TObject; sCaption, sLog, sFileName : String);
var
    sDate,sTime : String;
begin
    sDate := FormatDateTime('YYYYMMDD',Now);
    sTime := FormatDateTime('HHMMSS',Now);

    if TMemo(memLog).Lines.Count = 1000 then
    begin
        createdir(ExtractFilePath(Application.ExeName) + 'LOG');
        TMemo(memLog).Lines.SaveToFile('LOG\' + sDate+'_'+sTime+'.txt');
        TMemo(memLog).Lines.Clear;
    end;
    sDate := FormatDateTime('YYYY/MM/DD',Now);
    sTime := FormatDateTime('HH:MM:SS.ZZZ',Now);
    TMemo(memLog).Lines.Add('[' + sFileName+']'+ sCaption+':'+'('+sDate+'/'+sTime+')----->'+sLog);
end;

{  5000 이름 :  proc_PlayErrBellSound
    기능 :  소리 울림 - 한번만
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
procedure proc_PlayErrBellSound(sResource : String);
begin
    with TResourceStream.Create(HInstance, sResource, RT_RCDATA) do begin
        sndPlaySound( Memory, SND_MEMORY or SND_ASYNC );
        Free;
    end;
end;

{   이름 :  proc_PlayErrBellSoundLOOP
    기능 :  소리 울림 - 계속 반복
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
procedure proc_PlayErrBellSoundLOOP(sResource : String);
begin
    with TResourceStream.Create(HInstance, sResource, RT_RCDATA) do begin
        sndPlaySound( Memory, SND_MEMORY or SND_LOOP or SND_ASYNC );
        Free;
    end;
end;

{   이름 :  proc_PlayErrSoundOff
    기능 :  소리 끄기
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
procedure proc_PlayErrSoundOff;
begin
//소리 끌 때 - 둘중 아무거나 사용해도 꺼진다.
    sndPlaySound( nil, SND_MEMORY or SND_LOOP or SND_ASYNC );
end;

{   이름 :  proc_FontRegistry
    기능 :  외부 폰트 등록
    인수 :
  결과값 :
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
procedure proc_FontRegistry(sFontFile : String);
var 
    hBool : bool;
    sFontName : String;
begin
    sFontName := func_GetFontsFolder()+'\'+ExtractFileName(sFontFile);

    CopyFile(Pchar(sFontFile), Pchar(sFontName), hBool);

    //Add the font resource
    //AddFontResource(PChar(sFontName));
    //SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end;


end.

