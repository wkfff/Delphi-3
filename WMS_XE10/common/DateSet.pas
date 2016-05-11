unit DateSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Calendar, ExplBtn, ExtCtrls, Mycal, StdCtrls, Buttons,
  UBBlankFrm;

type
  TfrmDateSet = class(TFBBlankFrm)
    Panel1: TPanel;
    Cal: TMycal;
    bbtnOK: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnToday: TBitBtn;
    cDate: TPanel;
    bbtnPreYear: TBitBtn;
    bbtnPreMonth: TBitBtn;
    bbtnNextYear: TBitBtn;
    bbtnNextMonth: TBitBtn;
    procedure CalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cDateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure CalDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bbtnTodayClick(Sender: TObject);
    procedure bbtnPreYearClick(Sender: TObject);
    procedure bbtnPreMonthClick(Sender: TObject);
    procedure bbtnNextMonthClick(Sender: TObject);
    procedure bbtnNextYearClick(Sender: TObject);
  private
    procedure SetKeyword(fkey: string);
    function GetKeyword: string;
    { Private declarations }
  public
    gsSTDT_DATE: string;
    property fKey: string read GetKeyword write SetKeyWord;
    { Public declarations }
  end;

var
  frmDateSet: TfrmDateSet;

implementation

{$R *.DFM}

procedure TfrmDateSet.SetKeyword(fkey: string);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
end;

function TfrmDateSet.GetKeyword: string;
begin
  Result := cDate.Caption;
end;

procedure TfrmDateSet.CalChange(Sender: TObject);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
end;

procedure TfrmDateSet.FormShow(Sender: TObject);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
  if gsSTDT_DATE <> '' then begin
    Cal.Calendardate := StrToDateTime(gsSTDT_DATE);
    cDate.Caption := FormatDateTime('yyyy-mm-dd', StrToDateTime(gsSTDT_DATE));
  end;

end;

procedure TfrmDateSet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_PRIOR : bbtnPreMonthClick(Self);
    VK_HOME  : bbtnPreYearClick(Self);
    VK_END   : bbtnNextYearClick(Self);
    VK_NEXT  : bbtnNextMonthClick(Self);
  end;
end;

procedure TfrmDateSet.cDateClick(Sender: TObject);
begin
  Cal.Calendardate := date;
end;

procedure TfrmDateSet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDateSet.FormDestroy(Sender: TObject);
begin
  frmDateSet := nil;
end;

procedure TfrmDateSet.CalDblClick(Sender: TObject);
begin
  bbtnOK.Click;
end;

procedure TfrmDateSet.FormResize(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmDateSet.bbtnTodayClick(Sender: TObject);
begin
  cDateClick(Self);
end;

procedure TfrmDateSet.bbtnPreYearClick(Sender: TObject);
begin
  Cal.PrevYear;
end;

procedure TfrmDateSet.bbtnPreMonthClick(Sender: TObject);
begin
  Cal.PrevMonth;
end;

procedure TfrmDateSet.bbtnNextMonthClick(Sender: TObject);
begin
  Cal.NextMonth;
end;

procedure TfrmDateSet.bbtnNextYearClick(Sender: TObject);
begin
  Cal.NextYear;
end;

end.
