unit UOneADay;

interface

uses
  AdvGrid,SysUtils, ComCtrls, Forms, Classes, Controls, Dialogs;

const
  gcALL    = '%%';
  gcReady  = '01';
  gcCancel = '02';
  gcIng    = '03';
  gcDone   = '04';

  gciALL    = 0;
  gciReady  = 1;
  gciCancel = 2;
  gciIng    = 3;
  gciDone   = 4;

  gcSerial  = 'P';
  gc88      = 'G';
  gcNoSale  = 'N';

  gcPurchase = '1000';
  gcSell     = '2000';
  gcReturn   = '3000';

  gcITEM_NAMEWidth = 311;
  gcPurchase_Dept = '3000';
  gcSale_Dept     = '2000';

var
  
  gChForm     : TForm;
  gsCATNO     : String;
  gsITEM_CODE : String;
  gsITEM_NAME : String;
  gsCUST_CODE : String;
  gsCUST_NAME : String;
  gsSTOCK_UNIT : String;

  procedure pr_SetRecordCount(AGrid:TAdvStringGrid);overload;
//  procedure pr_SetRecordCount(AForm:TForm);overload;
  procedure WinControlTitleSetting(AComponent: TComponent);
  procedure pr_WinControlTitleSetting(AWinControl:TWinControl);

  function fn_ChkAUTH_LEVEL:Boolean;

implementation

uses UQMain, ULib;

procedure pr_SetRecordCount(AGrid:TAdvStringGrid);
begin
  if AGrid.RowCount-1 = 1 then begin
    if AGrid.Cells[1,1] = '' then
      FQMain.sbMsg.Panels[0].Text := '조회건수:0'
    else
      FQMain.sbMsg.Panels[0].Text := '조회건수:1';
  end
  else
    FQMain.sbMsg.Panels[0].Text := '조회건수:'+ FormatFloat('#,###,##0', AGrid.RowCount-1);
end;


procedure WinControlTitleSetting(AComponent: TComponent);
var
  i : integer;
begin
  for i := 0 to AComponent.ComponentCount - 1 do begin
    if AComponent.Components[i] is TAdvStringGrid then begin
        (AComponent.Components[i] as TAdvStringGrid).RowCount;
    end
    else if AComponent.Components[i] is TComponent then
      WinControlTitleSetting((AComponent.Components[i] as TComponent));
  end;
end;

procedure pr_WinControlTitleSetting(AWinControl:TWinControl);
var
  liCnt : integer;
  lb    : Boolean;
  i     : integer;
begin
  
  for i := 0 to AWinControl.ControlCount-1 do begin
    if AWinControl.Controls[i] is TAdvStringGrid then begin
      if (AWinControl.Controls[i] as TAdvStringGrid).Name = 'sgMain' then begin
        liCnt := (AWinControl.Controls[i] as TAdvStringGrid).RowCount;
        lb    := (AWinControl.Controls[i] as TAdvStringGrid).Cells[1,1] = '';

        if liCnt-1 = 1 then begin
          if lb then
            FQMain.sbMsg.Panels[0].Text := '조회건수:0'
          else
            FQMain.sbMsg.Panels[0].Text := '조회건수:1';
        end
        else begin
          FQMain.sbMsg.Panels[0].Text := '조회건수:'+ FormatFloat('#,###,##0', liCnt-1);
        end;
        Break;

      end;
    end;
    //else if AWinControl.Components[i] is TWinControl then
    //  pr_WinControlTitleSetting((AWinControl.Controls[i] as TWinControl));
  end;

end;

    
function fn_ChkAUTH_LEVEL:Boolean;
begin
  Result := False;
  if gsAUTH_LEVEL <> '0001' then begin
    ShowMessage('권한이 없습니다.');
    Result := True;
  end;
end;

end.
