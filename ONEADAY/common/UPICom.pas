//##############################################################################
//    Project Name   :  Com port
//    Form    Name   :  CommInit
//    Author Co.     :   (주)진코퍼레이션
//    Author         :   백민하
//    Create Date    :   2002/03/03
//    Modify Date    :
//    Remark         :  prot 1..9 까지만 가능
//    모뎀제어 레지스터(MCR)   DTR RTS 비트 세트
//    dll 파일로 정리
//##############################################################################
unit UPICom;

interface

uses
  Windows, Messages,  SysUtils, Classes, Dialogs, Forms, CPort;

const
  DefaultDeviceName = 'Com2';                          

   //통신 에러 상태 코드
   CE_NOERROR       =   1;      //정상
   CE_NEGATIVE      =  -1;      //부정응답
   CE_INVALID_DATA  =  -2;      //원치않는 이상한 데이터가 수신될 때    2001-07-11
   CE_TIMEOUT       = -11;      //Timeout - Communication Error or 응답지연
   CE_ComPortClosed = -99;      //통신포트가 Close되었을 때의 에러 코드


type
  ECommError = class(Exception)
    ErrorCode: Integer;
end;
    Function fn_ComOpen(D_Name:Pchar;baud:Pchar):Boolean;
//    function GetPiSts(sPosChk:PChar;Var sRet:Pchar):Boolean; stdcall; export;

    function GetPiSts(Comm:TComPort; iPiId:Integer):Boolean;
    //function GetPiSts(iPiId:Integer):Boolean;

    Function init(st_baud:Pchar):Integer;
    Function Write(comm: TComPort; Write_Data : array of byte;Data_len : integer):Integer;overload;
    Function Write(Write_Data : array of byte;Data_len : integer):Integer;overload;
    function func_SendString( comm: TComPort; TxBuf: string ): integer ;

    Function read(comm: TComPort; var Write_Data : Array of byte; Data_len : Integer):Integer;overload;
    Function read(var Write_Data : Array of byte; Data_len : Integer):Integer;overload;
    Function Send_PI(comm: TComPort; Pi_Id,Floor :Integer;  pidata : PChar):Boolean;overload;
    Function Send_PI(Pi_Id,Floor :Integer;  pidata : PChar):Boolean;overload;

    Function Write_Str(Write_Data : String;Data_len : integer):Integer;
    Function read_Str(var Write_Data : String; Data_len : Integer):Integer;
    Function hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string;
    Function CheckStatus : integer;
    Function Z4M_prt: boolean;
    function RTS(State: boolean): boolean;
    Procedure SetHS(State: Integer);
    Procedure Set_CRC(State : Integer);
    function IsOpen(iPort:Integer):Boolean;
    function DTR(State: boolean): boolean;
    PROCEDURE Transmit(port_num:Integer);
    PROCEDURE Disable;
    PROCEDURE Enable;
    Procedure Com1_RTS;
    Procedure Com2_RTS;
    function Cts_Sts : Boolean;
    Function fn_Close:Integer;
    //통신crc16관련 함수
    Function WritePort(W_Data:Array of byte;Len:Integer):Integer;

    Function  GetCRC16(data : Array of Byte; Count : integer) : integer;
    Procedure SetCRC16(var data : Array of Byte; Count : integer);
    Function  ChkCRC16(data : Array of Byte; Count : integer) : Boolean;

var

  ComFile: array [1..10] of THandle;  //통신포트 생성 HANDLE
  isConnect : array [1..10] of Boolean; //통신포트가 열려있는지 확인 TRUE 생성
  szPiSts : Array[0..24] of Char;
  Com_Port : Integer;
  gii      : Integer; //Z4M 상태체크 반복 변수 1000번 체크 이상이면 전원 및 포트 에러
  gstr     : String;  //Z4M 상태체크 리턴처리 변수

  //테이블
  Tbl : Array[0..255] of word;  //CRC16 테이블

implementation
const
  Read_buf=2048;
  port_base_id : array[0..4] of word = (0,$3f8,$2f8,$2e8,$3e8);
  port_IRQ : array[0..4] of byte = (0,4,3,4,3);

  //통신관련 기본값 설정
  STX = $02;
  ETX = $03;
  ACK = $06;
  ENQ = $05;
  EOT = $04;
  NAK = $15;


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
   ); //구버전


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


