unit UBarcodePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ScktComp, CPort, Grids, BaseGrid, AdvGrid,
  TFlatButtonUnit, Buttons, ComCtrls;

const
    cCR = #13;
    cLF = #10;

type
  TFBarcodePrint = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    GroupBox4: TGroupBox;
    lblSerial2: TLabel;
    Label2: TLabel;
    lblDATE: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    edtSerial2: TEdit;
    sgMain: TAdvStringGrid;
    Comm1Prnt1: TComPort;
    Timer1: TTimer;
    UpDown2: TUpDown;
    Label3: TLabel;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FFJOBS : string;
    gcMGridAlign : Array[0..27] of Char;   //그리드 출력 위치 설정;
    procedure pr_Grid_Init;
  public
    { Public declarations }
  end;

var
  FBarcodePrint: TFBarcodePrint;

implementation

uses UQMain, ULib, UOneADay;

{$R *.dfm}

const
  CD_SEQN      = 0;
  CD_PRNT_DATE = 1;
  CD_PRNT_STNO = 2;
  CD_PRNT_ENNO = 3;


procedure TFBarcodePrint.FormActivate(Sender: TObject);
begin
  FQMain.fn_ChildShow(TFBarcodePrint ,'FBarcodePrint');
end;

procedure TFBarcodePrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFBarcodePrint.FormCreate(Sender: TObject);
begin
    If  gChForm <> (Sender As TForm) Then  gChForm := (Sender As TForm);

  pr_Grid_Init;

  Left   := 0;
  Top    := 0;
  //Height := FQMain.ClientHeight - FQMain.Panel1.Height - FQMain.sbMsg.Height - 7;
  //Width  := FQMain.ClientWidth - 4;

  FFJOBS := '0003';

  //pr_qryOpen;

  Application.ProcessMessages;
end;

procedure TFBarcodePrint.FormDestroy(Sender: TObject);
begin

  FBarcodePrint := nil;
end;

procedure TFBarcodePrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : Button1Click(Sender);
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFBarcodePrint.pr_Grid_Init;
begin

    with sgMain do begin
       Options:=Options+[goRowSelect];
       //ColCount := 22; RowCount:= 2;

       gcMGridAlign[CD_SEQN        ] := 'C';
       gcMGridAlign[CD_PRNT_DATE   ] := 'C';
       gcMGridAlign[CD_PRNT_STNO   ] := 'C';
       gcMGridAlign[CD_PRNT_ENNO   ] := 'C';
    end;
end;

procedure TFBarcodePrint.Button1Click(Sender: TObject);
var
  Temp1 : String;
begin
{
SIZE 30 mm, 20 mm
GAP 2 mm,0 mm
DIRECTION 1,0
CLS
BARCODE 50,50,"EAN13",70,1,0,2,2,"123456789012"
PRINT 1,1
}
   Temp1 := cLF
          +'SIZE 30 mm, 20 mm'+cLF
          +'GAP 2 mm,0 mm'+cLF
          +'SPEED 4'+cLF
          +'DENSITY 8'+cLF
          +'DIRECTION 1,0'+cLF
          +'CLS'+cLF
          +'BARCODE 50,50,"EAN13",70,1,0,2,2,"123456789012"'+cLF
          +'PRINT 1,1'+cLF
          +'EOP';
          {
  if not Comm1Prnt1.Connected then
    Comm1Prnt1.Open;
  Comm1Prnt1.WriteStr(Temp1);  }

  Sleep(200);
end;

procedure TFBarcodePrint.Button4Click(Sender: TObject);
begin
  Close;
end;

end.




