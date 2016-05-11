//===============================================================================
//  ������Ʈ  : DAIHAN_DAS
//  ���ϸ�    : utDM
//  ���ϳ���  : �����͸�� 
//  �����ۼ���: Unknown
//  �����ۼ���: Unknown
//-------------------------------------------------------------------------------
//  ������    : 2016-02-04
//  ������    : dyddyd
//  ��������  :
//===============================================================================


unit utDM;

interface

uses
  SysUtils, Classes, DB, DBTables, StdCtrls, Dialogs, Grids, IniFiles, Forms;

type
  TTable=array[0..9, 0..6] of String; //Double���� 2���� �迭�� ����
  TdmDMS = class(TDataModule)
    Database1: TDatabase;
    function func_DBCONNECT(): Boolean;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure proc_SqlToText(strFILE : String; sSql : String);
procedure proc_QueryRepString(ParamName ,Value : string); overload;
procedure proc_QueryRepString(oQRY : TObject; ParamName ,Value : string); overload;
procedure proc_QuerySetString(ParamName ,Value : string);
//�޹� �ڽ� ��ġ�� ã��
procedure proc_Combo_Index(Sender : TComboBox;sData:String);

function func_GetSQLToCombo_1(cbTemp : TComboBox;
                             Param   : String):Boolean;
function func_GetSQLToCombo_2(cbTemp : TComboBox;
                             Param   : String):Boolean;
function func_GetQtyToCombo_1(cbTemp : TComboBox;
                                      sQuery : String;
                                      szParm : Array Of String;
                                      iFieldCnt: Integer=2) :Boolean;
function func_GetQtyToCombo_2(cbTemp : TComboBox;
                                      sQuery : String;
                                      szParm : Array Of String;
                                      iFieldCnt: Integer=2) :Boolean;

function CeRapiInit(): Integer; stdcall; external 'RAPI.DLL';
function CeRapiUninit(): Integer; stdcall; external 'RAPI.DLL';


var
  dmDMS: TdmDMS;
  COMM_Query      : TQuery;
  COMM_Proc       : TStoredProc;
  COMM_Database   : Array of TDatabase;           //������ ���̽� ��ü
  DASIni          : TIniFile;
  sSERVER_NAME, sPASSWORD : string;

implementation

uses Common, Common_Opt, Common_Xls;

{$R *.dfm}

function TdmDMS.func_DBCONNECT(): Boolean;
var
    i, iDBCnt : Integer;
begin
    try
        iDBCnt := func_txtGETLISTCount(gsFOLDER+'db.tmp', MyDbTable) - 1;
        SetLength(COMM_Database, iDBCnt);

        COMM_Proc  := TStoredProc.Create(self);
        COMM_Query := TQuery.Create(self);
        for i := 1 to iDBCnt do
        begin
            COMM_Database[i-1] := TDatabase.Create(self);
            with COMM_Database[i-1] do
            begin
                Connected := False;
                LoginPrompt := False;
                if (MyDbTable[i,1] <> 'STANDARD') then
                begin
                    DatabaseName := 'SERVER'+ IntToStr(i);
                    Params.Clear;
                    DriverName := MyDbTable[i,1];
                    Params.Add('SERVER NAME='+MyDbTable[i,3]);
                    if (MyDbTable[i,1] <> 'ORACLE') then Params.Add('DATABASE NAME='+MyDbTable[i,2]);
                    Params.Add('USER NAME='+MyDbTable[i,4]);
                    Params.Add('PASSWORD='+MyDbTable[i,5]);
                    MyDbTable[i,7] := IntToStr(i-1);
                    Connected := True;
                end
                else
                begin
                    DatabaseName := 'LOCAL'+ IntToStr(i);
                    Params.Clear;
                    DriverName := MyDbTable[i,1];
                    Params.Add('ENABLE BCD=TRUE');
                    Params.Add('PATH='+MyDbTable[i,6]);
                    MyDbTable[i,7] := IntToStr(i-1);
                    Connected := True;
                end;
            end;
        end;
        Result := True;
    except
        Result := True;
    end;
