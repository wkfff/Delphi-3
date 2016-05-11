{*******************************************************************************
*
* 프로젝트 :
* 파 일 명 : 공통내역
* 기    능 : 환경설정 공통 내역
* 작 성 자 : Jiny Park
* 작 성 일 : 2004-04-03
* 수정이력
*
  작업일자     작업자    버전    수정내역
 *----------------------------------------------------------------------------*
*******************************************************************************}
unit Common_Opt;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, RxGif, Jpeg, Forms, Dialogs,
    ExtCtrls, utOPTION, Common, Common_Grid, DB, DBTables, CPort, StdCtrls;

type
    TbyteType = Array[0..9] of byte;
    TTable=array[0..9, 0..7] of String; //Double형의 2차원 배열을 선언
    TtmCOMMON = class(TForm)
    public
        procedure proc_COMMCREATE(fmCONTROL : TObject);
        procedure proc_IMGCREATE(fmCONTROL : TObject);
        procedure proc_Init(fmCONTROL : TObject);

        function  func_initCOMMSET(comPORT : TObject; aRow: Integer): Boolean;
        function  func_COMMRequest(comPORT : TObject): String;
        function  func_GETTime(intSPEED, intXAXIS : Integer) : String;
        function  func_GETNorm(strBUFF : String) : String;
    end;

    function  GetCRC16(data : Array of Byte; Count : integer) : integer;
    function  ChkCRC16(data : Array of Byte; Count : integer) : Boolean;

    function  func_txtGETLISTCount(strPATH : String; var Tbl : TTable) : Integer;
    function  func_txtGETCol(strFileName : String; strName : String; Tbl : TTable; GetCol : Integer) : String;
    function  func_txtGETIndex(strName : String; iType : Integer) : Integer;
    function  func_PutDataPi(comPORT : TObject; BcuID : integer; PiID : Integer; Floor : Integer; Dan : String; Attribute : byte ; pidata : String) : Boolean;
    function  func_PutTowerLamp(comPORT : TObject; BcuID : integer; Tlampdata4, Tlampdata3, Tlampdata2, Tlampdata1 : byte) : Boolean;
    function  func_GetPiSts(comPORT : TObject; BcuID : integer; PiID : Integer; var sts : Array of Byte):boolean;
    
    function  func_GetPiOff(comPORT : TObject; BcuID : integer; PiID : Integer):boolean;
    function  func_GetPiOff_1(comPORT : TObject; BcuID : integer; PiID : Integer):boolean;
    function  func_PutDataDisplay(comPORT : TObject; BcuID : integer; Data : String): Boolean;

    function  func_WritePort(comPORT : TObject; W_Data:Array of byte;Len:Integer):Integer;

    function  func_CONTROLRead(comCONTROL : TObject; strBUFF : String; var sts : TbyteType) : boolean;
    function  func_CONTROLWrite(comCONTROL : TObject; strBUFF : String ):Boolean;

    procedure SetCRC16(var data : Array of Byte; Count : integer);
    procedure proc_SetCRC(Ver : Integer) ;
var
    tmCOMMON: TtmCOMMON;
    gsCheck : Boolean;

    MyDbTable           : TTable;
    MyCommTable         : TTable;
    MyDisplayTable      : TTable;

    Tbl : Array[0..255] of word;

    gcCOMM: Array of TComPort;
    giCOMM: Array [1..4] of Integer;

    imgCORP      : TImage;
    pnlBIMG      : TPanel;

    giORACLE     : Integer;
    giMSSQL      : Integer;

    gsSCAN_BAR_CD : String;
    gsSCAN_WEIGHT : String;

    gsSCAN_USERID : String;

    gsVIEWJOB    : String;
    gsVIEWMSG    : String;

    gsCAP        : String;
    gsDATPATH    : String;

    gsFOLDER     : String;
    gsCORP_CD    : String;
    gsCORP       : String;
    gsLGNUM      : String;
    gsLINE_GB    : String;

    gsSYSTEM     : String;
    gsVERSION    : String;
    gsEDTDATE    : String;
    gsCOPYTIGHT  : String;
    gsIMGFOLDER  : String;
    gsIMGLIM     : String;
    gsIMGICON    : String;

    gsCONV       : String;
    gsBASIC      : String;
    gsMANUAL     : String;
    gsDARKNEES   : String;
    gsPRTSPEED   : String;
    gsSLEWSPEED  : String;
    gsBFSPEED    : String;
    gsSLEEPTIME  : String;

    giCRCINFO    : Integer;
    giCOMMCNT    : Integer;
    giPCK_ZONE   : Integer;
    giJOB_AREA   : Integer;
    giCONV_ALL   : Integer;

    gsFTPHOST    : String;
    gsFTPUSER    : String;
    gsFTPPASS    : String;
    gsFTPPATH    : String;
    gsFTPEXE     : String;
    gsUPDATEDT   : String;

    //  gsDPI        : String;
    gsWRK_DT     : String;
    gsEXE_DT     : String;

    gsUSERID     : String;
    gsUSERPASS   : String;
    gsUSERNAME   : String;

    gsDB_SERVER  : String;
    gsDB_LOCAL   : String;

    gsRCV_Buff   : String;

    giMAXCOMM    : Integer;
    giING        : Integer;

    intRECQTY    : Integer;

