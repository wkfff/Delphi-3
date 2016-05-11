unit UIBarcodePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, DBTables,
  Printers, Winspool;

type
  TFIBarcodePrint = class(TForm)
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    cedtVBELN: TCurrencyEdit;
    Label6: TLabel;
    cbITEM_CODE: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbITEM_CODEChange(Sender: TObject);
  private
    { Private declarations }
    giCount : Integer;
    gbStart : Boolean;
  public
    { Public declarations }
  end;

var
  FIBarcodePrint: TFIBarcodePrint;

implementation

uses ULib, UDM;

{$R *.dfm}

procedure TFIBarcodePrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFIBarcodePrint.FormDestroy(Sender: TObject);
begin
  FIBarcodePrint := nil;
end;

procedure TFIBarcodePrint.FormCreate(Sender: TObject);
  function fn_GetMax:String;
  var
    lsITEM_CODE : String;
  begin

    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' select top 1 ITEM_CODE '+
              '   from dbo.STH003      ');
      Open;
      if not IsEmpty then begin
        lsITEM_CODE := Fields[0].AsString;
      end;
      

      Close;
      SQL.Clear;
      SQL.Add(' select max(barcode)                      '+
              '   from dbo.SPM100                        '+
              '  where substring(BARCODE,5,6) = :BARCODE ');
      Params[0].AsString := gsNowDateShort;
      Open;
      if not IsEmpty then begin
        if Fields[0].IsNull then begin
          Result := lsITEM_CODE + gsNowdateShort + '00001';
        end
        else
          Result := Fields[0].AsString;
      end
      else begin
          Result := lsITEM_CODE + gsNowdateShort + '00001';
      end;
    except
       on E:EDBEngineError do begin
          Application.MessageBox(PChar('ERROR :'), PChar(E.Message), 0);
          Exit;
       end;
    end;
  end;
var
  lsBarcode : String;
  lsSeqn    : String;
begin                                         
  gbStart := False;
  
  giCount := 0;
  Button1Click(Self);

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

//  dpBar1.Date := StrToDateTime(gsNowDate);
  Edit1.Text := 'LCD Counter Unit';
  Edit2.Text := 'Creativeicon Co., Ltd.';
  Edit3.Text := '02)309-0078';

  lsBarcode  := fn_GetMax;
  lsSeqn     := FormatFloat('00000',StrToInt(Copy(lsBarcode,11,5))+1);
  
  lsBarcode := Copy(lsBarcode,1,10);

  lsBarcode := lsBarcode + lsSeqn;
  
  Edit4.Text := lsBarcode;
  Edit5.Text := '"A/S를 위해 본 바코드 라벨을 제거하지 마십시오"';
end;

procedure TFIBarcodePrint.Button1Click(Sender: TObject);
  function fn_InsertData(ABarcode:String; AInc:Integer):String;
  var
    lsBarcode : String;
    lsSeqn    : String;
  begin
    //Result := False;
    lsBarcode := Copy(ABarcode,1,10);

    lsSeqn    := FormatFloat('00000',StrToInt(Copy(ABarcode,11,5))+AInc);
    lsBarcode := lsBarcode + lsSeqn;

    with DM.qryOpen do try
      Close;
      SQL.Clear;
      SQL.Add(' select barcode           '+
              '   from dbo.SPM100        '+
              ' where barcode = :barcode ');
      Params[0].AsString := lsBarcode;
      Open;
      if not IsEmpty then begin
          //ShowMessage('이미 처리된 제품입니다.');
          //Result := True;
          Exit;
      end;
      Close;
      SQL.Clear;
      SQL.Add(' insert into dbo.SPM100                                        '+
              ' (              BARCODE, ITEM_STATE,ITEM_CODE,ITEM_NAME, BARCODE_DATE,I_ID) '+
              '  select top 1 :BARCODE,:ITEM_STATE,ITEM_CODE,ITEM_NAME,:BARCODE_DATE,:I_ID '+
              '    from dbo.STH003 ');

      Params[0].AsString := lsBarcode;
      Params[1].AsString := '0';
      Params[2].AsString := gsNowDateTime;
      Params[3].AsString := gsUserID;
      ExecSQL;

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
  lsBarcode : String;
begin

  gbStart := not gbStart;

  if gbStart then Exit;
  
  if not fn_Valid then begin
    Exit;
  end;
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

  lsBarcode := Edit4.Text;

  for li := 0 to StrToInt(FloatToStr(cedtVBELN.Value)) -1 do begin
                             
    lsBarcode := fn_InsertData(Edit4.Text,li);
    
    cSend := 'CB' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'SA0' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'SOB' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

    cSend := 'SW520' + #13 + #10;    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'SL400,25,G' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

    cSend := 'SM0,0' + #13 + #10;    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'SS2' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'SD18' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

    cSend := 'T20,20,d,1,1,0,0,N,N,''' + '품  명 : ' + Edit1.Text + '''' + #13 + #10;    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'T20,80,d,1,1,0,0,N,N,''' + '회사명 : ' + Edit2.Text + '''' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'T20,140,d,1,1,0,0,N,N,''' + '연락처 : ' + Edit3.Text + '''' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

    cSend := 'B120,220,1,3,3,70,0,0,''' + lsBarcode + '''' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'T20,295,c,1,1,0,0,N,N,''' + lsBarcode + '''' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

    cSend := 'T20,340,e,1,1,0,0,N,N,''' + Edit5.Text + '''' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);
    cSend := 'P1,1' + #13 + #10;
    Writeprinter(Handle, PChar(cSend), Length(cSend), N);

  end;

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;

procedure TFIBarcodePrint.cbITEM_CODEChange(Sender: TObject);
begin
  cbITEM_CODE.
end;

end.
