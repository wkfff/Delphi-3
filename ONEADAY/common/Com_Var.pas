{*******************************************************************************
* Project     : �������
* Unit ��     : Com_Var
* ���	      :
* �ۼ���      : �����
* �ۼ���      : 2004-07-16
* ���� Unit   : ���� ���� ����
* �����̷�    :
*------------------------------------------------------------------------------
*   ��������   ������     ��������
*------------------------------------------------------------------------------
*******************************************************************************}

unit Com_Var;

interface
uses  Controls, ExtCtrls,Messages,Classes ,Dialogs ,Forms;
  Type
    //�׸������
    TFrmMode = (dwM,dwM1,dwP,dwS,dwQ,dwE,dwZ,dwEQ,P,M,Z,Q,I,E,F,D,K,N,O,S,L);
    //�׸��� ���� ���� ( fmI :����   fmF:�Ǽ�    fmL:�����̼�   fmT : �ð�   fmM:����)
    TFmtType = (fmI ,fmF ,fmC ,fmL ,fmT ,fmM ,fmINULL ,fmYM);
    //�׸���
    TRecord = record
      iType    : TFmtType;  //I:integer,
      iLoc     : Char;      //��ġ R:������ L:���� C : �߾�
      sTitle   : String;    //Ÿ��Ʋ
      iWidth   : Integer;   //��
    end;
    //������
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
    cgsTab    =Chr($9);  //Tab ����;
Var
  {USER}
    gsUser_id     : String;   //����� id
    gsName        : String;   //����� ��
    gsGrid        : String;   //����� ����
    gsJojik_Gb    : String;   //��������
    gsJojik_Cd    : String;   //����
    gsJojik_Nm    : String;   //������
    gsPlant       : String;   //����
    gsWh_Cd       : String;   //â��
    gsWh_Nm       : String;   //â���

  {program}
    gChForm      : TForm;     //ġȯ ����(��)
    giForm       : Integer=0; //�� iD
    gsPath       : String;    //���
    giSleep      : Integer;    //����ӵ� ���ð��ֱ�
implementation

end.
