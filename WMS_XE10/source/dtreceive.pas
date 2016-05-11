unit dtreceive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, CPort;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button14: TButton;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    Button1: TPanel;
    Button8: TSpeedButton;
    Button9: TSpeedButton;
    Button2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Comm1RxChar(Sender: TObject; Count: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Comm1TxEmpty(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure HandleException(Sender: TObject; E: Exception);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ReceiveData : String;
  //ReceiveData: array[0..2048] of Char;
  nLines  : Integer;
  bePress : Boolean;
  beFirst : Boolean;
  beStart : Boolean;
  beEnd   : Boolean;
  beOpen : Boolean;
  beSave : Boolean;
  beData : Boolean;
  cFileName, cPath, pFname : string;
implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox3.Items.Clear;
  ListBox4.Items.Clear;
  nLines := 0;
  beOpen := false;
  beSave := true;
  beData := false;
  beFirst := True;
  bePress := false;
  ReceiveData := '';
  Button9.Enabled := false;
  ComBoBox1.ItemIndex := 0;
  Application.OnException := HandleException;
  label1.Caption := FormatDateTime('yyyy"-"mm"-"dd',date);
  cPath := ExtractFilePath(ParamStr(0));
  //cPath := 'c:\stc\scandata\';
  cFileName := copy(label1.Caption,1,4) + copy(label1.Caption,6,2) + copy(label1.Caption,9,2);

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Application.OnException := nil;
end;

procedure TForm1.Comm1RxChar(Sender: TObject; Count: Integer);
var
  Buffer: array[0..2048] of Char;
  Bytes, P : Integer;
  Send    : String;
  cTemp   : String;
begin
  if bePress then begin
    Fillchar(Buffer, Sizeof(Buffer), 0);
    Bytes := Comm1.Read(Buffer, Count);
    P := 0;
    if( Bytes <> -1 ) then Begin
      while P < Bytes do begin
        case Buffer[ P ] of
          '<' : begin
                  Send := #06;
                  Comm1.Write( Send[1], Length( Send ));
                end;
          '>' : begin
                  beEnd := false;
                  bePress := false;
                  p := Bytes + 2;
                  ShowMessage( 'End of Data Receive.');
                  ListBox4.Items.SaveToFile( cFileName + '.txt' );
                  Button9Click( Sender );
                end;
          #02 : begin
//                beStart := true;
                  beEnd   := false;
                end;
          #03 : begin
                  nLines := nLines + 1;
                  Button1.Caption := 'Receive Data -> ' + Format( '%5.5d' + ' : ', [ nLines ] ) + ReceiveData;
                  Button1.Update;
                  cTemp := trim(ReceiveData);
                  ListBox3.Items.Add( Format( '%5.5d' + ' : ', [ nLines ] ) + cTemp );
                  ListBox4.Items.Add( cTemp );
                  ReceiveData := '';
                  beStart := false;
                  beEnd   := true;
                end;
          #10 :;
          #13 :;
        else
          if( Buffer[p] < #127 ) then ReceiveData := ReceiveData + Buffer[ P ];
        end;
        P := P+1;
      end;
    End;
  End;
end;

procedure TForm1.HandleException(Sender: TObject; E: Exception);
begin
  if E is ECommError then
    with E as ECommError do
      ShowMessage('Async32 error: ' + Message);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ComBoBox1.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ListBox3.Items.Clear;
  ListBox4.Items.Clear;
  nLines := 0;
  ReceiveData := '';
  beSave := false;
  beFirst := True;
  beStart := false;
  beEnd   := false;
  bePress := true;
  Button8.Enabled := false;
  Button9.Enabled := true;
  ComboBox1.Enabled := false;
  comm1.DeviceName := ComboBox1.Text;
  comm1.BaudRate := br19200;
  comm1.Open;
end;

procedure TForm1.Button9Click(Sender: TObject);

begin
  nLines := 0;
  comm1.Close;
  bePress := false;
  beSave := false;
  Button8.Enabled := true;
  Button9.Enabled := false;
  ComBoBox1.Enabled := True;

end;

procedure TForm1.Comm1TxEmpty(Sender: TObject);
 var Send : String;
begin
  if( bePress ) then begin
    Send := #06;
    Comm1.Write( Send[1], Length( Send ));
  end;
end;


procedure TForm1.Button14Click(Sender: TObject);
var
   nS : integer;
   sfilename : String;
begin
{ Data Save Routine }
  if (beSave = false) AND (ListBox4.Items.COUNT > 0) then begin
    if MessageDlg('Not Saved.' + #13 +
                  'Save Data?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

     SaveDialog1.InitialDir := cPath;
     for nS := 1 to 100 do begin
        sfilename := cPath + cFileName + '_' + format( '%3.3d', [ nS ] ) + '.txt';
        if FileExists( sfilename ) then begin
           sfilename := cfilename + '_' + format( '%3.3d', [ nS + 1 ] );
        end
        else break;
     end;

     SaveDialog1.FileName := sfilename;

     if (SaveDialog1.Execute) then begin
        sfilename := SaveDialog1.FileName;

        if UPPERCASE(Copy(Trim(sFileName), Length(Trim(sfilename)) - 3, 4)) <> '.TXT' then
           sfilename := sfilename + '.txt';

        ListBox4.Items.SaveToFile( sfilename );
        beSave := true;
        showmessage('데이터가 저장되었습니다.');
     end
     else begin
     end;

    end;
  end;
  close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   nS : integer;
   sfilename : String;
   nI : Integer;
   cTemp : String;

begin

  SaveDialog1.InitialDir := cPath;

  for nI := 0 to ListBox4.Items.COUNT - 1 do begin

     ListBox4.Items[nI] := copy(Trim(ListBox4.Items[nI]),1,1) + ',' +
                           copy(Trim(ListBox4.Items[nI]),2,8) + ',' +
                           copy(Trim(ListBox4.Items[nI]),10,4) + ',' +
                           copy(Trim(ListBox4.Items[nI]),14,15);
  end;

  if ListBox4.Items.COUNT > 0 then begin
     for nS := 1 to 100 do begin
        sfilename := cPath + cfilename + '_' + format( '%3.3d', [ nS ] ) + '.txt';
        if FileExists( sfilename ) then begin
           sfilename := cfilename + '_' + format( '%3.3d', [ nS + 1 ] );
        end
        else break;
     end;

     SaveDialog1.FileName := sfilename;

     if (SaveDialog1.Execute) then begin
        sfilename := SaveDialog1.FileName;

        if UPPERCASE(Copy(Trim(sFileName), Length(Trim(sfilename)) - 3, 4)) <> '.TXT' then
           sfilename := sfilename + '.txt';

        ListBox4.Items.SaveToFile( sfilename );
        beSave := true;
        showmessage('데이터가 저장되었습니다.');
     end
     else begin
     end;
  end;

end;

end.


