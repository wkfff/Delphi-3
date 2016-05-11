//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utAbout
//  파일내용  : 정보 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfmAbout = class(TForm)
    pnlNORMAL: TPanel;
    pnlNORTEXT: TPanel;
    pcSYSTEM: TPageControl;
    tsSYSTEM: TTabSheet;
    lblCORP: TLabel;
    lblPJNAME: TLabel;
    lblVERSION: TLabel;
    lblEDTDATE: TLabel;
    lblLOGOIMG: TLabel;
    lblLBLIMG: TLabel;
    lblCOPYRIGHT: TLabel;
    lblICON: TLabel;
    edtCORP: TEdit;
    edtPJNAME: TEdit;
    edtVERSION: TEdit;
    edtEDTDATE: TEdit;
    edtLOGOIMG: TEdit;
    edtLBLIMG: TEdit;
    edtCOPYRIGHT: TEdit;
    edtICON: TEdit;
    btnOK: TButton;
    tsDEVLOPER: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure pr_initNORMAL();   // NORMAL 성정 초기화
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.dfm}

uses Common_Opt;

procedure TfmAbout.btnOKClick(Sender: TObject);
begin
    Close;
end;

procedure TfmAbout.FormCreate(Sender: TObject);
begin
    pr_initNORMAL();
end;

procedure TfmAbout.pr_initNORMAL();
begin
    pcSYSTEM.ActivePageIndex := 0;
    pnlNORTEXT.Caption := '정보';
    edtCORP.Text       := gsCORP;
    edtPJNAME.Text     := gsSYSTEM;
    edtVERSION.Text    := gsVERSION;
    edtEDTDATE.Text    := gsEDTDATE;
    edtLOGOIMG.Text    := gsIMGFOLDER;
    edtLBLIMG.Text     := gsIMGLIM;
    edtICON.Text       := gsIMGICON;
    edtCOPYRIGHT.Text  := gsCOPYTIGHT;
end;


end.
