unit uCommon ;
//*****************************************************************************
//   �ۼ��� : �� ����    ���� :2001.07.10 ȭ����
//   ���� PI �κ��� ���� ���α׷��� ���
//   PLC �κ� �߰��� �Լ� ���� �ۼ� ���α׷��� �߰�
//   �ޱ۷��� �÷ο����� ���λ�ȣ ȥ�յɼ� ����.
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
                       Col_Pos:Integer; //������ġ
                       Col_Cnt:Integer;
                       Dip:String); //�����ΰ� :ColCount-Col_Cnt-1;

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

  PLC_WRITE        ='00WSS0106%';// 00 :���� W :���� SS:���� �б� 01:��� 06:��������
  PLC_W_PC         ='MX20001';//PC ���� ����
  PLC_W_PC_STOP    ='MX20000';//PC ���� ����
  PLC_W_CON        ='MX20101';//������ pc ����
  PLC_W_CON_STOP   ='MX20100';//������ pc ����
  PLC_W_NOT_CON    ='MX20201';//�˺��� �񿬵�
  PLC_W_AUTORUN    ='MX20301';//�ڵ� ����
  PLC_W_AUTORUN_STOP='MX20300';//�ڵ� ����
  PLC_W_AUTOSTOP   ='MX20401';//�ڵ� ����
  PLC_W_BLOCKMOVE  ='MX20501';//�۾� �Ϸ� ���� ���� �̵�
  PLC_W_BLOCKMOVE_STOP  ='MX20500';//�۾� �Ϸ� ���� ���� �̵�

  PLC_RCV         ='00RSS0106%';// 00 :���� R :�б� SS:���� �б� 01:��� 06:��������
  PLC_R_MODE       ='MX210'; //���� ���
  PLC_R_AUTOMODE   ='MX211'; //�ڵ� ���
  PLC_R_AUTORUN    ='MX212'; //�ڵ� ����
  PLC_R_BLOCKMOVE  ='MX213';//���Ա����̵���
  PLC_R_BLOCKMOVE1 ='PX044';//����1�����̵���
  PLC_R_BLOCKMOVE2 ='PX045';//����2�����̵���
  PLC_R_BLOCKMOVE3 ='PX046';//����3�����̵���
  PLC_R_BLOCKMOVE4 ='PX047';//����3�����̵���
  PLC_R_STS        ='MX217';//���� Ȯ��

  PLC_R_SENER1     ='PX010';//1���� ����
  PLC_R_SENER2     ='PX013';//2���� ����
  PLC_R_SENER3     ='PX017';//3���� ����


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
   ); //����c��


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

 //����
  Max_Rack =30; //�ִ� �� ������
  Rack_Gap =30; //�� �� ������
  con_bin_Cnt =24;
  Sys_Nm =' Digital Picking System';
var
  Tbl : Array[0..255] of word;
  Win_Nt : Boolean; //NT ȯ�濩�� �Ǵ�
//  con : Array[1..Max_Rack] of Integer ;
  ComFile: THandle;
  Start_Cnt : Integer; //���۰����
  Zone_Lamp_Bol :Boolean;
  gsConId : String;

//=============================================================================
//                         * ������ ���� ����*
//=============================================================================
  Center_Con_cnt : Integer; //������ ��Ʈ�ѷ� ����
  Con_Value : String; //������ ���Ա������ ����
  Con_Zone:  Array[1..Max_Rack,1..con_bin_Cnt] of Integer;
  Con_Sts : Array[1..Max_Rack,1..con_bin_Cnt] of Integer;
  Con_Cmt : Array[1..Max_Rack,1..con_bin_Cnt] of string;
  Con_Sts_cnt : Array[1..Max_Rack] of Integer;
  Con_Bin :Array[1..Max_Rack] of String; //������ ���°�
//=============================================================================
//                         * �� ���� *
//=============================================================================
  TotCel : Integer; //��ü ���
  S_Ang_id : Integer; //�ޱ۷� ���� id
  S_Flo_id : Integer; //�÷ο��� ���� id
  Add_Rack : Integer; // rack ������ �ִ� 20
  Test_Chk : Boolean=False;  //���� ���� üũ �ѹ� �۾��� �̷������� �������� �ٽ� üũ ���� ����
  Run_Chk : Boolean=False;
  Pre_Bool : Boolean;
  FT_Bool : Boolean;
  Jun_S_Id : Integer;
  Jun_Cnt : Integer;
  Con_Buf_Size : Integer;  //������ ���� ������
  Test_Rack : Array[1..Max_Rack] of Track; //DPS TEST
  Run_Rack : Array[1..Max_Rack] of Track;  //DPS �۾�����
