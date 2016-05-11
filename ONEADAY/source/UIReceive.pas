unit UIReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CPort, Dbtables;

type
  TFIReceive = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button14: TButton;
    Panel1: TPanel;
    Panel4: TPanel;
    ListBox4: TListBox;
    Button1: TPanel;
    SaveDialog1: TSaveDialog;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button10: TButton;
    Button11: TButton;
    ListBox3: TListBox;
    comm1: TComPort;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Comm1RxChar(Sender: TObject; Count: Integer);
    procedure Comm1TxEmpty(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }   
    procedure HandleException(Sender: TObject; E: Exception);
  public
    { Public declarations }
  end;

var
  FIReceive: TFIReceive;
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

uses UDM, ULib;

{$R *.dfm}

procedure TFIReceive.FormCreate(Sender: TObject);
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
  //Button9.Enabled := false;
  ComBoBox1.ItemIndex := 0;
  Application.OnException := HandleException;
  //label1.Caption := FormatDateTime('yyyy"-"mm"-"dd',date);
  cPath := ExtractFilePath(ParamStr(0));
  //cPath := 'c:\stc\scandata\';
  cFileName := copy(label1.Caption,1,4) + copy(label1.Caption,6,2) + copy(label1.Caption,9,2);
end;

procedure TFIReceive.HandleException(Sender: TObject; E: Exception);
begin
//  if E is ECommError then
//    with E as ECommError do
//      ShowMessage('Async32 error: ' + Message);
end;

procedure TFIReceive.FormDestroy(Sender: TObject);
begin
  Application.OnException := nil;
end;

procedure TFIReceive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIReceive.Comm1RxChar(Sender: TObject; Count: Integer);
var
  Buffer: array[0..2048] of Char;
  Bytes, P : Integer;
  Send    : String;
  cTemp   : String;
begin
  if bePress then begin
    Fillchar(Buffer, Sizeof(Buffer), 0);
    Bytes := comm1.Read(Buffer, Count);
    P := 0;
    if( Bytes <> -1 ) then Begin
      while P < Bytes do begin
        case Buffer[ P ] of
          '<' : begin
                  Send := #06;
                  comm1.Write( Send[1], Length( Send ));
                end;
          '>' : begin
                  beEnd := false;
                  bePress := false;
                  ShowMessage( 'End of Data Receive....');
                  comm1.ClearBuffer(True, True);
                  p := Bytes + 2;

                  Button3.Enabled := True;



                  //Button9Click(Self);
                end;
          #02 : begin
