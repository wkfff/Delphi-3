//===============================================================================
//  프로젝트  : DAIHAN_DAS
//  파일명    : utOPTSUB
//  파일내용  : 환경설정 서브 
//  최초작성일: Unknown
//  최초작성자: Unknown
//-------------------------------------------------------------------------------
//  수정일    : 2016-02-04
//  수정자    : dyddyd
//  수정내용  :
//===============================================================================


unit utOPTSUB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  TfmOPTSUB = class(TForm)
    pnlTitle: TPanel;
    btnOK: TButton;
    btnCANSEL: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCANSELClick(Sender: TObject);
  private
    { Private declarations }
  public
    function  func_actCREATE(intLEFT, intTOP : Integer; strKIND, strFILE : String): Boolean;
    procedure proc_txtSAVE(sdGRID : TObject; strFILE : String);
    procedure proc_grdGETCAPTION(strTITLE : String);
    procedure proc_grdGETEDIT(grdSTR : TObject);
    { Public declarations }
  end;

const
  intARRAY = 10;

var
  fmOPTSUB: TfmOPTSUB;

  lblCREATE : Array[0..intARRAY] of TLabel;   // Label 생을을 위한 배열
  edtCREATE : Array[0..intARRAY] of TEdit;    // Edit Box 생성을 위한 배열

  intACTCNT : Integer;

implementation

{$R *.dfm}

uses Common, Common_grid, Common_Opt, utOPTION;

function  TfmOPTSUB.func_actCREATE(intLEFT, intTOP : Integer; strKIND, strFILE : String): Boolean;
var
    txtFile : TextFile;
    strBUFF : String;
    arrBUFF : Array[0..intARRAY] of String;
    i : Integer;
begin
    AssignFile(txtFile, strFILE);
    if FileExists(strFILE) then
    begin
        Reset(txtFile);
        Readln(txtFile,strBUFF);
        proc_data_distinction(strBUFF,'|',arrBUFF,intACTCNT);
        for i := 0 to intACTCNT - 1 do
        begin
            if strKIND = '11' then
            begin
                lblCREATE[i] := TLabel.Create(self); // 이부분이 동적으로 객체를 생성해 주는 부분
                with lblCREATE[i] do
                begin
                    Caption := arrBUFF[i];
                    Left := IntLEFT;
                    Top := intTOP + (i*25);;
                    Parent := fmOPTSUB;
                end;
            end
            else
            if strKIND = '22' then
            begin
                edtCREATE[i] := TEdit.Create(self);  // Edit Box 를 배열을 이용하여 동적으로 생성한다.
                with edtCREATE[i] do
                begin
                    Left := IntLEFT;
                    Top := intTOP + (i*25);
                    Height := 20;
                    Parent:= fmOPTSUB;
                end;
            end;
        end;
        CloseFile(txtFile);
        Result := False;
    end
    else Result := False;
end;

procedure TfmOPTSUB.proc_grdGETCAPTION(strTITLE : String);
begin
    func_actCREATE(30, 60, '11', gsDATPATH);
    func_actCREATE(100, 55, '22', gsDATPATH);
    pnlTITLE.Caption := strTITLE;
    Caption := strTITLE + '...';
end;

procedure TfmOPTSUB.proc_grdGETEDIT(grdSTR : TObject);
var
    i : Integer;
begin
    for i := 0 to intACTCNT - 1 do
    begin
        edtCREATE[i].Text   := Trim(TStringGrid(grdSTR).Cells[ i,TStringGrid(grdSTR).Row]);
    end;
end;

procedure TfmOPTSUB.btnOKClick(Sender: TObject);
var
    strSAVE : String;
    i : Integer;
begin
    if Caption = '추가...' then
    begin
        for i := 0 to intACTCNT - 1 do
        begin
            if i <> intACTCNT - 1 then strSAVE := strSAVE + edtCREATE[i].Text + '|'
            else strSAVE := strSAVE + edtCREATE[i].Text;
        end;

        proc_Log2File(gsDATPATH,strSAVE);
    end
    else
    begin
        with fmOPTION.stgData do
        begin
            for i := 0 to intACTCNT - 1 do
            begin
                Cells[ i,Row] := edtCREATE[i].Text;
            end;
            proc_txtSAVE(fmOPTION.stgData, gsDATPATH);
        end;
        Close;
    end;
    proc_grdGETLIST(fmOPTION.stgData, gsDATPATH, False);
end;

procedure TfmOPTSUB.proc_txtSAVE(sdGRID : TObject; strFILE : String);
var
    strSAVE : String;
    i, j : Integer;
begin
    with TStringGrid(sdGRID) do
    begin
        if func_FileDelete(strFILE) = True then
        begin
            for i := 0 to RowCount - 1 do
            begin
                for j := 0 to ColCount - 1 do
                begin
                    if j <> ColCount - 1 then strSAVE := strSAVE + Cells[j,i] + '|'
                    else strSAVE := strSAVE + Cells[j,i];
                end;
                proc_Log2File(strFILE,strSAVE);
                strSAVE := '';
            end;
        end;
    end;
end;

procedure TfmOPTSUB.btnCANSELClick(Sender: TObject);
begin
    Close;
end;

end.