end;

{   �̸�	: pr_SqlToExcel
    ���	: ������ ������� �����͸� ������ �����մϴ�.
    �μ�	: ���� ���̾�α����۳�Ʈ,�������۳�Ʈ,��������
    �����	: ����
�����̷�	:
--------------------------------------------------------------------
��������     ������    ��������
--------------------------------------------------------------------
}
procedure proc_SqlToText(strFILE : String; sSql : String);
var
    strSave : String;
    Index, Row: Integer;
begin
    if strFILE <> '' then

    begin
       //COMM_Query :=  dmDMS.qryLOCAL;
       with COMM_Query do
       begin
          SQL.Clear;
          SQL.Add(sSql);
          Prepare;
          try
             Open;
             if isEmpty = False then
             begin
                Row := 0;
                while not Eof do
                begin
                    for Index := 1 to FieldCount do
                    begin
                        if Row = 0 then strSave := ''
//                        else strSave := strSave + func_alstrLeftF(Trim(Fields[Index-1].AsString),Fields.FieldByNumber(Index-1).Size);
                        else strSave := strSave + func_alstrLeftF(Trim(Fields[Index-1].AsString), Fields.FieldByNumber(index).Size);
                    end;
                    if Row <> 0 then proc_Log2File(strFILE,strSave);
                    strSave := '';
                    if Row <> 0 then Next;
                    Row := Row + 1;
                end;
             end;
             Close;
          except
             on E:EDBEngineError do begin
                Exit;
             end;
          end;
       end;
    end;
end;

{   �̸�	: pr_SqlToExcel
    ���	: ������ ������� �����͸� ������ �����մϴ�.
    �μ�	: ���� ���̾�α����۳�Ʈ,�������۳�Ʈ,��������
    �����	: ����
�����̷�	:
--------------------------------------------------------------------
��������     ������    ��������
--------------------------------------------------------------------
}
procedure proc_SqlToExcel(SaveDlg : TObject; sSql : String);
var
    FileHandle  : Integer;
    Index, Row, Column: Integer;
    strFILE     : String;
begin
    try  // ���ο� USW_MAIN.dfm , USW_MAIN.pas UPDATE ���ٰ�
       if TSaveDialog(SaveDlg).Execute then strFILE := TSaveDialog(SaveDlg).FileName;
    except
       exit;
    end;

    if strFILE <> '' then
    begin
       //COMM_Query :=  dmDMS.qryLOCAL;
       with COMM_Query do
       begin
          SQL.Clear;
          SQL.Add(sSql);
          Prepare;
          try
             Open;
             if isEmpty = False then
             begin
                FileHandle := Xls_Create(strFILE);

                Row := 0;

                while not Eof do
                begin
                    Column := 0;
                    for Index := 1 to FieldCount do
                    begin
                        if Row = 0 then Xls_SetString(FileHandle, Row,Column, Trim(Fields[Index-1].FieldName))
                        else Xls_SetString(FileHandle, Row,Column, Trim(Fields[Index-1].AsString));
                        Column := Column + 1;
                    end;
                    if Row <> 0 then Next;
                    Row := Row + 1;
                end;

                Xls_Close(FileHandle);
             end;
             Close;
          except
             on E:EDBEngineError do begin
                Exit;
             end;
          end;
       end;
    end;
end;

procedure proc_QueryRepString(ParamName ,Value : string);
var
    iPos : integer;
    sSql : String;