const
  TbNew : Array[0..255] of word = (
        $0000, $1021, $2042, $3063, $4084, $50A5, $60C6, $70E7,
        $8108, $9129, $A14A, $B16B, $C18C, $D1AD, $E1CE, $F1EF,
        $1231, $0210, $3273, $2252, $52B5, $4294, $72F7, $62D6,
        $9339, $8318, $B37B, $A35A, $D3BD, $C39C, $F3FF, $E3DE,
        $2462, $3443, $0420, $1401, $64E6, $74C7, $44A4, $5485,
        $A56A, $B54B, $8528, $9509, $E5EE, $F5CF, $C5AC, $D58D,
        $3653, $2672, $1611, $0630, $76D7, $66F6, $5695, $46B4,
        $B75B, $A77A, $9719, $8738, $F7DF, $E7FE, $D79D, $C7BC,
        $48C4, $58E5, $6886, $78A7, $0840, $1861, $2802, $3823,
        $C9CC, $D9ED, $E98E, $F9AF, $8948, $9969, $A90A, $B92B,
        $5AF5, $4AD4, $7AB7, $6A96, $1A71, $0A50, $3A33, $2A12,
        $DBFD, $CBDC, $FBBF, $EB9E, $9B79, $8B58, $BB3B, $AB1A,
        $6CA6, $7C87, $4CE4, $5CC5, $2C22, $3C03, $0C60, $1C41,
        $EDAE, $FD8F, $CDEC, $DDCD, $AD2A, $BD0B, $8D68, $9D49,
        $7E97, $6EB6, $5ED5, $4EF4, $3E13, $2E32, $1E51, $0E70,
        $FF9F, $EFBE, $DFDD, $CFFC, $BF1B, $AF3A, $9F59, $8F78,
        $9188, $81A9, $B1CA, $A1EB, $D10C, $C12D, $F14E, $E16F,
        $1080, $00A1, $30C2, $20E3, $5004, $4025, $7046, $6067,
        $83B9, $9398, $A3FB, $B3DA, $C33D, $D31C, $E37F, $F35E,
        $02B1, $1290, $22F3, $32D2, $4235, $5214, $6277, $7256,
        $B5EA, $A5CB, $95A8, $8589, $F56E, $E54F, $D52C, $C50D,
        $34E2, $24C3, $14A0, $0481, $7466, $6447, $5424, $4405,
        $A7DB, $B7FA, $8799, $97B8, $E75F, $F77E, $C71D, $D73C,
        $26D3, $36F2, $0691, $16B0, $6657, $7676, $4615, $5634,
        $D94C, $C96D, $F90E, $E92F, $99C8, $89E9, $B98A, $A9AB,
        $5844, $4865, $7806, $6827, $18C0, $08E1, $3882, $28A3,
        $CB7D, $DB5C, $EB3F, $FB1E, $8BF9, $9BD8, $ABBB, $BB9A,
        $4A75, $5A54, $6A37, $7A16, $0AF1, $A1D0, $2AB3, $3A92,
        $FD2E, $ED0F, $DD6C, $CD4D, $BDAA, $AD8B, $9DE8, $8DC9,
        $7C26, $6C07, $5C64, $4C45, $3CA2, $2C83, $1CE0, $0CC1,
        $EF1F, $FF3E, $CF5D, $DF7C, $AF9B, $BFBA, $8FD9, $9FF8,
        $6E17, $7E36, $4E55, $5E74, $2E93, $3EB2, $0ED1, $1EF0
   ); //수원c존


  TbOld : Array[0..255] of word = (
        $0000, $1021, $2042, $3063, $4084, $50A5, $60C6, $70E7,
        $8108, $9129, $A14A, $B16B, $C18C, $D1AD, $E1CE, $F1EF,
        $1231, $0210, $3273, $2252, $52B5, $4294, $72F7, $62D6,
        $9339, $8318, $B37B, $A35A, $D3BD, $C39C, $F3FF, $E3DE,
        $2462, $3443, $0420, $1401, $64E6, $74C7, $44A4, $5485,
        $A56A, $B54B, $8528, $9509, $E5EE, $F5CF, $C5AC, $D58D,
        $3653, $2672, $1611, $0630, $76D7, $66F6, $5695, $46B4,
        $B75B, $A77A, $9719, $8738, $F7DF, $E7FE, $D79D, $C7BC,
        $48C4, $58E5, $6886, $78A7, $0840, $1861, $2802, $3823,
        $C9CC, $D9ED, $E98E, $F9AF, $8948, $9969, $A90A, $B92B,
        $5AF5, $4AD4, $7AB7, $6A96, $1A71, $0A50, $3A33, $2A12,
        $DBFD, $CBDC, $FBBF, $EB9E, $9B79, $8B58, $BB3B, $AB1A,
        $6CA6, $7C87, $4CE4, $5CC5, $2C22, $3C03, $0C60, $1C41,
        $EDAE, $FD8F, $CDEC, $DDCD, $AD2A, $BD0B, $8D68, $9D49,
        $7E97, $6EB6, $5ED5, $4EF4, $3E13, $2E32, $1E51, $0E70,
        $FF9F, $EFBE, $DFDD, $CFFC, $BF1B, $AF3A, $9F59, $8F78,
        $9188, $81A9, $B1CA, $A1EB, $D10C, $C12D, $F14E, $E16F,
        $1080, $00A1, $30C2, $20E3, $5004, $4025, $7046, $6067,
        $83B9, $9398, $A3FB, $B3DA, $C33D, $D31C, $E37F, $F35E,
        $02B1, $1290, $22F3, $32D2, $4235, $5214, $6277, $7256,
        $B5EA, $A5CB, $95A8, $8589, $F56E, $E54F, $D52C, $C50D,
        $34E2, $24C3, $14A0, $0481, $7466, $6447, $5424, $4405,
        $A7DB, $B7FA, $8799, $97B8, $E75F, $F77E, $C71D, $D73C,
        $26D3, $36F2, $0691, $16B0, $6657, $7676, $4615, $5634,
        $D94C, $C96D, $F90E, $E92F, $99C8, $89E9, $B98A, $A9AB,
        $5844, $4865, $7806, $6827, $18C0, $08E1, $3882, $28A3,
        $CB7D, $DB5C, $EB3F, $FB1E, $8BF9, $9BD8, $ABBB, $BB9A,
        $4A75, $5A54, $6A37, $7A16, $0AF1, $1AD0, $2AB3, $3A92,
        $FD2E, $ED0F, $DD6C, $CD4D, $BDAA, $AD8B, $9DE8, $8DC9,
        $7C26, $6C07, $5C64, $4C45, $3CA2, $2C83, $1CE0, $0CC1,
        $EF1F, $FF3E, $CF5D, $DF7C, $AF9B, $BFBA, $8FD9, $9FF8,
        $6E17, $7E36, $4E55, $5E74, $2E93, $3EB2, $0ED1, $1EF0 );

    gsFILENAME1 : String = ('ZINOPT.ini');
    gsFILENAME2 : String = ('ZINFTP.ini');

    gsCONFIG  : Array[1..4] of String = ('컨트롤러','프린터','투입스캐너','검증스캐너');

    giMAINGAB   = 5;

