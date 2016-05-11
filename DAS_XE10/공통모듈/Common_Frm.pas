{*******************************************************************************
 * Project       :
 * Unit ��	 : mlCommon
 * ���		 : ������ ��� �������� ���Ǿ����� ���ν����� �Լ�����.
 * �ۼ���	 : �����
 * �ۼ���	 : 2004-07-22
 * �����̷�
 * -----------------------------------------------------------------------------
 *   ��������     ������   ��������
 * -----------------------------------------------------------------------------
     2005-08-10    Shim    1. func_CommaToInt, func_IntToComma, func_StrToInt
                              �Լ� mICommon���� Copy

 *******************************************************************************}
unit Common_Frm;

interface

uses  SysUtils,Forms,Dialogs,Windows,ExtCtrls, Grids, RxFileUtil, Buttons,
     Classes, StdCtrls, Messages, Graphics, Controls, Mask,MaskUtils, ComCtrls, RxCurrEdit,Imm;
     type
    THanMode = (Hangul,English,Japan,Other,Hanja);
type
  Ttest =class
private
protected
  procedure MyOnKeyPress(Sender: TObject; var Key: Char);
  procedure MyOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  procedure MyOnCloseQuery(Sender: TObject; var CanClose: Boolean);
  procedure MyOnbtnSearch(Sender: TObject);
  procedure MyOnbtnInsert(Sender: TObject);
  procedure MyOnbtnUpdate(Sender: TObject);
  procedure MyOnbtnSave(Sender: TObject);
  procedure MyOnbtnDelete(Sender: TObject);
  procedure MyOnbtnCancel(Sender: TObject);
  procedure MyOnbtnPrint(Sender: TObject);
  procedure MyOnbtnSetPrint(Sender: TObject);
  procedure MyOnbtnExcel(Sender: TObject);
  procedure MyOnbtnClose(Sender: TObject);
  procedure MyOnHint(Sender: TObject);
  procedure MyDoActiveControl(Sender: TObject);
  procedure MyFormDestroy(Sender: TObject);
  procedure WMMenuChar(var MessageRec: TWMMenuChar); message WM_MENUCHAR;


end;

Const
//== Message Box ===============================================================
  OK       = MB_OK       + MB_DEFBUTTON1 + MB_ICONINFORMATION + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_TASKMODAL
  ERROK    = MB_OK       + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_SYSTEMMODAL
  OKCANCEL = MB_OKCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_APPLMODAL
  YESNO    = MB_YESNO    + MB_DEFBUTTON1 + MB_ICONQUESTION    + MB_SYSTEMMODAL + MB_TASKMODAL;  //  MB_SYSTEMMODAL
//==============================================================================
  ACTIVECOLOR   = clYellow  ; // Active Cursor Color
  ERRORCOLOR    = clRed     ; // Error�׸�Color
  DEACTIVECOLOR = clWindow  ; // Default Cursor Color
  DISABLECOLOR  = clBtnFace ;
//==============================================================================
//���� �߰�
//==============================================================================
  SG_BANDS_PRIMARYCOLOR   = clWindow;  // AdvStringgrid Bands Primary Color
  SG_BANDS_SECONDARYCOLOR = $00F6F6F6; // AdvStringgrid Bands Secondary Color
  ST_JP_BG_COLOR          = $00F2EDBD; // ������ǰ ���� strategy jepum color background
  ST_STOP_BG_COLOR        = clRED;     // �ֹ�����        strategy jepum color background
  ST_ASS_BG_COLOR         = $00D9D9FF; // �����Ҵ� ����
  OV_JP_FONT_COLOR        = clRed;     // �����ֹ� ��ǰ ��Ʈ ��
  OV_JP_FONT_STYLE        = fsBold;    // �����ֹ� ��ǰ ��Ʈ ��Ÿ��
//==============================================================================

  {* User Function & Procedure *}
//����� �߰�
  function func_SetPCSystemTime(tDati: TDateTime): Boolean;
//-------------------------------------------------------------------------------
//Component ����
//-------------------------------------------------------------------------------
  function func_ClearForm (Const mFORM : TForm) : Boolean;                      // ���� ������Ʈ�� �ʱ�ȭ
  function func_GetCurrLine(Control:TCustomEdit): Integer;                      // �޸��忡�� ����Ŀ���� ���ι�ȣ�� ��� �Լ�
  function func_ScrollMemo(Control:TCustomEdit; iKey:Word) : Integer;           // �޸��忡�� PageUp�� PageDown�� Ű����� �����ϴ� �Լ�
  function func_MedToDtp(DateTimePicker ,MaskEdit: TObject; sDate_old : String ): Boolean;

  procedure proc_OnEnterColor(Sender: TObject);                                 // �׸� Ŀ���� ��ġ�ϴ� ��쿡 �׸��ǻ��� �����Ѵ�
  procedure proc_OnExitColor(Sender: TObject);                                  // �׸� Ŀ���� ���������� ��쿡 �׸��ǻ��� �����Ѵ�



  //Window ����
  function func_ShowMsg(sMsg, sCap: string; iType: Integer): Boolean;           // �޼����� ǥ���ϴ� �Լ�

  procedure proc_SetHanMode(NewMode : THanMode);                                // �ѿ������ȯ
  //��Ÿ ����
  procedure  proc_SetDateFmt;

{===============================================================================
   ����� �߰� ������ �Լ�
     --2003.11.12 ����� func_GetVersion ���������߰�
     --20040117 ����� �ġ �Լ� �߰�
================================================================================}
  procedure proc_Btn_Sts( Form_Mode : char;
                          Job_Sts   : char;
                          Sts_YN    : char ;
                          Prt,Exel  : boolean);
//  procedure proc_Btn_Obj(Obj :Array of TObject);
  procedure proc_SetBtnMode(btnSts:Array of Boolean);
  procedure proc_Form_init;
  procedure proc_FrmModeInit(iFrmCnt : Integer   );
  procedure proc_SetBtnInit(azBtn:array  of Tobject);
  procedure proc_Btn_Mode(iIndex     : Integer;  //������ġ
                          cForm_Mode : Char;     //������ ���
                          bPrint     : Boolean;  //����Ʈ��ư Ȱ������
                          bExcel     : Boolean); //�׼���ư Ȱ������

  procedure proc_OnActiveEnterColor(Sender: TObject);
  procedure proc_OnActiveExitColor(Sender: TObject);
  procedure proc_OnDisableColor(Sender: TObject; bOpt: Boolean);
  procedure proc_Frm_Clear(Sender: TObject; iClear_Tag: Integer=-1);
  procedure proc_Grp_Clear(    Sender : TObject;
                           iClear_Tag : Integer=-1;
                           bTag       : Boolean=False );


  procedure proc_Pnl_Clear( Sender     : TObject;
                            iClear_Tag : Integer=-1;
                            bTag       : Boolean=False );

  procedure proc_Btn_Enable(f3,f4,f5,f6,f7,f8,f9,f10,f11: Boolean);

  Function  func_ObjNullChk(Obj :Array of TObject):Boolean;

  procedure proc_data_distinction(strBUFF, strGUBUN : String; var arrDATA :Array of String; var intSEND : Integer);
  procedure proc_StatusMSG(sMSG : String);

  // 2005.08.10 jiny
  Function  func_Date_10_8(str :string):String;                                // '1997/01/01' -> '19970101'
  Function  func_Date_8_10(str, ins_char :string):String;                      // '19970101' -> '1997/01/01'

  procedure proc_LockKeys_Control(const pLockKeys : integer; pUsed : Integer = 2);
var

  gsoldDate           : String; //���ڰ���
  gdYmdEnter          : Boolean;
  test                : Ttest;
//-----------------------------------------------------------------------------
//             �����̺�Ʈ�� ����ä�� ó�� �ϱ����� ����
//-----------------------------------------------------------------------------
  gOldEdit            : TComponent;
  gOldMAskEdit        : TComponent;
  gOldComboBox        : TComponent;
  gOldMemo            : TComponent;
  gOldCheckBox        : TComponent;
  gOldDateTimePicker  : TComponent;
  gOldShape           : TComponent;
  gOldTCurrencyEdit   : TComponent;
  gOldLabelEdit       : TComponent;

  gChForm             : TForm;       //����� ���� ģȯ ����
  gChStatusBar        : TStatusBar=nil;
  gbPrint             : Boolean;     //��¼���
  gbExcel             : Boolean;     //�׼�����
  gbBtn_Set           : Boolean;     //��ư���¸� ǥ������ �۾��Ұ����� ����
  gsErrMsg            : String;      //�����Ҷ� ��������
  gBtn_Index          : Integer;
  giMaxCnt            : Integer;     //��ü ������

  gbUnClose           : Boolean;      //�ڽ�â ������ ����


  gszArrayForm_Mode : Array of Char;
  gszArrayBtn_Mode  : Array of Char;
  gszArrayJob_Mode  : Array of Char;
  gszArrayQuery_YN  : Array of Char;

  gszBtn : Array of Tobject;           //����üũ�� ��ü�� ����
  gszEnt : Array Of TNotifyEvent;
//-----------------------------------------------------------------------------
//             �����̺�Ʈ�� ����ä�� ó�� �ϱ����� ����
//-----------------------------------------------------------------------------

  OriginalKeyDown         : TKeyEvent;       //��Ű �̺�Ʈ
  OriginalKeyPress        : TKeyPressEvent;  //��Ű �̺�Ʈ



  OriginalOnCloseQuery    : TCloseQueryEvent;//�ݱ�
  OriginalOnbtnSearch     : TNotifyEvent;    //��ȸ
  OriginalOnbtnInsert     : TNotifyEvent;    //�ű�
  OriginalOnbtnUpdate     : TNotifyEvent;    //����
  OriginalOnbtnSave       : TNotifyEvent;    //����
  OriginalOnbtnDelete     : TNotifyEvent;    //����
  OriginalOnbtnCancel     : TNotifyEvent;    //���
  OriginalOnbtnPrint      : TNotifyEvent;    //���
  OriginalOnbtnSetPrint   : TNotifyEvent;    //����Ʈ����
  OriginalOnbtnExcel      : TNotifyEvent;    //�׼�
  OriginalOnbtnClose      : TNotifyEvent;    //�ݱ�



implementation

uses rxStrUtils, Winsock, utMsgBox;

{== ����,�ð� ����       user define function & procedure ======================}


