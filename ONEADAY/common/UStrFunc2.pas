{
--------------------------------------------------------------------------------
 1.String Function

   ControlStatue to String
   String to ControlStatue




--------------------------------------------------------------------------------
}
unit UStrFunc2;

interface

uses
  Classes, Controls, Graphics, Forms, Dialogs, SysUtils;

function fnStrIsInteger(Str: string): Boolean;
function fnStrClearToInteger(Str: string): string;
function fnMasterPath: string;
function fnCodeString(Strng, Code: string): string;
function fnCodeStringDelim(Str, Password: string; Delimiter: Char): string;
function fnDecodeStringDelim(Str: string; Delimiter: Char): string;
function fnStringLen(Str: string): Integer;
function fnStringCountInStr(SubStr, Str: string): Integer;
function fnSubPositionByIndex(Str, SubStr: string; Index: Integer): Integer;
function fnStrToList(Str, Delimeter: string): TStringList;
function fnListToStr(List: TStringList; Delimeter: string): string;
function fnStrLeft(Str: string; Count: Integer): string;
function fnStrMid(Str: string; Start, Count: Integer): string;
function fnStrRight(Str: string; Count: Integer): string;
function fnStrPart(Str: string; Start, Stop: Integer): string;
procedure prShowInteger(Int: Integer);

function fnBoolToStr(Bool: Boolean): string;
function fnStrToBool(Bool: string): Boolean;

function fnAlignToStr(Align: TAlign): string;
function fnStrToAlign(Align: string): TAlign;
function fnAnchorsToStr(Anchors: TAnchors): string;
function fnStrToAnchors(Anchors: string): TAnchors;
function fnBiDiModeToStr(BiDiMode: TBiDiMode): string;
function fnStrToBiDiMode(BiDiMode: string): TBiDiMode;
function fnBorderIconsToStr(BorderIcons: TBorderIcons): string;
function fnStrToBorderIcons(BorderIcons: string): TBorderIcons;
function fnBorderStyleToStr(BorderStyle: TFormBorderStyle): string;
function fnStrToBorderStyle(BorderStyle: string): TFormBorderStyle;
function fnConstraintsToStr(Constraints: TSizeConstraints): string;
function fnStrToConstraints(Constraints: string): TSizeConstraints;
function fnDefaultMonitorToStr(DefaultMonitor: TDefaultMonitor): string;
function fnStrToDefaultMonitor(DefaultMonitor: string): TDefaultMonitor;
function fnDragKindToStr(DragKind: TDragKind): string;
function fnStrToDragKind(DragKind: string): TDragKind;
function fnDragModeToStr(DragMode: TDragMode): string;
function fnStrToDragMode(DragMode: string): TDragMode;
function fnFontPitchToStr(FontPitch: TFontPitch): string;
function fnStrToFontPitch(FontPitch: string): TFontPitch;
function fnFontStyleToStr(FontStyle: TFontStyles): string;
function fnStrToFontStyle(FontStyle: string): TFontStyles;
function fnFontToStr(Font: TFont): string;
function fnStrToFont(Font: string): TFont;
function fnFormStyleToStr(FormStyle: TFormStyle): string;
function fnStrToFormStyle(FormStyle: string): TFormStyle;
function fnScrollBarStyleToStr(ScrollBarStyle: TScrollBarStyle): string;
function fnStrToScrollBarStyle(ScrollBarStyle: string): TScrollBarStyle;
function fnControlScrollBarToStr(ControlScrollBar: TControlScrollBar): string;
function fnStrToControlScrollBar(ControlScrollBar: string): TControlScrollBar;
function fnPositionToStr(Position: TPosition): string;
function fnStrToPosition(Position: string): TPosition;
function fnPrintScaleToStr(PrintScale: TPrintScale): string;
function fnStrToPrintScale(PrintScale: string): TPrintScale;
function fnWindowStateToStr(WindowState: TWindowState): string;
function fnStrToWindowState(WindowState: string): TWindowState;

