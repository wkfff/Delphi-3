unit UIBarcodePrinting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, DBTables, Printers, Winspool,
  ExtCtrls;

type
  TFIBarcodePrinting = class(TForm)
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    cedtVBELN: TCurrencyEdit;
    cbITEM_CODE: TComboBox;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Timer1: TTimer;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbITEM_CODEChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    gbStart : Boolean;
    giCount : Integer;
    gbPrint : Boolean;
    procedure pr_GetMax;
    function  fn_GetMax:String;
  public
    { Public declarations }
  end;

var
  FIBarcodePrinting: TFIBarcodePrinting;

implementation

uses UDM, ULib;

{$R *.dfm}  

procedure TFIBarcodePrinting.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
end;

procedure TFIBarcodePrinting.FormDestroy(Sender: TObject);
begin

  FIBarcodePrinting := nil;
end;

procedure TFIBarcodePrinting.FormCreate(Sender: TObject);
var
  lsBarcode : String;
  lsSeqn    : String;
begin                                         
                     
  gbPrint := True; 
  if FileExists(ExtractFilePath(Application.ExeName) + 'Print.ini') then begin
    gbPrint := False;
  end;

  gbStart := False;
  
  giCount := 0;

  DM.qrSTH003.Close;
  DM.qrSTH003.Open;

  cbITEM_CODE.Items.Clear;
  while not DM.qrSTH003.Eof do
  begin
    cbITEM_CODE.Items.Add(DM.qrSTH003.FieldValues['ITEM_CODE']+ ' '+ DM.qrSTH003.FieldValues['ITEM_NAME']);
    DM.qrSTH003.Next;
  end;
  DM.qrSTH003.Close;
  Application.ProcessMessages;

  cbITEM_CODE.ItemIndex := 0;

  Edit1.Text := Copy(cbITEM_CODE.Text,6,Length(cbITEM_CODE.Text));

//  dpBar1.Date := StrToDateTime(gsNowDate);
  Edit2.Text := 'Creativeicon Co., Ltd.';
  Edit3.Text := '02)309-0078';
              
  Edit5.Text := '"A/S를 위해 본 바코드 라벨을 제거하지 마십시오"'; 
  pr_GetMax;
end;

procedure TFIBarcodePrinting.cbITEM_CODEChange(Sender: TObject);
begin
  Edit1.Text := Copy(cbITEM_CODE.Text,6,length(cbITEM_CODE.Text));
  
  pr_GetMax;
  Edit4.Text := Copy(cbITEM_CODE.Text,1,4) + Copy(Edit4.Text,5,Length(Edit4.Text));
end;

procedure TFIBarcodePrinting.pr_GetMax;
var
  lsBarcode : String;
  lsSeqn    : String;
begin

  lsBarcode  := fn_GetMax;
  lsSeqn     := FormatFloat('00000',StrToInt(Copy(lsBarcode,11,5))+1);

  lsBarcode := Copy(lsBarcode,1,10);

  Edit4.Text := lsBarcode + lsSeqn;
end;

function TFIBarcodePrinting.fn_GetMax: String;
var
  lsITEM_CODE : String;
begin

  with DM.qryOpen do try
    Close;
    SQL.Clear;
    SQL.Add(' select max(barcode)                      '+
            '   from dbo.SPM100                        '+
            '  where ITEM_CODE = :ITEM_CODE            '+
            '    and substring(BARCODE,5,6) = :BARCODE ');
    Params[0].AsString := Copy(cbITEM_CODE.Text,1,4);
    Params[1].AsString := gsNowDateShort;
    Open;
    if not IsEmpty then begin
      if Fields[0].IsNull then begin
        Result := Copy(cbITEM_CODE.Text,1,4) + gsNowdateShort + '00000';
      end
      else
        Result := Fields[0].AsString;
    end
    else begin
        Result := Copy(Edit1.Text,1,4) + gsNowdateShort + '00000';
    end;
  except
     on E:EDBEngineError do begin
        Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
        Exit;
     end;
  end;
end;     