(****************************************************************************
  These are jusr the mneumonics for the UART registers which are accesses
  relative to the com port's base address.
*)
  IER=1;
  FCR=2;
  IIR=2;
  LCR=3;
  MCR=4;
  LSR=5;
  MSR=6;


//pi상태값 얻기

function GetPiSts(Comm:TComPort; iPiId:Integer):Boolean;
var
    i       : Integer;
    iChk    : Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf    : Array[1..10] of Byte;
begin
    Result := True;
    DataBuf[1] := STX;
    DataBuf[2] := iPiId - 1;
    DataBuf[3] := ord('C');
    SetCRC16(DataBuf, 3);
    For iChk := 1 to 2 do begin
        Comm.ClearBuffer(True, True);
        Comm.Write(DataBuf,5);
        //Write(DataBuf,5);
        //Comm.ClearBuffer(True, True);
        if Comm.Read(rBuf,10) = -1 then begin
        //if Read(rBuf,10) = -1 then begin
           Continue;
        end
        else begin
           if (rBuf[1] = STX) and (rBuf[2] = iPiId-1 ) then begin
              DataBuf[1]:=ACK;
              DataBuf[2]:=iPiId-1 ;
              Comm.ClearBuffer(True, True);
              Sleep(30);
              Comm.Write(DataBuf,2);
              //

              If rBuf[3]=1 then Begin
                 Result :=false;
                 Exit;
              end Else Begin
                 Exit;
              End;
           End
        end;
    End;
end;

{
//pi상태값 얻기
function GetPiSts(sPosChk:Pchar):Boolean; stdcall;
var
    i       : Integer;
    iChk    : Integer;
    DataBuf : Array[1..20] of Byte;
    rbuf    : Array[1..10] of Byte;
    sData   : String;
    sCh     : String;
    iLCnt   : Integer;
begin
    Result :=False;
    sCh:=  sPosChk;
    iLCnt :=  Length(sCh);
    ShowMessage(sCh);
    For i:=1 To  Length(sCh) Do Begin
        If  (sCh[i]='1')  Then Begin
            ShowMessage(inttostr(i));
            DataBuf[1] := STX;
            DataBuf[2] := i - 1;
            DataBuf[3] := ord('C');
            SetCRC16(DataBuf, 3);
            For iChk := 1 to 2 do begin
                Write(DataBuf,5);
                if Read(rBuf,10) = -1 then begin
                   Continue;
                end
                else begin
                   if (rBuf[1] = STX) and (rBuf[2] = i-1 ) then begin
                      If rBuf[3]=18 then begin
                          szPiSts[i]:='1'
                      end;
                      DataBuf[1]:=ACK;
                      DataBuf[2]:=i-1 ;
                      Write(DataBuf,2);

                      Break;
                   End

                end;

            end;
        End;
    End;
    Result :=True;

end;
}

Procedure Set_CRC(State : Integer);
Var
  i : Integer;
begin
    For i:= 1 To 10 Do
        isConnect[i]:= False;
    case State of
        1 : move(TbNew,Tbl[0],256*2);
        2 : move(TbOld,Tbl[0],256*2);
    end;
end;

Function GetCRC16(data : Array of Byte; Count : integer) : integer;
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

Procedure SetCRC16(var data : Array of Byte; Count : integer);
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


Function ChkCRC16(data : Array of Byte; Count : integer) : Boolean;
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



  { RaiseCommError }
procedure RaiseCommError(Msg: string; ErrCode: Integer);
var
  E: ECommError;
begin
  //E := ECommError.Create(Msg + Format(' (Error: %d) ', [ErrCode]));
  //E.ErrorCode := ErrCode;
  //raise E;
  //ShowMessage(Msg);
end;
{ RaiseCommError }

procedure TransmitChar(Ch: Char);
begin
  if not TransmitCommChar(ComFile[Com_Port], Ch) then
     RaiseCommError('통신에러', GetLastError);
end;

PROCEDURE Transmit(port_num:Integer);
VAR
  temp : BYTE;
  port_base : word;
BEGIN
  temp :=1;
  port_base := port_base_id[port_num];
  repeat
    asm
      mov DX, 3FCh             // *모뎀 제어 레지스터 비트 설정  DTR , 사용자 정의 출력
      mov AL, 9h               //전송 완료
      out DX, AL
    end;
    temp:=(port_base + LSR) AND $20;
  until temp<>0;

(*
  Now we can place a character in the register for the UART to send out.
*)


END;