procedure prReverseStringList(var List: TStringList);
function fnReplaceStr(OldStr, FillStr: string; ReplaceChar: Char; AlignRight: Boolean): string;
function fnReverseStr(const Str: string): string;

function fnCountCharInStr(Str: string; Chr: Char): Integer;
function fnSmashStr(ValueA, ValueB: string): string;

implementation

uses
  Windows;

function fnStrIsInteger(Str: string): Boolean;
begin
  result := not (StrToIntDef(Str, -2147483647) = -2147483647);
end;

function fnStrClearToInteger(Str: string): string;
var
  i: integer;
begin
  Result := Str;
  for i := Length(Result) downto 1 do
    if not (Result[i] in ['0'..'9']) then
      Delete(Result, i, 1);
end;

function fnMasterPath: string;
begin
  //result := UpperCase(IncludeTrailingBackslash(ExtractFilePath(Application.Exename)));
end;

function fnCodeString(Strng, Code: string): string;
var
  i: byte;
  h: string;
  j: byte;
begin
  Code := fnReverseStr(Code);
  i := 1;
  h := '';
  j := 1;
  while (i <= length(strng)) do
  begin
    h := h + chr(ord(strng[i]) xor ord(code[j]));
    inc(i);
    if j = length(code) then j := 1 else inc(j);
  end;
  result := h;
end;

function fnCodeStringDelim(Str, Password: string; Delimiter: Char): string;
begin
  Password := fnReverseStr(Password);
  result := fnCodeString(Str, Password) + Delimiter + Password;
end;

function fnDecodeStringDelim(Str: string; Delimiter: Char): string;
var
  TL: TStringList;
  CodedStr, Pwd: string;
begin
  TL := TStringList.Create;
  TL.Assign(fnStrToList(Str, Delimiter));
  CodedStr := TL[0];
  Pwd := TL[1];
  TL.Free;
  result := fnCodeString(CodedStr, Pwd);
end;

function fnStringLen(Str: string): Integer;
begin
  result := StrLen(PChar(Str));
end;

function fnStringCountInStr(SubStr, Str: string): Integer;
var
  StrLn, SubLn, I: Integer;
  TempStr: string;
begin
  StrLn := StrLen(PChar(Str));
  SubLn := StrLen(PChar(SubStr));
  TempStr := Str;
  result := 0;

  for I := 0 to StrLn - 1 do
  begin
    TempStr := Copy(Str, I + 1, SubLn);
    if TempStr = SubStr then Inc(result);
  end;

end;

function fnStrToList(Str, Delimeter: string): TStringList;
var
  I, iPos1, iPos2, DelimCount, StringLen: Integer;
begin
  result := TStringList.Create;
  DelimCount := fnStringCountInStr(Delimeter, Str);

  if DelimCount < 1 then
  begin
    result.Add(Str);
    exit;
  end;

  StringLen := StrLen(PChar(Str));

  if Pos(Delimeter, Str) = 0 then exit
  else
  begin
    result.Add(fnStrLeft(Str, Pos(Delimeter, Str) - 1));
    for I := 0 to fnStringCountInStr(Delimeter, Str) - 2 do
    begin
      iPos1 := fnSubPositionByIndex(Str, Delimeter, I + 1);
      iPos2 := fnSubPositionByIndex(Str, Delimeter, I + 2);
      result.Add(fnStrMid(Str, iPos1 + 1, iPos2 - iPos1 - 1));
    end;
  end;

  result.Add(fnStrPart(Str, fnSubPositionByIndex(Str, Delimeter, DelimCount) + 1, StringLen + 1));
end;

function fnListToStr(List: TStringList; Delimeter: string): string;
var
  I: Integer;
  TempStr: string;
begin
  for I := 0 to List.Count - 1 do
    TempStr := TempStr + List[I] + Delimeter;

  Delete(TempStr, (fnStringLen(TempStr) - fnStringLen(Delimeter) + 1), fnStringLen(Delimeter));
  result := TempStr;