{  �̸�    : func_CalcDateTimeToMin
   ���    : FromTime���� ToTime������ �а��
   �μ�    : From �ð�, To �ð�
   �����  : �� �ð����� ��(��)
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_CalcDateTimeToMin (FromTime, ToTime: TDateTime ) : LongInt;
var
    FromTimeStamp, ToTimeStamp : TTimeStamp;
begin
    FromTimeStamp := DateTimeToTimeStamp(FromTime);
    ToTimeStamp   := DateTimeToTimeStamp(ToTime);

    Result := (ToTimeStamp.Date - FromTimeStamp.Date) * 24 * 60
            + ( (ToTimeStamp.Time div 60000) - (FromTimeStamp.Time div 60000) )
end;




{== Component       ���� user define function & procedure ======================}

{  �̸�    : func_ClearForm
   ���    : ȭ������ ������ �⺻������Ʈ�� ���� Clear
   �μ�    : �ʱ�ȭ ��Ű�����ϴ� ���̸�
   �����  : �����۵��� True��ȯ
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_ClearForm (Const mFORM : TForm) : Boolean;
var
    i : Integer;
begin
    With mFORM do Begin
       For i := 0 To ComponentCount -1 Do Begin
         If Components[i] Is TEdit Then              //�⺻ ������Ʈ
            TEdit(Components[i]).Text := ''
         Else If Components[i] Is TStaticText Then
            TStaticText(Components[i]).Caption := ''
         Else If Components[i] Is TCheckBox Then
            TCheckBox(Components[i]).Checked := False
         Else If Components[i] Is TComBobox Then
            TCombobox(Components[i]).Text := ''
         Else If Components[i] Is TMaskEdit Then
            TMaskEdit(components[i]).text := ''
         Else If Components[i] Is TMemo Then
            TMemo(components[i]).Clear
         Else If Components[i] Is TDateTimePicker Then
            TDateTimePicker(components[i]).Date := Now
         Else If Components[i] Is TCurrencyEdit Then
            TCurrencyEdit(components[i]).Value := 0
       End;
    End;
    result := True;
end;

{  �̸�    : func_GetCurrLine
   ���    : �޸��忡�� ����Ŀ���� ���ι�ȣ�� ��� �Լ�
   �μ�    : Control:�޸����� �̸�
   �����  : ���ι�ȣ�� ������
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_GetCurrLine( Control : TCustomEdit) : Integer;
begin
    result := Control.Perform(EM_LINEFROMCHAR,Control.selstart ,0);
end;

{  �̸�    : func_ScrollMemo
   ���    : �޸��忡�� PageUp�� PageDown�� Ű����� �����ϴ� �Լ�
   �μ�    : Control:�޸����� �̸�; iKey:PageUp, PageDownKey�� ������
   �����  : PageUp, PageDownKey�� �������Ŀ� �̵��� ������
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_ScrollMemo(Control:TCustomEdit; iKey:Word) : Integer;
var
    iResult : Integer;
begin
    iResult := 0;
    If iKey = VK_PRIOR Then iResult := Control.Perform(EM_SCROLL,SB_PAGEUP,0);
    If iKey = VK_NEXT  Then iResult := Control.Perform(EM_SCROLL,SB_PAGEDOWN,0);
    Result := iResult;
end;

{  �̸�    : func_SeekComboItem
   ���    : ã�����ϴ� ���ڿ��� �޺��ڽ����� ���ڿ��� ���Ͽ� �������� ã����
   �μ�    : mCOMBOBOX: �޺��ڽ���; mSEEK : ã�� ���ڿ�
   �����  : ã�� ���ڿ��� ���� �ε����� ã�� ���ڿ��� ������.
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_SeekComboItem( Const mCOMBOBOX: TComBoBox;
                             Const mSEEK : String) : Byte;
var
    i, iLen : Byte;
begin
    iLen := length(mSeek);
    If iLen = 0 Then begin
        mCOMBOBOX.Text := '';
        Result := 0;
        Exit;
    End;
    For i := 0 To mCOMBOBOX.Items.Count - 1 Do Begin
       If mSEEK = Copy(mCOMBOBOX.Items[i],1,iLen) Then Begin
          mCOMBOBOX.ItemIndex := i;
          result := i;
          Exit;
       End;
    End;
    result := 0;
end;

{  �̸�    : func_SeekListItem
   ���    : ã�����ϴ� ���ڿ��� ����Ʈ�ڽ����� ���ڿ��� ���Ͽ� �������� ã����
   �μ�    : mLISTBOX: ����Ʈ�ڽ���; mSEEK : ã�� ���ڿ�
   �����  : ã�� ���ڿ��� ���� �ε����� ã�� ����.
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_SeekListItem(Const mLISTBOX : TListBox; Const mSEEK : String) : Byte;
var
    i, iLen : Byte;
begin
    iLen := length(mSeek);
    If iLen = 0 Then Begin
        mLISTBOX.ItemIndex  := -1;
        Result := 0;
        Exit;
    End;
    For i := 0 To mLISTBOX.Items.Count - 1 Do Begin
       If mSEEK = Copy(mLISTBOX.Items[i],1,iLen) Then Begin
          mLISTBOX.ItemIndex := i;
          result := i;
          Exit;
       End;
    End;
    Result := 0;
end;

{  �̸�    : proc_OnEnterColor
   ���    : �׸� Ŀ���� ��ġ�ϴ� ��쿡 �׸��ǻ��� �����Ѵ�
   �μ�    : Sender: TObject (Focus�� ���� ������Ʈ ��)
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_OnEnterColor(Sender: TObject);
begin
  If Sender is TEdit         Then With Sender As TEdit       Do Color      := ACTIVECOLOR ;
  If Sender is TMAskEdit     Then With Sender As TMAskEdit   Do Color      := ACTIVECOLOR ;
  If Sender is TComboBox     Then With Sender As TComboBox   Do Color      := ACTIVECOLOR ;
  If Sender is TMemo         Then With Sender As TMemo       Do Color      := ACTIVECOLOR ;
  If Sender is TCheckBox     Then With Sender As TCheckBox   Do Font.Color := clBlue ;
  If Sender is TDateTimePicker Then With Sender As TDateTimePicker Do Color := ACTIVECOLOR ;
  If Sender is TShape          Then With Sender As TShape          Do Brush.Color := ACTIVECOLOR ;
  If Sender is TCurrencyEdit   Then With Sender As TCurrencyEdit   Do Color := ACTIVECOLOR ;
end;

{  �̸�    : proc_OnExitColor
   ���    : �׸� Ŀ���� ���������� ��쿡 �׸��ǻ��� �����Ѵ�
   �μ�    : Sender: TObject(�̵��� �׸��)
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_OnExitColor(Sender: TObject);
begin
  If Sender is TEdit         Then With  Sender As TEdit       Do  Color      := DEACTIVECOLOR;
  If Sender is TMAskEdit     Then With  Sender As TMAskEdit   Do  Color      := DEACTIVECOLOR;
  If Sender is TComboBox     Then With  Sender As TComboBox   Do  Color      := DEACTIVECOLOR;
  If Sender is TMemo         Then With  Sender As TMemo       Do  Color      := DEACTIVECOLOR;
  If Sender is TCheckBox     Then With  Sender As TCheckBox   Do  font.Color := clBlack;


  If Sender is TDateTimePicker Then With Sender As TDateTimePicker Do Color := DEACTIVECOLOR ;
  If Sender is TShape          Then With Sender As TShape          Do Brush.Color := DEACTIVECOLOR ;
  If Sender is TCurrencyEdit   Then With Sender As TCurrencyEdit   Do Color := DEACTIVECOLOR ;
end;

function func_SetPCTime(tDate: TDateTime): Boolean;
var
    tSetDati: TDateTime;
    vDatiBias: Variant;
    tTZI: TTimeZoneInformation;
    tST: TSystemTime;
begin
    GetTimeZoneInformation(tTZI);
    vDatiBias := tTZI.Bias / 1440;
    tSetDati := tDate + vDatiBias;
    With tST Do Begin
       wYear   := StrToInt(FormatDateTime('yyyy', tSetDati));
       wMonth  := StrToInt(FormatDateTime('mm',   tSetDati));
       wDay    := StrToInt(FormatDateTime('dd',   tSetDati));
       wHour   := StrToInt(FormatDateTime('hh',   tSetDati));
       wMinute := StrToInt(FormatDateTime('nn',   tSetDati));
       wSecond := StrToInt(FormatDateTime('ss',   tSetDati));
       wMilliseconds := 0;
    End;
    result := SetSystemTime(tST);
end;


{  �̸�    : func_ShowMsg
   ���    : �޼����� ǥ���ϴ� �Լ�
   �μ�    : sMsg:�޼���, sCap:Title��Caption��; iType: �޼���ǥ�������� ������
   �����  : OK�� Yes
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   2005.08.01  ������   �޼��� ���̾�α� ���� (API�� ����)
}
{
function func_ShowMsg(sMsg, sCap: string; iType: Integer): Boolean;
var
    iRlt: integer;
begin
//    Case iType Of
//       OK:       iRlt := MessageDlg(sMsg, mtWarning,[mbOK],0);
//       ERROK:    iRlt := MessageDlg(sMsg, mtError,[mbOK],0);
//       OKCANCEL: iRlt := MessageDlg(sMsg, mtConfirmation, [mbOK, mbCANCEL],0);
//       YESNO:    iRlt := MessageDlg(sMsg, mtConfirmation, [mbYES, mbNO],0);
//    End;
//    func_ShowMsg := (Rlt = mrOK) or (Rlt = mrYES);


    iRlt := Application.MessageBox(PChar(sMsg),PChar(sCap),iType);
    func_ShowMsg := (iRlt = IDOK) or (iRlt = IDYES);
end;
}

{  �̸�    : func_ShowMsg
   ���    : �޼����� ǥ���ϴ� �Լ�
   �μ�    : sMsg:�޼���, sCap:Title��Caption��; iType: �޼���ǥ�������� ������
   �����  : OK�� Yes
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   2005.08.01  ������   �޼��� ���̾�α� ���� (API�� ����)
}
function func_ShowMsg(sMsg, sCap: string; iType: Integer): Boolean;
begin
    func_ShowMsg := fmMsgBox.func_Msgbox(sMsg, sCap, iType);
end;


{  �̸�    : proc_SetHanMode
   ���    : ��,����� ��ȯ
   �μ�    : NewMode : (Hangul:�ѱ� English:���� Japan:�Ϻ���)
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_SetHanMode(NewMode : THanMode);
var
    tMode : HIMC;
begin
//  FHan := NewMode;
    tMode := ImmGetContext(application.handle);
    case NewMode of
       Hangul  : ImmSetConversionStatus(tMode ,IME_CMODE_HANGEUL,IME_CMODE_HANGEUL);
       English : ImmSetConversionStatus(tMode ,IME_CMODE_ALPHANUMERIC,IME_CMODE_ALPHANUMERIC);
       Japan   : ImmSetConversionStatus(tMode ,IME_CMODE_KATAKANA,IME_CMODE_KATAKANA);
    end;
end;





{*****************************************************************************
*   �� �� ��  :SetBtnInit
*   �Լ� ��� :��ư �����ʱ�ȭ
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.30
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure proc_SetBtnInit(azBtn:array  of Tobject);
    procedure Event_init(iIndex: Integer;  ChBtn: Tobject;chEvent : TNotifyEvent);
    begin
        If (ChBtn Is  TSpeedButton) Then  Begin
           Case  iIndex Of
              0 : OriginalOnbtnSearch   :=(ChBtn  As TSpeedButton).OnClick;
              1 : OriginalOnbtnInsert   :=(ChBtn  As TSpeedButton).OnClick;
//              2 : OriginalOnbtnUpdate   :=(ChBtn  As TSpeedButton).OnClick;
              2 : OriginalOnbtnSave     :=(ChBtn  As TSpeedButton).OnClick;
              3 : OriginalOnbtnDelete   :=(ChBtn  As TSpeedButton).OnClick;
              4 : OriginalOnbtnCancel   :=(ChBtn  As TSpeedButton).OnClick;
              5 : OriginalOnbtnExcel    :=(ChBtn  As TSpeedButton).OnClick;
              6 : OriginalOnbtnSetPrint :=(ChBtn  As TSpeedButton).OnClick;
              7 : OriginalOnbtnPrint    :=(ChBtn  As TSpeedButton).OnClick;
           End;
           (ChBtn  As TSpeedButton).OnClick:=chEvent;
        End else
        If (ChBtn Is  TButton) Then Begin
           Case  iIndex Of
              0 : OriginalOnbtnSearch   :=(ChBtn  As TButton).OnClick;
              1 : OriginalOnbtnInsert   :=(ChBtn  As TButton).OnClick;
//              2 : OriginalOnbtnUpdate   :=(ChBtn  As TButton).OnClick;
              2 : OriginalOnbtnSave     :=(ChBtn  As TButton).OnClick;
              3 : OriginalOnbtnDelete   :=(ChBtn  As TButton).OnClick;
              4 : OriginalOnbtnCancel   :=(ChBtn  As TButton).OnClick;
              5 : OriginalOnbtnExcel    :=(ChBtn  As TButton).OnClick;
              6 : OriginalOnbtnSetPrint :=(ChBtn  As TButton).OnClick;
              7 : OriginalOnbtnPrint    :=(ChBtn  As TButton).OnClick;
           End;
           (ChBtn  As TButton).OnClick:=chEvent;
        End else
        If (ChBtn Is  TToolButton) Then Begin
           Case  iIndex Of
              0 : OriginalOnbtnSearch   :=(ChBtn  As TToolButton).OnClick;
              1 : OriginalOnbtnInsert   :=(ChBtn  As TToolButton).OnClick;
//              2 : OriginalOnbtnUpdate   :=(ChBtn  As TToolButton).OnClick;
              2 : OriginalOnbtnSave     :=(ChBtn  As TToolButton).OnClick;
              3 : OriginalOnbtnDelete   :=(ChBtn  As TToolButton).OnClick;
              4 : OriginalOnbtnCancel   :=(ChBtn  As TToolButton).OnClick;
              5 : OriginalOnbtnExcel    :=(ChBtn  As TToolButton).OnClick;
              6 : OriginalOnbtnSetPrint :=(ChBtn  As TToolButton).OnClick;
              7 : OriginalOnbtnPrint    :=(ChBtn  As TToolButton).OnClick;
           End;
           (ChBtn  As TToolButton).OnClick:=chEvent;
        End;
    end;
var
    Loop    : Integer;
    iMaxCnt : Integer;
begin
    gbBtn_Set := True;
    iMaxCnt   := high(azBtn);
    giMaxCnt  := iMaxCnt;
    SetLength(gszEnt , iMaxCnt + 1); //
    SetLength(gszBtn , iMaxCnt + 1); //
    //�̺�Ʈ ����ä��

    For Loop :=0 To iMaxCnt  Do begin
       gszBtn[Loop]:= azBtn[Loop];
       Case  Loop Of
          0 :gszEnt[Loop]  := test.MyOnbtnSearch  ;
          1 :gszEnt[Loop]  := test.MyOnbtnInsert  ;
//          2 :gszEnt[Loop]  := test.MyOnbtnUpdate  ;
          2 :gszEnt[Loop]  := test.MyOnbtnSave    ;
          3 :gszEnt[Loop]  := test.MyOnbtnDelete  ;
          4 :gszEnt[Loop]  := test.MyOnbtnCancel  ;
          5 :gszEnt[Loop]  := test.MyOnbtnExcel   ;
          6 :gszEnt[Loop]  := test.MyOnbtnSetPrint;
          7 :gszEnt[Loop]  := test.MyOnbtnPrint   ;
       End;
       If Loop < iMaxCnt Then
          Event_init(Loop,gszBtn[Loop],gszEnt[Loop])
    End;
end;

{*****************************************************************************
*   �� �� ��  :proc_SetBtnMode
*   �Լ� ��� :��ư ���¼���
*   Parameters:
*   Retrun    :
*   �� �� ��  : �� ����
*   �� �� ��  : 2002.03.30
******************************************************************************
    ��������           ���� �� ����                                   ������
******************************************************************************}
procedure proc_SetBtnMode(btnSts:Array of Boolean);
//------------------------------------------------------------------------------
    procedure pr_BtnSts(iIndex: Integer;Btn: Tobject; bSts: Boolean);
    Begin
        if (Btn Is  TSpeedButton) Then  Begin
           (Btn As TSpeedButton).Enabled:= bSts;
        End Else
        If (Btn Is  TButton) Then Begin
           (Btn As TButton).Enabled:= bSts;
        End else
        If (Btn Is  TToolButton) Then Begin

          { If bSts then
             (Btn As TToolButton).ImageIndex:=iIndex
           Else
             (Btn As TToolButton).ImageIndex:=iIndex+iCnt;
          }
           (Btn As TToolButton).Enabled:= bSts;


        End;
    End;
//------------------------------------------------------------------------------
var
    iLoop : Integer;
begin

    For iLoop :=0 To high(btnSts) - 1 Do Begin
       pr_BtnSts(iLoop,gszBtn[iLoop],btnSts[iLoop]);
    end;
end;


{================================================================================
  2003.11.05 ����� ���� �� ���� �κ� �߰�
================================================================================}
{  �̸�    : proc_Form_init
   ���    : ������ ������ ��ü
   �μ�    :  Sender : ��   PageControl:������ ��Ʈ��   StatusBar:���¹�
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure proc_Form_init;
begin
    With gChForm Do  Begin
       proc_SetDateFmt;
       gOldEdit          := Nil;
       gOldMAskEdit      := Nil;
       gOldComboBox      := Nil;
       gOldMemo          := Nil;
       gOldCheckBox      := Nil;
       gOldDateTimePicker:= Nil;
       gOldShape         := Nil;
       gOldTCurrencyEdit := Nil;
       gOldLabelEdit     := Nil;

       Application.Onhint := Test.MyOnHint;
       Screen.OnActiveControlChange := Test.MyDoActiveControl; //��Ʈ�� ���� ��������
       KeyPreview       := True;
       OriginalKeyPress :=OnKeyPress;
       OnKeyPress       :=test.MyOnKeyPress;
       OriginalKeyDown  :=OnKeyDown;           //
       onKeyDown        := test.MyOnKeyDown;         //
       OnDestroy        := test.MyFormDestroy;    //
       If  gChStatusBar<>Nil Then gChStatusBar.Panels[0].Text := Name;
    End;

end;

{================================================================================
  2003.11.05 ����� ���� �� ���� �κ� �߰�
================================================================================}
{  �̸�    : proc_Form_init
   ���    : ������ ������ ��ü
   �μ�    :  Sender : ��   PageControl:������ ��Ʈ��   StatusBar:���¹�
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure proc_FrmModeInit(iFrmCnt : Integer   );
Var
    iLoop : Integer;
begin
    gszArrayForm_Mode := Nil;
    SetLength(gszArrayForm_Mode,iFrmCnt);
    gszArrayBtn_Mode  := Nil;
    SetLength(gszArrayBtn_Mode,iFrmCnt);
    gszArrayQuery_YN  := Nil;
    SetLength(gszArrayQuery_YN,iFrmCnt);
    gszArrayJob_Mode :=Nil;
    SetLength(gszArrayJob_Mode,iFrmCnt);
    // Form�� ��ư �ʱ�ȭ  proc_Brn_Sts���� Job_STS�� 'C'�� �����ϱ� ���ؼ� ���� �����Ѵ�.
    For iLoop :=0 to iFrmCnt Do   Begin
       gszArrayBtn_Mode[iLoop]:='C';      // ��ư�迭
       gszArrayJob_Mode[iLoop]:='C';      // JOB_STS ��
    End;
end;
{  �̸�    : proc_Btn_Mode
   ���    : ������ ������  ��ư���� ����
   �μ�    : iIndex     : ȭ�鿡�� ������ ��ư ���� �迭��
             cForm_Mode : ������ ���� ('I': ���� 'Q' ��ȸ)
             bPrint     : ����Ʈ ��������
             bExcel     : �׼�

   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure proc_Btn_Mode(iIndex     : Integer;
                        cForm_Mode : Char;
                        bPrint     : Boolean;
                        bExcel     : Boolean);
Begin
    gBtn_Index:=iIndex;
    gszArrayForm_Mode[gBtn_Index] := cForm_Mode;
    gbPrint  := bPrint;
    gbExcel  := bExcel;

    If gbBtn_Set = True Then Begin
       proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
                    gszArrayBtn_Mode [gBtn_Index],
                    gszArrayQuery_YN [gBtn_Index],
                    gbPrint,
                    gbExcel);
    End;
End;

procedure proc_Btn_Enable(f3,f4,f5,f6,f7,f8,f9,f10,f11: Boolean);
begin
    proc_SetBtnMode([f3,f4,f5,f6,f7,f8,f9,f10,f11]);
end;

{  �̸�    : proc_Btn_Sts
   ���    : ��ư����
   �μ�    : Form_Mode  : ������ ���� ('I': ���� 'Q' ��ȸ)
             Job_Sts    : ��ư���� (Ȱ��ȭ,��Ȱ��ȭ)
             Sts_YN     : ��ȸ������� ���� ������ 'Y' ������ 'N'
             bPrint     : ����Ʈ ��������
             bExcel     : �׼�

   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure proc_Btn_Sts( Form_Mode : char; Job_Sts : char; Sts_YN : char ; Prt,Exel: boolean);
    procedure Btn_Enable(f3,f4,f5,f6,f7,f8,f9,f10,f11: Boolean);
    begin
        proc_SetBtnMode([f3,f4,f5,f6,f7,f8,f9,f10,f11]);
    end;
begin
    case Job_Sts of
      ' ' : Begin  //�ʱ�
               If gChStatusBar<> Nil Then Begin
                  With (gChStatusBar) Do Begin
//                     Panels[2].Text :='';
                  End;
               End;
               Btn_Enable(True,True,False,False,True,Exel,Prt,Prt,True );
            End;
      'C' : Begin  //���
               With (gChStatusBar) Do Begin
 //                  Panels[2].Text :='';
               End;
               If Form_Mode='P' Then Begin
                  Exit;
               End
               Else If Form_Mode='M' Then Begin
                  Btn_Enable(True ,True,False,False,True,Exel,Prt,Prt,True );
               End
               Else Begin
                  Btn_Enable(True ,False,False,False,True,Exel,Prt,Prt,True );
               End;
            End;
      'Q' : Begin //��ȸ
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='';
               End;
               case Form_Mode of
                 ' ' : Begin //��ȸ�۾� ��ư ���� ����
                          Btn_Enable(False,False,False,False,False ,Exel,Prt,Prt,True );
                       End;
                 'Q' : Begin //��ȸ�۾� ��ư ���� ����
                          If Sts_YN='Y'Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(True,False,False,False,True,Exel,Prt,Prt,True );
                          End //��ȸ�� �ڷᰡ �������
                          Else Begin
                             Btn_Enable(True,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       End;
                 'I' : begin //��ȸ,�Է� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else If Sts_YN='N' Then Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End
                          Else Begin
                             Btn_Enable(True,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       end;
                 'H' : begin //��ȸ,�Է� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else If Sts_YN='N' Then Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End
                          Else Begin
                             Btn_Enable(True,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'E' : Begin //��ȸ �Է� ���� �۾� ��ư ���� ����
                          If Sts_YN='Y'Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else Begin
                             Btn_Enable(True ,False ,False,False,False,Exel,Prt,Prt,True );
                          End;
                       End;
                 'F' : Begin //��ȸ �Է� ���� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin    //��ȸ�� �ڷᰡ �������  - ����, ����, ���, �ݱ�
                             Btn_Enable(False,False,True ,True,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������  - ��ȸ, ���, �ݱ�
                          Else Begin
                             Btn_Enable(True ,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       end;
                 'D' : Begin //��ȸ,���� �۾� ��ư ���� ����
                          If Sts_YN='Y'Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(True,False,False ,True,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else Begin
                             Btn_Enable(True ,False ,False,False,False ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'M' : Begin //��ȸ,���� �۾� ��ư ���� ����
                          If Sts_YN='Y'Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False ,False ,True ,False  ,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else Begin
                             Btn_Enable(True ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'K' : Begin //��ȸ,���� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False ,False ,True ,False,True ,Exel,Prt,Prt,True );
                          End else //��ȸ�� �ڷᰡ �������
                          Begin
                            Btn_Enable(True ,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       End;
                 'N' : Begin //��ȸ,���� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ ������� - �ű�, ����(True). ����(False)
                             Btn_Enable(False ,True ,True ,False ,True ,Exel,Prt,Prt,True );
                          End else //��ȸ�� �ڷᰡ ������� - �ű�(True). ����,����(False)
                          Begin
                             Btn_Enable(True ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'A' : Begin //��ȸ,���� �۾� ��ư ���� ����
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ ������� - �ű�, ����(True). ����(False)
                             Btn_Enable(False ,True ,True , True ,True ,Exel,Prt,Prt,True );
                          End else //��ȸ�� �ڷᰡ ������� - �ű�(True). ����,����(True)
                          Begin
                             Btn_Enable(True ,True ,False,True,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'O' : Begin //
                          If Sts_YN='Y' Then Begin
                          //��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //��ȸ�� �ڷᰡ �������
                          Else Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'S' : Begin //
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,False ,False,True  ,Exel,Prt,Prt,True );
                          End else //��ȸ�� �ڷᰡ �������
                          Begin
                             Btn_Enable(True ,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;

                 'L' : Begin //
                          If Sts_YN='Y' Then Begin//��ȸ�� �ڷᰡ �������
                             Btn_Enable(False,False,False ,True,True   ,Exel,Prt,Prt,True );
                          End else //��ȸ�� �ڷᰡ �������
                          Begin
                             Btn_Enable(True ,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'P' : Begin //
                           Btn_Enable(False ,False ,False,False,True ,Exel,Prt,Prt,True );
                       End;
               End;
            End;
      'I' : Begin //�ű�
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='�ű�';
               End;
               Case Form_Mode of
                  'N' : Begin // �ű��϶��� �ݱ��ư�� Ȱ��ȭ
                           Btn_Enable(False ,True ,True ,False ,True ,Exel,Prt,Prt,True );
                        End;
                  'H' : Begin // �ű��϶��� �ݱ��ư�� Ȱ��ȭ
                           Btn_Enable(True ,False ,False ,False ,True ,Exel,Prt,Prt,True );
                        End;
                  Else Begin
                     Btn_Enable(False,False,True,False ,True,Exel,Prt,Prt,True );
                  End;
               End;
            End;
      'E' : Begin //����
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='����';
               End;
               Btn_Enable(False,False,False,True ,True ,Exel,Prt,Prt,True );
            End;
    End;
end;

procedure Ttest.MyOnKeyPress(Sender: TObject; var Key: Char);
Begin
    If (key = #13) then Begin
       key := #0;
    End;
End;

procedure Ttest.MyOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function fn_ObjSts(iIndex: Integer;  ChBtn: Tobject):Boolean;
    begin
        Result := False;
        If (ChBtn Is  TSpeedButton) Then  Begin
           Case  iIndex Of
              0 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              1 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              2 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              3 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              4 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              5 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              6 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
              7 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
//              8 : If  (ChBtn As  TSpeedButton).Enabled=True Then Result := True;
           End;

        End else
        If (ChBtn Is  TButton) Then Begin
           Case  iIndex Of
              0 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              1 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              2 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              3 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              4 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              5 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              6 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
              7 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
//              8 :  If  (ChBtn As  TButton).Enabled=True Then Result := True;
           End;

        End else
        If (ChBtn Is  TToolButton) Then Begin
           Case  iIndex Of
              0 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              1 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              2 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              3 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              4 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              5 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              6 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
              7 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
//              8 : If  (ChBtn As  TToolButton).Enabled=True Then Result := True;
           End;

        End;
    end;


begin

  Case Key Of
    7         : Begin
                   Key :=0;
                End;
    VK_F1     : Begin
                   If fn_ObjSts(0,gszBtn[0]) Then Begin
                      Test.MyOnbtnSearch(Self);//��ȸ
                   End;
                End;
    VK_F2     : Begin
                   If fn_ObjSts(0,gszBtn[1]) Then Begin
                      Test.MyOnbtnInsert(Self);//�ű�
                   End;
                End;
    VK_F3     : Begin
                   If fn_ObjSts(0,gszBtn[2]) Then Begin
                      Test.MyOnbtnSave(Self); //����
                   End;
                End;
    VK_F4     : Begin
                   If fn_ObjSts(0,gszBtn[3]) Then Begin
                      Test.MyOnbtnDelete(Self);//����
                   End;
                End;
    VK_F5     : Begin
                   If fn_ObjSts(0,gszBtn[4]) Then Begin
                      Test.MyOnbtnCancel(Self);//���
                   End;
                End;
    VK_F6     : Begin
                   If fn_ObjSts(0,gszBtn[5]) Then Begin
                      Test.MyOnbtnExcel(Self);//����
                   End;
                End;
    VK_F7    : Begin
                   If fn_ObjSts(0,gszBtn[6]) Then Begin
                      Test.MyOnbtnSetPrint(Self);//����Ʈ
                   End;
                End;
    VK_F8     : Begin
                   If fn_ObjSts(0,gszBtn[7]) Then Begin
                      Test.MyOnbtnPrint(Self);//�׼�
                   End;
                End;
{    VK_F9    : Begin
                   If fn_ObjSts(0,gszBtn[8]) Then Begin
                      Test.MyOnbtnClose(Self);//�ݱ�
                   End;
                End;
}
    VK_RETURN : Begin
                   If (not ((Sender as TForm).ActiveControl is TStringGrid)) and (key>0) then Begin       { if not on a TDBGrid }
                      If (not((Sender as TForm).ActiveControl is TMemo))  Then Begin
                         SendMessage( (Sender as TForm).Handle, WM_NEXTDLGCTL, 0, 0);
                      End;
                   End
                   else
                   begin
                      If fn_ObjSts(0,gszBtn[0]) Then Begin
                         //Test.MyOnbtnSearch(Self);//��ȸ
                      End;
                   end;
                End
  End;



end;
{  �̸�    : MyOnCloseQuery
   ���    : ���� �۾��� �̷�������� �����Ұ����� üũ
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    Res : Variant;
begin
    If gszArrayBtn_Mode=Nil Then Exit;
    If gszArrayBtn_Mode[gBtn_Index] In ['I','E'] Then Begin
       //���� �� �Է��� �߻����� ��� ó��
       Res := Application.MessageBox('������ �۾������� �ֽ��ϴ�. �����Ͻðڽ��ϱ�?'
                                    ,'�۾� Ȯ��',
                                     MB_ICONINFORMATION+MB_YESNOCANCEL);  //�Ϲ� ����
       If Res = ID_YES Then Begin
          //���� �� �ݱ�
          If Assigned(OriginalOnbtnSave) Then Begin
              OriginalOnbtnSave(Sender);
          End;
          Exit;
       End Else If Res=ID_CANCEL Then Begin
          CanClose:=False;
       //���
       End Else If Res =  ID_NO Then Begin
          //�ݱ�
       End;

    End;
//    gbCanClose:=CanClose;
{    If Assigned(OriginalOnCloseQuery) Then Begin
       OriginalOnCloseQuery(Sender, CanClose);
    End;
 }
end;
{  �̸�    : MyOnbtnSearch
   ���    : ��ȸ �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnSearch(Sender: TObject);
begin
    gsErrMsg := '';
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnSearch) Then Begin
          OriginalOnbtnSearch(Sender);
       End;
       Exit;
    End;
    gszArrayQuery_YN[gBtn_Index] := ' ';
    gszArrayBtn_Mode[gBtn_Index] := 'Q';
    gszArrayJob_Mode[gBtn_Index] := 'Q';
    If Assigned(OriginalOnbtnSearch) Then Begin
       OriginalOnbtnSearch(Sender);
    End;

    If (gsErrMsg<>'') Then Begin
//       func_ShowMsg(gsErrMsg,'��ȸ����',ERROK);
       Exit;
    End;
    Case gszArrayForm_Mode[gBtn_Index] Of
       ' ': gszArrayForm_Mode[gBtn_Index]:='Q';
       'M': gszArrayBtn_Mode[gBtn_Index] :='Q';
    End;


    proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
            gszArrayBtn_Mode[gBtn_Index],
            gszArrayQuery_YN[gBtn_Index],
            gbPrint,
            gbExcel);
    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);

end;
{  �̸�    : MyOnbtnInsert
   ���    : �ű� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnInsert(Sender: TObject);
begin
    gsErrMsg:='';
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnInsert) Then Begin
          OriginalOnbtnInsert(Sender);
       End;
       Exit;
    End;
    If Assigned(OriginalOnbtnInsert) Then Begin
       OriginalOnbtnInsert(Sender);
    End;
    If gsErrMsg<>'' Then Begin
//       func_ShowMsg(gsErrMsg,'���忡��',ERROK);
       Exit;
    End;
    gszArrayJob_Mode[gBtn_Index] :='I';
    gszArrayBtn_Mode[gBtn_Index] :='I';
    proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
            gszArrayBtn_Mode[gBtn_Index],
            gszArrayQuery_YN[gBtn_Index],
            gbPrint,
            gbExcel);

    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);

end;
{  �̸�    : MyOnbtnUpdate
   ���    : ���� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnUpdate(Sender: TObject);
begin
    gsErrMsg := '';
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnUpdate) Then  Begin
          OriginalOnbtnUpdate(Sender);
       End;
       Exit;
    End;

    If Assigned(OriginalOnbtnUpdate) Then  Begin
       OriginalOnbtnUpdate(Sender);
    End;
    If gsErrMsg<>'' Then Begin
//       func_ShowMsg(gsErrMsg,'��������',ERROK);
       Exit;
    End;
    gszArrayBtn_Mode[gBtn_Index] :='E';
    gszArrayJob_Mode[gBtn_Index] :='E';
    proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
            gszArrayBtn_Mode[gBtn_Index],
            gszArrayQuery_YN[gBtn_Index],
            gbPrint,
            gbExcel);

    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);

end;
{  �̸�    : MyOnbtnSave
   ���    : ���� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   2005.08.12  Shim     1. ������ �� �Ŀ� ȭ���� �ʱ�ȭ �ϱ� ���ϼ�
                            gszArrayQuery_YN[gBtn_Index] = 'Y' ������ �ּ�ó���ϰ�
                            If �������� üũ��.

}

procedure Ttest.MyOnbtnSave(Sender: TObject);
begin
    gsErrMsg := '';
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnSave) then
       Begin
          OriginalOnbtnSave(Sender);
       End;
       Exit;
    End;
    If Assigned(OriginalOnbtnSave) then
    Begin
       OriginalOnbtnSave(Sender);
    End;
    If gsErrMsg<>'' Then Begin
//       func_ShowMsg(gsErrMsg,'���忡��',ERROK);
       Exit;
    End;

    // ������ �� �Ŀ� ȭ���� �ʱ�ȭ �ϱ� ���ϼ� �߰���. 2005.08.12 Shim
    If gszArrayQuery_YN[gBtn_Index] = 'C' then
    Begin
       OriginalOnbtnCancel(Sender);
    End;

//    gszArrayQuery_YN[gBtn_Index] :=' ';  2005.08.12 Shim
    gszArrayBtn_Mode[gBtn_Index] :='Q';
    proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
                 gszArrayBtn_Mode[gBtn_Index],
                 gszArrayQuery_YN[gBtn_Index],
                 gbPrint,
                 gbExcel);
    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);

end;
{  �̸�    : MyOnbtnDelete
   ���    : ���� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnDelete(Sender: TObject);
begin
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnDelete) Then Begin
          OriginalOnbtnDelete(Sender);
       End;
       Exit;
    End;
    gsErrMsg := '';
    If MessageDlg('�ش� �ڷḦ ���� �Ͻðڽ��ϱ�?', mtCustom, [mbYes, mbNo], 0) = mrNo Then Begin
       Exit;
    End;
    If gsErrMsg='' Then Begin
       gszArrayBtn_Mode[gBtn_Index] :='Q';
       proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
               gszArrayBtn_Mode[gBtn_Index],
               gszArrayQuery_YN[gBtn_Index],
               gbPrint,
               gbExcel);
    End;
    If Assigned(OriginalOnbtnDelete) Then Begin
       OriginalOnbtnDelete(Sender);
    End;
    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);
end;
{  �̸�    : MyOnbtnCancel
   ���    : ��� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnCancel(Sender: TObject);
begin
    gsErrMsg := '';
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnCancel) then
       Begin
          OriginalOnbtnCancel(Sender);
       End;
       Exit;
    End;
    gszArrayBtn_Mode[gBtn_Index] :='Q';
    If gszArrayForm_Mode[gBtn_Index]='M' then Begin
        gszArrayBtn_Mode[gBtn_Index] :=' ';
    End;
    If Assigned(OriginalOnbtnCancel) then
    Begin
       OriginalOnbtnCancel(Sender);
    End;
    If  gsErrMsg = '' Then Begin
       proc_Btn_Sts(gszArrayForm_Mode[gBtn_Index],
               gszArrayBtn_Mode[gBtn_Index],
               gszArrayQuery_YN[gBtn_Index],
               gbPrint,
               gbExcel);
    End;
    If  Assigned(gChForm.OnDeactivate) Then gChForm.OnDeactivate(Sender);
end;

{  �̸�    : MyOnbtnPrint
   ���    : ��� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnPrint(Sender: TObject);
begin
    If Not(gbBtn_Set) Then Begin
       If Assigned(OriginalOnbtnPrint) then
       Begin
          OriginalOnbtnPrint(Sender);
       End;
       Exit;
    End;
    If Assigned(OriginalOnbtnPrint) Then Begin
       OriginalOnbtnPrint(Sender);
    End;
end;
{  �̸�    : MyOnbtnSetPrint
   ���    : ����Ʈ ���� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure Ttest.MyOnbtnSetPrint(Sender: TObject);
begin
    If Assigned(OriginalOnbtnSetPrint) Then  Begin
       OriginalOnbtnSetPrint(Sender);
    End;
end;
{  �̸�    : MyOnbtnExcel
   ���    : �׼� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnExcel(Sender: TObject);
begin
    If Assigned(OriginalOnbtnExcel) then  Begin
       OriginalOnbtnExcel(Sender);
    End;
end;
{  �̸�    : MyOnbtnClose
   ���    : �ݱ� �۾�
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnClose(Sender: TObject);
begin
    If Assigned(OriginalOnbtnClose) Then Begin
       OriginalOnbtnClose(Sender);
    End
    Else Begin
       gChForm.Close;
    End;
end;

procedure Ttest.WMMenuChar(var MessageRec: TWMMenuChar);
begin
    inherited;
    MessageRec.Result := MakeLong(0, 1);
end;


procedure Ttest.MyOnHint(Sender: TObject);
{ ��Ʈ�� Display ��Ű�� ���ؼ�}
begin
    If (gChStatusBar <> Nil) Then
       gChStatusBar.Panels[1].Text:= Application.Hint;
end;

procedure Ttest.MyFormDestroy(Sender: TObject);
Var
    iLoop : Integer;
begin
    If gChStatusBar<> Nil Then Begin
       With (gChStatusBar) Do Begin
          For iLoop := 0 To Panels.Count-1 Do
             Panels[iLoop].Text :='';
       End;
    End;
    Screen.OnActiveControlChange :=Nil;
    gChForm := Nil;

end;

{  �̸�    : MyDoActiveControl
   ���    : ��ü ��������

   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure Ttest.MyDoActiveControl(Sender: TObject);
  procedure pr_Color(Sender: TObject ; tmpCOL : TColor);
  Begin
    If Sender is  TShape    Then Begin
      With Sender As TShape   Do Brush.Color := tmpCOL ;
      Exit;
    End;
    If Sender is  TMAskEdit    Then Begin
      With Sender As TMAskEdit   Do Color := tmpCOL ;
      Exit;
    End;

    If Sender is  TDateTimePicker    Then Begin
      With Sender As TDateTimePicker          Do Color := tmpCOL ;
      Exit;
    End;
    If Sender is  TEdit    Then Begin
      With Sender As TEdit  Do Begin
         If ReadOnly Then Exit;
         Color := tmpCOL ;
      End;
      Exit;
    End;
  End;
var
  sComp  : String;
  tmpCOL : TColor;

begin

 // ������ focus�� �ִ� control�� White ��������
    If (gChForm=Nil)   Then Exit;
    With (gChForm) Do Begin
       tmpCOL :=  ACTIVECOLOR;
       proc_OnActiveExitColor(Sender);
       If activeControl is TEdit Then Begin
          sComp := Copy(TEdit(activeControl).Name,4,Length(TEdit(activeControl).Name)-1);
          pr_Color(TShape(FindComponent('shp' + sComp)) ,tmpCOL);
       End;
       // ����Ʈ ������Ʈ ����
       proc_OnActiveEnterColor(Sender);
       If activeControl is TDateTimePicker Then Begin
          gdYmdEnter := True;
          sComp := Copy(TDateTimePicker(activeControl).Name,4,Length(TDateTimePicker(activeControl).Name)-1);
          pr_Color(TMAskEdit(FindComponent('met' + sComp)) ,tmpCOL);
       End;
       If activeControl is TMAskEdit Then Begin
          sComp := Copy(TMAskEdit(activeControl).Name,4,Length(TMAskEdit(activeControl).Name)-1);
          pr_Color(TDateTimePicker(FindComponent('dtp' + sComp)) ,tmpCOL);
          pr_Color(TShape(FindComponent('shp' + sComp)) ,tmpCOL);
          pr_Color(TEdit(FindComponent('edt' + sComp)) ,tmpCOL);
       End;
       If activeControl is TCurrencyEdit Then Begin
          sComp := Copy(TCurrencyEdit(activeControl).Name,4,Length(TCurrencyEdit(activeControl).Name)-1);
          pr_Color(TDateTimePicker(FindComponent('edt' + sComp)) ,tmpCOL);
          pr_Color(TShape(FindComponent('shp' + sComp)) ,tmpCOL);
          pr_Color(TEdit(FindComponent('edt' + sComp)) ,tmpCOL);
       End;
    End;
end;

{  �̸�    : proc_OnActiveExitColor
   ���    : ���� ��ü ���� ����
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}


procedure proc_OnActiveExitColor(Sender: TObject);
    procedure pr_Color(Sender: TObject ; tmpCOL : TColor);
    Begin
       If Sender is  TShape    Then Begin
          With Sender As TShape   Do Brush.Color := tmpCOL ;
          Exit;
       End;
       If Sender is  TMAskEdit    Then Begin
          With Sender As TMAskEdit   Do Color := tmpCOL ;
          Exit;
       End;

       If Sender is  TDateTimePicker    Then Begin
          With Sender As TDateTimePicker          Do Color := tmpCOL ;
          Exit;
       End;
       If Sender is  TEdit    Then Begin
          With Sender As TEdit          Do Begin
             If ReadOnly Then Exit;
             Color := tmpCOL ;
          End;
          Exit;
       End;
       If Sender is  TCurrencyEdit    Then Begin
          With Sender As TCurrencyEdit          Do Color := tmpCOL ;
          Exit;
       End;
    End;
Var
    rChColor : TColor;
    sComp    : String;

begin
    rChColor:= DEACTIVECOLOR;
    If (gChForm=Nil) Then Exit;
    With (gChForm) Do Begin
       If assigned(gOldEdit)       Then Begin
          With  gOldEdit     As TEdit       Do  Color      := $00E0C1B6;
       End;
       If assigned(gOldLabelEdit)       Then Begin
          With  gOldLabelEdit     As TLabeledEdit       Do  Color      := $00E0C1B6;
       End;
       If assigned(gOldComboBox)   Then With  gOldComboBox As TComboBox   Do  Color      := rChColor;
       If assigned(gOldMemo)       Then With  gOldMemo     As TMemo       Do  Color      := rChColor;
       If assigned(gOldCheckBox)   Then With  gOldCheckBox As TCheckBox   Do  font.Color := clBlack;
       If assigned(gOldTCurrencyEdit)   Then Begin
          sComp := Copy(gOldTCurrencyEdit.Name,4,Length(gOldTCurrencyEdit.Name)-1);
          With  gOldTCurrencyEdit As TCurrencyEdit   Do  Color      := rChColor;
          pr_Color(TShape(FindComponent('shp' + sComp)), rChColor);
       End;
       If assigned(gOldDateTimePicker)  Then Begin
          With gOldDateTimePicker As TDateTimePicker Do Color := rChColor ;
          sComp := Copy(gOldDateTimePicker.Name,4,Length(gOldDateTimePicker.Name)-1);
          pr_Color(TMAskEdit(FindComponent('met' + sComp)), rChColor);
       End;
       If assigned(gOldMAskEdit)   Then Begin
          sComp := Copy(gOldMAskEdit.Name,4,Length(gOldMAskEdit.Name)-1);
          If assigned(TDateTimePicker(FindComponent('dtp' + sComp))) Then Begin
//             If Pos('YMD',UpperCase((gOldMAskEdit As TMAskEdit).Name)) >0 Then Begin
{
                If gbData = True Then Begin
                   If func_MedToDtp(TDateTimePicker(FindComponent('dtp' + sComp)),gOldMAskEdit,gsoldDate) Then Begin
                      gbData := False;
                   End
                   Else Begin
                      gbData := False;
                     // SendMessage( (gOldMAskEdit As TMAskEdit).Handle, WM_SETFOCUS, 0, 0);
                      (gOldMAskEdit As TMAskEdit).SetFocus;
                   End;
                End;
}
//             End;
             pr_Color(TDateTimePicker(FindComponent('dtp' + sComp)), rChColor);
          End;
          With  gOldMAskEdit As TMAskEdit   Do  Color      := rChColor;
          pr_Color(TShape(FindComponent('shp' + sComp)), rChColor);
       End;
    End;
end;

{  �̸�    : proc_OnActiveEnterColor
   ���    : Ȱ��ȭ�� ��ü ���� ����
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

procedure proc_OnActiveEnterColor(Sender: TObject);
Var
    sComp : String;
begin
    If (gChForm=Nil) Then Exit;
    With (gChForm)  Do Begin
       If activeControl is TEdit       Then Begin
          With activeControl As TEdit       Do Begin
             If ReadOnly Then Exit;
             Color      := ACTIVECOLOR ;
          End;
          gOldEdit :=  activeControl As TEdit;
       End;
       If activeControl is TComboBox   Then Begin
          With activeControl As TComboBox   Do Color      := ACTIVECOLOR ;
          gOldComboBox :=activeControl As TComboBox;
       End;
       If activeControl is TMemo       Then Begin
          With activeControl As TMemo       Do Color      := ACTIVECOLOR ;
          gOldMemo := activeControl As TMemo;
       End;
       If activeControl is TCheckBox   Then Begin
          With activeControl As TCheckBox   Do Font.Color := clBlue ;
          gOldCheckBox := activeControl As TCheckBox;
       End;
       If activeControl is TDateTimePicker Then Begin
          gdYmdEnter := True;
          sComp := Copy(TDateTimePicker(activeControl).Name,4,Length(TDateTimePicker(activeControl).Name)-1);
          With activeControl As TDateTimePicker Do Color := ACTIVECOLOR ;
          gOldDateTimePicker := activeControl As TDateTimePicker;
          func_MedToDtp((activeControl As TDateTimePicker),TMAskEdit(FindComponent('met' + sComp)),gsoldDate);
       End;
       If activeControl is TCurrencyEdit Then Begin
          With activeControl As TCurrencyEdit Do Color := ACTIVECOLOR ;
          gOldTCurrencyEdit := activeControl As TCurrencyEdit;
       End;
       If activeControl is TMAskEdit   Then Begin
          sComp := Copy(TMAskEdit(activeControl).Name,4,Length(TMAskEdit(activeControl).Name)-1);
          With activeControl As TMAskEdit   Do Color      := ACTIVECOLOR ;
          gOldMAskEdit := activeControl As TMAskEdit;
          If FindComponent('dtp' + sComp) Is  TDateTimePicker Then Begin
//           If (Pos('YMD',UpperCase((activeControl As TMAskEdit).Name)) >0) Then Begin//And (gbData=False) Then Begin
             gsoldDate    := (activeControl As TMAskEdit).Text;
             func_MedToDtp(TDateTimePicker(FindComponent('dtp' + sComp)),(activeControl As TMAskEdit),gsoldDate);
          End;
       End;
       If activeControl is TLabeledEdit       Then Begin
          With activeControl As TLabeledEdit       Do Begin
             If ReadOnly Then Exit;
             Color      := ACTIVECOLOR ;
          End;
          gOldLabelEdit :=  activeControl As TLabeledEdit;
       End;
    End;
end;

{  �̸�    : proc_OnDisableColor
   ���    : �׷�ڽ��� ������ ��ü ���� ����
   �μ�    : Sender: TObject(�̵��� �׸��)
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_OnDisableColor(Sender: TObject; bOpt: Boolean);
  procedure pr_Color(Sender: TObject ; Obj_Name : String; tmpCOL : TColor);
  var
    iLoop : Integer;
    tG  : TGroupBox;
    iMax: Integer;
  Begin
    tG  := (Sender As TGroupBox);
    iMax :=(Sender As TGroupBox).ControlCount -1;
    For iLoop := 0 to iMax Do Begin
      With tG Do Begin
        If Controls[iLoop] is  TShape    Then Begin
          If (Controls[iLoop] As  TShape).Name ='shp'+Obj_Name Then  Begin
            With Controls[iLoop] As TShape   Do Brush.Color := tmpCOL ;
            Exit;
          End;
        End;
        If Controls[iLoop] is  TDateTimePicker    Then Begin
          If (Controls[iLoop] As  TDateTimePicker).Name ='dtp'+Obj_Name Then  Begin
            With Controls[iLoop] As TDateTimePicker          Do Color := tmpCOL ;
            Exit;
          End;
        End;
        If Controls[iLoop] is  TEdit    Then Begin
          If (Controls[iLoop] As  TEdit).Name ='edt'+Obj_Name Then  Begin
            With Controls[iLoop] As TEdit          Do Color := tmpCOL ;
            Exit;
          End;
        End;
        If Controls[iLoop] is  TMAskEdit    Then Begin
          If (Controls[iLoop] As  TMAskEdit).Name ='met'+Obj_Name Then  Begin
            With Controls[iLoop] As TMAskEdit          Do Color := tmpCOL ;
            Exit;
          End;
        End;

        If Controls[iLoop] is  TCurrencyEdit    Then Begin
          If (Controls[iLoop] As  TCurrencyEdit).Name ='edt'+Obj_Name Then  Begin
            With Controls[iLoop] As TCurrencyEdit          Do Color := tmpCOL ;
            Exit;
          End;
        End;
      End;
    End;
  End;
var
  tmpCOL : TColor;
  i      : Integer;
  sComp  : String;
  tG     : TGroupBox;
  iMax   : Integer;

begin
    If bOpt Then tmpCOL := DEACTIVECOLOR
    Else         tmpCOL := DISABLECOLOR;
    tG  := (Sender As TGroupBox);
    iMax :=(Sender As TGroupBox).ControlCount -1;
    tG.Enabled := bOpt;
    IF Not(bOpt) Then Begin
       gOldEdit          := Nil;
       gOldMAskEdit      := Nil;
       gOldComboBox      := Nil;
       gOldMemo          := Nil;
       gOldCheckBox      := Nil;
       gOldDateTimePicker:= Nil;
       gOldShape         := Nil;
       gOldTCurrencyEdit := Nil;
       gOldLabelEdit     := Nil;
    End;
    For i := 0 to   iMax Do Begin
      With tG Do Begin
        If Controls[i]  is TEdit  Then Begin
          With  Controls[i] As TEdit Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TEdit(Controls[i] ).Name,4,Length(TEdit(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;
        If Controls[i]  is TCurrencyEdit  Then Begin
          With  Controls[i] As TCurrencyEdit Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TCurrencyEdit(Controls[i] ).Name,4,Length(TCurrencyEdit(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;

        If Controls[i]  is TMAskEdit   Then Begin
          With  Controls[i] As TMAskEdit   Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TMAskEdit(Controls[i] ).Name,4,Length(TMAskEdit(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;
        If Controls[i]  is TComboBox   Then Begin
          With  Controls[i] As TComboBox   Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TComboBox(Controls[i] ).Name,4,Length(TComboBox(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;

        If Controls[i]  is TMemo       Then Begin
          With  Controls[i] As TMemo       Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TMemo(Controls[i] ).Name,4,Length(TMemo(Controls[i] ).Name)-1);
          pr_Color(Sender ,'shp' + sComp,tmpCOL);
        End;
        If Controls[i]  is TCheckBox   Then Begin
          {With  Controls[i] As TCheckBox   Do Begin
            Color      := tmpCOL;
          End;
          }
          sComp := Copy(TCheckBox(Controls[i] ).Name,4,Length(TCheckBox(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;
        If Controls[i]  is TDateTimePicker Then Begin
          With Controls[i] As TDateTimePicker Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TDateTimePicker(Controls[i] ).Name,4,Length(TDateTimePicker(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;
        If Controls[i]  is TLabeledEdit  Then Begin
          With  Controls[i] As TLabeledEdit Do Begin
            Color      := tmpCOL;
          End;
          sComp := Copy(TLabeledEdit(Controls[i] ).Name,4,Length(TLabeledEdit(Controls[i] ).Name)-1);
          pr_Color(Sender , sComp,tmpCOL);
        End;
      End;
    End;
end;
{  �̸�    : proc_Frm_Clear
   ���    : ���� ������ ������ ��ü �ʱ�ȭ
   �μ�    : Sender: TObject  ,iClear_Tag : �ʱ�ȭȰ ��ü tag ����
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Frm_Clear(Sender : TObject; iClear_Tag: Integer);
var
    iLoop : Integer;
begin
    If Sender Is TForm Then Begin
       For iLoop := 0 to (Sender As TForm).ControlCount -1 Do Begin
          With Sender As TForm Do Begin
             If Controls[iLoop]  is TEdit  Then Begin
                With  Controls[iLoop] As TEdit Do Begin
                   If Tag = iClear_Tag Then Begin
                      Clear;
                   End;
                End;
             End;
             If Controls[iLoop]  is TMAskEdit   Then Begin
                With  Controls[iLoop] As TMAskEdit   Do Begin
                   If Tag = iClear_Tag Then Begin
                      Text :='';
                   End;
                End;
             End;
             If Controls[iLoop]  is TComboBox   Then Begin
                With  Controls[iLoop] As TComboBox   Do Begin
                   If Tag = iClear_Tag Then Begin
                      Clear;
                   End;
                End;
             End;
             If Controls[iLoop]  is TMemo       Then Begin
                With  Controls[iLoop] As TMemo       Do Begin
                   If Tag = iClear_Tag Then Begin
                      Clear;
                   End;
                End;
             End;
             If Controls[iLoop]  is TCheckBox   Then Begin
                With  Controls[iLoop] As TCheckBox   Do Begin
                   If Tag = iClear_Tag Then Begin
                   End;
                End;
             End;
             If Controls[iLoop]  is TDateTimePicker Then Begin
                With Controls[iLoop] As TDateTimePicker Do Begin
                   If Tag = iClear_Tag Then Begin

                   End;
                End;
             End;
             If Controls[iLoop]  is TLabel Then Begin
                With Controls[iLoop] As TLabel Do Begin
                   If Tag = iClear_Tag Then Begin
                      Caption := '';
                   End;
                End;
             End;
             If Controls[iLoop]  is TStaticText Then Begin
                With Controls[iLoop] As TStaticText Do Begin
                   If Tag = iClear_Tag Then Begin
                      Caption := '';
                   End;
                End;
             End;
             If Controls[iLoop]  is TCurrencyEdit Then Begin
                With Controls[iLoop] As TCurrencyEdit Do Begin
                   If Tag = iClear_Tag Then Begin
                      Text := '';
                   End;
                End;
             End;
             If Controls[iLoop]  is TLabeledEdit  Then Begin
                With  Controls[iLoop] As TLabeledEdit Do Begin
                   If Tag = iClear_Tag Then Begin
                      Clear;
                   End;
                End;
             End;
          End;
       End;
    End;
end;


{  �̸�    : proc_Grp_Clear
   ���    : �׷�ڽ��� ������ ��ü �ʱ�ȭ
   �μ�    : Sender: TObject  ,iClear_Tag : �ʱ�ȭȰ ��ü tag ����
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Grp_Clear(    Sender : TObject;
                         iClear_Tag : Integer;
                         bTag       : Boolean );
var
    iLoop : Integer;
    iMax  : Integer;
    tGrp  : TGroupBox;
//    tPan  :  TPanel;
    iRow  : Integer;
begin

     tGrp   := (Sender As TGroupBox);
     iMax := tGrp.ControlCount -1;
     //--------------------------------------------------------------------------
     //panel componet
     //--------------------------------------------------------------------------
     For iLoop := 0 to iMax  Do Begin
        With tGrp Do Begin
           If Controls[iLoop]  Is TStringGrid  Then Begin
                If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                   With  Controls[iLoop] As TStringGrid Do Begin
                      For iRow := FixedRows To RowCount -1 Do
                         Rows[iRow].Clear;
                      RowCount := 2;
                   End;
                End;
           End;
           If Controls[iLoop]  is TEdit  Then Begin
                With  Controls[iLoop] As TEdit Do Begin
                   If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                      Text:='';
                   End;
                End;
           End;
           If Controls[iLoop]  is TMAskEdit   Then Begin
              With  Controls[iLoop] As TMAskEdit   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Text :='';
                 End;
              End;
           End;
           If Controls[iLoop]  is TComboBox   Then Begin
              With  Controls[iLoop] As TComboBox   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                   // Clear;
                    ItemIndex := -1;
                 End;
              End;
           End;
           If Controls[iLoop]  is TMemo       Then Begin
              With  Controls[iLoop] As TMemo       Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Clear;
                 End;
              End;
           End;
           If Controls[iLoop]  is TCheckBox   Then Begin
              With  Controls[iLoop] As TCheckBox   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                 End;
              End;
           End;
           If Controls[iLoop]  is TDateTimePicker Then Begin
              With Controls[iLoop] As TDateTimePicker Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin

                 End;
              End;
           End;
           If Controls[iLoop]  is TStaticText Then Begin
              With Controls[iLoop] As TStaticText Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                     Caption := '';
                 End;
              End;
           End;

           If Controls[iLoop]  is TCurrencyEdit Then Begin
              With Controls[iLoop] As TCurrencyEdit Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Text := '';
                 End;
              End;
           End;
           If Controls[iLoop]  is TLabeledEdit  Then Begin
                With  Controls[iLoop] As TLabeledEdit Do Begin
                   If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                      Text:='';
                   End;
                End;
           End;
        End;
    End;
end;


{  �̸�    : proc_Grp_Clear
   ���    : �׷�ڽ��� ������ ��ü �ʱ�ȭ
   �μ�    : Sender: TObject  ,iClear_Tag : �ʱ�ȭȰ ��ü tag ����
   �����  : None
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure proc_Pnl_Clear(    Sender : TObject;
                         iClear_Tag : Integer;
                         bTag       : Boolean );
var
    iLoop : Integer;
    iMax  : Integer;
//    tGrp  : TGroupBox;
    tPan  :  TPanel;
    iRow  : Integer;
begin

     tPan   := (Sender As TPanel);
     iMax := tPan.ControlCount -1;
     //--------------------------------------------------------------------------
     //panel componet
     //--------------------------------------------------------------------------
     For iLoop := 0 to iMax  Do Begin
        With tPan Do Begin
           If Controls[iLoop]  Is TStringGrid  Then Begin
                If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                   With  Controls[iLoop] As TStringGrid Do Begin
                      For iRow := FixedRows To RowCount -1 Do
                         Rows[iRow].Clear;
                      RowCount := 2;
                   End;
                End;
           End;
           If Controls[iLoop]  is TEdit  Then Begin
                With  Controls[iLoop] As TEdit Do Begin
                   If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                      Text:='';
                   End;
                End;
           End;
           If Controls[iLoop]  is TLabeledEdit  Then Begin
                With  Controls[iLoop] As TLabeledEdit Do Begin
                   If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                      Text:='';
                   End;
                End;
           End;
           If Controls[iLoop]  is TMAskEdit   Then Begin
              With  Controls[iLoop] As TMAskEdit   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Text :='';
                 End;
              End;
           End;
           If Controls[iLoop]  is TComboBox   Then Begin
              With  Controls[iLoop] As TComboBox   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                   // Clear;
                    ItemIndex := -1;
                 End;
              End;
           End;
           If Controls[iLoop]  is TMemo       Then Begin
              With  Controls[iLoop] As TMemo       Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Clear;
                 End;
              End;
           End;
           If Controls[iLoop]  is TCheckBox   Then Begin
              With  Controls[iLoop] As TCheckBox   Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                 End;
              End;
           End;
           If Controls[iLoop]  is TDateTimePicker Then Begin
              With Controls[iLoop] As TDateTimePicker Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin

                 End;
              End;
           End;
           If Controls[iLoop]  is TStaticText Then Begin
              With Controls[iLoop] As TStaticText Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                     Caption := '';
                 End;
              End;
           End;

           If Controls[iLoop]  is TCurrencyEdit Then Begin
              With Controls[iLoop] As TCurrencyEdit Do Begin
                 If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                    Text := '';
                 End;
              End;
           End;
           If Controls[iLoop]  is TLabeledEdit  Then Begin
                With  Controls[iLoop] As TLabeledEdit Do Begin
                   If ((Tag = iClear_Tag)  And (bTag)) Or (bTag=False) Then Begin
                      Text:='';
                   End;
                End;
           End;
        End;
    End;
end;



{  �̸�    : proc_SetDateFmt
   ���    : ��¥��������
   �μ�    :
   �����  :
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
procedure  proc_SetDateFmt;
Begin
    FormatSettings.DateSeparator   := '-';
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
End;
{    �̸�  : func_ITF_Chkum
     ���  : 2 of 5 ���ڵ忡 üũ���� ���Ѵ�...
     �μ�  : �̵��� �׸��
   �����  :'-1' ���� Else ����
  �����̷� :
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   Ȧ�� *3
}
function func_ITF_Chkum(sTxt: string) : string;
Var
    i,iRes,iStr : Integer;
Const
    szArryGAJUNG : Array[0..1] Of Integer = (1,3);
begin
    iRes := 0;
    iStr := length(sTxt) Mod 2;
    If iStr = 1 Then Begin
        For i := 1 to length(sTxt) Do Begin
           iRes := iRes + StrtoInt(sTxt[i]) * szArryGAJUNG[i mod 2];
        End;
        If IntToStr(10-(iRes Mod 10)) = '10' Then Result := '0'
        Else Result := IntToStr(10-(iRes Mod 10));
    End
    Else Result := '-1';
end;
{    �̸�  : func_AppIsAlreadyRunning
     ���  : ���α׷��� �Ϲ��� �����Ҽ� ����
     �μ�  : �̵��� �׸��
   �����  :'-1' ���� Else ����
  �����̷� :
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

function func_AppIsAlreadyRunning(const sUniqueText: String): Boolean;
begin
    if OpenMutex(MUTEX_ALL_ACCESS,False,PChar(sUniqueText)) <> 0 then
    Result := True
    else
    Result := (CreateMutex(nil,False,PChar(sUniqueText)) = 0);
end;
{    �̸�  : func_SetPCSystemTime
     ���  : ������ ��¥�� �ð��� TDateTime �� ��
     �μ�  :
   �����  :Boolean������ True �̸� ���� ���� False �̸� ����
  �����̷� :
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}
function func_SetPCSystemTime(tDati: TDateTime): Boolean;
var
   tSetDati: TDateTime;
   vDatiBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
   GetTimeZoneInformation(tTZI);
   vDatiBias := tTZI.Bias / 1440;
   tSetDati := tDati + vDatiBias;
   With tST do  begin
      wYear   := StrToInt(FormatDateTime('yyyy', tSetDati));
      wMonth  := StrToInt(FormatDateTime('mm',   tSetDati));
      wDay    := StrToInt(FormatDateTime('dd',   tSetDati));
      wHour   := StrToInt(FormatDateTime('hh',   tSetDati));
      wMinute := StrToInt(FormatDateTime('nn',   tSetDati));
      wSecond := StrToInt(FormatDateTime('ss',   tSetDati));
      wMilliseconds := 0;
   end;
   func_SetPCSystemTime := SetSystemTime(tST);
end;
{    �̸�  : func_PortAlive
     ���  : ������ ������ �Ǿ��ִ��� Ȯ��
     �μ�  :
   �����  :Boolean������ True �̸� ���� ���� False �̸� ����
  �����̷� :
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}

function func_PortAlive(sHost:String;sPort:String) : Boolean;
var
    OSocket: TSocket;
    Live_in: TSockAddrIn;
    GInitData : TWSADATA;
begin
    Result := False;
    If WSAStartup($101, GInitData) <> 0 then
       MessageBox(0,PChar('WINSOCK.DLL�� ������ �ȵǾ����ϴ�.'+#13#10#13#10+
                          '(Windows ��Ʈ���κ��� ���ν��� �ϼ���)'),'�� ��',MB_OK or $0030);
    OSocket := Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    If OSocket = INVALID_SOCKET then
    Begin
       CloseSocket(OSocket);
       System.Exit;
    End;
    With Live_in do
    Begin
       FillChar(Live_in,Sizeof(Live_in),#0);
       sin_family := AF_INET;
//       sin_addr.s_addr := LongInt(inet_addr(PChar(sHost)));
       sin_addr.s_addr := LongInt(inet_addr(PAnsiChar(sHost)));
       sin_port := htons(StrToInt(sPort)); //StrToInt(Port);
    End;
    If Connect(OSocket,Live_in,sizeof(Live_in)) = SOCKET_ERROR then
    Begin
       If WSAGetLastError <> WSAEWOULDBLOCK then
       Begin
          CloseSocket(OSocket);
          System.Exit;
       End;
    End;
    CloseSocket(OSocket);
    Result := True;
end;

{  �̸�    : func_MedToDtp
   ���    : ����Ÿ���� MaskEdit�� Text�� �Բ����� TDateTimePicker�� ���ڸ� ����ȭ��Ŵ
   �μ�    : DateTimePicker: ����ȭ�Ǿ��� ����, MaskEdit: ����,
             sDate_old : Error�� �ǵ����� ���ڰ�.('YYYYMMDD' ����)
   �����  : MaskEdit�� Text�� DateTimePicker�� ���ڸ� ����ȭ
   �����̷�:
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
   2003-10-17 �����    1.�ۼ�
}
function func_MedToDtp(DateTimePicker ,MaskEdit: TObject; sDate_old : String ): Boolean;
var
    sDate    : string;
    sMaxDate : string;
    sMinDate : string;
begin
    Try
      result := True;
      sDate    := (MaskEdit As TMaskEdit).Text;
      If (Length(Trim(sDate))<>8) And (gdYmdEnter) Then exit;
      gdYmdEnter := False;
      If  Trim(sDate)='' Then Begin
         Exit;
      End;
      sMaxDate := '99991231';//�ִ�����
      sMinDate := FormatDateTime('YYYYMMDD',(DateTimePicker As TDateTimePicker).MinDate);//�ּ�����
      If (sDate='') and (trim(sDate_old)<>'')  then
      Begin
         //���� ��¥�� ȯ��
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      If (sMaxDate < sDate) then
      Begin
         showmessage(FormatMaskText('####-##-##;0',sMaxDate) +'���ں��� �۰� �Է��ؾ��մϴ�');
         result := False;
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      If sMinDate > sDate then
      Begin
         showmessage(FormatMaskText('####-##-##;0',sMinDate) +'���ں��� ũ�� �Է��ؾ��մϴ�');
         result := False;
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      (DateTimePicker As TDateTimePicker).date := StrTodate(FormatMaskText('####-##-##;0',sDate));
    Except
      On EConvertError Do Begin
//          gbData := False;
          Showmessage('��¥ ���Ŀ��� Ȯ���� �ٽ� �Է��� �ֽʽÿ�');
          (MaskEdit As TMaskEdit).Text := sDate_old;
          Result := False;
          Exit;
      End;
    end;
 //   gbData := True;
    (MaskEdit As TMaskEdit).Text := FormatDateTime('YYYYMMDD', (DateTimePicker As TDateTimePicker).Date);

end;
{    �̸�  : func_ObjNullChk
     ���  : ��ü�� ���� �ִ��� üũ
     �μ�  :
   �����  :Boolean������ True �̸�  ���� False �̸� ���� �Է������ʾ���
  �����̷� :
   -----------------------------------------------------------------------------
   ��������   ������    ��������
   -----------------------------------------------------------------------------
}


Function func_ObjNullChk(Obj :Array of TObject): Boolean;
var
    iLoop      : Integer;
    MaxobjCnt : Integer;
//    sCaption  : String;
    chTlbl    : TLabel;
begin
    Result := True;
    MaxobjCnt := High(Obj);
    For iLoop :=0 to MaxobjCnt do
    begin
       If Obj[iLoop]  is TEdit  Then Begin
          With  Obj[iLoop] As TEdit Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                If Enabled Then Begin
                   SetFocus;
                End;
                Exit;
             End;
          End;
       End;
       If Obj[iLoop]  is TMAskEdit   Then Begin
          With  Obj[iLoop] As TMAskEdit   Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                If Enabled Then Begin
                   SetFocus;
                End;
                Exit;
             End;
          End;
       End;
       If Obj[iLoop]  is TComboBox   Then Begin
          With  Obj[iLoop] As TComboBox   Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                If Enabled Then Begin
                   SetFocus;
                End;
                Exit;
             End;
          End;
       End;
       If Obj[iLoop]  is TMemo       Then Begin
          With  Obj[iLoop] As TMemo       Do Begin
          End;
       End;
       If Obj[iLoop]  is TCheckBox   Then Begin
          With  Obj[iLoop] As TCheckBox   Do Begin
          End;
       End;
       If Obj[iLoop]  is TDateTimePicker Then Begin
          With Obj[iLoop] As TDateTimePicker Do Begin
          End;
       End;
       If Obj[iLoop]  is TStaticText Then Begin
          With Obj[iLoop] As TStaticText Do Begin
             If  (Caption='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                Exit;
             End;

          End;
       End;

       If Obj[iLoop]  is TCurrencyEdit Then Begin
          With Obj[iLoop] As TCurrencyEdit Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                If Enabled Then Begin
                   SetFocus;
                End;
                Exit;
             End;
          End;
       End;
       If Obj[iLoop]  is TLabeledEdit  Then Begin
          With  Obj[iLoop] As TLabeledEdit Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'�� �ʼ� �Է��׸��Դϴ�.!!!');
                If Enabled Then Begin
                   SetFocus;
                End;
                Exit;
             End;
          End;
       End;
    end;
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

{   �̸�	: pr_GetGrid
    ���	: �޼��� Display ��Ű�� ���ؼ�..
    �μ�	: ����
    �����	: ����
�����̷�	:
--------------------------------------------------------------------
��������     ������    ��������
--------------------------------------------------------------------
}
procedure proc_StatusMSG(sMSG : String);
begin
    If (gChStatusBar <> Nil) Then
       gChStatusBar.Panels[1].Text:= sMSG;
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
      S := Copy(S,1,4) + Copy(S,6,2) + Copy(S,9,2) ; //yyyymmdd
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
      S := Copy(S,1,4) + Ins_Char + Copy(S,5,2) +  Ins_Char + Copy(S,7,2) ; //yyyy/mm/dd
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


{    �̸� : proc_LockKeys_Control
     ��� : VirtualKeys���� Caps, Scroll, Num Key�� LOCK����
     �μ� : VK_CAPITAL, VK_NUMLOCK, VK_SCROLL�� ������, ��������
   ����� :
 �����̷� : --------------------------------------------------------------------
            ��������    ������     ����    ��������
            --------------------------------------------------------------------
}
procedure proc_LockKeys_Control(const pLockKeys : integer; pUsed : Integer = 2);
var
   KeyState : TKeyboardState;
begin
   GetKeyboardState(KeyState);
   case pUsed of
     0 : KeyState[pLockKeys] := 0; // OFF
     1 : KeyState[pLockKeys] := 1; // ON
     2 : KeyState[pLockKeys] := not KeyState[pLockKeys]; // ����
   end;
   SetKeyboardState(KeyState);
end;

end.


