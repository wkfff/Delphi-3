unit UISTH002;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls, ComCtrls, MaskUtils,
  DBTables;

type
  TFISTH002 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button4: TButton;
    qryMain: TQuery;
    qryMainORGAN_CODE: TStringField;
    qryMainORGAN_NAME: TStringField;
    qryMainCLOSE_DATE: TStringField;
    qryMainI_DATE: TStringField;
    qryMainI_ID: TStringField;
    qryMainU_DATE: TStringField;
    qryMainU_ID: TStringField;
    pnCode: TPanel;
    Label75: TLabel;
    Label76: TLabel;
    Label2: TLabel;
    pnCodeTitle: TPanel;
    Button13: TButton;
    Button14: TButton;
    edCodeName: TEdit;
    edCode: TEdit;
    edPass: TEdit;
    Button1: TButton;
    Button2: TButton;
    meClose: TMaskEdit;
    Label1: TLabel;
    qryMainREMARKS: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure pnCodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnCodeTitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFJOBS : string;
  public
    { Public declarations }
  end;

var
  FISTH002: TFISTH002;

implementation

uses UDM, UQMain, ULib;

{$R *.dfm}

procedure TFISTH002.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFISTH002.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFISTH002.Button1Click(Sender: TObject);
begin
  edCode.Text := '';
  edCodeName.Text := '';
  edPass.Text := '';       
  meClose.Text := '99991231';
  qryMain.DisableControls;
  pnCodeTitle.Caption := '거래처 코드 관리 - 추가';
  pnCode.Visible := true;
  edCode.SetFocus;
end;

procedure TFISTH002.Button2Click(Sender: TObject);
begin
  edCode.Text     := qryMain.FieldValues['ORGAN_CODE'];
  edCodeName.Text := qryMain.FieldValues['ORGAN_NAME'];
  edPass.Text     := qryMain.FieldValues['REMARKS'];
  meClose.Text    := '99991231';
  edCode.ReadOnly := False;
  qryMain.DisableControls;
  pnCodeTitle.Caption := '거래처 코드 관리 - 수정';
  pnCode.Visible := true;
  edCodeName.SetFocus;
end;

procedure TFISTH002.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_F2 : Button2Click(Sender);        
    VK_ESCAPE : Close;
  end;
end;

procedure TFISTH002.FormDestroy(Sender: TObject);
begin
  FISTH002 := nil;
end;

procedure TFISTH002.FormCreate(Sender: TObject);
begin
  qryMain.Close;
  Application.ProcessMessages;
  qryMain.Open;
end;

procedure TFISTH002.Button13Click(Sender: TObject);
begin
  if edCode.Text = '0000' then begin                    
    ShowMessage('"0000" 거래처코드는 시스템에서 사용하는 코드입니다.');
    Exit;
  end;

  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add('   update dbo.STH002                                                             '+
            '      set ORGAN_NAME = :ORGAN_NAME, REMARKS = :REMARKS, CLOSE_DATE = :CLOSE_DATE '+
            '    where ORGAN_CODE = :ORGAN_CODE                                               '+
            '   if @@ROWCOUNT = 0 begin                                                       '+
            '     insert into dbo.STH002                                                      '+
            '     ([ORGAN_CODE],[ORGAN_NAME],[REMARKS],I_ID)                                  '+
            '     values(:ORGAN_CODE, :ORGAN_NAME, :REMARKS, :I_ID )                          '+
            '   end                                                                           ');
    ParamByName('ORGAN_CODE').AsString := edCode.Text;
    ParamByName('ORGAN_NAME').AsString := edCodeName.Text;
    ParamByName('REMARKS').AsString  := edPass.Text;
    ParamByName('CLOSE_DATE').AsString := meClose.Text;
    ParamByName('I_ID').AsString       := gsUserID;
    ExecSQL;

    qryMain.Close;
    qryMain.Open;
  except
     on E:EDBEngineError do begin
        beep;
        qryMain.EnableControls;
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
  qryMain.Close;
  Application.ProcessMessages;
  ShowMessage(pnCodeTitle.Caption+ ' 되었습니다.');
  pnCode.Visible := false;
  qryMain.Open;
  qryMain.EnableControls;
end;

procedure TFISTH002.Button14Click(Sender: TObject);
begin

  qryMain.EnableControls;
  pnCode.Visible := false;
end;

procedure TFISTH002.pnCodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(pnCode.Handle,WM_SYSCOMMAND, $F012, 0);
end;  

procedure TFISTH002.pnCodeTitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCapture(pnCode.Handle);
end;

procedure TFISTH002.edCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
  end;
end;

end.
