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

unit UComm_Var;

interface

uses  Controls, ExtCtrls,Messages,Classes ,Dialogs ,Forms;
    //==========================================================================
const
    cCbo_Len =40;
    cDtl_Len =4;
    cgsTab    =Chr($9);  //Tab 설정;
var
  {USER}
    gsUser_id     : String;   //사용자 id
    gsName        : String;   //사용자 명
    gsGrid        : String;   //사용자 권한
    gsIP          : String;   // PC IP

implementation

end.