//=============================================================================
//                         * ���� ���� *
//=============================================================================
  Center_Code : String;// ���� �ڵ�
  Center_Nm : String;//���� ��
  Center_PcZone : String;//���� �۾� ��
  Center_DB_path : String; //DB ��ġ
  Dps_Zone : Integer;  //dps �۾� �� ����
  Zone_Cnt : Integer;  //(��)��� ����
  Ack_Bol  : String[1];    //���� pi�� ���µ� ack ���ۿ���
//=============================================================================
//                         * �� ���� ���� *
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
  Cf_START_PI_ID :Array[0..Max_Rack] of Integer; //���� pi
  Cf_END_PI_ID   :Array[0..Max_Rack] of Integer; //������ pi
  Cf_CELL_Start  :Array[0..Max_Rack] of Integer;
  Cf_CELL_End    :Array[0..Max_Rack] of Integer;
  Cf_LAMP_BCU_ID :Array[0..Max_Rack] of Integer; //���� bcu id
  Cf_Block_Id    :Array[0..Max_Rack] of String;  //��� ���� ��ġ
  Cf_RACK_LR     :Array[0..Max_Rack] of String;  //��Ÿ������ ��ġ
  Cf_RACK_ID     :Array[0..Max_Rack] of String;  //�� ID
  Cf_B_Z_Cnt     :Array[0..Max_Rack] of Integer; //������� ������ BCU��
  Cf_LAMP_SET    :Array[0..Max_Rack] of String;  //���� ���°� ����
  Cf_Lamp_YN     :Array[0..Max_Rack] of Char;  //���� ���°� ����
  Cf_MAXPI_DAN   :Array[0..Max_Rack] of Integer;  //�� ����
//  Cf_RACK_SEL    :Array[0..Max_Rack] of String;  //�� ��ǥ����
//  Cf_RACK_LEN    :Array[0..Max_Rack] of Integer;  //�� ������� ����
  Cf_STOP_BCUID_F :Array[0..Max_Rack] of Integer; //
  Cf_STOP_BCUID_T :Array[0..Max_Rack] of Integer; //
  Cf_STOP_ID      :Array[0..Max_Rack] of Integer; //
  Cf_Con_Width    :Array[0..Max_Rack] of Integer; // �˺��� ������
  Cf_Job_Col      :Array[0..Max_Rack] of String; // �۾��ѿ� ���
  BCU_PI_ID       :Array[0..Max_Rack] of Integer; // ���� piid
//=============================================================================
//                         * ��ũ�� �� ����������� *
//=============================================================================
  Cell_Size :Integer;//��ũ��
  Con_Width :Integer;//��������
  Con_LocY  :Integer;//��������ġ(Top)
  Con_LocX  :Integer;//��������ġ(Left)
  WaitJob   :Integer;


  Rack_Loc : Integer;//��������ġ-����ġ


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
  TbNames : TStringList ;      // ���̺� ��� ���� ����
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
 2002.04.31  �ޱ۷� ó�� ���غ������� �ܰ�� ���� �߰�
             DB�� ������ �Ұ����� ���� ó���Ұ����� �߰�
             ��(1)-��(1)-��(2) -��(2) -��(1)
             �ޱ۷��ϰ�� ��ó�� ���� ���� ��->��ó�� (4)  5�� ó�������� ������ �����ϹǷ�
             5�̻��� ���� �Ҽ� ����.
             ���������� ���� id����
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
    bk := StrToInt(Copy(loc,3,2));  //��
    cl := StrToInt(Copy(loc,5,2));  //��
    ro := StrToInt(Copy(loc,7,1));  //��
    Rack_Loc := StrToint(Loc[1]);   //��
    for i := 1 to  (Zone_cnt+1 div 2) do begin
      Zone_id :=S_Flo_id+(i*2)-2;      // �÷ο��� ����id
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
        Zone_id :=S_Ang_id+(i*2)-2;      // �÷ο��� ����id
        if (bk mod 2)=0 then  Zone_id :=S_Ang_id+(i*2)-1;
        if (cl >=Cf_CELL_Start[Zone_id]) and  (cl <=Cf_CELL_End[Zone_id]) then
        begin
          Zone :=StrToint(Cf_Block_Id[Zone_id]);
          Bcu :=Cf_BCU_ID[Zone_id];
          if (copy(loc,1,2)='1D') then
          begin
          //10�� ó��  =�� / 6
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
//���ν��� ��: �����ǿ� ����� ���� ���߱�
//�ۼ� ����:2001.09.24
//�� �� ��:�����
// �� ��:
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
*   �� �� ��  : RACK_CRT
*   �Լ� ��� : �� ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.15
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : Rack_Start_Pos
*   �Լ� ��� : �� ������ġ ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : Con_chk
*   �Լ� ��� : ������ �۾� ���� üũ
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.16
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
//seq=1 �� ������ ���� �̾�߸� ����� �����Ҽ� �ִ�.
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
              and  (Con_Cmt[con_job_id][i]<>'��������')  then
            begin
                Result := True;
                exit;
            end else
            if (con_job_id>1) and (i>Cmp_Value)
              and  (Con_Cmt[con_job_id][i]<>'��������') then
            begin
                Result := True;
                exit;
            end;
        end;
    end;

