{*******************************************************************************
 * Project       :
 * Unit 명	 : mlCommon
 * 기능		 : 델파이 언어 공통으로 사용되어지는 프로시져와 함수정의.
 * 작성자	 : 백민하
 * 작성일	 : 2004-07-22
 * 수정이력
 * -----------------------------------------------------------------------------
 *   수정일자     수정자   수정내역
 * -----------------------------------------------------------------------------
     2005-08-10    Shim    1. func_CommaToInt, func_IntToComma, func_StrToInt
                              함수 mICommon에서 Copy

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
  ERRORCOLOR    = clRed     ; // Error항목Color
  DEACTIVECOLOR = clWindow  ; // Default Cursor Color
  DISABLECOLOR  = clBtnFace ;
//==============================================================================
//색상 추가
//==============================================================================
  SG_BANDS_PRIMARYCOLOR   = clWindow;  // AdvStringgrid Bands Primary Color
  SG_BANDS_SECONDARYCOLOR = $00F6F6F6; // AdvStringgrid Bands Secondary Color
  ST_JP_BG_COLOR          = $00F2EDBD; // 전략제품 배경색 strategy jepum color background
  ST_STOP_BG_COLOR        = clRED;     // 주문금지        strategy jepum color background
  ST_ASS_BG_COLOR         = $00D9D9FF; // 강제할당 배경색
  OV_JP_FONT_COLOR        = clRed;     // 과다주문 제품 폰트 색
  OV_JP_FONT_STYLE        = fsBold;    // 과다주문 제품 폰트 스타일
//==============================================================================

  {* User Function & Procedure *}
//백민하 추가
  function func_SetPCSystemTime(tDati: TDateTime): Boolean;
//-------------------------------------------------------------------------------
//Component 관련
//-------------------------------------------------------------------------------
  function func_ClearForm (Const mFORM : TForm) : Boolean;                      // 폼의 콤포넌트를 초기화
  function func_GetCurrLine(Control:TCustomEdit): Integer;                      // 메모장에서 현재커서의 라인번호를 얻는 함수
  function func_ScrollMemo(Control:TCustomEdit; iKey:Word) : Integer;           // 메모장에서 PageUp과 PageDown을 키보드로 제어하는 함수
  function func_MedToDtp(DateTimePicker ,MaskEdit: TObject; sDate_old : String ): Boolean;

  procedure proc_OnEnterColor(Sender: TObject);                                 // 항목에 커서가 위치하는 경우에 항목의색을 변경한다
  procedure proc_OnExitColor(Sender: TObject);                                  // 항목에 커서가 빠져나가는 경우에 항목의색을 변경한다



  //Window 관련
  function func_ShowMsg(sMsg, sCap: string; iType: Integer): Boolean;           // 메세지를 표시하는 함수

  procedure proc_SetHanMode(NewMode : THanMode);                                // 한영모드전환
  //기타 관련
  procedure  proc_SetDateFmt;

{===============================================================================
   백민하 추가 폼제어 함수
     --2003.11.12 백민하 func_GetVersion 버전관리추가
     --20040117 백민하 쿡서치 함수 추가
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
  procedure proc_Btn_Mode(iIndex     : Integer;  //제어위치
                          cForm_Mode : Char;     //폼설정 모드
                          bPrint     : Boolean;  //프린트버튼 활성여부
                          bExcel     : Boolean); //액셀버튼 활성여부

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

  gsoldDate           : String; //일자관련
  gdYmdEnter          : Boolean;
  test                : Ttest;
//-----------------------------------------------------------------------------
//             폼을이벤트를 가로채서 처리 하기위해 생성
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

  gChForm             : TForm;       //폼제어를 위한 친환 변수
  gChStatusBar        : TStatusBar=nil;
  gbPrint             : Boolean;     //출력설정
  gbExcel             : Boolean;     //액셀설정
  gbBtn_Set           : Boolean;     //번튼상태를 표준으로 작업할것인지 여부
  gsErrMsg            : String;      //저장할때 에러여부
  gBtn_Index          : Integer;
  giMaxCnt            : Integer;     //객체 설정값

  gbUnClose           : Boolean;      //자식창 닫을지 여부


  gszArrayForm_Mode : Array of Char;
  gszArrayBtn_Mode  : Array of Char;
  gszArrayJob_Mode  : Array of Char;
  gszArrayQuery_YN  : Array of Char;

  gszBtn : Array of Tobject;           //상태체크할 객체값 설정
  gszEnt : Array Of TNotifyEvent;
//-----------------------------------------------------------------------------
//             폼을이벤트를 가로채서 처리 하기위해 생성
//-----------------------------------------------------------------------------

  OriginalKeyDown         : TKeyEvent;       //폼키 이벤트
  OriginalKeyPress        : TKeyPressEvent;  //폼키 이벤트



  OriginalOnCloseQuery    : TCloseQueryEvent;//닫기
  OriginalOnbtnSearch     : TNotifyEvent;    //조회
  OriginalOnbtnInsert     : TNotifyEvent;    //신규
  OriginalOnbtnUpdate     : TNotifyEvent;    //수정
  OriginalOnbtnSave       : TNotifyEvent;    //저장
  OriginalOnbtnDelete     : TNotifyEvent;    //삭제
  OriginalOnbtnCancel     : TNotifyEvent;    //취소
  OriginalOnbtnPrint      : TNotifyEvent;    //출력
  OriginalOnbtnSetPrint   : TNotifyEvent;    //프린트설정
  OriginalOnbtnExcel      : TNotifyEvent;    //액셀
  OriginalOnbtnClose      : TNotifyEvent;    //닫기



implementation

uses rxStrUtils, Winsock, utMsgBox;

{== 날자,시간 관련       user define function & procedure ======================}


{  이름    : func_CalcDateTimeToMin
   기능    : FromTime부터 ToTime까지의 분계산
   인수    : From 시간, To 시간
   결과값  : 두 시간값의 차(분)
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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




{== Component       관련 user define function & procedure ======================}

{  이름    : func_ClearForm
   기능    : 화면폼의 델파이 기본콤포넌트의 값을 Clear
   인수    : 초기화 시키고자하는 폼이름
   결과값  : 정상작동시 True반환
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}
function func_ClearForm (Const mFORM : TForm) : Boolean;
var
    i : Integer;
begin
    With mFORM do Begin
       For i := 0 To ComponentCount -1 Do Begin
         If Components[i] Is TEdit Then              //기본 콤포넌트
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

{  이름    : func_GetCurrLine
   기능    : 메모장에서 현재커서의 라인번호를 얻는 함수
   인수    : Control:메모장의 이름
   결과값  : 라인번호의 정수값
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}
function func_GetCurrLine( Control : TCustomEdit) : Integer;
begin
    result := Control.Perform(EM_LINEFROMCHAR,Control.selstart ,0);
end;

{  이름    : func_ScrollMemo
   기능    : 메모장에서 PageUp과 PageDown을 키보드로 제어하는 함수
   인수    : Control:메모장의 이름; iKey:PageUp, PageDownKey의 정수값
   결과값  : PageUp, PageDownKey을 실행한후에 이동한 정수값
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : func_SeekComboItem
   기능    : 찾고자하는 문자열을 콤보박스내의 문자열과 비교하여 같은것을 찾아줌
   인수    : mCOMBOBOX: 콤보박스명; mSEEK : 찾을 문자열
   결과값  : 찾은 문자열이 속한 인덱스를 찾아 문자열을 보여줌.
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : func_SeekListItem
   기능    : 찾고자하는 문자열을 리스트박스내의 문자열과 비교하여 같은것을 찾아줌
   인수    : mLISTBOX: 리스트박스명; mSEEK : 찾을 문자열
   결과값  : 찾은 문자열이 속한 인덱스를 찾아 지정.
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : proc_OnEnterColor
   기능    : 항목에 커서가 위치하는 경우에 항목의색을 변경한다
   인수    : Sender: TObject (Focus를 받은 콤포넌트 명)
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : proc_OnExitColor
   기능    : 항목에 커서가 빠져나가는 경우에 항목의색을 변경한다
   인수    : Sender: TObject(이동할 항목명)
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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


{  이름    : func_ShowMsg
   기능    : 메세지를 표시하는 함수
   인수    : sMsg:메세지, sCap:Title의Caption명; iType: 메세지표시형태의 정수값
   결과값  : OK나 Yes
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
   2005.08.01  박정진   메세지 다이얼로그 수정 (API로 변경)
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

{  이름    : func_ShowMsg
   기능    : 메세지를 표시하는 함수
   인수    : sMsg:메세지, sCap:Title의Caption명; iType: 메세지표시형태의 정수값
   결과값  : OK나 Yes
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
   2005.08.01  박정진   메세지 다이얼로그 수정 (API로 변경)
}
function func_ShowMsg(sMsg, sCap: string; iType: Integer): Boolean;
begin
    func_ShowMsg := fmMsgBox.func_Msgbox(sMsg, sCap, iType);
end;


{  이름    : proc_SetHanMode
   기능    : 한,영모드 전환
   인수    : NewMode : (Hangul:한글 English:영어 Japan:일본어)
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
*   함 수 명  :SetBtnInit
*   함수 기능 :버튼 상태초기화
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.03.30
******************************************************************************
    수정일자           내용 및 사유                                   수정자
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
    //이벤트 가료채기

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
*   함 수 명  :proc_SetBtnMode
*   함수 기능 :버튼 상태설정
*   Parameters:
*   Retrun    :
*   작 성 자  : 백 민하
*   작 성 일  : 2002.03.30
******************************************************************************
    수정일자           내용 및 사유                                   수정자
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
  2003.11.05 백민하 공통 폼 제어 부분 추가
================================================================================}
{  이름    : proc_Form_init
   기능    : 폼에서 제어할 객체
   인수    :  Sender : 폼   PageControl:패이지 컨트롤   StatusBar:상태바
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
       Screen.OnActiveControlChange := Test.MyDoActiveControl; //컨트롤 제어 색깔지정
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
  2003.11.05 백민하 공통 폼 제어 부분 추가
================================================================================}
{  이름    : proc_Form_init
   기능    : 폼에서 제어할 객체
   인수    :  Sender : 폼   PageControl:패이지 컨트롤   StatusBar:상태바
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
    // Form의 버튼 초기화  proc_Brn_Sts에서 Job_STS가 'C'로 설정하기 위해서 값을 설정한다.
    For iLoop :=0 to iFrmCnt Do   Begin
       gszArrayBtn_Mode[iLoop]:='C';      // 버튼배열
       gszArrayJob_Mode[iLoop]:='C';      // JOB_STS 값
    End;
end;
{  이름    : proc_Btn_Mode
   기능    : 폼에서 제어할  버튼상태 설정
   인수    : iIndex     : 화면에서 제어할 버튼 상태 배열값
             cForm_Mode : 폼상태 설정 ('I': 저장 'Q' 조회)
             bPrint     : 프리트 설정여부
             bExcel     : 액셀

   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : proc_Btn_Sts
   기능    : 버튼설정
   인수    : Form_Mode  : 폼상태 설정 ('I': 저장 'Q' 조회)
             Job_Sts    : 버튼상태 (활성화,비활성화)
             Sts_YN     : 조회했을경우 값이 있으면 'Y' 없으면 'N'
             bPrint     : 프리트 설정여부
             bExcel     : 액셀

   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}

procedure proc_Btn_Sts( Form_Mode : char; Job_Sts : char; Sts_YN : char ; Prt,Exel: boolean);
    procedure Btn_Enable(f3,f4,f5,f6,f7,f8,f9,f10,f11: Boolean);
    begin
        proc_SetBtnMode([f3,f4,f5,f6,f7,f8,f9,f10,f11]);
    end;
begin
    case Job_Sts of
      ' ' : Begin  //초기
               If gChStatusBar<> Nil Then Begin
                  With (gChStatusBar) Do Begin
//                     Panels[2].Text :='';
                  End;
               End;
               Btn_Enable(True,True,False,False,True,Exel,Prt,Prt,True );
            End;
      'C' : Begin  //취소
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
      'Q' : Begin //조회
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='';
               End;
               case Form_Mode of
                 ' ' : Begin //조회작업 버튼 상태 제어
                          Btn_Enable(False,False,False,False,False ,Exel,Prt,Prt,True );
                       End;
                 'Q' : Begin //조회작업 버튼 상태 제어
                          If Sts_YN='Y'Then Begin//조회된 자료가 있을경우
                             Btn_Enable(True,False,False,False,True,Exel,Prt,Prt,True );
                          End //조회된 자료가 없을경우
                          Else Begin
                             Btn_Enable(True,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       End;
                 'I' : begin //조회,입력 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else If Sts_YN='N' Then Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End
                          Else Begin
                             Btn_Enable(True,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       end;
                 'H' : begin //조회,입력 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else If Sts_YN='N' Then Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End
                          Else Begin
                             Btn_Enable(True,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'E' : Begin //조회 입력 수정 작업 버튼 상태 제어
                          If Sts_YN='Y'Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else Begin
                             Btn_Enable(True ,False ,False,False,False,Exel,Prt,Prt,True );
                          End;
                       End;
                 'F' : Begin //조회 입력 수정 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin    //조회된 자료가 있을경우  - 수정, 삭제, 취소, 닫기
                             Btn_Enable(False,False,True ,True,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우  - 조회, 취소, 닫기
                          Else Begin
                             Btn_Enable(True ,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       end;
                 'D' : Begin //조회,삭제 작업 버튼 상태 제어
                          If Sts_YN='Y'Then Begin//조회된 자료가 있을경우
                             Btn_Enable(True,False,False ,True,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else Begin
                             Btn_Enable(True ,False ,False,False,False ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'M' : Begin //조회,삭제 작업 버튼 상태 제어
                          If Sts_YN='Y'Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False ,False ,True ,False  ,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else Begin
                             Btn_Enable(True ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'K' : Begin //조회,수정 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False ,False ,True ,False,True ,Exel,Prt,Prt,True );
                          End else //조회된 자료가 없을경우
                          Begin
                            Btn_Enable(True ,False ,False,False,True,Exel,Prt,Prt,True );
                          End;
                       End;
                 'N' : Begin //조회,수정 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우 - 신규, 수정(True). 삭제(False)
                             Btn_Enable(False ,True ,True ,False ,True ,Exel,Prt,Prt,True );
                          End else //조회된 자료가 없을경우 - 신규(True). 수정,삭제(False)
                          Begin
                             Btn_Enable(True ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'A' : Begin //조회,수정 작업 버튼 상태 제어
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우 - 신규, 수정(True). 삭제(False)
                             Btn_Enable(False ,True ,True , True ,True ,Exel,Prt,Prt,True );
                          End else //조회된 자료가 없을경우 - 신규(True). 수정,삭제(True)
                          Begin
                             Btn_Enable(True ,True ,False,True,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'O' : Begin //
                          If Sts_YN='Y' Then Begin
                          //조회된 자료가 있을경우
                             Btn_Enable(False,False,True ,False,True ,Exel,Prt,Prt,True );
                          End  //조회된 자료가 없을경우
                          Else Begin
                             Btn_Enable(False ,True ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'S' : Begin //
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False,False,False ,False,True  ,Exel,Prt,Prt,True );
                          End else //조회된 자료가 없을경우
                          Begin
                             Btn_Enable(True ,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;

                 'L' : Begin //
                          If Sts_YN='Y' Then Begin//조회된 자료가 있을경우
                             Btn_Enable(False,False,False ,True,True   ,Exel,Prt,Prt,True );
                          End else //조회된 자료가 없을경우
                          Begin
                             Btn_Enable(True ,False ,False,False,True ,Exel,Prt,Prt,True );
                          End;
                       End;
                 'P' : Begin //
                           Btn_Enable(False ,False ,False,False,True ,Exel,Prt,Prt,True );
                       End;
               End;
            End;
      'I' : Begin //신규
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='신규';
               End;
               Case Form_Mode of
                  'N' : Begin // 신규일때는 닫기버튼만 활성화
                           Btn_Enable(False ,True ,True ,False ,True ,Exel,Prt,Prt,True );
                        End;
                  'H' : Begin // 신규일때는 닫기버튼만 활성화
                           Btn_Enable(True ,False ,False ,False ,True ,Exel,Prt,Prt,True );
                        End;
                  Else Begin
                     Btn_Enable(False,False,True,False ,True,Exel,Prt,Prt,True );
                  End;
               End;
            End;
      'E' : Begin //수정
               With (gChStatusBar) Do Begin
//                  Panels[2].Text :='수정';
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
                      Test.MyOnbtnSearch(Self);//조회
                   End;
                End;
    VK_F2     : Begin
                   If fn_ObjSts(0,gszBtn[1]) Then Begin
                      Test.MyOnbtnInsert(Self);//신규
                   End;
                End;
    VK_F3     : Begin
                   If fn_ObjSts(0,gszBtn[2]) Then Begin
                      Test.MyOnbtnSave(Self); //저장
                   End;
                End;
    VK_F4     : Begin
                   If fn_ObjSts(0,gszBtn[3]) Then Begin
                      Test.MyOnbtnDelete(Self);//삭제
                   End;
                End;
    VK_F5     : Begin
                   If fn_ObjSts(0,gszBtn[4]) Then Begin
                      Test.MyOnbtnCancel(Self);//취소
                   End;
                End;
    VK_F6     : Begin
                   If fn_ObjSts(0,gszBtn[5]) Then Begin
                      Test.MyOnbtnExcel(Self);//설정
                   End;
                End;
    VK_F7    : Begin
                   If fn_ObjSts(0,gszBtn[6]) Then Begin
                      Test.MyOnbtnSetPrint(Self);//프린트
                   End;
                End;
    VK_F8     : Begin
                   If fn_ObjSts(0,gszBtn[7]) Then Begin
                      Test.MyOnbtnPrint(Self);//액셀
                   End;
                End;
{    VK_F9    : Begin
                   If fn_ObjSts(0,gszBtn[8]) Then Begin
                      Test.MyOnbtnClose(Self);//닫기
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
                         //Test.MyOnbtnSearch(Self);//조회
                      End;
                   end;
                End
  End;



end;
{  이름    : MyOnCloseQuery
   기능    : 수정 작업이 이뤄졌을경우 저장할것인지 체크
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    Res : Variant;
begin
    If gszArrayBtn_Mode=Nil Then Exit;
    If gszArrayBtn_Mode[gBtn_Index] In ['I','E'] Then Begin
       //수정 및 입력이 발생했을 경우 처리
       Res := Application.MessageBox('수정한 작업내역이 있습니다. 저장하시겠습니까?'
                                    ,'작업 확인',
                                     MB_ICONINFORMATION+MB_YESNOCANCEL);  //일반 에러
       If Res = ID_YES Then Begin
          //저장 후 닫기
          If Assigned(OriginalOnbtnSave) Then Begin
              OriginalOnbtnSave(Sender);
          End;
          Exit;
       End Else If Res=ID_CANCEL Then Begin
          CanClose:=False;
       //취소
       End Else If Res =  ID_NO Then Begin
          //닫기
       End;

    End;
//    gbCanClose:=CanClose;
{    If Assigned(OriginalOnCloseQuery) Then Begin
       OriginalOnCloseQuery(Sender, CanClose);
    End;
 }
end;
{  이름    : MyOnbtnSearch
   기능    : 조회 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
//       func_ShowMsg(gsErrMsg,'조회에러',ERROK);
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
{  이름    : MyOnbtnInsert
   기능    : 신규 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
//       func_ShowMsg(gsErrMsg,'저장에러',ERROK);
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
{  이름    : MyOnbtnUpdate
   기능    : 수정 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
//       func_ShowMsg(gsErrMsg,'수정에러',ERROK);
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
{  이름    : MyOnbtnSave
   기능    : 저장 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
   2005.08.12  Shim     1. 저장을 한 후에 화면을 초기화 하기 위하서
                            gszArrayQuery_YN[gBtn_Index] = 'Y' 조건을 주석처리하고
                            If 조건으로 체크함.

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
//       func_ShowMsg(gsErrMsg,'저장에러',ERROK);
       Exit;
    End;

    // 저장을 한 후에 화면을 초기화 하기 위하서 추가함. 2005.08.12 Shim
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
{  이름    : MyOnbtnDelete
   기능    : 삭제 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
    If MessageDlg('해당 자료를 삭제 하시겠습니까?', mtCustom, [mbYes, mbNo], 0) = mrNo Then Begin
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
{  이름    : MyOnbtnCancel
   기능    : 취소 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : MyOnbtnPrint
   기능    : 출력 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
{  이름    : MyOnbtnSetPrint
   기능    : 프린트 설정 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}
procedure Ttest.MyOnbtnSetPrint(Sender: TObject);
begin
    If Assigned(OriginalOnbtnSetPrint) Then  Begin
       OriginalOnbtnSetPrint(Sender);
    End;
end;
{  이름    : MyOnbtnExcel
   기능    : 액셀 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}

procedure Ttest.MyOnbtnExcel(Sender: TObject);
begin
    If Assigned(OriginalOnbtnExcel) then  Begin
       OriginalOnbtnExcel(Sender);
    End;
end;
{  이름    : MyOnbtnClose
   기능    : 닫기 작업
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
{ 힌트를 Display 시키기 위해서}
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

{  이름    : MyDoActiveControl
   기능    : 객체 색상지정

   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

 // 이전에 focus가 있던 control은 White 색상으로
    If (gChForm=Nil)   Then Exit;
    With (gChForm) Do Begin
       tmpCOL :=  ACTIVECOLOR;
       proc_OnActiveExitColor(Sender);
       If activeControl is TEdit Then Begin
          sComp := Copy(TEdit(activeControl).Name,4,Length(TEdit(activeControl).Name)-1);
          pr_Color(TShape(FindComponent('shp' + sComp)) ,tmpCOL);
       End;
       // 에디트 컴포넌트 제어
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

{  이름    : proc_OnActiveExitColor
   기능    : 이전 객체 색깔 지정
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : proc_OnActiveEnterColor
   기능    : 활성화된 객체 색깔 지정
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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

{  이름    : proc_OnDisableColor
   기능    : 그룹박스에 지정된 객체 색깔 지정
   인수    : Sender: TObject(이동할 항목명)
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
{  이름    : proc_Frm_Clear
   기능    : 폼에 설정된 지정된 객체 초기화
   인수    : Sender: TObject  ,iClear_Tag : 초기화활 객체 tag 지정
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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


{  이름    : proc_Grp_Clear
   기능    : 그룹박스에 지정된 객체 초기화
   인수    : Sender: TObject  ,iClear_Tag : 초기화활 객체 tag 지정
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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


{  이름    : proc_Grp_Clear
   기능    : 그룹박스에 지정된 객체 초기화
   인수    : Sender: TObject  ,iClear_Tag : 초기화활 객체 tag 지정
   결과값  : None
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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



{  이름    : proc_SetDateFmt
   기능    : 날짜형식지정
   인수    :
   결과값  :
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}
procedure  proc_SetDateFmt;
Begin
    FormatSettings.DateSeparator   := '-';
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
End;
{    이름  : func_ITF_Chkum
     기능  : 2 of 5 바코드에 체크썸을 구한다...
     인수  : 이동할 항목명
   결과값  :'-1' 에러 Else 정상
  수정이력 :
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
   홀수 *3
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
{    이름  : func_AppIsAlreadyRunning
     기능  : 프로그램은 하번만 실행할수 있음
     인수  : 이동할 항목명
   결과값  :'-1' 에러 Else 정상
  수정이력 :
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
}

function func_AppIsAlreadyRunning(const sUniqueText: String): Boolean;
begin
    if OpenMutex(MUTEX_ALL_ACCESS,False,PChar(sUniqueText)) <> 0 then
    Result := True
    else
    Result := (CreateMutex(nil,False,PChar(sUniqueText)) = 0);
end;
{    이름  : func_SetPCSystemTime
     기능  : 설정할 날짜와 시간의 TDateTime 형 값
     인수  :
   결과값  :Boolean값으로 True 이면 설정 성공 False 이면 실패
  수정이력 :
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
{    이름  : func_PortAlive
     기능  : 서버와 연결이 되어있는지 확인
     인수  :
   결과값  :Boolean값으로 True 이면 설정 성공 False 이면 실패
  수정이력 :
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
       MessageBox(0,PChar('WINSOCK.DLL이 구동이 안되었습니다.'+#13#10#13#10+
                          '(Windows 네트웍부분을 재인스톨 하세요)'),'알 림',MB_OK or $0030);
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

{  이름    : func_MedToDtp
   기능    : 날자타입의 MaskEdit의 Text와 함께무린 TDateTimePicker의 날자를 동기화시킴
   인수    : DateTimePicker: 동기화되어질 콤포, MaskEdit: 콤포,
             sDate_old : Error시 되돌려질 날자값.('YYYYMMDD' 형식)
   결과값  : MaskEdit의 Text와 DateTimePicker의 날자를 동기화
   수정이력:
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
   -----------------------------------------------------------------------------
   2003-10-17 백민하    1.작성
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
      sMaxDate := '99991231';//최대일자
      sMinDate := FormatDateTime('YYYYMMDD',(DateTimePicker As TDateTimePicker).MinDate);//최소일자
      If (sDate='') and (trim(sDate_old)<>'')  then
      Begin
         //이전 날짜로 환원
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      If (sMaxDate < sDate) then
      Begin
         showmessage(FormatMaskText('####-##-##;0',sMaxDate) +'일자보다 작게 입력해야합니다');
         result := False;
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      If sMinDate > sDate then
      Begin
         showmessage(FormatMaskText('####-##-##;0',sMinDate) +'일자보다 크게 입력해야합니다');
         result := False;
         (MaskEdit As TMaskEdit).Text := sDate_old;
         Exit;
      End;
      (DateTimePicker As TDateTimePicker).date := StrTodate(FormatMaskText('####-##-##;0',sDate));
    Except
      On EConvertError Do Begin
//          gbData := False;
          Showmessage('날짜 형식에러 확인후 다시 입력해 주십시오');
          (MaskEdit As TMaskEdit).Text := sDate_old;
          Result := False;
          Exit;
      End;
    end;
 //   gbData := True;
    (MaskEdit As TMaskEdit).Text := FormatDateTime('YYYYMMDD', (DateTimePicker As TDateTimePicker).Date);

end;
{    이름  : func_ObjNullChk
     기능  : 객체에 값이 있는지 체크
     인수  :
   결과값  :Boolean값으로 True 이면  정상 False 이면 값을 입력하지않았음
  수정이력 :
   -----------------------------------------------------------------------------
   수정일자   수정자    수정내역
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
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
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
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
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
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
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
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
                Exit;
             End;

          End;
       End;

       If Obj[iLoop]  is TCurrencyEdit Then Begin
          With Obj[iLoop] As TCurrencyEdit Do Begin
             If  (Text='') Then Begin
                Result := False;
                chTlbl :=TLabel(gChForm.FindComponent('lbl' + Trim(Copy(Name,4,100))));
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
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
                ShowMessage(chTlbl.Caption+'은 필수 입력항목입니다.!!!');
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

{   이름	: pr_GetGrid
    기능	: 메세지 Display 시키기 위해서..
    인수	: 없음
    결과값	: 없음
수정이력	:
--------------------------------------------------------------------
수정일자     수정자    수정내역
--------------------------------------------------------------------
}
procedure proc_StatusMSG(sMSG : String);
begin
    If (gChStatusBar <> Nil) Then
       gChStatusBar.Panels[1].Text:= sMSG;
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


{    이름 : proc_LockKeys_Control
     기능 : VirtualKeys에서 Caps, Scroll, Num Key의 LOCK설정
     인수 : VK_CAPITAL, VK_NUMLOCK, VK_SCROLL의 정수값, 반전여부
   결과값 :
 수정이력 : --------------------------------------------------------------------
            수정일자    수정자     버전    수정내역
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
     2 : KeyState[pLockKeys] := not KeyState[pLockKeys]; // 반전
   end;
   SetKeyboardState(KeyState);
end;

end.