implementation

uses utHanConv;

function GetCRC16(data : Array of Byte; Count : integer) : integer;
var
  W : Word;
  i : integer;
begin
    w := 0;
    for i := 0  to Count - 1 do begin
      W := ((W and $00FF) shl 8) xor tbl[((W shr 8) xor data[i])];
//      	W := (W shl 8) xor tbl[((W shr 8) xor data[i])];
    end;
    Result := W;
end;

function ChkCRC16(data : Array of Byte; Count : integer) : Boolean;
var
    W : Word;
    i : integer;
begin
    w := 0;
    for i := 0 to Count - 1 do begin
        W := (W shl 8) xor tbl[((W shr 8) xor data[i])];
    end;
    if W = 0 then
        Result := True
    else
        Result := False;
end;

function func_CONTROLRead(comCONTROL : TObject; strBUFF : String; var sts : TbyteType) : boolean;
var
  Send_Buf  : Array[0..256] of byte;
  Rcv       : Array[0..99] of Char;
  Len, i, j : Integer;
  iLoop, iRcvCnt : Integer;
  Ch_Char   : Char;
begin
    for i := 0 to 255 do
    begin
        Send_Buf[i] := 0;
    end;

    with TComPort(comCONTROL) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        Len := Length(strBUFF)+2;
        Send_Buf[0] := ENQ;
        for i:=1 to Len-1 do
        begin
            Ch_Char := strBUFF[I];
            Send_Buf[i]:=Ord(Ch_Char);
        end;
        Send_Buf[LEN-1] := EOT;
        for j := 1 to giCOMMCNT do//RepeatCom do
        begin
            ClearBuffer(True,True);
            Write(Send_Buf,Len);
//            while Read(Rcv,120) > 0 do
//            iRcvCnt
            Sleep(40);
            Read(Rcv,50);
            if Ord(Rcv[0]) = ACK then
            begin
                for iLoop:=0 To 99 do
                begin
                    if Ord(Rcv[10+iLoop]) = ETX then
                    begin
                        Result := True;
                        Exit;
                    end;
                    sts[iLoop] := Ord(Rcv[10+iLoop]);
                end;
            end
            else Result := False;
        end;
        Result := False;
    end;
end;

function func_CONTROLWrite(comCONTROL : TObject; strBUFF : String):Boolean;
var
    Send_Buf : Array[0..256] of byte;
    Rcv      : Array[0..50] of Char;
    Len ,i,j : Integer;
    Ch_Char  :Char;
begin
    for i := 0 to 255 do
    begin
        Send_Buf[i] := 0;
    end;
    with TComPort(comCONTROL) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        Result := False;
        Len := Length(strBUFF)+2;
        Send_Buf[0] := ENQ;
        for i:= 1 to Len-1 do
        begin
            Ch_Char := strBUFF[I];
            Send_Buf[i]:=Ord(Ch_Char);
        end;
        Send_Buf[LEN-1] := EOT;
        for j := 1 to giCOMMCNT do       //RepeatCom do
        begin
            ClearBuffer(True,True);
            Write(Send_Buf,Len);
           Sleep(40);
            Read(Rcv,Len);
            if Ord(Rcv[0]) = ACK then
            begin
                Result := True;
                exit;
            end;
        end;
    end;