end;

function fnStrLeft(Str: string; Count: Integer): string;
begin
  result := Copy(Str, 1, Count);
end;

function fnStrMid(Str: string; Start, Count: Integer): string;
begin
  result := Copy(Str, Start, Count);
end;

function fnStrRight(Str: string; Count: Integer): string;
var StrLn: Integer;
begin
  StrLn := StrLen(PChar(Str));
  result := Copy(Str, StrLn - (Count - 1), Count);
end;

function fnStrPart(Str: string; Start, Stop: Integer): string;
begin
  result := Copy(Str, Start, Stop - Start);
end;

procedure prShowInteger(Int: Integer);
begin
  ShowMessage(IntToStr(Int));
end;

function fnBoolToStr(Bool: Boolean): string;
begin
  if Bool then result := '1' else result := '0';
end;

function fnStrToBool(Bool: string): Boolean;
begin
  result := (Bool = '1');
end;

function fnAlignToStr(Align: TAlign): string;
begin
  result := 'alNone';
  case Align of
    alBottom: result := 'alBottom';
    alClient: result := 'alClient';
    alLeft: result := 'alLeft';
    alRight: result := 'alRight';
    alTop: result := 'alTop';
  end;
end;

function fnStrToAlign(Align: string): TAlign;
begin
  result := alNone;
  if Align = 'alBottom' then result := alBottom
  else if Align = 'alClient' then result := alClient
  else if Align = 'alLeft' then result := alLeft
  else if Align = 'alRight' then result := alRight
  else if Align = 'alTop' then result := alTop;
end;

function fnAnchorsToStr(Anchors: TAnchors): string;
var
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  try
    if akLeft in Anchors then TempList.Add('akLeft');
    if akTop in Anchors then TempList.Add('akTop');
    if akRight in Anchors then TempList.Add('akRight');
    if akBottom in Anchors then TempList.Add('akBottom');
    result := fnListToStr(TempList, '|');
  finally
    TempList.Free;
  end;
end;

function fnStrToAnchors(Anchors: string): TAnchors;
var
  TempList: TStringList;
  I: Integer;
  TempAnchors: TAnchors;
begin
  TempList := fnStrToList(Anchors, '|');

  for I := 0 to TempList.Count - 1 do
  begin
    if TempList[I] = 'akLeft' then Include(TempAnchors, akLeft);
    if TempList[I] = 'akTop' then Include(TempAnchors, akTop);
    if TempList[I] = 'akRight' then Include(TempAnchors, akRight);
    if TempList[I] = 'akBottom' then Include(TempAnchors, akBottom);
  end;

  result := TempAnchors;
  TempList.Free;
end;

function fnBiDiModeToStr(BiDiMode: TBiDiMode): string;
begin
  case BiDiMode of
    bdLeftToRight: result := 'bdLeftToRight';
    bdRightToLeft: result := 'bdRightToLeft';
    bdRightToLeftNoAlign: result := 'bdRightToLeftNoAlign';
    bdRightToLeftReadingOnly: result := 'bdRightToLeftReadingOnly';
  end;
end;


function fnStrToBiDiMode(BiDiMode: string): TBiDiMode;
begin
  result := bdLeftToRight;
  if BiDiMode = 'bdLeftToRight' then result := bdLeftToRight
  else if BiDiMode = 'bdRightToLeft' then result := bdRightToLeft
  else if BiDiMode = 'bdRightToLeftNoAlign' then result := bdRightToLeftNoAlign
  else if BiDiMode = 'bdRightToLeftReadingOnly' then result := bdRightToLeftReadingOnly;
end;

function fnBorderIconsToStr(BorderIcons: TBorderIcons): string;
var
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  try
    if biSystemMenu in BorderIcons then TempList.Add('biSystemMenu');
    if biMinimize in BorderIcons then TempList.Add('biMinimize');
    if biMaximize in BorderIcons then TempList.Add('biMaximize');
    if biHelp in BorderIcons then TempList.Add('biHelp');
    result := fnListToStr(TempList, '|');
  finally
    TempList.Free;
  end;
