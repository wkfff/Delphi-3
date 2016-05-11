unit uCommon ;
//*****************************************************************************
//   작성자 : 백 민하    일자 :2001.07.10 화요일
//   태전 PI 부분은 기존 프로그램을 사용
//   PLC 부분 추가로 함수 새로 작성 프로그램에 추가
//   앵글랙와 플로워랙은 서로상호 혼합될수 없다.
//*****************************************************************************
interface
uses
  Controls, ExtCtrls,Messages,Classes ,Forms,Dialogs,DBtables,
  StdCtrls, SysUtils, Windows, Graphics, comctrls,Rack,Grids ;

  Function RTS:integer;
  Function RTS2:integer;
  Function RTSONOFF(ioaddr: Word) : integer;

  Function GetCRC16(data : Array of Byte; Count : integer) : integer;
  Function ChkCRC16(data : Array of Byte; Count : integer) : Boolean;
  Function isNumeral(S : String) : Boolean;
  Function IntTo0Str(iNum : Word ; iLen : Byte):String;
  Function IntTo_Str(iNum : Word ; iLen : Byte): String;
  Function IntTosStr(iNum : Word ; iLen : Byte): String;
  Function GFileSize(fname : String) : longint;
  Procedure SetCRC16(var data : Array of Byte; Count : integer);
  Function TableExists (dbalias:string; tbName : string ) : Boolean ;
  Function Id2Loc(pla,bcu,id : Integer): String;
//  Procedure Location2ID(DPSPLACE : Integer; Loc : String; var Zone,block,Bcu, PI : Integer);
  Procedure Loc_Dan(bcu,id : Integer; var Col,Dan : Integer);
  Function fmt20(F_Data:String):String;
  function Rack_Start_Pos(Tot_Rack_Width:Integer):integer;
  function IntToBin(valor,digitos:integer):string;
  function Con_chk(con_job_id,Cmp_Value:Integer):Boolean;
  Function DPS_Seq(Bcu,Pi :Integer):Integer;

  Function Warp_Row_Cnt (const Data :String):Integer;
  Function ChkSysType : integer;
  procedure Grid_Clear(Sender: TObject);
  procedure Grid_Next(Sender: TObject;
                       Col_Pos:Integer; //시작위치
                       Col_Cnt:Integer;
                       Dip:String); //끝라인값 :ColCount-Col_Cnt-1;

  procedure Grid_Draw(Sender: TObject;
                      Col_Loc,
                      Row_Loc:Integer;
                      Rect: TRect;
                      State: TGridDrawState;
                      Draw_Loc:Char;
                      Sts_Pos:Integer;
                      Wrap_Cnt:Integer);


  procedure Rack_Crt(Sender : Tobject;RoomX,
                                      RoomY,
                                      GroupX,
                                      GroupY,
                                      G_GapX: Integer;
                                      pos_x,
                                      pos_y: Integer;
                                      RackType:String;
                                      Lamp_Loc:String;
                                      Mode:Char;
                                      Lamp_Type:Char);
  Procedure Set_CRC(Ver : Integer) ;


const
  STX = $02;
  ETX = $03;
  ACK = $06;
  ENQ = $05;
  EOT = $04;
  NAK = $15;

  PLC_WRITE        ='00WSS0106%';// 00 :국번 W :쓰기 SS:연속 읽기 01:블록 06:변수길이
  PLC_W_PC         ='MX20001';//PC 운전 설정
  PLC_W_PC_STOP    ='MX20000';//PC 운전 정지
  PLC_W_CON        ='MX20101';//컨베어 pc 연동
  PLC_W_CON_STOP   ='MX20100';//컨베어 pc 정지
  PLC_W_NOT_CON    ='MX20201';//켄베어 비연동
  PLC_W_AUTORUN    ='MX20301';//자동 운전
  PLC_W_AUTORUN_STOP='MX20300';//자동 운전
  PLC_W_AUTOSTOP   ='MX20401';//자동 정지
  PLC_W_BLOCKMOVE  ='MX20501';//작업 완료 다음 구간 이동
  PLC_W_BLOCKMOVE_STOP  ='MX20500';//작업 완료 다음 구간 이동

  PLC_RCV         ='00RSS0106%';// 00 :국번 R :읽기 SS:연속 읽기 01:블록 06:변수길이
  PLC_R_MODE       ='MX210'; //수동 모드
  PLC_R_AUTOMODE   ='MX211'; //자동 모드
  PLC_R_AUTORUN    ='MX212'; //자동 실행
  PLC_R_BLOCKMOVE  ='MX213';//투입구간이동중
  PLC_R_BLOCKMOVE1 ='PX044';//투입1구간이동중
  PLC_R_BLOCKMOVE2 ='PX045';//투입2구간이동중
  PLC_R_BLOCKMOVE3 ='PX046';//투입3구간이동중
  PLC_R_BLOCKMOVE4 ='PX047';//투입3구간이동중
  PLC_R_STS        ='MX217';//예약 확인

  PLC_R_SENER1     ='PX010';//1구간 센서
  PLC_R_SENER2     ='PX013';//2구간 센서
  PLC_R_SENER3     ='PX017';//3구간 센서


  PORTNUM : Array[0..5] of String = ('1','2','5','6','7','8');

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

 //기현
  Max_Rack =30; //최대 랙 생성값
  Rack_Gap =30; //랙 폭 설정값
  con_bin_Cnt =24;
  Sys_Nm =' Digital Picking System';
