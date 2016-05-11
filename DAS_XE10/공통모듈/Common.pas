{*******************************************************************************
*
* ������Ʈ :
* �� �� �� : ���볻��
* ��    �� : ���α׷����� ���������� ���Ǵ� ���ν����� �Լ��� ����Ѵ�.
* �� �� �� : Shim HanWoo
* �� �� �� : 2001-04-03
* �����̷�
*
  �۾�����     �۾���    ����    ��������
 *----------------------------------------------------------------------------*
  2001.04.30   Shim              1.TBitBtn���� TButton���� ����
  2001-05-19   Lim               1.QuotedStr  �Լ� �߰�
  2001-05-21   Lim               1.func_GetCalendarDate �߰�
                                 2.CalendarJ --> CalendarK�� ����
               ******* ����(��ü ���α׷��� ������ �ش�) *******
                                 3.proc_GetInitialParams����
                                   DateSeparator�� ���� ���� ��¥ ���� �Լ� ��� ����.
                                   ��¥ �����ڿ� '/'�� '-'���� ������� ����
                                   DateSeparator ������ ����� ��.
  2001-05-23   Lim               1.proc_GetInitialParams���� ��¥ ������ ������ ���� ���� ����
  2001-05-28   Lim               1.��¥ ��ȯ �Լ�����, ������ �� �����ϴ� ������� ''�� ����
                                 2.��ư�� Enabled�Ӽ� ���� ���ν��� �߰�
  2001-06-07   Lim               1.DateSeparator�� '-'���� '/'�� ��ü ����
  2001.06.28    Shim             1. Local DB�� Alias�Լ� �߰�
                                 2. Oracle Server DB�� Alias�Լ� �߰�

  2001-07-05    Lim             1.��ü�� �����ϴ� ����,���,�Լ����� ������ Unit���� �и�
                                2.���ʿ��� ����,������� ����
  2001-07-28    Lim             1.proc_Log2File�� PR004.pas���� �̰����� �̵�
  2001-08-15    Lim             1.func_strFillZeroL �Լ��� 2������ �ۼ� (overload)
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
    ErrorColor      = clRed     ;                 // Error�׸�Color
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

function func_CalcDateTimeToMin ( FromTime, ToTime: TDateTime ) : LongInt;  //�� ��¥������ �ð���(��)���ϱ�2001-06-12
Function func_DaysPerMonth(AYear, AMonth: Integer) : Integer;               // �ش���� �˼��� ����Ѵ�
Function func_IsLeapYear(AYear: Integer) : Boolean;                         // ������ �Ǵ�
Function func_Date_10_8(str :string):String;                                // '1997/01/01' -> '19970101'
Function func_Date_8_10(str, ins_char :string):String;                      // '19970101' -> '1997/01/01'
Function func_date_add(str :string ;day :integer):string;                   // ���ڸ� �����ִ� �Լ�
Function func_subtract_date(org1_date:string ;org2_date:string ) :integer;  // ���ڸ� ���ִ� �Լ�
Function func_isDate(str :string):boolean;                                  // ������������ ���氡������üũ
Function func_MON_add(str :string ;mon :integer):string;                    // ���� �����ִ� �Լ�
function func_HidukeHensyu(iDate:String):String ;                           // ���ڸ� �����Ѵ�
Function func_yyyymm(yyyymm:integer;var start_date :Tdatetime;var end_date :Tdatetime):boolean;
                                                                            // ���� �����ϰ� ���������� ã���ش�
Function func_isnumeric(str :string):boolean;                               // ������������ ���氡������üũ
Function func_s_ifix(num :longint ;n :smallint ;typ :integer):longint;      // ������ �ܼ�ó��
Function func_s_ffix(num :Extended ;n :smallint ;typ :integer):Extended;    // �Ǽ��� �ܼ�ó��
function func_SiteiSyosu(sOrgVal,sTrcVal :String):String ;                  // �����ѼҼ����������� ǥ���Ѵ�

function func_strFillZeroL( s: string  ;  max_len: integer ) : string ; overload;    // fill character '0' to left
function func_strFillZeroL( i: integer ;  max_len: integer ) : string ; overload;    // fill character '0' to left
function func_alstrLeftF( s: string  ;  max_len: integer ) : string ;       // align to Left  with fixed length
function func_alstrRightF( s: string  ;  max_len: integer ) : string ;      // align to Right with fixed length
function func_alstrCenterF( s: string  ;  max_len: integer ) : string ;       // align to Left  with fixed length
function func_CutStr( cLine:String ; cLen: Cardinal ): string;              // Split string (�ѱ�2����Ʈó���� ���Ͽ� ���ڿ��� ������)
Function func_strim(Str:string ;del_str:string):string;                     // ���ڿ����� ������ ���ڸ� �����Ѵ�

Function func_GetAge( Birthday, CurrDate: string ):Integer;                 // ������Ͽ��� ���̸� ����Ѵ�
Function func_CurGetAge( Birthday, CurrDate: string ):String;               // ������Ͽ��� ���̸� ����Ѵ� (Return��nnn��nn��)

Function func_AppExec(ExeFileName :string):integer ;                        // �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ����ʴ� �Լ�
Function func_AppExec_Wait(FormName :Tform ;ExeFileName :string):integer ;  // �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ��� �Լ�
function func_AppExec_Search(sClassName, sWindowName : String): HWND;       // �ٸ� ���ø����̼� ����� ���������¸� üũ�Ѵ�

Function func_Login(DB: TDataBase ; User, passwd:string):Boolean ;          // Login function
function TableExists ( DBAlias,tbName : string ) : Boolean  ;               // Check whether the specified Table is Exists or Not
function IsDataSetEmpty(DataSet: TDataSet): Boolean;                        // Data�� �����ϴ� üũ
function func_Msg(Msg, Cap: string; uType: integer): boolean;               // Error Message ó��

function IsFieldExists(DataSet: TDataSet ; FieldName : String ): Boolean;   // DataSet�߿��� Ư��Field�� ���������� üũ
Function func_isAlphaNum(str :string):boolean;                              // [0..9],[a..z],[A..Z]������ �ƴ����� üũ

function func_Color2Str( Color : TColor): string ;                          // ��Ʈ������ RGB������ �����ϴ� �Լ�{'RRRGGGBBB'}
function func_Str2Color( Color : string): TColor ;                          // RGB���� ��Ʈ�������� �����ϴ� �Լ�

function func_GetCurrLine(Control:TCustomEdit): Integer;                    // �޸��忡�� ����Ŀ���� ���ι�ȣ�� ��� �Լ�
function func_MemoScrollUpDown(Control:TCustomEdit; iKey:Word):Integer;     // �޸��忡�� PageUp�� PageDown�� Ű����� �����ϴ� �Լ�

function QuotedStr(const S:string): string ;                                // ����ǥ��(') �ѷ��� ���ڿ� ���ϱ� 2001-05-19 Lim

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

//���� ��Ʈ��
function func_FileDelete(strFILE : string) : Boolean;
function func_IntToBin(valor,digitos:integer):string;

function func_kcWeekOfYear( dDate: TdateTime ): Integer;
function func_kcMonthDays( nMonth, nYear: Integer ): Integer;
function func_kcIsLeapYear( nYear: Integer ): Boolean;
function func_LANSend(Sender: TObject; sSnd : String; sIP : String) : Boolean;
function func_ActiveLANSend(Sender: TObject; sSnd : String) : Boolean;
function func_TableCreate(fmCONTROL: TObject; intINDEX: Integer; TableName: String; FieldName: String) : Boolean;

function OKPostExec(ACommand: string; cShow: Word): Integer;                //�ܺ� ���α׷� �����ϱ�...
function Browsedialog(const Title: string; const Flag: integer): string;

function func_SEQ_Query(fmCONTROL: TObject; sl_Query:String):String;        //���� ���ϱ�
function func_CNT_Query(fmCONTROL: TObject; sl_Query:String):String;
function func_ExecSQL(fmCONTROL: TObject; sSQL:String): Boolean;                                      //SQL ������ ���� �ϰ� �������θ� �����Ѵ�.

function CheckTimeOver(LastTime, Elapsed: Dword): Boolean;                      // ���� �ð��� LastTime���� Elapsed��ŭ ����� ��� True�� ��ȯ�Ѵ�.
function func_GetFontsFolder() : String;
function func_SetSystemTime(sDateTime : String) : Boolean;

(* User Procedure *)

procedure ColorOnEnter(Sender: TObject);                                    // �׸� Ŀ���� ��ġ�ϴ� ��쿡 �׸��ǻ��� �����Ѵ�
procedure ColorOnExit(Sender: TObject);                                     // �׸� Ŀ���� ���������� ��쿡 �׸��ǻ��� �����Ѵ�

procedure TokenString(const S: String; TokenSeparator: String; Tokens: TStringList);
procedure DateDiff(Date1, Date2: TDateTime; var Days, Months, Years: Word);

procedure RefreshDataSet(Tab: TDataSet);                                   // ȭ�鿡 Refresh���� ��ġ�� �̵��ϵ����ϴ� �Լ�

procedure proc_Log2File(FilePath, LogStr : string);     //2001-07-28 PR004.pas���� ����� �̵�
procedure proc_LptSend(sSnd : String);                  //2002-11-29 ������ �߰�
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

{    �̸� : SetToBookmark
     ��� : BookMark���ִ� �Լ�
     �μ� :
   ����� : True, False
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{   �̸� :  func_CalcDateTimeToMin
    ��� :  FromTime���� ToTime������ �а��
    �μ� :
  ����� :  �� �ð����� ��(��)
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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

{    �̸� : func_DaysPerMonth
     ��� : ���� �ϼ��� ����ϴ� �Լ�
     �μ� : �⵵�� ���� ������
   ����� : �ش�⵵�� ���� �ϼ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function func_DaysPerMonth(AYear, AMonth: Integer) : Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and func_IsLeapYear(AYear)  then
    Inc(Result);  {������ �ϼ�}
end;

{    �̸� : func_IsLeapYear
     ��� : ������ �Ǵ��ϴ� �Լ�
     �μ� : �⵵�� ������
   ����� : True - ���� False - ���
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function func_IsLeapYear(AYear: Integer) : Boolean;
begin
  Result  := (AYear mod  4 = 0)  and  ((AYear mod 100 <> 0)  or  (AYear mod 400 = 0));
end;

{    �̸� : func_Date_10_8
     ��� : YYYY/MM/DD�� ������ YYYYMMDD�������� ��ȯ�ϴ� �Լ�
     �μ� : YYYY/MM/DD�� �����ǳ������ ���ڰ�
   ����� : YYYYMMDD�� ������ ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-28  Lim                1.������ �� ������� ''�� ����
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

{    �̸� : func_Date_8_10
     ��� : YYYYMMDD�� ������ YYYY/MM/DD�������� ��ȯ�ϴ� �Լ�
     �μ� : YYYYMMDD�� �����ǳ������ ���ڰ�
   ����� : YYYY/MM/DD�� ������ ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-28  Lim                1.������ �� ������� ''�� ����
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

{    �̸� : func_date_add
     ��� : ��¥�� �����ش�
     �μ� : YYYYMMDD������ ���ڰ�, �����ϼ��� ������
   ����� : YYYYMMDD�� ������ ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
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


{    �̸� : func_subtract_date
     ��� : �� ��¥�� ���̸� ���� ȯ��(x����)��.
     �μ� : ��¥ ���ڿ�(YYYYMMDD)
   ����� : x����(����)
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_isDate
     ��� : ��¥���� ���� �Լ�
            DateTime���� ��ȯ �����ϸ� ��¥ �������̰� �Ұ����ϸ� ��¥ ������ �ƴ�.
     �μ� : ��¥�������� ������ ���ڰ�(YYYYMMDD)
   ����� : True - ��¥���� False - ��¥������ �ƴ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
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

{    �̸� : func_MON_add
     ��� :
     �μ� : �⵵������ ���ڰ�(YYYYMMDD), ���� ���� ������
   ����� : ���� �⵵������ ���ڰ�(YYYYMMDD)
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
}
Function func_MON_add( str :string ;mon :integer):string;
var
  Old_Date, New_Date : TDateTime ;
begin
  Old_Date := StrToDate( func_Date_8_10( str,FormatSettings.DateSeparator));
  New_Date := IncMonth( Old_Date, mon );
  result   := FormatDateTime('YYYYMMDD', New_date);
end;

{    �̸� : func_HidukeHensyu
     ��� : ������������ �Է��Ҷ� ���� �Ͽ��� 0�� �Է����� ���� ��쿡 0�� �ٿ��ش�
     �μ� : ��¥������ ���ڰ�(YYYY/MM/DD)
   ����� : 0�� ä���� ���������� ���ڰ�(YYYY/MM/DD)
      ��)   func_HidukeHensyu(2001/4/5) --> 2001/04/05
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
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

{    �̸� : func_yyyymm
     ��� : ����� �����ϰ� ���������� ã���ش�
     �μ� : ����� ���ڰ�(YYYYMM)
   ����� : �����ϰ� ���������� Date������ ��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : func_isnumeric
     ��� : �������� ���� �Լ�
            ���������� ����
     �μ� : ������������ ������ ���ڰ�
   ����� : True - �������� False - ���������� �ƴ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : func_s_ifix
     ��� : ������ �ܼ�ó��
     �μ� : num:���氡���Ѽ�ġ n:�ڸ��� typ:�ܼ�ó�� ���(1: ���� 2:������ 3: �ݿø�) �� ������
   ����� : �ܼ�ó���� ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_s_ffix
     ��� : �Ǽ��� �ܼ�ó��
     �μ� : num:���氡���Ѽ�ġ�� �Ǽ���, n:�ڸ��� typ:�ܼ�ó�� ���(1: ���� 2:������ 3: �ݿø�) �� ������
   ����� : �ܼ�ó���� �Ǽ���
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_SiteiSyosu
     ��� : �����ѼҼ����������� ǥ���Ѵ�
     �μ� : �������� �Ҽ����ڸ����� ���ڰ�
   ����� : �����ѼҼ����������� ǥ�õ� ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_strFillZeroL
     ��� : ���ʿ�0�� �ٿ��ִ� �Լ�
     �μ� : 0�� ���� ���ڰ�, 0�� ä�� �ڸ����� ������
   ����� : 0�� ä���� ���ڰ�
       �� - func_strFillZeroL('2', 4) ===> '0002'
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

//2001-08-15 Lim �߰�
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

{    �̸� : func_alstrLeftF
     ��� : ���ڿ� ���� ����
     �μ� : Space�� ���� ���ڰ�, Space�� ä�� �ڸ����� ������
   ����� : Space�� ä���� ���ڰ�
       �� - func_alstrLeftF('2', 4) ===> '2   '
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_alstrRightF
     ��� : ���ڿ� ������ ����
     �μ� : Space�� ���� ���ڰ�, Space�� ä�� �ڸ����� ������
   ����� : Space�� ä���� ���ڰ�
       �� - func_alstrRightF('2', 4) ===> '    2'
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_alstrCenterF
     ��� : ���ڿ� ��� ����
     �μ� : Space�� ���� ���ڰ�, Space�� ä�� �ڸ����� ������
   ����� : Space�� ä���� ���ڰ�
       �� - func_alstrRightF('2', 4) ===> '    2'
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_CutStr
     ��� : ���ڿ����� ������ Byte��ŭ ���ڿ��� �����ش�
     �μ� : ���ڿ��� ���ڰ��� ǥ���� ������
   ����� : ������ Byte��ŭ�� ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function  func_CutStr( cLine:String ; cLen: Cardinal ): string;  // Cardinal : Integer��
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


{    �̸� : func_strim
     ��� : ���ڿ����� Ư�� ���� ����
     �μ� : �Է¹��ڿ�, ������ ���ڿ�
   ����� : ������ ���ڿ��� ���ŵ� ���ڿ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function func_strim(Str:string ;del_str:string):string;
begin
  while Pos(del_str,Str) > 0 do delete(Str,Pos(Del_Str,Str),1);
  Result := Str;
end;


{    �̸� : func_GetAge
     ��� : ���̸� ���ϴ� �Լ� (nnn��)
     �μ� : �������(YYYYMMDD)�� �������(YYYYMMDD)�� ���ڰ�
   ����� : ������ ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
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

{    �̸� : func_CurGetAge
     ��� : ���̸� ���ϴ� �Լ� (nnn��nn����)
     �μ� : �������(YYYYMMDD)�� �������(YYYYMMDD)�� ���ڰ�
   ����� : ���̿� �������� ���ڰ� (yyymm)
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
            2001-05-21  Lim                1.������ '/'�� �ƴ϶� DateSeparator ���
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


{    �̸� : func_AppExec
     ��� : �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ����ʴ� �Լ�
     �μ� : ������ Exeȭ�ϸ�� �Ķ����
   ����� : ������ Exeȭ���� �ڵ鰪
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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
    MessageDlg(ExeFileName + '�� �����Ҽ� �����ϴ�',mtError,[mbOK],0);
  end;
end;

{    �̸� : func_AppExec_Wait
     ��� : �ٸ� ���ø����̼� �����ϰ� ���ø����̼��� ���Ḧ ��ٸ��� �Լ�
     �μ� : ������ Exeȭ�ϸ�� �Ķ����
   ����� : 0- Exeȭ���� ������ 1- Exeȭ���� �������� ����
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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
    MessageDlg(ExeFileName + '�� �����Ҽ� �����ϴ�',mtError,[mbOK],0);
  end;
end;

{    �̸� : func_AppExec_Search
     ��� : �ٸ� ���ø����̼� ����� ���������¸� üũ�Ѵ�
     �μ� : ������ ���� Class��� ���� Caption���� ���ڰ�
   ����� : ������Exeȭ���� �ڵ鰪
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
Function  func_AppExec_Search(sClassName, sWindowName :string):HWND ;
begin
  Result      := 0;
  Result      := FindWindow(PChar(sClassName),PChar(sWindowName));
end;


{    �̸� : func_Login
     ��� : �α����� ���ִ� �Լ�
     �μ� : �α����� ����Ÿ���̽���, ����ڿ� �н������� ���ڰ�
   ����� : True - �α��μ��� False - �α��� ����
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : TableExists
     ��� : ���̺��� ���翩�θ� üũ�ϴ� �Լ�
     �μ� : ����Ÿ���̽��� ���̺��� ���ڰ�
   ����� : True- ���̺��� ������ False- ���̺��� �������� ����
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : IsDataSetEmpty
     ��� : �����Ͱ� �����ϴ����� üũ�Ѵ�.
     �μ� : ���̺���� Dataset
   ����� : True - �����Ͱ� ���� False - �����Ͱ� ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function IsDataSetEmpty(DataSet: TDataSet): Boolean;
begin
  with DataSet do Result := (not Active) or (Eof and Bof);
end;


{    �̸� : IsFieldExists
     ��� : DataSet�߿��� Ư��Field�� ���������� üũ
     �μ� : ���̺���� DataSet���� �ش��ʵ��̸��� ���ڰ�
   ����� : True- �ش��ʵ尡 �����Ѵ� False- �ش��ʵ尡 �������� �ʴ´�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_isAlphaNum
     ��� : [0..9],[a..z],[A..Z]������ �ƴ����� üũ
     �μ� : üũ�� ���ڰ�
   ����� : True- ������ ���� False- ������ ����
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_Color2Str
     ��� : RGB���� ��Ʈ�������� �����ϴ� �Լ�
     �μ� : RGB�� ������
   ����� : RGB�� ��ȯ�� ���ڰ�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function func_Color2Str( Color : TColor): string ;  {'RRRGGGBBB'}
begin
    result := AddChar('0', IntToStr(GetRValue(Color)) ,3) +
              AddChar('0', IntToStr(GetGValue(Color)) ,3) +
              AddChar('0', IntToStr(GetBValue(Color)) ,3) ;
end;

{    �̸� : func_Str2Color
     ��� : ��Ʈ������ RGB������ �����ϴ� �Լ�
     �μ� : RGB�� �ٲ� ���ڰ�
   ����� : RGB�� �ٲ� ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function func_Str2Color( Color : string): TColor ;
begin
    result := RGB(Byte(StrToInt(Copy(Color,1,3))),
                  Byte(StrToInt(Copy(Color,4,3))),
                  Byte(StrToInt(Copy(Color,7,3))) );
end;

{    �̸� : func_Msg
     ��� : �޼����� ǥ���ϴ� �Լ�
     �μ� : �޼����� Title��Caption���� ���ڰ��� �޼���ǥ�������� ������
   ����� : OK�� Yes
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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



{    �̸� : func_GetCurrLine
     ��� : �޸��忡�� ����Ŀ���� ���ι�ȣ�� ��� �Լ�
     �μ� : �޸����� �̸�
   ����� : ���ι�ȣ�� ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function func_GetCurrLine(Control:TCustomEdit): Integer;
begin
  Result := Control.Perform(EM_LINEFROMCHAR,Control.selstart ,0);
end;

{    �̸� : func_MemoScrollUpDown
     ��� : �޸��忡�� PageUp�� PageDown�� Ű����� �����ϴ� �Լ�
     �μ� : �޸����� �̸��� PageUp, PageDownKey�� ������
   ����� : PageUp, PageDownKey�� �������Ŀ� �̵��� ������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{   �̸� : QuotedStr
    ��� : ���ڿ��� ���� ����ǥ(')�� �ѷ��� ���ڿ��� ��ȯ
    �μ� : �Է¹��ڿ�
  ����� : �Ұ�ȣ�� �ѷ��� ���ڿ�
}
function QuotedStr(const S:string): string ;
begin
    QuotedStr := QuotedString( S, char(''''));
end;


{   �̸� :  func_Dec2Hex64
    ��� :  64��Ʈ �������� ������ �ڸ�����ŭ�� 16���� ���ڿ��� ��ȯ
            ��) 32��Ʈ �������� ��ȯ���ִ� �Լ��� �̹� RxLib�� StrUtils.pas�� �ִ�.
    �μ� :  Unsigned 64bits ����, ǥ���� �ڸ���
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
           --------------------------------------------------------------------
}
function func_Dec2Hex64(N: Int64; Digits: integer): string;
begin
  Result := IntToHex(N, Digits);
end;

{   �̸� :  func_Hex2Dec64
    ��� :  16���� ���ڿ��� 64��Ʈ ������(10����)���� ������.
            ��) 32��Ʈ ���������� ��ȯ���ִ� �Լ��� �̹� RxLib�� StrUtils.pas�� �ִ�.
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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

{   �̸� :  func_GetFolder
    ��� :  ���� ���� ��������...
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
           --------------------------------------------------------------------
}
function func_GetFolder() : String;
var
    S : String;
begin
    S := Application.ExeName;
    Result := ExtractFilePath(S);
end;

{   �̸� :  func_IniSave
    ��� :  ȯ������ ����...
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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

{   �̸� :  func_IniStringRead
    ��� :  ȯ������ �о����...(String)
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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

{   �̸� :  func_IniIntegerRead
    ��� :  ȯ������ �о����...(Integer)
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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
// Txt      : �μ��� ���ڿ�
// Xpos     : X ��ǥ
// Ypos     : Y ��ǥ
// Xaxis    : �̹��� Ȯ�� X ��ǥ ���� (Default : 1)
// Yaxis    : �̹��� Ȯ�� Y ��ǥ ���� (Default : 1)
// Rotation : �μ��̹����� ȸ�� ( False : 'N'-- �������μ�, True : 'Y'-- 90�� ȸ�� �μ� )
//
// ��뿹�� : hangulZpl('�����۷��̼� �ֽ�ȸ��', 200,100,1,1,True);
////////////////////////////////////////////////////////////////////////////////
function func_hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string;
var
   i, Len, Gap  : integer;
   KorTxt, Str1 : String;
   j    : array[0..100] of integer;
begin
   Gap  := 24;                 //���ڻ����� ���� �̹���Ȯ�밡 ������ 24�� Default Value
   i    := 1;
   Len  := length(Txt);

   While Len >= i do
   begin
       j[i] := Ord(Txt[i]);
       j[i+1] := Ord(Txt[i+1]);
       if j[i] >= 176 then //�����ϰ��
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
    Count                  : Integer;      //������ġ�� ��Ÿ�� (����������.....)
    Before_Hangle          : String;       //����Ÿ���Ͽ��� ���ϱ� ���� ���� 1����
    Result_Hangle          : String;       //Conversion�� �ѱ� Hex��
    Total_Hangle           : String;       //Conversion�� �ѱ� Hex�� ��� ����
    Han_Font_Flag          : Boolean;      //�� ���ڰ� �ѱ����� ��� (True�϶�)
    Eng_Font_Flag          : Boolean;      //�� ���ڰ� �������� ��� (True�϶�)
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
                If Pitch = '' Then                                //���� ��Ʈ�� ����ũ ��Ŵ.
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

    Result := Total_Hangle;     //Conversion�� �ѱ� ����
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
       if j[i] >= 176 then //�����ϰ��
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
 ��� :�ѱ��� Zebra 170PAX2 ������ ��¿� �°Բ� �����ڵ�� ��ȯ���ִ� �Լ�
 �μ� : Data - ��ȯ�ϰ��� �ϴ� �ѱ� ��Ʈ��
 ��� : �����ڵ� ��簪�� ��ȯ�� ����Ÿ    ��)'��' -> _AC_00
 ��뿹�� : func_HanToUnicode('�����۷��̼� �ֽ�ȸ��');
 ���� : ���� �ѱ۸� �Ķ���ͷ� �Է��ؾ� ��... ���߿� �������
*******************************************************************************}
function func_HanToUnicode(Data : String) : String;
var
  len, i : Integer;
  pwcData : pWideChar;
  HexString, tmp : String;
begin
    len := Length(Data);
    GetMem(pwcData, len+1);
    StringToWideChar(Data, pwcData, len+1);     // ��Ʈ���� �����ڵ�� �����ϴ� �Լ�
    tmp := '';
    For i:=0 to (Length(Data) div 2)-1 do begin
        tmp := tmp + IntToHex(Ord(pwcData[i]), 4);  // �����ڵ尪�� �ϳ��� �о ���� ����
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

{    �̸� : func_Chkum
     ��� : 2 of 5 ���ڵ忡 üũ���� ���Ѵ�...
     �μ� : �̵��� �׸��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_FileDelete
     ��� : ���� �����
     �μ� : �̵��� �׸��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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
*   �� �� ��  : IntToBin
*   �Լ� ��� : 10����->2������ ��ȯ
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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

{    �̸� : func_kcIsLeapYear
     ��� : 1�⿡ �ְ� ����� ���
     �μ� : ����� �⵵
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function func_kcIsLeapYear( nYear: Integer ): Boolean;
begin
    Result := (nYear mod 4 = 0) and ((nYear mod 100 <> 0) or (nYear mod 400 = 0));
end;

{    �̸� : func_kcMonthDays
     ��� : �޿� ��° �� ����
     �μ� : ��,��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
function func_kcMonthDays( nMonth, nYear: Integer ): Integer;
const
    DaysPerMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
    Result := DaysPerMonth[nMonth];
    if (nMonth = 2) and func_kcIsLeapYear(nYear) then Inc(Result);
end;

{    �̸� : func_kcWeekOfYear
     ��� : �⿡ ��°�� ����
     �μ� : ���ó�¥ �׸�
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_LANSend
     ��� : ���Ͽ����� ������ �۽��� ���� ����
     �μ� : ���� ���۳�Ʈ��, ����������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : func_ActiveLANSend
     ��� : ���Ͽ����� ������ �۽��� ���� ����
     �μ� : ���� ���۳�Ʈ��, ����������
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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
    StartUpInfo: TStartUpInfo; // Win32�� STARTUPINFO ����ü
    ProcessInfo: TProcessInformation; // Win32�� PROCESS_INFORMATION
//
//    strCommand : string;
begin
    FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
    with StartupInfo do
    begin
        cb := SizeOf(TStartupInfo); // ����ü�� ũ��
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := cShow
    end;
    Rslt := CreateProcess(nil, PChar(ACommand), nil, nil, False,
    NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
    if Rslt then
        with ProcessInfo do
        begin
            WaitForInputIdle(hProcess, INFINITE);
            CloseHandle(hThread); // hThread �ڵ��� �����Ѵ�.
            CloseHandle(hProcess);// hProcess �ڵ��� �����Ѵ�.
            Result := 0; // ������ ���ϴ� 0�� ���ϰ����� �����ش�.
        end
    else Result := GetLastError; // ���� �ڵ带 �����ش�.
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
//seq ��ȣ ���ϱ�....
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
//������ ī���� ��������....
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
// ���   : SQL ������ ���� �ϰ� �������θ� �����Ѵ�.
// input  : SQL ����
// output : True/False
// example: f_ExecSQL('update cust set cunm = ''ȫ�浿''')
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

// ���� �ð��� LastTime���� Elapsed��ŭ ����� ��� True�� ��ȯ�Ѵ�.
function CheckTimeOver(LastTime, Elapsed: Dword): Boolean;
var
  Tm, Sum : Dword;
begin
  Tm := GetTickCount;

  Sum := LastTime + Elapsed;
  // ���� �÷ο�?
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
(* Procedure ���� *)
////////////////////////////////////////////////////////////////////////////////

{    �̸� : RefreshDataSet
     ��� : ȭ�鿡 Refresh���Ŀ� ���� ��ġ�� �̵��ϵ����ϴ� ���ν���
     �μ� : ���̺��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : ColorOnEnter
     ��� : �׸� Ŀ���� ��ġ�ϴ� ��쿡 �׸��ǻ��� �����Ѵ�
     �μ� : �̵��� �׸��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : ColorOnExit
     ��� : �׸� Ŀ���� ���������� ��쿡 �׸��ǻ��� �����Ѵ�
     �μ� : �̵��� �׸��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{    �̸� : TokenString
     ��� : ���ڿ��� �����ڷ� �����ؼ� StringList�� �����ش�
     �μ� : ���ڿ��� ���ڰ�, �������� ���ڰ�, ǥ���� ��Ʈ������Ʈ
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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

{    �̸� : DateDiff
     ��� : �� ����Ϸ� ���ڼ��� ����Ѵ�
     �μ� : ���� ������� Date��
   ����� : ���ڼ��� Word��
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
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


{   �̸� :  proc_Log2File
    ��� :  �α����Ͽ� �α� ���
            ���ϸ��� �������� ������ ������� �ʴ´�.
    �μ� :  FileName: ����� �α����ϸ�
            LogStr  : ���Ͽ� ����� ���ڿ�
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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
        //������ ����
        XL := CreateOLEObject('Excel.Application');
    except
        ShowMessage('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�!!!');
        Exit;
    end;
    XL.Visible := false;
    XL.WorkBooks.Open(sFileName);
    WorkBK := XL.WorkBooks.item[1]; //��ũ ��Ʈ ����


    // ��ũ��Ʈ�� ��Ʈ�� ������ ���� ��Ʈ�� ������
    for idx := 1 to WorkBK.WorkSheets.Count do
    begin
        WorkSheet := WorkBK.WorkSheets.Item[idx];
//        FXlsChoose.LBSheet.Items.Add(WorkSheet.Name);
    end;
    WorkSheet := WorkBK.WorkSheets.Item[1];
    // ��ũ��Ʈ�� ��Ʈ�� ������ ���� ��Ʈ�� ������

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
        //������ ����
        XL := CreateOLEObject('Excel.Application');
    except
        ShowMessage('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�!!!');
        Exit;
    end;
    XL.Visible := false;
    XL.WorkBooks.Open(sFileName);
    WorkBK := XL.WorkBooks.item[1]; //��ũ ��Ʈ ����


    // ��ũ��Ʈ�� ��Ʈ�� ������ ���� ��Ʈ�� ������
    for idx := 1 to WorkBK.WorkSheets.Count do
    begin
        WorkSheet := WorkBK.WorkSheets.Item[idx];
//        FXlsChoose.LBSheet.Items.Add(WorkSheet.Name);
    end;
    WorkSheet := WorkBK.WorkSheets.Item[1];
    // ��ũ��Ʈ�� ��Ʈ�� ������ ���� ��Ʈ�� ������

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
                strTEMP := strTEMP + Trim(WorkSheet.Cells[idx, jdx]) + '|�۾�����|����';
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
                strSQL := strSQL + '''' + '�۾���' + '''' + ',';
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


{   �̸�	: proc_MemoLog
    ���	: �޸��忡 �α� ǥ��
    �μ�	: �޸������۳�Ʈ,�α�
    �����	: ����
�����̷�	:
--------------------------------------------------------------------
��������     ������    ��������
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

{  5000 �̸� :  proc_PlayErrBellSound
    ��� :  �Ҹ� �︲ - �ѹ���
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
           --------------------------------------------------------------------
}
procedure proc_PlayErrBellSound(sResource : String);
begin
    with TResourceStream.Create(HInstance, sResource, RT_RCDATA) do begin
        sndPlaySound( Memory, SND_MEMORY or SND_ASYNC );
        Free;
    end;
end;

{   �̸� :  proc_PlayErrBellSoundLOOP
    ��� :  �Ҹ� �︲ - ��� �ݺ�
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
           --------------------------------------------------------------------
}
procedure proc_PlayErrBellSoundLOOP(sResource : String);
begin
    with TResourceStream.Create(HInstance, sResource, RT_RCDATA) do begin
        sndPlaySound( Memory, SND_MEMORY or SND_LOOP or SND_ASYNC );
        Free;
    end;
end;

{   �̸� :  proc_PlayErrSoundOff
    ��� :  �Ҹ� ����
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
           --------------------------------------------------------------------
}
procedure proc_PlayErrSoundOff;
begin
//�Ҹ� �� �� - ���� �ƹ��ų� ����ص� ������.
    sndPlaySound( nil, SND_MEMORY or SND_LOOP or SND_ASYNC );
end;

{   �̸� :  proc_FontRegistry
    ��� :  �ܺ� ��Ʈ ���
    �μ� :
  ����� :
�����̷� : --------------------------------------------------------------------
            ��������   ������     ��������
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

