unit UBBlankFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type              
  TFBBlankFrm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBBlankFrm: TFBBlankFrm;

implementation

{$R *.DFM}

procedure TFBBlankFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFBBlankFrm.FormDestroy(Sender: TObject);
begin
  FBBlankFrm := nil;
end;

procedure TFBBlankFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : SelectNext(Sender as TWinControl, True, True);
    VK_ESCAPE : Close;
  end;
end;

procedure TFBBlankFrm.FormCreate(Sender: TObject);
begin
{
         Font := screen.MenuFont;
         Font.Name := '-머리정체L';
         Font.Charset := DEFAULT_CHARSET;
         Font.Size := 14;
         }
end;

end.