var
  Tbl : Array[0..255] of word;
  Win_Nt : Boolean; //NT 환경여부 판단
//  con : Array[1..Max_Rack] of Integer ;
  ComFile: THandle;
  Start_Cnt : Integer; //시작값계산
  Zone_Lamp_Bol :Boolean;
  gsConId : String;

//=============================================================================
//                         * 컨베어 상태 정보*
//=============================================================================
  Center_Con_cnt : Integer; //컨베어 컨트롤러 수량
  Con_Value : String; //컨베어 투입구간제어값 설정
  Con_Zone:  Array[1..Max_Rack,1..con_bin_Cnt] of Integer;
  Con_Sts : Array[1..Max_Rack,1..con_bin_Cnt] of Integer;
  Con_Cmt : Array[1..Max_Rack,1..con_bin_Cnt] of string;
  Con_Sts_cnt : Array[1..Max_Rack] of Integer;
  Con_Bin :Array[1..Max_Rack] of String; //컨베어 상태값
//=============================================================================
//                         * 랙 정보 *
//=============================================================================
  TotCel : Integer; //전체 행수
  S_Ang_id : Integer; //앵글랙 시작 id
  S_Flo_id : Integer; //플로워랙 사작 id
  Add_Rack : Integer; // rack 생성값 최대 20
  Test_Chk : Boolean=False;  //실행 여부 체크 한번 작업이 이뤄졌으면 랙정보를 다시 체크 하지 않음
  Run_Chk : Boolean=False;
  Pre_Bool : Boolean;
  FT_Bool : Boolean;
  Jun_S_Id : Integer;
  Jun_Cnt : Integer;
  Con_Buf_Size : Integer;  //컨베어 버퍼 설정값
  Test_Rack : Array[1..Max_Rack] of Track; //DPS TEST
  Run_Rack : Array[1..Max_Rack] of Track;  //DPS 작업지시
//=============================================================================
//                         * 센터 정보 *
//=============================================================================
  Center_Code : String;// 센터 코드
  Center_Nm : String;//센터 명
  Center_PcZone : String;//센터 작업 존
  Center_DB_path : String; //DB 위치
  Dps_Zone : Integer;  //dps 작업 존 설정
  Zone_Cnt : Integer;  //(존)블락 갯수
  Ack_Bol  : String[1];    //종료 pi가 없는데 ack 전송여부