function IsOpen(iPort:Integer):Boolean;
Begin
  Result := isConnect[iPort];
End;

function fn_ComOpen(D_Name:Pchar;baud:Pchar):Boolean;
var
  DeviceName : String;
  iPort      : Integer;
begin
    Result := True;
    if isConnect[Com_Port]=True Then
    begin
       fn_Close;
    end;
    Com_Port := StrToint(Copy(D_Name,4,1));
    ComFile[Com_Port] := CreateFile(D_Name,
                                    GENERIC_READ or GENERIC_WRITE, 0, nil,
                                    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if ComFile[Com_Port] = INVALID_HANDLE_VALUE then begin
      RaiseCommError('포트를 열수 없습니다!!!', -1);
      Result := False;
      exit;
    end;

    Init(baud);
    isConnect[Com_Port]:=True;
    gii :=0;
end;

Function init(st_baud:Pchar):Integer;
Var
   DCB: TDCB;
   Config : String;
   CommTimeouts : TCommTimeouts;
begin
  if not SetupComm(ComFile[Com_Port], Read_buf, Read_buf) then
  begin
     { Raise an exception }
  end;
  if not GetCommState(ComFile[Com_Port], DCB) then
  begin
     { Raise an exception }
  end;
  Config := 'baud='+st_baud +' parity=n data=8 stop=1' ;
  if not BuildCommDCB(@Config[1], DCB) then
  begin
     { Raise an exception }
  end;
  if not SetCommState(ComFile[Com_Port], DCB) then
  begin
     { Raise an exception }
  end;
  with CommTimeouts do
  begin
     ReadIntervalTimeout := 1;
     ReadTotalTimeoutMultiplier := 0;
     ReadTotalTimeoutConstant := 200;
     WriteTotalTimeoutMultiplier := 100;
     WriteTotalTimeoutConstant := 1000;
  end;
  if not SetCommTimeouts(ComFile[Com_Port], CommTimeouts) then
  begin
     { Raise an exception }
  end;
  Result := 0;

end;

{   이름 : func_SendString
    기능 : 송신버퍼의 데이터를 송신
    인수 :
  결과값 : True-정상송신, False-오류
수정이력 : --------------------------------------------------------------------
            수정일자   수정자     수정내역
           --------------------------------------------------------------------
}
function func_SendString( comm: TComPort; TxBuf: string ): integer ;
begin
    if not comm.Connected then begin
        result := CE_ComPortClosed;
        exit;
    end;
    result := CE_NEGATIVE;

    if comm.WriteStr( TxBuf) > 0 then result := CE_NOERROR;
end;


Function Write(comm: TComPort; Write_Data : array of byte ; Data_len : integer ):Integer;
var
  ls : String;
   i : Integer;
begin
  ls := '';
  for i := 0 to data_len do
    ls := ls + char(Write_Data[i]);

  if func_SendString(comm, ls) <> CE_NOERROR then begin
    Result := -1;
    RaiseCommError('자료를 송신할 수 없습니다!!!', -2);
  end;

  {
  if not WriteFile(ComFile[Com_Port], Write_Data[0], Data_len, dWord(Result),nil)  then
  begin
     // Raise an exception
    Result := -1;
    RaiseCommError('자료를 송신할수 없습니다!!!', -2);
  end;
  }
end;

Function Write(Write_Data : array of byte ; Data_len : integer ):Integer;
begin
  if not WriteFile(ComFile[Com_Port], Write_Data[0], Data_len, dWord(Result),nil)  then
  begin
     { Raise an exception }
    Result := -1;
    RaiseCommError('자료를 송신할수 없습니다!!!', -2);
  end;
end;

Function read(var Write_Data :Array of byte; Data_len : Integer):Integer;
Var
   d: array[1..Read_buf] of Char;
begin
  if not ReadFile(ComFile[Com_Port],Write_Data, Data_len, dWord(Result),nil) then
  begin
    Result := -1;
    { Raise an exception }
    RaiseCommError('자료를 수신할수 없습니다!!!', -3);
  end;
end;

Function read(comm: TComPort; var Write_Data : Array of byte; Data_len : Integer):Integer;
var
  ls : String;
   i : Integer;
begin
  ls := '';
  for i := 0 to data_len do
    ls := ls + char(Write_Data[i]);

  if func_SendString(comm, ls) <> CE_NOERROR then begin
    Result := -1;
    RaiseCommError('자료를 송신할 수 없습니다!!!', -2);
  end;

  {
  if not ReadFile(ComFile[Com_Port],Write_Data, Data_len, dWord(Result),nil) then
  begin
    Result := -1;
    // Raise an exception 
    //RaiseCommError('자료를 수신할수 없습니다!!!', -3);
  end;
  }

end;



//문자열 출력
Function Send_PI(comm: TComPort; Pi_Id, Floor :Integer;  pidata : PChar):Boolean;
var
  i       : Integer;
  DataBuf : Array[1..15] of Byte;
  rbuf    : Array[1..2] of byte;
  sData : String;
  iPI   : Integer;
begin
  iPI:= Pi_Id - 1;  
              // PI 초기화
              DataBuf[1]:=ACK;
              DataBuf[2]:=Pi_Id-1 ;
              Comm.ClearBuffer(True, True);
              Sleep(50);
              Comm.Write(DataBuf,2);
              
  Result:=False;
  DataBuf[1] := STX;
  DataBuf[2] := iPI;
  DataBuf[3] := ord('D');
  DataBuf[4] := Floor;
  DataBuf[5] := ord(pidata[0]);
  for i := 6 to 12 do
      DataBuf[i] := ord(pidata[i-5]);
  DataBuf[12] := ETX;
  SetCRC16(DataBuf, 12);
  For i := 1 to 5 do begin


       Comm.ClearBuffer(True, True);
       comm.Write(DataBuf, 14);
//       Comm.ClearBuffer(True, True);
       if comm.Read(rBuf,2) = -1 then begin
          Continue;
      end
      else begin
          if (rBuf[1] = ACK)  then begin
              Result := True;
              Exit;
          end
      end;
  end;

end;

//문자열 출력
Function Send_PI(Pi_Id,Floor :Integer;  pidata : PChar):Boolean;
var
  i       : Integer;
  DataBuf : Array[1..15] of Byte;
  rbuf    : Array[1..2] of byte;
  sData : String;
  iPI   : Integer;
begin
  iPI:= Pi_Id - 1;
  Result:=False;
  DataBuf[1] := STX;
  DataBuf[2] := iPI;
  DataBuf[3] := ord('D');
  DataBuf[4] := Floor;
  DataBuf[5] := ord(pidata[0]);
  for i := 6 to 12 do
      DataBuf[i] := ord(pidata[i-5]);
  DataBuf[12] := ETX;
  SetCRC16(DataBuf, 12);
  For i := 1 to 2 do begin
      Write(DataBuf,14);
      if Read(rBuf,5) = -1 then begin
          Continue;
      end
      else begin
          if (rBuf[1] = ACK)  then begin
              Result := True;
              Exit;
          end
      end;
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
******************************************************************************}