end;

function fnStrToBorderIcons(BorderIcons: string): TBorderIcons;
var
  TempList: TStringList;
  I: Integer;
begin
  TempList := fnStrToList(BorderIcons, '|');
  for I := 0 to TempList.Count - 1 do
  begin
    if TempList[I] = 'biSystemMenu' then Include(result, biSystemMenu);
    if TempList[I] = 'biMinimize' then Include(result, biMinimize);
    if TempList[I] = 'biMaximize' then Include(result, biMaximize);
    if TempList[I] = 'biHelp' then Include(result, biHelp);
  end;
  TempList.Free;
end;

function fnBorderStyleToStr(BorderStyle: TFormBorderStyle): string;
begin
  result := 'bsSizeable';
  case BorderStyle of
    bsDialog: result := 'bsDialog';
    bsNone: result := 'bsNone';
    bsSingle: result := 'bsSingle';
    bsSizeable: result := 'bsSizeable';
    bsSizeToolWin: result := 'bsSizeToolWin';
    bsToolWindow: result := 'bsToolWindow';
  end;
end;

function fnStrToBorderStyle(BorderStyle: string): TFormBorderStyle;
begin
  result := bsSizeable;
  if BorderStyle = 'bsDialog' then result := bsDialog;
  if BorderStyle = 'bsNone' then result := bsNone;
  if BorderStyle = 'bsSingle' then result := bsSingle;
  if BorderStyle = 'bsSizeable' then result := bsSizeable;
  if BorderStyle = 'bsSizeToolWin' then result := bsSizeToolWin;
  if BorderStyle = 'bsToolWindow' then result := bsToolWindow;
end;

function fnConstraintsToStr(Constraints: TSizeConstraints): string;
begin
  with Constraints do
    result := IntToStr(MaxHeight) + '|' +
      IntToStr(MaxWidth) + '|' +
      IntToStr(MinHeight) + '|' +
      IntToStr(MinWidth);
end;


function fnStrToConstraints(Constraints: string): TSizeConstraints;
var
  TempList: TStringList;
begin
  result := TSizeConstraints.Create(Application.MainForm);
  TempList := fnStrToList(Constraints, '|');
  result.MaxHeight := StrToIntDef(TempList[0], 0);
  result.MaxWidth := StrToIntDef(TempList[1], 0);
  result.MinHeight := StrToIntDef(TempList[2], 0);
  result.MinWidth := StrToIntDef(TempList[3], 0);
  TempList.Free;
end;

function fnDefaultMonitorToStr(DefaultMonitor: TDefaultMonitor): string;
begin
  result := 'dmPrimary';
  case DefaultMonitor of
    dmDesktop: result := 'dmDesktop';
    dmPrimary: result := 'dmPrimary';
    dmMainForm: result := 'dmMainForm';
    dmActiveForm: result := 'dmActiveForm';
  end;
end;


function fnStrToDefaultMonitor(DefaultMonitor: string): TDefaultMonitor;
begin
  result := dmPrimary;
  if DefaultMonitor = 'dmDesktop' then result := dmDesktop
  else if DefaultMonitor = 'dmPrimary' then result := dmPrimary
  else if DefaultMonitor = 'dmMainForm' then result := dmMainForm
  else if DefaultMonitor = 'dmActiveForm' then result := dmActiveForm;
end;

function fnDragKindToStr(DragKind: TDragKind): string;
begin
  if DragKind = dkDrag then result := 'dkDrag' else result := 'dkDock';
end;

function fnStrToDragKind(DragKind: string): TDragKind;
begin
  if DragKind = 'dkDrag' then result := dkDrag else result := dkDock;
end;

function fnDragModeToStr(DragMode: TDragMode): string;
begin
  if DragMode = dmManual then result := 'dmManual' else result := 'dmAutomatic';
end;