//=============================================================================
//                         * 랙 생성 정보 *
//=============================================================================
  Cf_SEQ         :Array[0..Max_Rack] of Integer;
  Cf_BCU_ID      :Array[0..Max_Rack] of Integer;
  Cf_RACK        :Array[0..Max_Rack] of String;
  Cf_RACK_NM     :Array[0..Max_Rack] of String;
  Cf_ZONE        :Array[0..Max_Rack] of Integer;
  Cf_X_POS       :Array[0..Max_Rack] of Integer;
  Cf_Y_POS       :Array[0..Max_Rack] of Integer;
  Cf_CELL_X      :Array[0..Max_Rack] of Integer;
  Cf_CELL_Y      :Array[0..Max_Rack] of Integer;
  Cf_GROUP_X     :Array[0..Max_Rack] of Integer;
  Cf_GROUP_Y     :Array[0..Max_Rack] of Integer; //
  Cf_START_PI_ID :Array[0..Max_Rack] of Integer; //시작 pi
  Cf_END_PI_ID   :Array[0..Max_Rack] of Integer; //마지막 pi
  Cf_CELL_Start  :Array[0..Max_Rack] of Integer;
  Cf_CELL_End    :Array[0..Max_Rack] of Integer;
  Cf_LAMP_BCU_ID :Array[0..Max_Rack] of Integer; //램프 bcu id
  Cf_Block_Id    :Array[0..Max_Rack] of String;  //블록 지정 위치
  Cf_RACK_LR     :Array[0..Max_Rack] of String;  //랙타워램프 위치
  Cf_RACK_ID     :Array[0..Max_Rack] of String;  //랙 ID
  Cf_B_Z_Cnt     :Array[0..Max_Rack] of Integer; //블락에서 제어할 BCU수
  Cf_LAMP_SET    :Array[0..Max_Rack] of String;  //램프 상태값 설정
  Cf_Lamp_YN     :Array[0..Max_Rack] of Char;  //램프 상태값 설정
  Cf_MAXPI_DAN   :Array[0..Max_Rack] of Integer;  //단 설정
//  Cf_RACK_SEL    :Array[0..Max_Rack] of String;  //랙 좌표설정
//  Cf_RACK_LEN    :Array[0..Max_Rack] of Integer;  //랙 잡업길이 설정
  Cf_STOP_BCUID_F :Array[0..Max_Rack] of Integer; //
  Cf_STOP_BCUID_T :Array[0..Max_Rack] of Integer; //
  Cf_STOP_ID      :Array[0..Max_Rack] of Integer; //
  Cf_Con_Width    :Array[0..Max_Rack] of Integer; // 켄베어 폭설정
  Cf_Job_Col      :Array[0..Max_Rack] of String; // 작업한연 행수
  BCU_PI_ID       :Array[0..Max_Rack] of Integer; // 최종 piid
//=============================================================================
//                         * 셀크기 및 컨베어설정정보 *
//=============================================================================
  Cell_Size :Integer;//셀크기
  Con_Width :Integer;//컨베어폭
  Con_LocY  :Integer;//컨베어위치(Top)
  Con_LocX  :Integer;//컨베어위치(Left)
  WaitJob   :Integer;


  Rack_Loc : Integer;//컨베어위치-랙위치


implementation

uses
  uRun1;

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

Function isNumeral(S : String) : Boolean;
var
    i : Integer;
begin
    for i := 1 to Length(S) do begin
        if not (S[i] in ['0'..'9']) then begin
            Result := False;
            Exit;
        end;
    end;
    Result := True;
end;

Function IntTo0Str(iNum : Word ; iLen : Byte): String;
var
   S : ShortString;
begin
    S := Format('%*d',[iLen,iNum]);
    While Pos(' ',s) > 0 do
        S[Pos(' ',s)] := '0';
    Result := S;
End;

Function IntTo_Str(iNum : Word ; iLen : Byte): String;
var
    S : ShortString;
begin
    S := Format('%*d',[iLen,iNum]);
//   if iNum = 0 then S[iLen] := ' ';
    Result := S;
End;

Function IntTosStr(iNum : Word ; iLen : Byte): String;
var
  S : ShortString;
begin
    S := Format('%*d',[iLen,iNum]);
    if iNum = 0 then S[iLen] := ' ';
    Result := S;
End;


Function GetFileName(S : String): String;
var
    last : Integer;