end;
{*****************************************************************************
*   �� �� ��  : Warp_Row_Cnt
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters:Sender: Data
*
*   Retrun    : Integer -> '|' ����
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : Grid_Draw
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters:Sender: TObject
*               Col_Loc,              //col ��ġ��
*               Row_Loc:Integer       //row ��ġ��
*               Rect: TRect;          //
*               State: TGridDrawState;//���°�
*               Draw_Loc:Char;        //'L'->���� ���� 'C'->�߾� ���� 'R'->������ ����
*               Sts_Pos:Integer);     //�ߺ� ó�� �۾��� �� 0-Sts_Pos �÷� ��ġ
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
                    Pos_cnt:= Warp_Row_Cnt(warp_data);  //���� �ľ�
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
                                  Textrect(Rect, li_Left, CurY, ch_data); //����� �ڷ�
                                end else begin
                                  TextOut(li_Left, CurY, ch_data); //����� �ڷ�
                                end;
                                CurY := CurY +  TextHeight('A')+5;
                            end
                            else
                            begin
                                EndData := True;
                                li_Left := Rect.Left + ((Rect.Right - Rect.Left) - Textwidth(warp_data)) div 2;
                                TextOut(li_Left, CurY, warp_data); //����� �ڷ�
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
                //Sts_Pos�ȿ��� �۾��� ���� ����
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
*   �� �� ��  : Grid_Next
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender : TStringGrid
*               Mode : 'I'  -> �ű� ��� �ڵ����� Row �� ����
*                      else -> ��ȸ ���
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************
}
procedure Grid_Next(Sender: TObject;
                     Col_Pos:Integer; //������ġ
                     Col_Cnt:Integer;
                     Dip:String); //�����ΰ� :ColCount-Col_Cnt-1;
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
*   �� �� ��  : Grid_Clear
*   �Լ� ��� : �׸��� �ʱ�ȭ
*   Parameters: Sender : TStringGrid
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : IntToBin
*   �Լ� ��� : 10����->2������ ��ȯ
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : ChkSysType
*   �Լ� ��� :  OS �Ǵ�
*   Parameters:
*   Retrun    :  1: win 2000 or nt  0: win 95�� 98
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : Loc_Dan(bcu,id : Integer; var Col,Dan : Integer)
*   �Լ� ��� : �� ,�� ���ϱ�
*   Parameters:
*   Retrun    : ��,��
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : DPS_Seq(bcu,id : Integer; var Col,Dan : Integer)
*   �Լ� ��� : �۾����� seq���
*   Parameters:
*   Retrun    : seq
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : RTS
*   �Լ� ��� : COM1 RTS ONOFF ����
*   Parameters:
*   Retrun    : 0-> �������� �۾�
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

function RTS:integer;
var
  b:Byte;
  i:integer;
begin
  i:=0;
  while True do begin
     asm                            //���� ���� ��������
        mov DX, 3FDh                //��Ʈ ���°� ���
        in  AL, DX
        mov b, AL
     end;
     if (b and $40)=0 then begin    //Transmiter shift register empty
        inc(i);                     //�۽��� ����Ÿ�� �ִ��� Ȯ��
        if i > 10000 then begin
           Result := -1;
           exit;
        end;
     end
     else break;
  end;

  asm
     mov DX, 3FCh             //�� �����ȣ ���� ����
     mov AL, 9h               //DTR ,����� ���� ��� ���� OUT1 ->������ �͹̳� �غ�
     out DX, AL               //DSR �����ͼ�Ʈ �غ� �Ϸ�
  end;
  i:=0;
  while True do
  begin
    asm
      mov DX, 3FEh
      in  AL, DX
      mov b, AL
    end;
    if (b and $10)=0 then begin    // CTS_OFF (������ ������  �����Ǿ����� Ȯ��)
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
*   �� �� ��  : RTS
*   �Լ� ��� : COM2 RTS ONOFF ����
*   Parameters:
*   Retrun    : 0-> �������� �۾�
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  : RTSONOFF
*   �Լ� ��� : COM1,COM2  RTS ONOFF ����
*   Parameters:
*   Retrun    : 0-> �������� �۾�
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.04.16
******************************************************************************
    ��������           ���� �� ����                                   ������
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
*   �� �� ��  :Set_CRC
*   �Լ� ��� :CRC���̺� ����
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2003.03.16
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}

Procedure Set_CRC(Ver : Integer) ;
begin
    case Ver of
        1 : move(TbNew,Tbl[0],256*2);
        2 : move(TbOld,Tbl[0],256*2);
    end;
end;

end.