Function WritePort(W_Data:Array of byte;Len:Integer):Integer;
var
  i : Integer;
begin
  For i := 1 To Len Do Begin
    TransmitChar(Char(W_Data[i]));
  End;
End;
//문자열 출력
Function Write_Str(Write_Data :String ; Data_len : integer ):Integer;
var
   s: String;
begin
  s := Write_Data;
  if not WriteFile(ComFile[Com_Port], S[1], Data_len, dWord(Result),nil)  then
  begin
     { Raise an exception }
    RaiseCommError('자료를 송신할수 없습니다!!!', -2);
  end;
end;
//통신 자료 읽기
Function read_Str(var Write_Data :String; Data_len : Integer):Integer;
var
  d: array[1..Read_buf] of Char;
  ch_buf : String;
begin
 if not ReadFile(ComFile[Com_Port], d, Data_len, dWord(Result),nil) then
 begin
   { Raise an exception }
    RaiseCommError('자료를 수신할수 없습니다!!!', -3);
 end;
 ch_buf := d;
 Write_Data := Copy(ch_Buf,1,dWord(Result));
 Result := Length(Write_Data);
end;


Function fn_Close:Integer;
begin
    if isConnect[Com_Port]=True Then
    begin
        CloseHandle(ComFile[Com_Port]);
    end;
    isConnect[Com_Port]:=False;
    result :=0;

end;

//rts 제어
function RTS(State: boolean): boolean;
begin
  case State of
    true: Result := EscapeCommFunction(ComFile[Com_Port], SETRTS);
    false: Result := EscapeCommFunction(ComFile[Com_Port], CLRRTS);
  end;
  Result := True;
end;

Procedure SetHS(State: Integer);
var
  DCB: TDCB;
