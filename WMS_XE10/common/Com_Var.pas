{*******************************************************************************
* Project     : 공통관련
* Unit 명     : Com_Var
* 기능	      :
* 작성자      : 백민하
* 작성일      : 2004-07-16
* 참조 Unit   : 공통 변수 정리
* 수정이력    :
*------------------------------------------------------------------------------
*   수정일자   수정자     수정내역
*------------------------------------------------------------------------------
*******************************************************************************}

unit Com_Var;

interface
uses  Controls, ExtCtrls,Messages,Classes ,Dialogs ,Forms;
  Type
    //그리드관련
    TFrmMode = (dwM,dwM1,dwP,dwS,dwQ,dwE,dwZ,dwEQ,P,M,Z,Q,I,E,F,D,K,N,O,S,L);
    //그리드 포맷 설정 ( fmI :정수   fmF:실수    fmL:로케이션   fmT : 시간   fmM:일자)
    TFmtType = (fmI ,fmF ,fmC ,fmL ,fmT ,fmM ,fmINULL ,fmYM);
    //그리드
    TRecord = record
      iType    : TFmtType;  //I:integer,
      iLoc     : Char;      //위치 R:오른쪽 L:왼쪽 C : 중앙
      sTitle   : String;    //타이틀
      iWidth   : Integer;   //폭
    end;
    //폼상태
    TfrmSts = record
      gForm_Mode : TFrmMode;
      gBtn_Mode  : Char;
      gJob_Mode  : Char;
      gQuery_YN  : Char;
    End;
    //==========================================================================
Const
    cCbo_Len =40;
    cDtl_Len =4;
    cgsTab    =Chr($9);  //Tab 설정;
Var
  {USER}
    gsUser_id     : String;   //사용자 id
    gsName        : String;   //사용자 명
    gsGrid        : String;   //사용자 권한
    gsJojik_Gb    : String;   //조직구분
    gsJojik_Cd    : String;   //조직
    gsJojik_Nm    : String;   //조직명
    gsPlant       : String;   //공장
    gsWh_Cd       : String;   //창고
    gsWh_Nm       : String;   //창고명

  {program}
    gChForm      : TForm;     //치환 변수(폼)
    giForm       : Integer=0; //폼 iD
    gsPath       : String;    //경로
    giSleep      : Integer;    //발행속도 대기시간주기
implementation

end.