function fnStrToDragMode(DragMode: string): TDragMode;
begin
  if DragMode = 'dmManual' then result := dmManual else result := dmAutomatic;
end;

function fnFontPitchToStr(FontPitch: TFontPitch): string;
begin
  result := 'fpDefault';
  case FontPitch of
    fpDefault: result := 'fpDefault';
    fpFixed: result := 'fpFixed';
    fpVariable: result := 'fpVariable';
  end;
end;

function fnStrToFontPitch(FontPitch: string): TFontPitch;
begin
  result := fpDefault;
  if FontPitch = 'fpDefault' then result := fpDefault
  else if FontPitch = 'fpFixed' then result := fpFixed
  else if FontPitch = 'fpVariable' then result := fpVariable;
end;

function fnFontStyleToStr(FontStyle: TFontStyles): string;
var
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  if fsBold in FontStyle then TempList.Add('fsBold');
  if fsItalic in FontStyle then TempList.Add('fsItalic');
  if fsUnderline in FontStyle then TempList.Add('fsUnderline');
  if fsStrikeOut in FontStyle then TempList.Add('fsStrikeOut');
  if TempList.Count = 0 then TempList.Add('fsNone');
  result := fnListToStr(TempList, '~');
  TempList.Free;
end;

function fnStrToFontStyle(FontStyle: string): TFontStyles;
var
  TempList: TStringList;
  I: Integer;
begin
  TempList := fnStrToList(FontStyle, '~');
  result := [];
  for I := 0 to TempList.Count - 1 do
  begin
    if TempList[I] = 'fsBold' then Include(result, fsBold)
    else if TempList[I] = 'fsItalic' then Include(result, fsItalic)
    else if TempList[I] = 'fsUnderline' then Include(result, fsUnderline)
    else if TempList[I] = 'fsStrikeOut' then Include(result, fsStrikeOut);
  end;
  TempList.Free;
end;

function fnFontToStr(Font: TFont): string;
var
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  TempList.Add(IntToStr(Int64(Font.Charset)));
  TempList.Add(ColorToString(Font.Color));
  TempList.Add(IntToStr(Font.Height));
  TempList.Add(Font.Name);
  TempList.Add(fnFontPitchToStr(Font.Pitch));
  TempList.Add(IntToStr(Font.Size));
  TempList.Add(fnFontStyleToStr(Font.Style));
  result := fnListToStr(TempList, '|');
  TempList.Free;
end;

function fnStrToFont(Font: string): TFont;
var
  TempList: TStringList;
  bFont: TFont;
begin
  TempList := fnStrToList(Font, '|');
  bFont := TFont.Create;
  bFont.Charset := StrToIntDef(TempList[0], 1);
  bFont.Color := StringToColor(TempList[1]);
  bFont.Height := StrToIntDef(TempList[2], -11);
  bFont.Name := TempList[3];
  bFont.Pitch := fnStrToFontPitch(TempList[4]);
  bFont.Size := StrToIntDef(TempList[5], 8);
  bFont.Style := fnStrToFontStyle(TempList[6]);
  TempList.Free;
  result := bFont;
end;

function fnFormStyleToStr(FormStyle: TFormStyle): string;
begin
  result := 'fsNormal';
  case FormStyle of
    fsNormal: result := 'fsNormal';
    fsMDIChild: result := 'fsMDIChild';
    fsMDIForm: result := 'fsMDIForm';
    fsStayOnTop: result := 'fsStayOnTop';
  end;
end;

function fnStrToFormStyle(FormStyle: string): TFormStyle;
begin
  result := fsNormal;
  if FormStyle = 'fsNormal' then result := fsNormal
  else if FormStyle = 'fsMDIChild' then result := fsMDIChild
  else if FormStyle = 'fsMDIForm' then result := fsMDIForm
  else if FormStyle = 'fsStayOnTop' then result := fsStayOnTop;
end;