begin
  case State of
    2 :
    begin
      DCB.Flags := DCB.Flags or RTS_CONTROL_HANDSHAKE;
    end;
    3 :
    begin
      DCB.Flags := DCB.Flags or RTS_CONTROL_TOGGLE;
    end;
  end;
end;

function Cts_Sts : Boolean;
begin
//    Result := GeTBarPrtModemStatus(ComFile[1],MS_CTS_ON);
end;
PROCEDURE Disable;
begin
// INLINE($FA);
end;
PROCEDURE Enable;
begin
//  INLINE($FB);
end;



function DTR(State: boolean): boolean;
begin
  case State of
    true: Result := EscapeCommFunction(ComFile[Com_Port], SETDTR);
    false: Result := EscapeCommFunction(ComFile[Com_Port], CLRDTR);
  end;
end;


Procedure Com1_RTS;
var
  b:Byte;
  i:integer;
begin
  i:=0;
  while True do begin
    asm                 //3F8H COM1 기본 레지스터
       mov DX, 3FDh     //LSR 라인상태 레지스터 번지값 [기본포트+5]
       in  AL, DX
       mov b, AL
    end;
    if (b and $40)=0 then begin    //Transmiter shift register empty
       inc(i);
       if i > 10000 then begin
          exit;
       end;
    end
    else begin
      system.break;
    end;
  end;

  asm
    mov DX, 3FCh             // *모뎀 제어 레지스터 비트 설정  DTR , 사용자 정의 출력
    mov AL, 9h               //전송 완료
    out DX, AL
  end;

  i:=0;
  while True do
  begin
    asm
      mov DX, 3FEh             //모뎀 상태 레시스터
      in  AL, DX
      mov b, AL
    end;
    if (b and $10)=0 then begin    //송신 해제 상태 확인  (1 해제 0 송신)
      inc(i);
      if i > 10000 then begin
         exit;
      end;
    end
    else system.break;
  end;
end;
//////////////////////////////////////////////////////////////

Procedure Com2_RTS;
var
  b:Byte;
  i:integer;
begin
  i:=0;
  while True do begin
     asm
        mov DX, 2FDh
        in  AL, DX
        mov b, AL
     end;
     if (b and $40)=0 then begin    //Transmiter shift register empty
        inc(i);
        if i > 10000 then begin
           exit;
        end;
     end
     else begin
       system.break;
     end;
  end;

  asm
    mov DX, 2FCh             // RTS OFF
    mov AL, 9h
    out DX, AL
  end;

  i:=0;
  while True do
  begin
    asm
      mov DX, 2FEh
      in  AL, DX
      mov b, AL
    end;
    if (b and $10)=0 then begin    // CTS_OFF
      inc(i);
      if i > 10000 then begin
         exit;
      end;
    end
    else system.break;
  end;
end;
{*****************************************************************************
*   함 수 명  : CheckStatus
*   함수 기능 : Z4M 상태값 얻기
*   Parameters:
                ?
*   Retrun    : 0 정상  ELSE 에러
*   작 성 자  : 백민하
*   작 성 일  : 2002.07.11
*                   컴퓨터          Z4M(바코드 프린터) 상태값 리턴
*   Remark    : command '~HS' -> <STX>aaa,b,c,dddd,eee,f,g,h,iii,j,k,l<ETX><CR><LF>
*              aaa : 통신 설정 (110,300) 바운드
*
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}


Function CheckStatus : integer;
var
    cnt : integer;
    str   : string;
begin
    Result := 0;
    str := '~HS';
 //   RTS(True);
    Write_Str(str,Length(str));
 //   RTS(False);
    str := '';
    While gii<>1000 Do Begin
       inc(gii);
       Sleep(1);
       cnt := Read_Str(str,83);
       gstr := gstr + str;
       if Length(gstr)=82 then Begin
          RaiseCommError(gstr,0);
          //ShowMessage(gstr);
          gii :=0;
          str := gstr;
          Break;
       End;
    End;
    if cnt > 0 then
    begin
        // 56, 8   프린트 작업 실행중?
        if ((StrTointDef(Copy(str,15,3),-1)=-1)) or ((StrTointDef(Copy(str,56,8),-1)=-1)) then
        begin
          Result := 6;
          exit;
        end;
        if str[ 6] = '1' then Result := 1;  // Paper Out
        if str[ 8] = '1' then Result := 12; // Pause 버튼 눌림'
        if str[19] = '1' then Result := 2;  // Buffer Full
        if str[42] = '1' then Result := 10; // Head Err
        if str[44] = '1' then Result := 3;  // Head Up(Open)
        if str[46] = '1' then Result := 4;  // Ribbon Out
        if str[54] = '1' then Result := 11; // 라벨 대기

        if (StrToInt(Copy(str,15,3))>0) and (Result=0) then
        begin
          Result := 2; //프린트 명령 작업 상태
          exit;
        end;
