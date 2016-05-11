unit DateSetPop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Calendar, ExplBtn, ExtCtrls, Mycal, StdCtrls, Buttons,
  UBBlankFrm, TFlatButtonUnit;

type
  TfrmDateSetPop = class(TFBBlankFrm)
    Panel1: TPanel;
    Cal: TMycal;
    cDate: TPanel;
    fbtnPrevYear: TFlatButton;
    fbtnPrevMonth: TFlatButton;
    fbtnNextMonth: TFlatButton;
    fbtnNextYear: TFlatButton;
    fbtnOK: TFlatButton;
    fbtnCancel: TFlatButton;
    fbtnToday: TFlatButton;
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
    procedure fbtnPrevYearClick(Sender: TObject);
    procedure fbtnPrevMonthClick(Sender: TObject);
    procedure fbtnNextMonthClick(Sender: TObject);
    procedure fbtnNextYearClick(Sender: TObject);
    procedure fbtnTodayClick(Sender: TObject);
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
  frmDateSetPop: TfrmDateSetPop;

implementation

{$R *.DFM}

procedure TfrmDateSetPop.SetKeyword(fkey: string);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
end;

function TfrmDateSetPop.GetKeyword: string;
begin
  Result := cDate.Caption;
end;

procedure TfrmDateSetPop.CalChange(Sender: TObject);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
end;

procedure TfrmDateSetPop.FormShow(Sender: TObject);
begin
  cDate.Caption := FormatDateTime('yyyy-mm-dd', Cal.Calendardate);
  if gsSTDT_DATE <> '' then begin
    Cal.Calendardate := StrToDateTime(gsSTDT_DATE);
    cDate.Caption := FormatDateTime('yyyy-mm-dd', StrToDateTime(gsSTDT_DATE));
  end;

end;

procedure TfrmDateSetPop.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_PRIOR : fbtnPrevMonthClick(Self);
    VK_HOME  : fbtnPrevYearClick(Self);
    VK_END   : fbtnNextYearClick(Self);
    VK_NEXT  : fbtnNextMonthClick(Self);
  end;
end;

procedure TfrmDateSetPop.cDateClick(Sender: TObject);
begin
  Cal.Calendardate := date;
end;

procedure TfrmDateSetPop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDateSetPop.FormDestroy(Sender: TObject);
begin
  frmDateSetPop := nil;
end;

procedure TfrmDateSetPop.CalDblClick(Sender: TObject);
begin
  fbtnOK.Click;
end;

procedure TfrmDateSetPop.FormResize(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmDateSetPop.bbtnTodayClick(Sender: TObject);
begin
  cDateClick(Self);
end;

procedure TfrmDateSetPop.fbtnPrevYearClick(Sender: TObject);
begin
  Cal.PrevYear;
end;

procedure TfrmDateSetPop.fbtnPrevMonthClick(Sender: TObject);
begin
  Cal.PrevMonth;
end;

procedure TfrmDateSetPop.fbtnNextMonthClick(Sender: TObject);
begin
  Cal.NextMonth;
end;

procedure TfrmDateSetPop.fbtnNextYearClick(Sender: TObject);
begin
  Cal.NextYear;
end;

procedure TfrmDateSetPop.fbtnTodayClick(Sender: TObject);
begin
  cDateClick(Self);
end;

end.