begin
    last := 0;
    While pos('\',s) > 0 do begin
        last := Pos('\',s);
        S[pos('\',s)] := '/';
    end;
    result := Copy(s,last + 1, length(s) - last);
end;

Function GFileSize(fname : String) : longint;
var
  FHandle: THandle;
begin
    FHandle := CreateFile(PChar(fName), GENERIC_READ ,
       0, nil, OPEN_EXISTING, FILE_FLAG_WRITE_THROUGH or FILE_FLAG_OVERLAPPED, 0);
    if FHandle = INVALID_HANDLE_VALUE then begin
      GFileSize := -1;
      Exit;
    end;
    GFileSize := GetFileSize(FHandle, nil);
    if not CloseHandle(FHandle) then showmessage('error');
end;

function TableExists ( dbalias:string;tbName : string ) : Boolean ;
var
  TbNames : TStringList ;      // 테이블 목록 저장 변수
begin
    TbNames := TstringList.Create ;
    Session.GetTableNames( DBAlias, '', false, false, TbNames ) ;
    if TbNames.IndexOf(tbName) >= 0 then  TableExists := True
    else  TableExists := False ;
    TbNames.Free ;
end;

// pla : 1,2,3,4   bcu : 1,2,..,11  id : 1,2,...,n

Function Id2Loc(pla,bcu,id : Integer): String;
var
  s : string;
begin
    s :='';
    if odd(bcu) then
      s := s + Cf_RACK[bcu]+'-01-'
    else
      s := s + Cf_RACK[bcu]+'-02-';
    if cf_Rack_nm[bcu]='Flo' then begin   // F/R

      s := s + IntTo0Str(((id-1) mod Cf_CELL_X[bcu] + 1) + Cf_CELL_Start[bcu] - 1,2) + '-'
             + IntTo0Str((id-1) div Cf_CELL_X[bcu] +1,1)

    end
    else
    if cf_Rack_nm[bcu]='Ang' then begin   // A/R
      s := S + IntTo0Str((id-1) div Cf_END_PI_ID[bcu] + 1,2) + '-'
             + IntTo0Str((id-1) mod Cf_END_PI_ID[bcu] + 1,2) + '-x';
    end;
    Result := s;
end;

{===============================================================================
 2002.04.31  앵글랙 처리 기준변경으로 단계산 로직 추가
             DB에 행으로 할것인지 열로 처리할것인지 추가
             랙(1)-존(1)-열(2) -행(2) -단(1)
             앵글랙일경우 단처리 기준 적용 열->단처리 (4)  5단 처리까지만 적용이 가능하므로
             5이상은 적용 할수 없다.
             위에서부터 시작 id설정
================================================================================}
{
Procedure Location2ID(DPSPLACE : Integer; Loc : String; var Zone ,block ,Bcu ,PI : Integer);
var
  bk, cl, ro : Integer;
  Rack_Loc   : Integer;
  Zone_id    : Integer;
  i          : Integer;
begin
    Zone_id :=0;
    bk := StrToInt(Copy(loc,3,2));  //행
    cl := StrToInt(Copy(loc,5,2));  //열
    ro := StrToInt(Copy(loc,7,1));  //단
    Rack_Loc := StrToint(Loc[1]);   //랙
    for i := 1 to  (Zone_cnt+1 div 2) do begin
      Zone_id :=S_Flo_id+(i*2)-2;      // 플로워랙 시작id
      if (bk mod 2)=0 then  Zone_id :=S_Flo_id+(i*2)-1;
      if Zone_id > Zone_cnt then Continue;
      if Cf_RACK_ID[Rack_Loc] = 'Flo' then begin               // F/R
        if (cl >=Cf_CELL_Start[Zone_id]) and  (cl <=Cf_CELL_End[Zone_id]) then
        begin
          Zone :=StrToint(Cf_Block_Id[Zone_id]);
          Bcu :=Cf_BCU_ID[Zone_id];
          pi := ((cl - 0)-(Cf_CELL_Start[Zone_id]-1)) + ((ro - 1) * (Cf_CELL_x[Zone_id]));
          break;
        end;
      end else
      if Cf_RACK_ID[Rack_Loc] = 'Ang' then begin               // A/R
        Zone_id :=S_Ang_id+(i*2)-2;      // 플로워랙 시작id
        if (bk mod 2)=0 then  Zone_id :=S_Ang_id+(i*2)-1;
        if (cl >=Cf_CELL_Start[Zone_id]) and  (cl <=Cf_CELL_End[Zone_id]) then
        begin
          Zone :=StrToint(Cf_Block_Id[Zone_id]);
          Bcu :=Cf_BCU_ID[Zone_id];
          if (copy(loc,1,2)='1D') then
          begin
          //10단 처리  =단 / 6
            pi:= (ro div 6)+( (cl-1) * Cf_CELL_End[Zone_id])+1;
           end else
          begin
            pi:= (ro div 5)+( (cl-1) * Cf_CELL_End[Zone_id])+1;
          end;
        end;
      end;
    end;
    block := bcu;
end;
}
//프로시져 명: 전광판에 출력할 문자 맞추기
//작성 일자:2001.09.24
//작 성 자:백민하
// 설 명:
Function fmt20(F_Data:String):String;
var
    f_loop : integer;
    len : Integer;
    Sum_data : String;
begin
    Sum_data :=Trim(copy(F_Data,1,15));
    len := Length(Sum_data);
    for  f_loop:= len to 15 do begin
        Sum_data:=Sum_data+' ';
    end;
    Result :=Sum_data;
end;

{*****************************************************************************
*   함 수 명  : RACK_CRT
*   함수 기능 : 랙 생성
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.15
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Rack_Crt(Sender : Tobject;RoomX,
                                    RoomY,
                                    GroupX,
                                    GroupY,
                                    G_GapX: Integer;
                                    pos_x,
                                    pos_y: Integer;
                                    RackType:String;
                                    Lamp_Loc:String;
                                    Mode:Char;
                                    Lamp_Type:Char);
begin
    Add_Rack := Add_Rack+1;
    if mode='T' then
    begin
        With (Sender as Tpanel) do begin
            Test_Rack[Add_Rack] := TRack.Create(Application);
            Test_Rack[Add_Rack].Parent :=(Sender as Tpanel);
            Test_Rack[Add_Rack].Cel_x:=Cell_Size;
            Test_Rack[Add_Rack].Cel_y:=Cell_Size;
            Test_Rack[Add_Rack].left:=pos_X;
            Test_Rack[Add_Rack].Top:=pos_y;
            Test_Rack[Add_Rack].RoomX:= RoomX;
            Test_Rack[Add_Rack].RoomY:= RoomY;
            Test_Rack[Add_Rack].GroupX:= GroupX;
            Test_Rack[Add_Rack].GroupY:= GroupY;
            Test_Rack[Add_Rack].G_GapX:= G_GapX;

            if RackType='Flo' then
              Test_Rack[Add_Rack].RackType:= Flo
            else
            if RackType='Ang' then
              Test_Rack[Add_Rack].RackType:= Ang
            else
            if RackType='plt' then
              Test_Rack[Add_Rack].RackType:= Plt;
            if Lamp_Loc='L_Bottom' then
              Test_Rack[Add_Rack].Lamp_Loc:=L_Bottom
            else
            if Lamp_Loc='L_Top' then
              Test_Rack[Add_Rack].Lamp_Loc:=L_Top;
            if Lamp_Type='Y' then
              Test_Rack[Add_Rack].LampType:=Yes
            else
              Test_Rack[Add_Rack].LampType:=No;
            Test_Rack[Add_Rack].Visible := True;
            Test_Rack[Add_Rack].offcolor:= $003F7D00;
            Test_Rack[Add_Rack].inlinecolor:=clBlack;
            Test_Rack[Add_Rack].Caption := '';
            Test_Rack[Add_Rack].Color := clBtnFace;
        end;
    end else
    if mode='R' then
    begin
        With (Sender as Tpanel) do begin
            RUN_Rack[Add_Rack] := TRack.Create(Application);
            RUN_Rack[Add_Rack].Parent :=(Sender as Tpanel);
            RUN_Rack[Add_Rack].Cel_x:=Cell_Size;
            RUN_Rack[Add_Rack].Cel_y:=Cell_Size;
            RUN_Rack[Add_Rack].left:=pos_X;
            RUN_Rack[Add_Rack].Top:=pos_y;
            RUN_Rack[Add_Rack].RoomX:= RoomX;
            RUN_Rack[Add_Rack].RoomY:= RoomY;
            RUN_Rack[Add_Rack].GroupX:= GroupX;
            RUN_Rack[Add_Rack].GroupY:= GroupY;
            RUN_Rack[Add_Rack].G_GapX:= G_GapX;

            if RackType='Flo' then
              RUN_Rack[Add_Rack].RackType:= Flo
            else
            if RackType='Ang' then
              RUN_Rack[Add_Rack].RackType:= Ang
            else
            if RackType='plt' then
              RUN_Rack[Add_Rack].RackType:= Plt;
            if  Lamp_Loc='L_Bottom' then
              RUN_Rack[Add_Rack].Lamp_Loc:=L_Bottom
            else
            if  Lamp_Loc='L_Top' then
              RUN_Rack[Add_Rack].Lamp_Loc:=L_Top;
            if Lamp_Type='Y' then
              RUN_Rack[Add_Rack].LampType:=Yes
            else
              RUN_Rack[Add_Rack].LampType:=No;

            RUN_Rack[Add_Rack].Visible := True;
            RUN_Rack[Add_Rack].offcolor:= $003F7D00;
            RUN_Rack[Add_Rack].inlinecolor:=clBlack;
            RUN_Rack[Add_Rack].Caption := '';
            RUN_Rack[Add_Rack].Color := clBtnFace;
            RUN_Rack[Add_Rack].Exc_Test :=Exec;
        end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Rack_Start_Pos
*   함수 기능 : 랙 시작위치 설정
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.03.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function Rack_Start_Pos(Tot_Rack_Width:Integer):integer;
var
    Sum_x : Integer;
    Buf_Cnt : Integer;
begin
    Buf_Cnt := StrToint('0'+Cf_Block_Id[Zone_Cnt]);
    Sum_x :=(TotCel*10)+((Rack_Gap+Con_Buf_Size)*(Dps_Zone));
    Result :=0;
    if Zone_Cnt >0 then
        result :=(Tot_Rack_Width-Sum_x) div 2 ;
end;
{*****************************************************************************
*   함 수 명  : Con_chk
*   함수 기능 : 컨베어 작업 상테 체크
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.03.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
//seq=1 은 무조건 값이 이어야만 컨베어를 구동할수 있다.
function Con_chk(con_job_id,Cmp_Value:Integer):Boolean;
var
  i : Integer;
begin
    Result := False;
    if (con_job_id >=StrToInt('0'+gsConId)) and
           (fRun1.checkbox1.checked = True) then begin
       exit;
    End;

    for i := 1 to Con_Sts_cnt[con_job_id] do
    begin


        if Copy(Con_Bin[con_job_id],Length(Con_Bin[con_job_id])+1-Con_Sts[con_job_id][i],1) = '1' then
        begin
            if (con_job_id=1) and (i>Cmp_Value)
              and  (Con_Cmt[con_job_id][i]<>'센서참조')  then
            begin
                Result := True;
                exit;
            end else
            if (con_job_id>1) and (i>Cmp_Value)
              and  (Con_Cmt[con_job_id][i]<>'센서참조') then
            begin
                Result := True;
                exit;
            end;
        end;
    end;

end;
{*****************************************************************************
*   함 수 명  : Warp_Row_Cnt
*   함수 기능 : 그리드 초기화
*   Parameters:Sender: Data
*
*   Retrun    : Integer -> '|' 갯수
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
Function Warp_Row_Cnt (const Data :String):Integer;
var
    k : integer;
    comma_cnt : Integer;
begin
    comma_cnt :=0;
    for k := 1 to length(data) do
        if (copy(Data,k,1) = '|') then
            inc(comma_cnt);
    Result := comma_cnt;
end;
{*****************************************************************************
*   함 수 명  : Grid_Draw
*   함수 기능 : 그리드 초기화
*   Parameters:Sender: TObject
*               Col_Loc,              //col 위치값
*               Row_Loc:Integer       //row 위치값
*               Rect: TRect;          //
*               State: TGridDrawState;//상태값
*               Draw_Loc:Char;        //'L'->왼쪽 정렬 'C'->중앙 정렬 'R'->오른쪽 정렬
*               Sts_Pos:Integer);     //중복 처리 작업을 할 0-Sts_Pos 컬럼 위치
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}
procedure Grid_Draw(Sender: TObject;
                    Col_Loc,
                    Row_Loc:Integer;
                    Rect: TRect;
                    State: TGridDrawState;
                    Draw_Loc:Char;
                    Sts_Pos:Integer;
                    Wrap_Cnt:Integer);
var
    li_Left ,li_Top ,li_tw : Integer;
    Pos_cnt : Integer;
    warp_data,ch_data : ShortString;
    Wrap_Pos : Integer;
    CurY : Integer;
    EndData,one_cnt : Boolean;
begin
    with (Sender as TStringGrid) do begin
        with Canvas do begin
            if (Row_Loc = 0) then begin
                if Wrap_Cnt>1 then begin
//                  DefaultDrawing := false;
                    warp_data := Cells[Col_Loc,Row_Loc];
                    Pos_cnt:= Warp_Row_Cnt(warp_data);  //객수 파악
                    RowHeights[0] := (TextHeight('A')*Wrap_Cnt)+(Wrap_Cnt*4)+8;
                    if  Pos_cnt =0 then begin
                        li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
                        li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
                        Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
                    end
                    else
                    begin
                        EndData := False;
                        one_cnt := False;
                        CurY :=  (RowHeights[0] mod ((TextHeight('A') * ( Pos_cnt+1))+(Wrap_Cnt*4))) div 2;
                        while (not EndData) do begin
                            Wrap_Pos:= pos('|', warp_data);
                            if Wrap_Pos > 0 then begin
                                ch_data :=Copy(warp_data, 0, Wrap_Pos-1);
                                warp_data := Copy(warp_data,Wrap_Pos+1 , Length(warp_data) - Wrap_Pos);
                                li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(ch_data)) div 2;
                                if (not one_cnt) then begin
                                  one_cnt := True;
                                  Textrect(Rect, li_Left, CurY, ch_data); //출력할 자료
                                end else begin
                                  TextOut(li_Left, CurY, ch_data); //출력할 자료
                                end;
                                CurY := CurY +  TextHeight('A')+5;
                            end
                            else
                            begin
                                EndData := True;
                                li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(warp_data)) div 2;
                                TextOut(li_Left, CurY, warp_data); //출력할 자료
                            end;
                        end;
                    end;
                end
                else
                begin
                    li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(Cells[Col_Loc,Row_Loc])) div 2;
                    li_Top  := (Rect.Top + ((Rect.Bottom - Rect.Top) - Textheight(Cells[Col_Loc,Row_Loc])) div 2) + 1;
                    Textrect(Rect, li_Left, li_Top, Cells[Col_Loc,Row_Loc]);
                end;
            end else begin
                //Sts_Pos안에서 작업할 영역 선택
                Font.Color :=  clWindowText;
                if (gdSelected in State) or (Pos('>',Cells[Col_Loc,Row_Loc])>0) then begin
                    Brush.Color :=clAQUA;
                    Font.Color :=Clblue;
                end;
                if Sts_Pos>=Col_Loc then begin
                    if Cells[Col_Loc,Row_Loc]=Cells[Col_Loc,Row_Loc-1] then begin
                        Font.Color := (Sender as TStringGrid).Color;
                        if gdSelected in State then
                            Font.Color:=clAQUA;
                    end;
                end;
                FillRect(Rect);
                li_tw := TextWidth(Trim(Cells[Col_Loc, Row_Loc]));
                Case UpCase(Draw_Loc) of
                    'R' : TextOut(Rect.Right - li_tw - 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
                    'L' : TextOut(Rect.Left+2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
                    'C' : TextOut((Rect.Left + Rect.Right - li_tw) div 2, Rect.Top+2, trim(Cells[Col_Loc,Row_Loc]));
                end;
            end;
        end;
    end;
end;
{*****************************************************************************
*   함 수 명  : Grid_Next
*   함수 기능 : 그리드 초기화
*   Parameters: Sender : TStringGrid
*               Mode : 'I'  -> 신규 모드 자동으로 Row 값 증가
*                      else -> 조회 모드
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************
}
procedure Grid_Next(Sender: TObject;
                     Col_Pos:Integer; //시작위치
                     Col_Cnt:Integer;
                     Dip:String); //끝라인값 :ColCount-Col_Cnt-1;
begin
    with (Sender as TStringGrid) do begin
        if col=ColCount-Col_Cnt-1 then begin
            Col := Col_Pos;
            if (RowCount <= Row + 1)  then begin
                if  (Dip='Q')  or (Dip='UPDATE')then Exit;
                RowCount := RowCount+1;
                row:=RowCount-1;
                if (Dip<>'E') then
                    Cells[ColCount,Row]:=Dip;
            end else begin
                row := row + 1;
            end;
        end else
        if ColCount > Col+1 then
            Col:=Col+1;
    end;
end;
{*****************************************************************************
*   함 수 명  : Grid_Clear
*   함수 기능 : 그리드 초기화
*   Parameters: Sender : TStringGrid
*
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2001.08.04
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

procedure Grid_Clear(Sender: TObject);
var
  li_loop : Integer;
begin
    with (Sender as TStringGrid) do begin
        for li_loop := 1 to RowCount-1 do begin
            Rows[li_loop].Clear;
        end;
        Row := 1;
        RowCount := 2;
    end;
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
function IntToBin(valor,digitos:integer):string;
var
    resultado:string;
    i:integer;
begin
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
{*****************************************************************************
*   함 수 명  : ChkSysType
*   함수 기능 :  OS 판단
*   Parameters:
*   Retrun    :  1: win 2000 or nt  0: win 95및 98
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}


Function ChkSysType : integer;
var
    VersionInfo : TOSVersionInfo;
Begin
    Win_Nt := False;
    VersionInfo.dwOSVersionInfoSize:=SizeOf (VersionInfo);
    GetVersionEx (VersionInfo);
    if VersionInfo.dwPlatformID=VER_PLATFORM_WIN32_NT then
    begin
        Result := 1;
        Win_Nt := True;
    end else
        Result := 0;
end;

{*****************************************************************************
*   함 수 명  : Loc_Dan(bcu,id : Integer; var Col,Dan : Integer)
*   함수 기능 : 행 ,단 구하기
*   Parameters:
*   Retrun    : 행,단
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

Procedure Loc_Dan(bcu,id : Integer; var Col,Dan : Integer);
begin
    if cf_Rack_nm[bcu]='Flo' then begin   // F/R
        Col:= ((id-1) mod Cf_CELL_X[bcu] + 1) + (Cf_CELL_Start[bcu] - 1);
        Dan:= ((id-1) div Cf_CELL_X[bcu] +1);
    end
    else
    if cf_Rack_nm[bcu]='Ang' then begin   // A/R
        Col:=((id-1) div Cf_END_PI_ID[bcu] + 1);
        Dan:=((id-1) mod Cf_END_PI_ID[bcu] + 1);
    end;
end;

{*****************************************************************************
*   함 수 명  : DPS_Seq(bcu,id : Integer; var Col,Dan : Integer)
*   함수 기능 : 작업중인 seq얻기
*   Parameters:
*   Retrun    : seq
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

Function DPS_Seq(Bcu,Pi :Integer):Integer;
var
    i : Integer;
begin
    For i:= Start_Cnt to Zone_Cnt do
    begin
        if Cf_BCU_ID[i]=Bcu then
          if (Cf_START_PI_ID[i]<= pi) and ( Cf_END_PI_ID[i]>=Pi)  then break;
    end;
    Result := i;
end;



{*****************************************************************************
*   함 수 명  : RTS
*   함수 기능 : COM1 RTS ONOFF 제어
*   Parameters:
*   Retrun    : 0-> 정상적인 작업
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function RTS:integer;
var
  b:Byte;
  i:integer;
begin
  i:=0;
  while True do begin
     asm                            //라인 상태 레지스터
        mov DX, 3FDh                //포트 상태값 얻기
        in  AL, DX
        mov b, AL
     end;
     if (b and $40)=0 then begin    //Transmiter shift register empty
        inc(i);                     //송신할 테이타가 있는지 확인
        if i > 10000 then begin
           Result := -1;
           exit;
        end;
     end
     else break;
  end;

  asm
     mov DX, 3FCh             //모뎀 제어신호 상태 세팅
     mov AL, 9h               //DTR ,사용자 정의 출력 지정 OUT1 ->데이터 터미널 준비
     out DX, AL               //DSR 데이터세트 준비 완료
  end;
  i:=0;
  while True do
  begin
    asm
      mov DX, 3FEh
      in  AL, DX
      mov b, AL
    end;
    if (b and $10)=0 then begin    // CTS_OFF (데이터 전송이  해제되었는지 확인)
      inc(i);
      if i > 10000 then begin
         Result := -2;
         exit;
      end;
    end
    else break;
  end;
  Result:=0;
end;
{*****************************************************************************
*   함 수 명  : RTS
*   함수 기능 : COM2 RTS ONOFF 제어
*   Parameters:
*   Retrun    : 0-> 정상적인 작업
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function RTS2:integer;
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
           Result := -1;
           exit;
        end;
     end
     else break;
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
         Result := -2;
         exit;
      end;
    end
    else break;
  end;
  Result:=0;
end;

{*****************************************************************************
*   함 수 명  : RTSONOFF
*   함수 기능 : COM1,COM2  RTS ONOFF 제어
*   Parameters:
*   Retrun    : 0-> 정상적인 작업
*   작 성 자  : 백 민하
*   작 성 일  : 2002.04.16
******************************************************************************
    수정일자           내용 및 사유                                   수정자
******************************************************************************}

function RTSONOFF(ioaddr: Word) : integer;
begin
  if ioaddr = 1 then begin
     RTSONOFF:=RTS;
  end
  else begin
     RTSONOFF:=RTS2;
  end;
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

Procedure Set_CRC(Ver : Integer) ;
begin
    case Ver of
        1 : move(TbNew,Tbl[0],256*2);
        2 : move(TbOld,Tbl[0],256*2);
    end;
end;

end.