function fnScrollBarStyleToStr(ScrollBarStyle: TScrollBarStyle): string;
begin
  result := 'ssRegular';
  case ScrollBarStyle of
    ssRegular: result := 'ssRegular';
    ssFlat: result := 'ssFlat';
    ssHotTrack: result := 'ssHotTrack';
  end;
end;

function fnStrToScrollBarStyle(ScrollBarStyle: string): TScrollBarStyle;
begin
  result := ssRegular;
  if ScrollBarStyle = 'ssRegular' then result := ssRegular
  else if ScrollBarStyle = 'ssFlat' then result := ssFlat
  else if ScrollBarStyle = 'ssHotTrack' then result := ssHotTrack;
end;

function fnControlScrollBarToStr(ControlScrollBar: TControlScrollBar): string;
var
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  with ControlScrollBar do
  begin
    TempList.Add(IntToStr(ButtonSize));
    TempList.Add(ColorToString(Color));
    TempList.Add(IntToStr(Increment));
    TempList.Add(IntToStr(Margin));
    TempList.Add(fnBoolToStr(ParentColor));
    TempList.Add(IntToStr(Position));
    TempList.Add(IntToStr(Range));
    TempList.Add(IntToStr(Size));
    TempList.Add(fnBoolToStr(Smooth));
    TempList.Add(fnScrollBarStyleToStr(Style));
    TempList.Add(IntToStr(ThumbSize));
    TempList.Add(fnBoolToStr(Tracking));
    TempList.Add(fnBoolToStr(Visible));
  end;
  result := fnListToStr(TempList, '|');
  TempList.Free;
end;

function fnStrToControlScrollBar(ControlScrollBar: string): TControlScrollBar;
var
  TempList: TStringList;
  rslt: TControlScrollBar;
begin
  TempList := fnStrToList(ControlScrollBar, '|');
  rslt := TControlScrollBar.Create;
  with rslt do
  begin
    ButtonSize := StrToIntDef(TempList[0], 0);
    Increment := StrToIntDef(TempList[2], 8);
    Margin := StrToIntDef(TempList[3], 0);
    ParentColor := fnStrToBool(TempList[4]);