procedure TFIBarcodePrinting.Button1Click(Sender: TObject);
  function fn_InsertData(ABarcode:String):String;
  var
    lsBarcode     : String;
    lsNowDateTime : String;
  begin

    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' select barcode                                                            '+
              '   from dbo.SPM100                                                         '+
              ' where barcode = :barcode                                                  '+
              ' if @@ROWCOUNT = 0 begin                                                   '+
              '   insert into dbo.SPM100                                                  '+
              '   (  BARCODE,  ITEM_STATE,  ITEM_CODE,  BARCODE_DATE,  I_ID)              '+
              '   values                                                                  '+
              '   ( :BARCODE,       ''0'', :ITEM_CODE, :BARCODE_DATE, :I_ID)              '+
              '   insert into dbo.SPD101                                                  '+
              '   ([STDT_DATE],[BARCODE],[ORGAN_CODE],[ITEM_CODE],[ITEM_STATE],[I_ID])    '+
              '   values(:prdt_date, :barcode, ''0000'', :ITEM_CODE, ''0'', :I_ID )       '+
              ' end                                                                       ');
      lsNowDateTime := gsNowDateTime;

      Params[0].AsString := ABarcode;
      Params[1].AsString := ABarcode;
      Params[2].AsString := Copy(cbITEM_CODE.Text,1,4);
      Params[3].AsString := lsNowDateTime;
      Params[4].AsString := gsUserID;

      Params[5].AsString := lsNowDateTime;
      Params[6].AsString := ABarcode;
      Params[7].AsString := Copy(cbITEM_CODE.Text,1,4);
      Params[8].AsString := gsUserID;
      ExecSQL;
       
      lsBarcode := Copy(ABarcode,1,10) + FormatFloat('00000',StrToInt(Copy(ABarcode,11,5))+1);
      Result := lsBarcode;
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
          Exit;
       end;
    end;
  end;

  function fn_Valid:Boolean;
  var
    lsSeqn    : String;
  begin
    Result := True;
    if Length(Edit4.Text) <> 15 then begin   
      Result := False;
      ShowMessage('자릿수를 확인하십시오');
    end;
    lsSeqn    := fn_GetNumber(Copy(Edit4.Text,11,5));
    if Length(lsSeqn) <> 5 then begin           
      Result := False;
      ShowMessage('바코드 시리얼번호를 확인하십시오');
    end;
  end;
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  aDriver, aPort, aPrinterName: array[0..255] of Char; { aDriver and aPort won’t be used }
  hPrinter: THandle;
  cPrinter : String;
  cSend : String;

  li : Integer;
begin

//  gbStart := not gbStart;

//  if gbStart1 then Exit;
  
  if not fn_Valid then begin
    Exit;
  end;
  
  if gbPrint then begin
    //포트오픈
    Printer.GetPrinter(aPrinterName, aDriver, aPort, hPrinter);
    cPrinter := aPrinterName;

    if not OpenPrinter(PChar(cPrinter), Handle, nil) then
    begin
      ShowMessage('error ' + IntToStr(GetLastError));
      Exit;
    end;

    with DocInfo1 do begin
      pDocName := PChar('test doc');
      pOutputFile := nil;
  //    pOutputFile := 'C:\11.txt';
      pDataType := 'RAW';
    end;
    StartDocPrinter(Handle, 1, @DocInfo1);
    StartPagePrinter(Handle);
  end;

  for li := 0 to StrToInt(FloatToStr(cedtVBELN.Value)) -1 do begin

    if gbPrint then begin
      cSend := 'CB' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'SA0' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'SOB' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);

      cSend := 'SW520' + #13 + #10;      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'SL400,25,G' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);

      cSend := 'SM0,0' + #13 + #10;      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'SS2' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'SD18' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);

      cSend := 'T20,20,d,1,1,0,0,N,N,''' + '품  명 : ' + Edit1.Text + '''' + #13 + #10;      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'T20,80,d,1,1,0,0,N,N,''' + '회사명 : ' + Edit2.Text + '''' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'T20,140,d,1,1,0,0,N,N,''' + '연락처 : ' + Edit3.Text + '''' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);

//      cSend := 'B120,220,0,2,4,70,0,0,''' + Edit4.Text + '''' + #13 + #10; // Code 39
      cSend := 'B120,220,1,3,3,70,0,0,''' + Edit4.Text + '''' + #13 + #10; // Code 128
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'T20,295,c,1,1,0,0,N,N,''' + Edit4.Text + '''' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);

      cSend := 'T20,340,e,1,1,0,0,N,N,''' + Edit5.Text + '''' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
      cSend := 'P1,1' + #13 + #10;
      Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    end;
    
    Edit4.Text := fn_InsertData(Edit4.Text);
  end;
                   
  if gbPrint then begin
    EndPagePrinter(Handle);
    EndDocPrinter(Handle);
    ClosePrinter(Handle);
  end;
end;

procedure TFIBarcodePrinting.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