begin

    sSql := COMM_Query.Sql.Text;
    while Pos(ParamName,sSql) > 0 do
    begin
       iPos := Pos(ParamName,sSql);
       Delete(sSql,iPos,Length(ParamName));
       Insert(''''+Value+'''',sSql,iPos);
       //break;
    end;
    COMM_Query.Sql.Text :=  sSql;
end;

procedure proc_QueryRepString(oQRY : TObject; ParamName ,Value : string);
var
    iPos : integer;
    sSql : String;
begin

    sSql := TQuery(oQRY).Sql.Text;
    while Pos(ParamName,sSql) > 0 do
    begin
       iPos := Pos(ParamName,sSql);
       Delete(sSql,iPos,Length(ParamName));
       Insert(''''+Value+'''',sSql,iPos);
       //break;
    end;
    TQuery(oQRY).SQL.Text :=  sSql;
end;

{  �̸�    : proc_QuerySetString
   ���    :
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   2003-9-03  ������    1.�ۼ�
}

procedure proc_QuerySetString(ParamName ,Value : string);
var
    iPos : integer;
    sSql : String;
begin
    sSql := COMM_Query.Sql.Text;
    While Pos(ParamName,sSql) > 0 Do Begin
       iPos := Pos(ParamName,sSql);
       Delete(sSql,iPos,Length(ParamName));
       Insert(''''+Value+'''',sSql,iPos);
       break;
    End;
    COMM_Query.Sql.Text :=  sSql;
end;

{*****************************************************************************
*   �� �� ��  : proc_Combo_Index
*   �Լ� ��� : �޹� �ڽ� ��ġ�� ã��
*   Parameters: Sender : TComboBox
*
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2001.08.04
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure proc_Combo_Index(Sender : TComboBox;sData:String);
Var
    iLoop : Integer;
    sBuf  : String;
Begin
    With Sender Do Begin
       For iLoop := 0 To Sender.Items.Count -1 Do Begin
          sBuf := Items.Strings[iLoop];
          If Pos(sData,sBuf)>0 Then Begin
             ItemIndex :=iLoop;
             Exit;
          End;
       End;
    End;
End;

function func_txtGETLISTCount(strPATH : String) : Integer;
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
                MyDbTable[intCNT, i] := arrBUFF[i];
            end;
            intCNT := intCNT + 1;
        end;
        CloseFile(txtFile);
    end;
    Result := intCNT;
end;

function func_GetSQLToCombo_1(cbTemp : TComboBox;
                             Param   : String):Boolean;
Var
  sQuery  : String;
  szParam : Array [0..3] Of String;
  bRet    : Boolean;
begin
    sQuery :=   'SELECT CODE_SNM            '
              + '      ,COMM_CD               '
              + '  FROM TB_LA04      '
              + ' WHERE COMM_CLASS_CD = :pParam1 '
              + '   AND COMM_CD      <> :pParam2 '
              + '   AND COMM_CD      <> :pParam3 '
              + ' ORDER BY COMM_CD            ';

    szParam[0]:= Param;
    szParam[1]:= '00';
    szParam[2]:= '99';
    If func_GetQtyToCombo_2( cbTemp
                              ,sQuery
                              ,szParam
                              ) Then begin
       cbTemp.ItemIndex := 0;
    End;
    bRet   := True;
    Result := bRet;
end;

function func_GetSQLToCombo_2(cbTemp : TComboBox;
                             Param   : String):Boolean;
Var
  sQuery  : String;
  szParam : Array [0..3] Of String;
  bRet    : Boolean;
begin
    sQuery :=   'SELECT CODE_SNM            '
              + '      ,COMM_CD               '
              + '  FROM TB_LA04      '
              + ' WHERE COMM_CLASS_CD = :pParam1 '
              + '   AND COMM_CD      <> :pParam2 '
              + '   AND COMM_CD      <> :pParam3 '
              + ' ORDER BY COMM_CD            ';

    szParam[0]:= Param;
    szParam[1]:= '00';
    szParam[2]:= '99';
    If func_GetQtyToCombo_1( cbTemp
                              ,sQuery
                              ,szParam
                              ) Then begin
       cbTemp.ItemIndex := 0;
    End;
    bRet   := True;
    Result := bRet;
end;


{  �̸�    : fn_GetCodeToCombo
   ���    : ���̺� �����޾� �޹ڽ��� ���� �־��ش�.
   �μ�    : cbTemp : �ڵ���� �ְ����ϴ� FlatComboBox;
             sCode  : String; iLen : Integer
   �����  : ���ϰ����ϴ� ���̸�ŭ�� �ڵ尪
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_GetQtyToCombo_1(cbTemp : TComboBox;
                                      sQuery : String;
                                      szParm : Array Of String;
                                      iFieldCnt: Integer=2) :Boolean;

var
  i: Integer;
  iLoop : Integer;
  sSQL, sTmp: String;
  sData     : String;
begin
  result := False;
  //COMM_Query := dmDMS.qryLOCAL;
  With COMM_Query  Do Begin
    Close;
    SQL.Clear;
    sSQL := sQuery;
    SQL.Add(sSQL);
    For iLoop :=0 To High(szParm) Do
       proc_QuerySetString(':pParam'+IntToStr(iLoop+1),szParm[iLoop]);
    Prepare;
    Open;
    If IsEmpty Then Exit;
    First;
    cbTemp.Clear;
    While NOT Eof Do Begin
      sTmp :='';
      For iLoop := 1 To iFieldCnt Do Begin
        sData :=  Fields.FieldByNumber(iLoop).AsString;
        sTmp := sTmp + sData;
        i    := Length(sData);
        While i < 40 Do Begin
          INC(i);
          sTmp := sTmp + ' ';
        End;
      End;
      cbTemp.Items.Add(sTmp);
      Next;
    End; // WHILE END
    Close;
  End; // WITH END
  result := True;
End;

{  �̸�    : func_GetQtyToCombo_2
   ���    : ���̺� �����޾� �޹ڽ��� ���� �־��ش�.
   �μ�    : cbTemp : �ڵ���� �ְ����ϴ� FlatComboBox;
             sCode  : String; iLen : Integer
   �����  : ���ϰ����ϴ� ���̸�ŭ�� �ڵ尪
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_GetQtyToCombo_2(cbTemp : TComboBox;
                                      sQuery : String;
                                      szParm : Array Of String;
                                      iFieldCnt: Integer=2) :Boolean;

var
  i: Integer;
  iLoop : Integer;
  sSQL, sTmp: String;
  sData     : String;
begin
  result := False;
  //COMM_Query := dmDMS.qryLOCAL;
  With COMM_Query  Do Begin
    Close;
    SQL.Clear;
    sSQL := sQuery;
    SQL.Add(sSQL);
    For iLoop :=0 To High(szParm) Do
       proc_QuerySetString(':pParam'+IntToStr(iLoop+1),szParm[iLoop]);
    Prepare;
    Open;
    If IsEmpty Then Exit;
    First;
    cbTemp.Clear;
    cbTemp.Items.Add('��ü');
    While NOT Eof Do Begin
      sTmp :='';
      For iLoop := 1 To iFieldCnt Do Begin
        sData :=  Fields.FieldByNumber(iLoop).AsString;
        sTmp := sTmp + sData;
        i    := Length(sData);
        While i < 40 Do Begin
          INC(i);
          sTmp := sTmp + ' ';
        End;
      End;
      cbTemp.Items.Add(sTmp);
      Next;
    End; // WHILE END
    Close;
  End; // WITH END
  result := True;
End;

procedure TdmDMS.DataModuleCreate(Sender: TObject);
begin
  Database1.Connected := False;

  DASIni :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'DBCNF.ini');
  try
    with DASIni do begin
      sSERVER_NAME := ReadString('DAS', 'SERVER NAME',  '52.79.56.98');
      sPASSWORD    := ReadString('DAS', 'SERVER PASS',  'tsvr2201@pts');
      
      Database1.Params.Values['SERVER NAME'] := sSERVER_NAME;
      Database1.Params.Values['PASSWORD']    := sPASSWORD;
    end;
  except
    DASIni.Free;
  end;
end;

end.