//      if (StrToInt(Copy(str,56,8))>0) then Result := 2; // now printing
    end
    else
        Result := 5; // Com port Error or Turn off
end;
{*****************************************************************************
*   함 수 명  : CheckStatus
*   함수 기능 : Z4M 상태값 얻기
*   Parameters:
*   Retrun    : 0 정상  ELSE 에러
*   작 성 자  : 백민하
*   작 성 일  : 2002.07.11
*                   컴퓨터          Z4M(바코드 프린터) 상태값 리턴
*   Remark    : command '~HS' -> <STX>aaa,b,c,dddd,eee,f,g,h,iii,j,k,l<ETX><CR><LF>
*              aaa : 통신 설정 (110,300) 바운드
*
*              포트를 잡고있을때 다시 상태 체크를 하면에러 발생 창태체크를 하고
*              리터 받는 시간을 계산해서 연결해 주어야함
*              0: 바코드 출력
*              2: 작업 완료(진행중...)
*              5: 기타 에러
*              6: 포맷 형식 에러
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

Function Z4M_prt: boolean;
var
  ii : Integer;
  sMsg : String;
begin
  result := False;
  ii:=9;
  while ii <> 0 do
  begin
//      sleep(50);
      ii := CheckStatus;
      if ii in [2,5,6] then Continue
      else
      begin
          case ii of
             0 : break;
             1 : sMsg := '라벨이 없습니다!!';
             3 : sMsg := '헤드가 열려있습니다!!';
             4 : sMsg := '리본이 없습니다!!';
             10: sMsg := '헤드에러!!';
             11: sMsg := '라벨대기!!';
             12: sMsg := 'Pause 버튼 눌림!!';

             //5 : sMsg := '수신 포트가 다르거나 전원이 off되어 있습니다.';
          end;
          sleep(500);
          MessageBeep($ffff);
          if MessageBox(GetFocus,pchar(sMsg+#13+'출력을 계속하시겠습니까?')
                       ,'프린터에러',mb_IconExclamation+MB_YESNO)= IDNO         then
          begin
              exit;
          end;
      end;
  end;
  result := True;
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
// db2 1 바이트 문자는 모두 앞에 163 이 붙어서 처리됨
////////////////////////////////////////////////////////////////////////////////
function hangulZpl(Txt: string; Xpos, Ypos, Xaxis, Yaxis :integer; Rotation : Boolean) : string; 
var
   i, Len, Gap  : integer;
   KorTxt, Str1 : String;
   j    : array[0..100] of integer;
const
   DB2_Bojong =128;  //DB2  보정값
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
           if (j[i]=163) and (j[i+1]>=176) then //DB2 자료일경우
           begin
               Str1 := IntTostr(j[i+1]-DB2_Bojong);
               if Not Rotation then
               begin
                   Xpos   := Xpos + (Gap * Xaxis);
                   KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                           + '^XGE:N' + FormatFloat('000000',StrToFloat(Str1))+ ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
               end else
               begin
                   Ypos   := Ypos + (Gap * Yaxis);
                   KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                           + '^XGE:R' + FormatFloat('000000',StrToFloat(Str1)) + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
               end;
               i      := i + 2;
           end else
           begin //정상 자료일 경우 처리
             Str1   := IntToStr(j[i]);
             if Not Rotation then
             begin
                 Xpos   := Xpos + (Gap * Xaxis);
                 KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                         + '^XGE:N' + FormatFloat('000000',StrToFloat(Str1)) + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
             end else
             begin
                 Ypos   := Ypos + (Gap * Yaxis);
                 KorTxt := KorTxt + '^FO' + IntToStr(Xpos) + ',' + IntToStr(Ypos)
                         + '^XGE:R' + FormatFloat('000000',StrToFloat(Str1)) + ',' + IntToStr(Xaxis) + ',' + IntToStr(Yaxis)+ '^FS';
             end;
             i      := i + 1;
           end;
       end;
   end;

   Result := KorTxt;

end;




end.