//      Position:=     StrToIntDef(TempList[5], 0);
//      Range:=        StrToIntDef(TempList[6], 0);
    Size := StrToIntDef(TempList[7], 0);
    Smooth := fnStrToBool(TempList[8]);
    Style := fnStrToScrollBarStyle(TempList[9]);
    ThumbSize := StrToIntDef(TempList[10], 0);
    Tracking := fnStrToBool(TempList[11]);
      {Visible:=      StrToBool(TempList[12]);//}
  end;
  result := rslt;
end;

function fnPositionToStr(Position: TPosition): string;
begin
  result := 'poDesigned';
  case Position of
    poDesigned: result := 'poDesigned';
    poDefault: result := 'poDefault';
    poDefaultPosOnly: result := 'poDefaultPosOnly';
    poDefaultSizeOnly: result := 'poDefaultSizeOnly';
    poScreenCenter: result := 'poScreenCenter';
    poDesktopCenter: result := 'poDesktopCenter';
    //poMainFormCenter: result := 'poMainFormCenter';
    //poOwnerFormCenter: result := 'poOwnerFormCenter';
  end;
end;

function fnStrToPosition(Position: string): TPosition;
begin
  result := poDesigned;
  if Position = 'poDesigned' then result := poDesigned
  else if Position = 'poDefault' then result := poDesigned
  else if Position = 'poDefaultPosOnly' then result := poDefaultPosOnly
  else if Position = 'poDefaultSizeOnly' then result := poDefaultSizeOnly
  else if Position = 'poScreenCenter' then result := poScreenCenter
  else if Position = 'poDesktopCenter' then result := poDesktopCenter
//  else if Position = 'poMainFormCenter' then result := poMainFormCenter
//  else if Position = 'poOwnerFormCenter' then result := poOwnerFormCenter;
end;

function fnPrintScaleToStr(PrintScale: TPrintScale): string;
begin
  result := 'poProportional';
  case PrintScale of
    poNone: result := 'poNone';
    poProportional: result := 'poProportional';
    poPrintToFit: result := 'poPrintToFit';
  end;
end;

function fnStrToPrintScale(PrintScale: string): TPrintScale;
begin
  result := poProportional;
  if PrintScale = 'poNone' then result := poNone
  else if PrintScale = 'poProportional' then result := poProportional
  else if PrintScale = 'poPrintToFit' then result := poPrintToFit;
end;

function fnWindowStateToStr(WindowState: TWindowState): string;
begin
  result := 'wsNormal';
  case WindowState of
    wsNormal: result := 'wsNormal';
    wsMinimized: result := 'wsMinimized';
    wsMaximized: result := 'wsMaximized';
  end;
end;

function fnStrToWindowState(WindowState: string): TWindowState;
begin
  result := wsNormal;
  if WindowState = 'wsNormal' then result := wsNormal
  else if WindowState = 'wsMinimized' then result := wsMinimized
  else if WindowState = 'wsMaximized' then result := wsMaximized;
end;

procedure prReverseStringList(var List: TStringList);
var
  TempList: TStringList;
  I: Integer;
begin
  TempList := TStringList.Create;
  for I := List.Count - 1 downto 0 do
  begin
    TempList.Add(List[I]);
  end;
  List.Assign(TempList);
  TempList.Free;
end;

function fnReplaceStr(OldStr, FillStr: string; ReplaceChar: Char; AlignRight: Boolean): string;
var
  fcCount, I, J, K: Integer;
begin
  if (fnStringLen(OldStr) < 1) then exit;

  result := OldStr;

  if (fnStringLen(FillStr) < 1) then exit;

  fcCount := fnStringCountInStr(ReplaceChar, OldStr);

  if fcCount < 1 then exit;

  if not AlignRight then
  begin
    K := 0;
    for I := 1 to fnStringLen(OldStr) do
    begin
      if OldStr[I] = ReplaceChar then
      begin
        inc(K);
        if not (K > fnStringLen(FillStr)) then OldStr[I] := FillStr[K];
      end;
    end;
  end
  else
  begin
    FillStr := fnReverseStr(FillStr);
    K := 0;
    for J := fnStringLen(OldStr) downto 1 do
    begin
      if OldStr[J] = ReplaceChar then
      begin
        inc(K);
        if not (K > fnStringLen(FillStr)) then OldStr[J] := FillStr[K];
      end;
    end;
  end;
  result := OldStr;
end;

function fnReverseStr(const Str: string): string;
var
  I: Integer;
begin
  result := Str;
  if fnStringLen(Str) < 2 then exit;
  for I := fnStringLen(Str) downto 1 do
  begin
    result[I] := Str[(fnStringLen(Str) - I) + 1];
  end;
end;

function fnCountCharInStr(Str: string; Chr: Char): Integer;
var
  I: Integer;
begin
  result := 0;
  for I := 1 to fnStringLen(Str) do
  begin
    if Str[I] = Chr then Inc(result);
  end;
end;

function fnSmashStr(ValueA, ValueB: string): string;
var
  i: Integer;
  strTemp: string;
begin
  strTemp := ValueB;
  for i := 1 to Length(ValueB) do
    if Pos(ValueB[i], ValueA) = 0 then
      strTemp := StringReplace(strTemp, ValueB[i], '', [rfReplaceAll]);

  Result := strTemp;
end;

function fnSubPositionByIndex(Str, SubStr: string; Index: Integer): Integer;
var
  StrLn, SubLn, Lock, I: Integer;
  TempStr: string;
begin
  StrLn := StrLen(PChar(Str));
  SubLn := StrLen(PChar(SubStr));
  result := 0;
  Lock := 0;
  for I := 0 to StrLn - 1 do
  begin
    TempStr := Copy(Str, I + 1, SubLn);
    if TempStr = SubStr then Inc(Lock);
    if Lock = Index then
    begin
      result := I + 1;
      break;
    end;
  end;
end;


end.