//                beStart := true;
                  beEnd   := false;
                end;
          #03 : begin
                  cTemp := Trim(ReceiveData);
                  ListBox3.Items.Add( cTemp );
                  ReceiveData := '';
                  beStart := false;
                  beEnd   := true;
                end;
          #10 :;
          #13 :;
        else
          if( Buffer[p] < #127 ) then begin
             ReceiveData := ReceiveData + Buffer[ P ];
          end;
        end;
        P := P+1;
      end;
    End;
  End;
end;

procedure TFIReceive.Comm1TxEmpty(Sender: TObject);   
 var Send : String;
begin
   if( bePress ) then begin
      Send := #06;
      comm1.Write( Send[1], Length( Send ));
   end;
end;

procedure TFIReceive.Button14Click(Sender: TObject);
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

procedure TFIReceive.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case key of
    VK_F1 : Button3Click(Sender);
    VK_F2 : Button10Click(Sender);
    VK_F3 : Button11Click(Sender);
  end;
end;

procedure TFIReceive.Button3Click(Sender: TObject);
begin
  comm1.close;
  ListBox3.Items.Clear;
  ListBox4.Items.Clear;
  nLines := 0;
  ReceiveData := '';
  beSave := false;
  beFirst := True;
  beStart := false;
  beEnd   := false;
  bePress := true;
  Button3.Enabled := false;
  Button10.Enabled := true;
  ComboBox1.Enabled := false;
  comm1.Port := ComboBox1.Text;
  comm1.BaudRate := br19200;
  comm1.Open;
end;

procedure TFIReceive.Button10Click(Sender: TObject);
begin
  nLines := 0;
  bePress := false;
  comm1.Close;
  beSave := false;

  //Button8.Enabled := true;
  //Button9.Enabled := false;

  Button3.Enabled  := true;
  Button10.Enabled := false;

  ComBoBox1.Enabled := True;
end;

procedure TFIReceive.Button11Click(Sender: TObject);
var
   lsITEM_STATE : String;
   liITEM_STATE : Integer;
   lsSTDT_DATE  : String;
   lsORGAN_CODE : String;
   lsBarcode    : String;
   lsNowDateTime : String;
   lsSTDT_TIME  : String;

   function fn_SaveData:Boolean;
   begin
     Result := True;
    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' select PRDT_DATE, BARCODE_DATE '+
              '   from dbo.SPM100              '+
              ' where barcode = :barcode       ');
      Params[0].AsString := lsBarcode;
      Open;
      if IsEmpty then begin
        //ShowMessage('발행내역이 없습니다.');
        Result := False;
      end
      else begin
        if Fields[1].AsString = '' then begin
          //ShowMessage('발행내역이 없습니다.');
          Result := False;
        end;
      end;
      
      Close;
      SQL.Clear;
      SQL.Add('   update dbo.SPM100                                          '+
              '      set ITEM_STATE = :ITEM_STATE, ORGAN_CODE = :ORGAN_CODE, ');
      liITEM_STATE := StrToInt(lsITEM_STATE); 
      case liITEM_STATE of
        1 : SQL.Add(' PRDT_DATE = :PRDT_DATE  ');              // 입고'
        2 : SQL.Add(' PRDT_BACK_DATE = :PRDT_BACK_DATE   ');   // 입고반품'
        3 : SQL.Add(' STORE_DATE = :STORE_DATE   ');           // 출고'
        4 : SQL.Add(' STORE_BACK_DATE = :STORE_BACK_DATE   '); // 출고반품'
        5 : SQL.Add(' AS_BACK_DATE = :AS_BACK_DATE   ');       // A/S반품'
        6 : SQL.Add(' DISUSE_DATE = :DISUSE_DATE   ');           // 폐기'
      end;
      SQL.Add('    where barcode = :barcode                                                    '+
              '   update spd101                                                                '+
              '      set ORGAN_CODE = :ORGAN_CODE ,                                            '+
              '          ITEM_CODE  = :ITEM_CODE  ,                                            '+
              '          ITEM_STATE = :ITEM_STATE ,                                            '+
              '          I_ID       = :I_ID                                                    '+
              '    where STDT_DATE  = :STDT_DATE                                               '+
              '      and BARCODE    = :BARCODE                                                 '+
              '   if @@rowcount = 0 begin                                                      '+
              '     insert into spd101                                                         '+
              '     (STDT_DATE,ORGAN_CODE,ITEM_CODE,BARCODE,ITEM_STATE,I_ID)                   '+
              '     values(:prdt_date, :ORGAN_CODE, :ITEM_CODE, :barcode, :ITEM_STATE, :I_ID ) '+
              '   end                                                                          ');
      //lsNowDateTime      := gsNowDateTime;

      Params[ 0].AsString := lsITEM_STATE;
      Params[ 1].AsString := lsORGAN_CODE;
      Params[ 2].AsString := lsSTDT_DATE + ' '+lsSTDT_TIME;
      Params[ 3].AsString := lsBarcode;

      Params[ 4].AsString := lsORGAN_CODE;
      Params[ 5].AsString := Copy(lsBarcode,1,4);
      Params[ 6].AsString := lsITEM_STATE;
      Params[ 7].AsString := gsUserID;
      Params[ 8].AsString := lsSTDT_DATE + ' '+lsSTDT_TIME;
      Params[ 9].AsString := lsBarcode;

      Params[10].AsString := lsSTDT_DATE + ' '+lsSTDT_TIME;
      Params[11].AsString := lsORGAN_CODE;
      Params[12].AsString := Copy(lsBarcode,1,4);
      Params[13].AsString := lsBarcode;
      Params[14].AsString := lsITEM_STATE;
      Params[15].AsString := gsUserID;
      ExecSQL;
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);

          Result := False;
       end;
    end;
   end;
var
   nI      : Integer;
   liCount : Integer;
   liNG    : Integer;
begin


  liCount := 0;
  liNG    := 0;
  for nI := 0 to ListBox3.Items.COUNT - 1 do begin

     lsITEM_STATE := copy(Trim(ListBox3.Items[nI]),1,1);
     lsSTDT_DATE  := copy(Trim(ListBox3.Items[nI]),2,4) + '-' +
                     copy(Trim(ListBox3.Items[nI]),6,2) + '-' +
                     copy(Trim(ListBox3.Items[nI]),8,2);
     lsSTDT_TIME  := copy(Trim(ListBox3.Items[nI]),29,8);
     lsORGAN_CODE := copy(Trim(ListBox3.Items[nI]),10,4);
     lsBarcode    := copy(Trim(ListBox3.Items[nI]),14,15);

     if fn_SaveData then
       Inc(liCount)
     else
       Inc(liNG);
  end;

  Label3.Caption := '저장 건수 : '+ IntToStr(liCount);
  Label4.Caption := '실패 건수 : '+ IntToStr(liNG);
  
  ListBox3.Items.Clear;
  ShowMessage('저장 되었습니다.');
end;

end.