end;

function func_txtGETLISTCount(strPATH : String; var Tbl : TTable) : Integer;
var
    txtFile : TextFile;
    strBUFF : String;
    arrBUFF : Array[0..99] of String;
    intCNT, i, j  : Integer;
begin
    intCNT := 0;
    AssignFile(txtFile, strPATH);
    if FileExists(strPATH) then
    begin
        Reset(txtFile);
        while not Eof(txtFile) do
        begin
            Readln(txtFile,strBUFF);
            proc_data_distinction(strBUFF,'|',arrBUFF,j);
            for i := 0 to j - 1 do
            begin
                Tbl[intCNT, i] := arrBUFF[i];
            end;
            intCNT := intCNT + 1;
        end;
        CloseFile(txtFile);
    end;
    Result := intCNT;
end;

{    이름 : func_txtGETIndex
     기능 : 통신컴퍼넌트와 DB컴퍼넌트의 동적으로 생성한 각 포트명과 데이터베이스명의 컴퍼넌트의 인덱스 가져오는 함수
     인수 : 가져올 포트명이나 데이터베이스 드라이버명, 통신컴퍼넌트인지 데이터 베이스 컴퍼넌트인지를 구분 하는 구분자
   결과값 : 각각의 컴퍼넌트의 인덱스
 사용예제 : func_txtGETIndex('스캐너', 1)
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_txtGETIndex(strName : String; iType : Integer) : Integer;
var
    i, iCnt : Integer;
    sResult     : String;
begin
    try
        sResult := '-1';
        if iType = 1 then //통신 컴퍼넌트 가져오기
        begin
            iCnt := func_txtGETLISTCount(gsFOLDER+'~comm.tmp', MyCommTable) - 1;

            for i := 1 to iCnt do
            begin
                if MyCommTable[i,1] = strName then sResult := MyCommTable[i,7];
            end;
        end
        else
        if iType = 2 then //DB 컴퍼넌트 가져오기
        begin
            iCnt := func_txtGETLISTCount(gsFOLDER+'db.tmp', MyDbTable) - 1;

            for i := 1 to iCnt do
            begin
                if MyDbTable[i,1] = strName then sResult := MyDbTable[i,7];
            end;
        end
        else
        if iType = 3 then //전광판 가져오기
        begin
            iCnt := func_txtGETLISTCount(gsFOLDER+'~display.tmp', MyDisplayTable) - 1;

            for i := 1 to iCnt do
            begin
                if MyDisplayTable[i,1] = strName then sResult := MyDisplayTable[i,2];
            end;
        end;
        Result := StrToInt(sResult);
    except
        Result := -1;
    end;
end;

{    이름 : func_txtGETIndex
     기능 : 통신컴퍼넌트와 DB컴퍼넌트의 동적으로 생성한 각 포트명과 데이터베이스명의 컴퍼넌트의 인덱스 가져오는 함수
     인수 : 가져올 포트명이나 데이터베이스 드라이버명, 통신컴퍼넌트인지 데이터 베이스 컴퍼넌트인지를 구분 하는 구분자
   결과값 : 각각의 컴퍼넌트의 인덱스
 사용예제 : func_txtGETIndex('스캐너', 1)
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
            --------------------------------------------------------------------
}
function func_txtGETCol(strFileName : String; strName : String; Tbl : TTable; GetCol : Integer) : String;
var
    i, iCnt : Integer;
    sResult     : String;
begin
    try
        sResult := '-1';

        iCnt := func_txtGETLISTCount(strFileName, Tbl) - 1;

        for i := 1 to iCnt do
        begin
            if Tbl[i,1] = strName then sResult := Tbl[i,GetCol];
        end;

        Result := sResult;
    except
        Result := '-1';
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// PI 에 데이타 뿌리기
// bcuid     : 1,2,3,4,5...
// piid      : 1,2,3,4,5...
// floor     : 1,2,3...
// Dan       : 1,2,3...
// Attribute :
// PIData    : 6자리
////////////////////////////////////////////////////////////////////////////////
function func_PutDataPi(comPORT : TObject; BcuID : integer; PiID : Integer; Floor : Integer; Dan : String; Attribute : byte ; pidata : String) : Boolean;
var
    i, iRcvCnt: Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf : Array[1..5] of byte;
    sBCU, sPI : String;
begin
    sBCU := func_strFillZeroL(BcuID,2);
    sPI  := func_strFillZeroL(func_Dec2Hex64(PiID,2),2);

    DataBuf[1] := STX;
    DataBuf[2] := ord(sBCU[1]);     //bcu id
    DataBuf[3] := ord(sBCU[2]);     //bcu id
    DataBuf[4] := ord('P');         //pi 명령
    DataBuf[5] := ord(sPI[1]);      //pi id
    DataBuf[6] := ord(sPI[2]);      //pi id
    DataBuf[7] := ord('F');         //수량조정
    DataBuf[8] := ord('1');         //floor
    DataBuf[9] := ord(Dan[1]);      //단데이터

    DataBuf[10] := Attribute;             //표시모드
    for i := 11 to 16 do
    	DataBuf[i] := Ord(pidata[i-10]);
    DataBuf[17] := ETX;
    SetCRC16(DataBuf, 17);

    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
//        sleep(100);
        for i := 1 to giCOMMCNT do
        begin

            ClearBuffer(True,True);

            Write(DataBuf, 19);

            iRcvCnt := Read(rBuf, 3);
            if (rBuf[1] = ACK) then
            begin
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// PUT
// bcuid     : 1,2,3,4,5...
// LAMPData  : 4자리
//             31-LG 32-LR 34-RG 38-RR 30-Clear
////////////////////////////////////////////////////////////////////////////////
function func_PutTowerLamp(comPORT : TObject; BcuID : integer; Tlampdata4, Tlampdata3, Tlampdata2, Tlampdata1 : byte) : Boolean;
var
    i, iRcvCnt: Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf : Array[1..5] of byte;
    sBCU : String;
begin
    sBCU := func_strFillZeroL(BcuID,2);

    DataBuf[1] := STX;
    DataBuf[2] := ord(sBCU[1]);     //bcu id
    DataBuf[3] := ord(sBCU[2]);     //bcu id
    DataBuf[4] := ord('O');         //pi 명령
    DataBuf[5] := Tlampdata4;       //예비
    DataBuf[6] := Tlampdata3;       //예비
    DataBuf[7] := Tlampdata2;       //예비
    DataBuf[8] := Tlampdata1;       //31-LG 32-LR 34-RG 38-RR 30-Clear
    DataBuf[9] := ETX;
    SetCRC16(DataBuf, 9);

    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        for i := 1 to giCOMMCNT do
        begin
            ClearBuffer(True,True);

            Write(DataBuf, 11);

            iRcvCnt := Read(rBuf, 3);
            if (rBuf[1] = ACK) then
            begin
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;


////////////////////////////////////////////////////////////////////////////////
// PI 상태 얻기
// BcuID : 1,2,3,4,
// PINO  : 1,2,3,4..
////////////////////////////////////////////////////////////////////////////////
function func_GetPiSts(comPORT : TObject; BcuID : integer; PiID : Integer; var sts : Array of Byte):boolean;
var
    i, iRcvCnt: Integer;
    DataBuf : Array[1..20] of Byte;
    DataBuf2: Array[1..5] of Byte;
    sBCU, sPI : String;
begin
    sBCU := func_strFillZeroL(BcuID,2);
    sPI  := func_strFillZeroL(func_Dec2Hex64(PiID,2),2);

//    for i := 0 to 45 do
//    begin
//        sts[i] := 0;
//    end;

    DataBuf[1] := STX;
    DataBuf[2] := ord(sBCU[1]);     //bcu id
    DataBuf[3] := ord(sBCU[2]);     //bcu id
    DataBuf[4] := ord('R');         //pi 명령
    DataBuf[5] := ord(sPI[1]);      //pi id
    DataBuf[6] := ord(sPI[2]);      //pi id
    DataBuf[7] := ETX;
    SetCRC16(DataBuf, 7);
    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        for i := 1 to giCOMMCNT do // do//RepeatCom do
        begin
        //sleep(200);
            ClearBuffer(True,True);
            Write(DataBuf, 9);

            iRcvCnt := Read(sts, 45);

            if ChkCRC16(sts, iRcvCnt) then
            begin
                //sleep(200);
                DataBuf2[1] := ACK;
                DataBuf2[2] := ord(sBCU[1]);     //bcu id
                DataBuf2[3] := ord(sBCU[2]);     //bcu id
                DataBuf2[4] := ord(sPI[1]);      //pi id
                DataBuf2[5] := ord(sPI[2]);      //pi id
                TComPort(comPORT).Write(DataBuf2, 5);
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// PI 상태 얻기
// BcuID : 1,2,3,4,
// PINO  : 1,2,3,4..
////////////////////////////////////////////////////////////////////////////////
function func_GetPiOff(comPORT : TObject; BcuID : integer; PiID : Integer):boolean;
var
    i, iRcvCnt: Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf : Array[1..5] of byte;
    sBCU, sPI : String;
begin
    sBCU := func_strFillZeroL(BcuID,2);
    sPI  := func_strFillZeroL(func_Dec2Hex64(PiID,2),2);

//    for i := 0 to 45 do
//    begin
//        sts[i] := 0;
//    end;

    DataBuf[1] := STX;
    DataBuf[2] := ord(sBCU[1]);     //bcu id
    DataBuf[3] := ord(sBCU[2]);     //bcu id
    DataBuf[4] := ord('E');         //pi 명령
    DataBuf[5] := ord(sPI[1]);      //pi id
    DataBuf[6] := ord(sPI[2]);      //pi id
    DataBuf[7] := ETX;
    SetCRC16(DataBuf, 7);
    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        for i := 1 to giCOMMCNT do // do//RepeatCom do
        begin
            ClearBuffer(True,True);
            Write(DataBuf, 9);

            iRcvCnt := Read(rBuf, 3);
            if (rBuf[1] = ACK) then
            begin
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;

function func_GetPiOff_1(comPORT : TObject; BcuID : integer; PiID : Integer):boolean;
var
    i, iRcvCnt: Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf : Array[1..5] of byte;
    sBCU, sPI : String;
begin
    sBCU := func_strFillZeroL(BcuID,2);
    sPI  := func_strFillZeroL(func_Dec2Hex64(PiID,2),2);

//    for i := 0 to 45 do
//    begin
//        sts[i] := 0;
//    end;

    DataBuf[1] := STX;
    DataBuf[2] := ord(sBCU[1]);     //bcu id
    DataBuf[3] := ord(sBCU[2]);     //bcu id
    DataBuf[4] := ord('E');         //pi 명령
    DataBuf[5] := ord(sPI[1]);      //pi id
    DataBuf[6] := ord(sPI[2]);      //pi id
    DataBuf[7] := ETX;
    SetCRC16(DataBuf, 7);
    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        for i := 1 to giCOMMCNT do // do//RepeatCom do
        begin
            ClearBuffer(True,True);
            Write(DataBuf, 9);

            iRcvCnt := Read(rBuf, 3);
            if (rBuf[1] = ACK) then
            begin
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// 전광판 데이타를 전송한다.
// ID : 1,2,..,n  전광판 ID
// Data : 전광판에 전송할 데이타 (20 자리)
////////////////////////////////////////////////////////////////////////////////
function func_PutDataDisplay(comPORT : TObject; BcuID : integer; Data : String): Boolean;
var
    i, iRcvCnt, iLen: Integer;
    DataBuf : Array[1..30] of Byte;
    tBuff : Array[0..30] of Byte;
    rbuf : Array[1..5] of byte;
begin
    iLen := Length(Data);
    DataBuf[1] := STX;
    DataBuf[2] := BcuID - 1;
    DataBuf[3] := ord('D');
    hsConvert(Data, tBuff);
    for i := 4 to iLen + 3 do
        DataBuf[i] := tBuff[i-4];            //Ord(Data[i-5]);
    DataBuf[iLen + 4] := ETX;
    SetCRC16(DataBuf, 24);
    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := False;
            exit;
        end;
        for i := 1 to giCOMMCNT do//RepeatCom do
        begin
            ClearBuffer(True,True);
            Write(DataBuf, 51);
            iRcvCnt := Read(rBuf, 2);
            if (rBuf[1] = ACK) and (rBuf[2] = BcuID - 1) then
            begin
                Result := True;
                Exit;
            end;
        end;
        Result := False;
    end;
end;

{*****************************************************************************
*   함 수 명  : WritePort
*   함수 기능 : comport에 자료 보내기
*   Parameters: 보내 byte 수
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
   20050404 백민하  통신값 전송부분 수정 }

function func_WritePort(comPORT : TObject; W_Data:Array of byte;Len:Integer):Integer;
var
  i : Integer;
begin
    with TComPort(comPORT) do
    begin
        if Connected = False then
        begin
            Result := -1;
            exit;
        end;
        for i:= 0 to len-1 do
        begin
            TransmitChar(chr(W_Data[i]));
    //        Sleep(1);
    //        If gbCt Then Sleep(1);
        end;
        Result := i;
    end;
end;

procedure SetCRC16(var data : Array of Byte; Count : integer);
var
  W : Word;
  i : integer;
begin
    w := 0;                                            //2114048 13379    //65535
    for i := 0 to Count - 1 do begin
      W := ((W and $00FF) shl 8) xor tbl[((W shr 8) xor data[i])];
//      	W := (W shl 8) xor tbl[((W shr 8) xor data[i])];
    end;
    data[count] := hi(w);
    data[count+ 1] := lo(w);
end;

{*****************************************************************************
*   함 수 명  :Set_CRC
*   함수 기능 :CRC테이블값 설정
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2003.03.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure proc_SetCRC(Ver : Integer) ;
begin
    case Ver of
        1 : move(TbNew,Tbl[0],256*2);
        2 : move(TbOld,Tbl[0],256*2);
    end;
end;



procedure TtmCOMMON.proc_COMMCREATE(fmCONTROL : TObject);
var
    i, iCommCnt : Integer;
begin
    try
        iCommCnt := func_txtGETLISTCount(gsFOLDER+'~comm.tmp', MyCommTable) - 1;
        if gcCOMM = Nil then SetLength(gcCOMM, iCommCnt);

        for i := 1 to iCommCnt do
        begin
            if gcCOMM[i-1] = Nil then gcCOMM[i-1] := TComPort.Create(self);
            MyCommTable[i,7] :=  IntToStr(i-1);
            func_initCOMMSET(gcCOMM[i-1],i);
        end;
    except
//        func_Msg(gcCOMM[i].Port + ' 포트 열기 실패~!', '에러',ERROK);
    end;
end;

procedure TtmCOMMON.proc_Init(fmCONTROL : TObject);
begin
    gsFOLDER     := func_GetFolder;
    proc_COMMCREATE(fmCONTROL);

    //fmOPTION.ssDRIVER.GetDriverNames(fmOPTION.cbTYPE.Items);

    gsCORP_CD    := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','업체코드','1');
    gsCORP       := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','업체명','진 코퍼레이션');

    gsSYSTEM     := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','시스템명','옵션');
    gsEDTDATE    := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','수정일자','20040403');
    gsIMGFOLDER  := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','이미지 폴더','');
    gsIMGLIM     := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','라벨 이미지','');
    gsIMGICON    := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','아이콘','');
    gsCOPYTIGHT  := func_IniStringRead(gsFOLDER,gsFILENAME1,'시스템 정보','Copyright','Copyright (C) ZIN Corporation');

    gsCONV       := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','켄베어 속도','100');
    gsBASIC      := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','기본 시간','10');
    gsMANUAL     := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','부착 시간','10');
    gsDARKNEES   := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','DARKNEES','12');
    gsPRTSPEED   := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','Print 속도','50.8 mm/sec');
    gsSLEWSPEED  := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','회전 속도','50.8 mm/sec');
    gsBFSPEED    := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','Backfeed 속도','50.8 mm/sec');
    gsSLEEPTIME  := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','통신 시간','10');
    gsDATPATH    := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','인쇄 파일','');

    giCOMMCNT    := func_IniIntegerRead(gsFOLDER,gsFILENAME1,'부가 설정','통신 횟수',5);
    giCRCINFO    := func_IniIntegerRead(gsFOLDER,gsFILENAME1,'부가 설정','CRC 정보',1);
    giPCK_ZONE   := func_IniIntegerRead(gsFOLDER,gsFILENAME1,'부가 설정','최대 피킹존',3);
    giCONV_ALL   := func_IniIntegerRead(gsFOLDER,gsFILENAME1,'부가 설정','컨베어 전체 제어',1);

    gsLGNUM      := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','창고구분','W20');
    gsLINE_GB    := func_IniStringRead(gsFOLDER,gsFILENAME1,'부가 설정','라인구분','A');

    giJOB_AREA   := func_IniIntegerRead(gsFOLDER,gsFILENAME1,'부가 설정','작업구간',0);

    gsEXE_DT     := func_IniStringRead(gsFOLDER,gsFILENAME1,'실행 정보','실행일자','20090615');

    gsVERSION    := func_IniStringRead(gsFOLDER,gsFILENAME2,'시스템 정보','버젼','1.0');
    gsFTPHOST    := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','HOST','61.97.143.100');
    gsFTPUSER    := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','USER','zinpm');
    gsFTPPASS    := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','PASS','zinpm');
    gsFTPPATH    := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','PATH','Relay_DPS');
    gsFTPEXE     := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','EXE','Relay_DPS.EXE');
    gsUPDATEDT   := func_IniStringRead(gsFOLDER,gsFILENAME2,'FTP','DATE','2009.10.09');

    proc_IMGCREATE(fmCONTROL);

    Application.Title := gsCORP + ' ' + gsSYSTEM;

    TForm(fmCONTROL).Caption    := gsCORP + ' ' + gsSYSTEM + ' (' + gsVERSION + ')';
    if gsIMGICON <> '' then Application.Icon.LoadFromFile(gsIMGICON);
    if gsSLEEPTIME = '' then gsSLEEPTIME := '0';

    proc_SetCRC(giCRCINFO);

end;

procedure TtmCOMMON.proc_IMGCREATE(fmCONTROL : TObject);
begin
    FreeAndNil(imgCORP);
    if gsIMGFOLDER <> '' then
    begin
        imgCORP := TImage.Create(Self);
        with imgCORP do
        begin
            Parent   := TForm(fmCONTROL);
            Picture.LoadFromFile(func_GetFolder()+ '이미지\' + ExtractFileName(gsIMGFOLDER));
            //Align    := alClient;
            Align    := alNone;
            AutoSize := true;
            Top  := 0;
            Left := 0
            //Center   := True;
        end;
    end;
end;


function TtmCOMMON.func_initCOMMSET(comPORT : TObject; aRow : Integer): Boolean;
var
    strBAUD, strDATA, strSTOP, strPARITY : String;
begin
    TComPort(comPORT).Connected := False;

    if Copy(MyCommTable[aRow, 2], 1,3) <> 'LPT' then
    begin
        TComPort(comPORT).Port      := MyCommTable[aRow, 2];
        strBAUD   := MyCommTable[aRow,3];
        strDATA   := MyCommTable[aRow,4];
        strSTOP   := MyCommTable[aRow,5];
        strPARITY := MyCommTable[aRow,6];

        if strBAUD = '9600'   then TComPort(comPORT).Baudrate := br9600;
        if strBAUD = '19200'  then TComPort(comPORT).Baudrate := br19200;
        if strBAUD = '38400'  then TComPort(comPORT).Baudrate := br38400;
        if strBAUD = '57600'  then TComPort(comPORT).Baudrate := br57600;
        if strBAUD = '115200' then TComPort(comPORT).Baudrate := br115200;

        if strDATA = '5'      then TComPort(comPORT).Databits := dbFive;
        if strDATA = '6'      then TComPort(comPORT).Databits := dbSix;
        if strDATA = '7'      then TComPort(comPORT).Databits := dbSeven;
        if strDATA = '8'      then TComPort(comPORT).Databits := dbEight;

        if strSTOP = '1'      then TComPort(comPORT).Stopbits := sbOneStopBit;
        if strSTOP = '1.5'    then TComPort(comPORT).Stopbits := sbOne5StopBits;
        if strSTOP = '2'      then TComPort(comPORT).Stopbits := sbTwoStopBits;

        if strPARITY = 'Even'  then TComPort(comPORT).Parity.Bits  := prEven;
        if strPARITY = 'Mark'  then TComPort(comPORT).Parity.Bits := prMark;
        if strPARITY = 'None'  then TComPort(comPORT).Parity.Bits := prNone;
        if strPARITY = 'Odd'   then TComPort(comPORT).Parity.Bits := prOdd;
        if strPARITY = 'Space' then TComPort(comPORT).Parity.Bits := prSpace;

        if (MyCommTable[aRow,1] = 'BCU1') then
        begin
            TComPort(comPORT).Timeouts.ReadInterval := -1;
            TComPort(comPORT).Timeouts.ReadTotalConstant := 30;
            TComPort(comPORT).Timeouts.ReadTotalMultiplier := 0;
            TComPort(comPORT).Timeouts.WriteTotalConstant := 30;
            TComPort(comPORT).Timeouts.WriteTotalMultiplier := 30;
            TComPort(comPORT).FlowControl.ControlDTR := dtrEnable;
            TComPort(comPORT).FlowControl.ControlRTS := rtsDisable;
            // 2016-05-10 dyddyd SyncMethod 추가
            TComPort(comPORT).SyncMethod := smNone;
        end;

        if (MyCommTable[aRow,1] = 'BCU2') then
        begin
            TComPort(comPORT).Timeouts.ReadInterval := -1;
            TComPort(comPORT).Timeouts.ReadTotalConstant := 30;
            TComPort(comPORT).Timeouts.ReadTotalMultiplier := 0;
            TComPort(comPORT).Timeouts.WriteTotalConstant := 30;
            TComPort(comPORT).Timeouts.WriteTotalMultiplier := 30;
            TComPort(comPORT).FlowControl.ControlDTR := dtrEnable;
            TComPort(comPORT).FlowControl.ControlRTS := rtsDisable;
        end;

        sleep(100);
        try
            if MyCommTable[aRow, 0] = 'Y' then TComPort(comPORT).Connected := True;
            Result := True;
        except
            on e: EConvertError do  Result := False;
        end;
    end;
end;

function TtmCOMMON.func_COMMRequest(comPORT : TObject): String;
var
    Rcv      : Array[0..50] of Char;
    strSEND  : String;
    Len ,i,j : Integer;
begin
    with TComPort(comPORT) do
    begin
        Result := '';
        strSEND := Char(STX) + 'RQ' + Char(ETX);
        Len := Length(strSEND);
        for j:= 1 to 3 do
        begin
//            PurgeRead;
            SetDTR(True);
//            WriteBuf(strSEND[1],Len);
            Sleep(StrToInt(gsSLEEPTIME));
//            ReadBuf(Rcv,50);
            if Ord(Rcv[0]) = Ord(STX) then
            begin
                for i := 1 to 50 do
                begin
                    if Ord(Rcv[i]) = Ord(ETX) then
                    begin
                        if Result <> 'EOF' then
                        begin
                            strSEND := Char(STX) + 'GD' + Char(ETX);
                            Len := Length(strSEND);
//                            PurgeRead;
                            SetDTR(True);
//                            WriteBuf(strSEND[1],Len);
                        end;
                        Exit;
                    end;
                    Result := Result + Rcv[i];
                end;
            end;
        end;
    end;
end;


function TtmCOMMON.func_GETTime(intSPEED, intXAXIS : Integer) : String;
var
    i,j,r : Integer;
begin
    i := (intSPEED div 60) div 10;
    j := intXAXIS div 2;
    r := ((j - 80) div i) - StrToInt(gsBASIC);
//    showmessage(inttostr(r));
    Result := IntToStr(r);
end;

function TtmCOMMON.func_GETNorm(strBUFF : String) : String;
var
    strFNORM, strANORM, strTEMP, strABS : String;
begin
    if Pos('"',strBUFF) > 0 then
    begin
        strFNORM := Trim(Copy(strBUFF,1,Pos('"',strBUFF)-1));
        strABS :=   Trim(Copy(strBUFF,Pos('"',strBUFF)+2,Length(strBUFF)));
        strANORM := Trim(Copy(strABS,1,Pos('"',strABS)-1));

        if StrToInt(strFNORM) < StrToInt(strANORM) then strTEMP := FloatToStr(StrToFloat(strFNORM) * 25.4)
        else strTEMP := FloatToStr(StrToFloat(strANORM) * 25.4);
    end else
    begin
        strFNORM := Trim(Copy(strBUFF,1,Pos('X',strBUFF)-1));
        strANORM := Trim(Copy(strBUFF,Pos('X',strBUFF)+1,Length(strBUFF)));

        if StrToInt(strFNORM) < StrToInt(strANORM) then strTEMP := strFNORM
        else strTEMP := strANORM;
    end;
    Result  := func_GETTime(StrToInt(gsCONV),StrToInt(strTEMP));
end;

end.
