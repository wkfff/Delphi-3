unit USender;
          
interface

uses  BDE, DBTables, Dialogs, SysUtils;


  procedure pr_Send;
  procedure pr_SendIFZZINF;

implementation

uses UDM, ULib;

procedure pr_Send;
  // ASort 1:Master, 2:Detail
  function fn_IsSendData(AWRK_DT, AVBELN : String; ASort:Integer):Boolean;
  begin
    Result := False;
    if ASort = 1 then begin
      with DM.qryEORDO2MT do try
        Close;
        SQL.Clear;
        SQL.Add(' Exec sp_ZZSendData :giCOMP_CODE, :gsWRK_DT, :gsVBELN, :giSORT ');
        ParamByName('giCOMP_CODE').Value := giCOMP_CODE;
        ParamByName('gsWRK_DT').Value    := AWRK_DT;
        ParamByName('gsVBELN').Value     := AVBELN;
        ParamByName('giSORT').Value      := ASort;
        Open;

        if not IsEmpty then begin
          if Fields.FieldByNumber(1).AsString = '0' then begin
            Exit;
          end;
          Result := True;
        end;
      except
        on E : EDBEngineError do begin
          ShowMessage (E.Message);
          Exit;
        end;
      end;
    end
    else begin
      with DM.qryEORDO2DT do try
        Close;
        SQL.Clear;
        SQL.Add(' Exec sp_ZZSendData :giCOMP_CODE, :gsWRK_DT, :gsVBELN, :giSORT ');
        ParamByName('giCOMP_CODE').Value := giCOMP_CODE;
        ParamByName('gsWRK_DT').Value    := AWRK_DT;
        ParamByName('gsVBELN').Value     := AVBELN;
        ParamByName('giSORT').Value      := ASort;
        Open;

        if not IsEmpty then begin
          if Fields.FieldByNumber(1).AsString = '0' then begin
            Exit;
          end;
          Result := True;
        end;
      except
        on E : EDBEngineError do begin
          ShowMessage (E.Message);
          Exit;
        end;
      end;
    end;
  end;

  // APCOS
  function fn_IsEORDO2(ATable:Integer; ALC_CD, AWRK_DT, AVBELN : String; ALine, ABOX_NO:Integer; AMATNR:String):Boolean;
  begin
    Result := False;
    // 마스터
    if ATable = 1 then begin
      with DM.qryAPCOS do try
        Close;
        SQL.Clear;
        SQL.Add(' select VBELN           '+
                '  from EWRK02MT         '+
                ' where LC_CD  = :LC_CD  '+
                '   and WRK_DT = :WRK_DT '+
                '   and VBELN  = :VBELN  ');
        ParamByName('LC_CD').Value  := ALC_CD;
        ParamByName('WRK_DT').Value := AWRK_DT;
        ParamByName('VBELN').Value  := AVBELN;
        Open;
        if not IsEmpty then begin
          Result := True;
        end;
      except
        on E : EDBEngineError do begin
          ShowMessage (E.Message);
          Exit;
        end;
      end;
    end
    // 디테일
    else begin
      with DM.qryAPCOS do try
        Close;
        SQL.Clear;
        SQL.Add(' select VBELN           '+
                '  from EWRK02DT         '+
                ' where LC_CD  = :LC_CD  '+
                '   and WRK_DT = :WRK_DT '+
                '   and VBELN  = :VBELN  '+
                '   and LINE   = :LINE   '+
                '   and BOX_NO = :BOX_NO '+
                '   and MATNR  = :MATNR  ');
        ParamByName('LC_CD').Value  := ALC_CD;
        ParamByName('WRK_DT').Value := AWRK_DT;
        ParamByName('VBELN').Value  := AVBELN;
        ParamByName('LINE').Value   := ALine;
        ParamByName('BOX_NO').Value := ABOX_NO;
        ParamByName('MATNR').Value  := AMATNR;
        Open;
        if not IsEmpty then begin
          Result := True;
        end;
      except
        on E : EDBEngineError do begin
          ShowMessage (E.Message);
          Exit;
        end;
      end;
    end;

  end;

  // EORDO2MT 전송
  procedure pr_SendEORDO2MT;
  begin
    with DM.qryEORDO2MT do begin


      // Insert
      if not fn_IsEORDO2(1, FieldByName('LC_CD').AsString,
                            FieldByName('WRK_DT').AsString,
                            FieldByName('VBELN').AsString, 0, 0, '') then begin
        DM.qryAPCOS.Close;
        DM.qryAPCOS.SQL.Clear;
        DM.qryAPCOS.SQL.Add(' INSERT INTO EWRK02MT '+
                            '  (LC_CD, WRK_DT, VBELN, CUST_CD, DLV_CUST_NM, MATNR_CNT, MATNR_PCS, MATNR_DN, WRK_STAT, RCV_DT, '+
                            '   QUICK_STAT, BOX_QTY, SET_DT, PRNT_DT, WRK_START, WRK_END, LEAD_TM, RDATE, DONE_DT, ROUTE_ID,  '+
                            '   ROUTE, CNC_STAT, CNC_INDEX, CNC_INDEXNM, '+
                            '   CNC_REMK, CDATE, CUSER_ID, UDATE, UUSER_ID)                       '+
                            ' VALUES '+
                            '  (:LC_CD, :WRK_DT, :VBELN, :CUST_CD, :DLV_CUST_NM, :MATNR_CNT, :MATNR_PCS, :MATNR_DN, :WRK_STAT, :RCV_DT, '+
                            '   :QUICK_STAT, :BOX_QTY, :SET_DT, :PRNT_DT, :WRK_START, :WRK_END, :LEAD_TM, :RDATE, :DONE_DT, :ROUTE_ID,  '+
                            '   :ROUTE, :CNC_STAT, :CNC_INDEX, :CNC_INDEXNM, '+
                            '   :CNC_REMK, :CDATE, :CUSER_ID, :UDATE, :UUSER_ID)                         ');
        DM.qryAPCOS.ParamByName('LC_CD').Value       := FieldByName('LC_CD').Value;
        DM.qryAPCOS.ParamByName('WRK_DT').Value      := FieldByName('WRK_DT').Value;
        DM.qryAPCOS.ParamByName('VBELN').Value       := FieldByName('VBELN').Value;
        DM.qryAPCOS.ParamByName('CUST_CD').Value     := FieldByName('CUST_CD').Value;
        DM.qryAPCOS.ParamByName('DLV_CUST_NM').Value := FieldByName('DLV_CUST_NM').Value;

        DM.qryAPCOS.ParamByName('MATNR_CNT').Value   := FieldByName('MATNR_CNT').Value;
        DM.qryAPCOS.ParamByName('MATNR_PCS').Value   := FieldByName('MATNR_PCS').Value;
        DM.qryAPCOS.ParamByName('MATNR_DN').Value    := FieldByName('MATNR_DN').Value;
        DM.qryAPCOS.ParamByName('WRK_STAT').Value    := FieldByName('WRK_STAT').Value;
        DM.qryAPCOS.ParamByName('RCV_DT').Value      := FieldByName('RCV_DT').Value;

        DM.qryAPCOS.ParamByName('QUICK_STAT').Value  := FieldByName('QUICK_STAT').Value;
        DM.qryAPCOS.ParamByName('BOX_QTY').Value     := FieldByName('BOX_QTY').Value;
        DM.qryAPCOS.ParamByName('SET_DT').Value      := FieldByName('SET_DT').Value;
        DM.qryAPCOS.ParamByName('PRNT_DT').Value     := FieldByName('PRNT_DT').Value;
        DM.qryAPCOS.ParamByName('WRK_START').Value   := FieldByName('WRK_START').Value;

        DM.qryAPCOS.ParamByName('WRK_END').Value     := FieldByName('WRK_END').Value;
        DM.qryAPCOS.ParamByName('LEAD_TM').Value     := FieldByName('LEAD_TM').Value;
        DM.qryAPCOS.ParamByName('RDATE').Value       := FieldByName('RDATE').Value;
        DM.qryAPCOS.ParamByName('DONE_DT').Value     := FieldByName('DONE_DT').Value;
        DM.qryAPCOS.ParamByName('ROUTE_ID').Value    := FieldByName('ROUTE_ID').Value;

        DM.qryAPCOS.ParamByName('ROUTE').Value       := FieldByName('ROUTE').Value;
        DM.qryAPCOS.ParamByName('CNC_STAT').Value    := FieldByName('CNC_STAT').Value;
        DM.qryAPCOS.ParamByName('CNC_INDEX').Value   := FieldByName('CNC_INDEX').Value;
        DM.qryAPCOS.ParamByName('CNC_INDEXNM').Value := FieldByName('CNC_INDEXNM').Value;
        DM.qryAPCOS.ParamByName('CNC_REMK').Value    := FieldByName('CNC_REMK').Value;
        DM.qryAPCOS.ParamByName('CDATE').Value       := FieldByName('CDATE').Value;

        DM.qryAPCOS.ParamByName('CUSER_ID').Value    := FieldByName('CUSER_ID').Value;
        DM.qryAPCOS.ParamByName('UDATE').Value       := FieldByName('UDATE').Value;
        DM.qryAPCOS.ParamByName('UUSER_ID').Value    := FieldByName('UUSER_ID').Value;
        DM.qryAPCOS.ExecSQL;
      end
      // Update
      else begin
        if not DM.dbAPCOS.InTransaction then DM.dbAPCOS.StartTransaction;
                                 

        DM.qryAPCOS.Close;
        DM.qryAPCOS.SQL.Clear;
        DM.qryAPCOS.SQL.Add(' UPDATE EWRK02MT                 '+
                            ' SET CUST_CD     = :CUST_CD,     '+
                            '     DLV_CUST_NM = :DLV_CUST_NM, '+
                            '     MATNR_CNT   = :MATNR_CNT,   '+
                            '     MATNR_PCS   = :MATNR_PCS,   '+
                            '     MATNR_DN    = :MATNR_DN,    '+
                            '     WRK_STAT    = :WRK_STAT,    '+
                            '     RCV_DT      = :RCV_DT,      '+
                            '     QUICK_STAT  = :QUICK_STAT,  '+
                            '     BOX_QTY     = :BOX_QTY,     '+
                            '     SET_DT      = :SET_DT,      '+
                            '     PRNT_DT     = :PRNT_DT,     '+
                            '     WRK_START   = :WRK_START,   '+
                            '     WRK_END     = :WRK_END,     '+
                            '     LEAD_TM     = :LEAD_TM,     '+
                            '     RDATE       = :RDATE,       '+
                            '     DONE_DT     = :DONE_DT,     '+
                            '     ROUTE_ID    = :ROUTE_ID,    '+
                            '     ROUTE       = :ROUTE,       '+
                            '     CNC_STAT    = :CNC_STAT,    '+
                            '     CNC_INDEX   = :CNC_INDEX,   '+
                            '     CNC_INDEXNM = :CNC_INDEXNM, '+
                            '     CNC_REMK    = :CNC_REMK,    '+
                            '     UDATE       = :UDATE,       '+
                            '     UUSER_ID    = :UUSER_ID     '+
                            ' WHERE LC_CD     = :LC_CD        '+
                            '   AND WRK_DT    = :WRK_DT       '+
                            '   AND VBELN     = :VBELN        ');
        DM.qryAPCOS.ParamByName('LC_CD').Value       := DM.qryEORDO2MT.FieldByName('LC_CD').Value;
        DM.qryAPCOS.ParamByName('WRK_DT').Value      := DM.qryEORDO2MT.FieldByName('WRK_DT').Value;
        DM.qryAPCOS.ParamByName('VBELN').Value       := DM.qryEORDO2MT.FieldByName('VBELN').Value;
        DM.qryAPCOS.ParamByName('CUST_CD').Value     := DM.qryEORDO2MT.FieldByName('CUST_CD').Value;
        DM.qryAPCOS.ParamByName('DLV_CUST_NM').Value := DM.qryEORDO2MT.FieldByName('DLV_CUST_NM').Value;

        DM.qryAPCOS.ParamByName('MATNR_CNT').Value   := DM.qryEORDO2MT.FieldByName('MATNR_CNT').Value;
        DM.qryAPCOS.ParamByName('MATNR_PCS').Value   := DM.qryEORDO2MT.FieldByName('MATNR_PCS').Value;
        DM.qryAPCOS.ParamByName('MATNR_DN').Value    := DM.qryEORDO2MT.FieldByName('MATNR_DN').Value;
        DM.qryAPCOS.ParamByName('WRK_STAT').Value    := DM.qryEORDO2MT.FieldByName('WRK_STAT').Value;
        DM.qryAPCOS.ParamByName('RCV_DT').Value      := DM.qryEORDO2MT.FieldByName('RCV_DT').Value;

        DM.qryAPCOS.ParamByName('QUICK_STAT').Value  := DM.qryEORDO2MT.FieldByName('QUICK_STAT').Value;
        DM.qryAPCOS.ParamByName('BOX_QTY').Value     := DM.qryEORDO2MT.FieldByName('BOX_QTY').Value;
        DM.qryAPCOS.ParamByName('SET_DT').Value      := DM.qryEORDO2MT.FieldByName('SET_DT').Value;
        DM.qryAPCOS.ParamByName('PRNT_DT').Value     := DM.qryEORDO2MT.FieldByName('PRNT_DT').Value;
        DM.qryAPCOS.ParamByName('WRK_START').Value   := DM.qryEORDO2MT.FieldByName('WRK_START').Value;

        DM.qryAPCOS.ParamByName('WRK_END').Value     := DM.qryEORDO2MT.FieldByName('WRK_END').Value;
        DM.qryAPCOS.ParamByName('LEAD_TM').Value     := DM.qryEORDO2MT.FieldByName('LEAD_TM').Value;
        DM.qryAPCOS.ParamByName('RDATE').Value       := DM.qryEORDO2MT.FieldByName('RDATE').Value;
        DM.qryAPCOS.ParamByName('DONE_DT').Value     := DM.qryEORDO2MT.FieldByName('DONE_DT').Value;
        DM.qryAPCOS.ParamByName('ROUTE_ID').Value    := DM.qryEORDO2MT.FieldByName('ROUTE_ID').Value;

        DM.qryAPCOS.ParamByName('ROUTE').Value       := DM.qryEORDO2MT.FieldByName('ROUTE').Value;
        DM.qryAPCOS.ParamByName('CNC_STAT').Value    := DM.qryEORDO2MT.FieldByName('CNC_STAT').Value;
        DM.qryAPCOS.ParamByName('CNC_INDEX').Value   := DM.qryEORDO2MT.FieldByName('CNC_INDEX').Value;
        DM.qryAPCOS.ParamByName('CNC_INDEXNM').Value := DM.qryEORDO2MT.FieldByName('CNC_INDEXNM').Value;
        DM.qryAPCOS.ParamByName('CNC_REMK').Value    := DM.qryEORDO2MT.FieldByName('CNC_REMK').Value;
        //DM.qryAPCOS.ParamByName('CDATE').Value     := DM.qryEORDO2MT.FieldByName('CDATE').Value;

        //DM.qryAPCOS.ParamByName('CUSER_ID').Value := DM.qryEORDO2MT.FieldByName('CUSER_ID').Value;
        DM.qryAPCOS.ParamByName('UDATE').AsDateTime  := DM.qryEORDO2MT.FieldByName('UDATE').AsDateTime;
        DM.qryAPCOS.ParamByName('UUSER_ID').Value    := DM.qryEORDO2MT.FieldByName('UUSER_ID').Value;

        DM.qryAPCOS.ExecSQL;
        DM.dbAPCOS.Commit;

         {
        DM.qryAPCOS.Close;
        DM.qryAPCOS.SQL.Clear;
        DM.qryAPCOS.SQL.Add(' UPDATE EWRK02MT                 '+
                            ' SET CUST_CD     = :CUST_CD,     '+
                            '     DLV_CUST_NM = :DLV_CUST_NM, '+
                            '     MATNR_CNT   = :MATNR_CNT,   '+
                            '     MATNR_PCS   = :MATNR_PCS,   '+
                            '     MATNR_DN    = :MATNR_DN,    '+
                            '     WRK_STAT    = :WRK_STAT,    '+
                            '     RCV_DT,     = :RCV_DT,      '+
                            '     QUICK_STAT  = :QUICK_STAT,  '+
                            '     BOX_QTY     = :BOX_QTY,     '+
                            '     SET_DT      = :SET_DT,      '+
                            '     PRNT_DT     = :PRNT_DT,     '+
                            '     WRK_START   = :WRK_START,   '+
                            '     WRK_END     = :WRK_END,     '+
                            '     LEAD_TM     = :LEAD_TM,     '+
                            '     RDATE       = :RDATE,       '+
                            '     DONE_DT     = :DONE_DT,     '+
                            '     ROUTE_ID    = :ROUTE_ID,    '+
                            '     ROUTE       = :ROUTE,       '+
                            '     CNC_STAT    = :CNC_STAT,    '+
                            '     CNC_INDEX   = :CNC_INDEX,   '+
                            //'     CNC_INDEXNM = :CNC_INDEXNM, '+
                            '     CNC_REMK    = :CNC_REMK,    '+
                            '     UDATE       = :UDATE,       '+
                            '     UUSER_ID    = :UUSER_ID     '+
                            ' WHERE LC_CD     = :LC_CD        '+
                            '   AND WRK_DT    = :WRK_DT       '+
                            '   AND VBELN     = :VBELN        ');
        DM.qryAPCOS.ParamByName('LC_CD').Value       := DM.qryEORDO2MT.FieldByName('LC_CD').Value;
        DM.qryAPCOS.ParamByName('WRK_DT').Value      := DM.qryEORDO2MT.FieldByName('WRK_DT').Value;
        DM.qryAPCOS.ParamByName('VBELN').Value       := DM.qryEORDO2MT.FieldByName('VBELN').Value;
        DM.qryAPCOS.ParamByName('CUST_CD').Value     := DM.qryEORDO2MT.FieldByName('CUST_CD').Value;
        DM.qryAPCOS.ParamByName('DLV_CUST_NM').Value := DM.qryEORDO2MT.FieldByName('DLV_CUST_NM').Value;

        DM.qryAPCOS.ParamByName('MATNR_CNT').Value   := DM.qryEORDO2MT.FieldByName('MATNR_CNT').Value;
        DM.qryAPCOS.ParamByName('MATNR_PCS').Value   := DM.qryEORDO2MT.FieldByName('MATNR_PCS').Value;
        DM.qryAPCOS.ParamByName('MATNR_DN').Value    := DM.qryEORDO2MT.FieldByName('MATNR_DN').Value;
        DM.qryAPCOS.ParamByName('WRK_STAT').Value    := DM.qryEORDO2MT.FieldByName('WRK_STAT').Value;
        DM.qryAPCOS.ParamByName('RCV_DT').Value      := DM.qryEORDO2MT.FieldByName('RCV_DT').Value;

        DM.qryAPCOS.ParamByName('QUICK_STAT').Value  := DM.qryEORDO2MT.FieldByName('QUICK_STAT').Value;
        DM.qryAPCOS.ParamByName('BOX_QTY').Value     := DM.qryEORDO2MT.FieldByName('BOX_QTY').Value;
        DM.qryAPCOS.ParamByName('SET_DT').Value      := DM.qryEORDO2MT.FieldByName('SET_DT').Value;
        DM.qryAPCOS.ParamByName('PRNT_DT').Value     := DM.qryEORDO2MT.FieldByName('PRNT_DT').Value;
        DM.qryAPCOS.ParamByName('WRK_START').Value   := DM.qryEORDO2MT.FieldByName('WRK_START').Value;

        DM.qryAPCOS.ParamByName('WRK_END').Value     := DM.qryEORDO2MT.FieldByName('WRK_END').Value;
        DM.qryAPCOS.ParamByName('LEAD_TM').Value     := DM.qryEORDO2MT.FieldByName('LEAD_TM').Value;
        DM.qryAPCOS.ParamByName('RDATE').Value       := DM.qryEORDO2MT.FieldByName('RDATE').Value;
        DM.qryAPCOS.ParamByName('DONE_DT').Value     := DM.qryEORDO2MT.FieldByName('DONE_DT').Value;
        DM.qryAPCOS.ParamByName('ROUTE_ID').Value    := DM.qryEORDO2MT.FieldByName('ROUTE_ID').Value;

        DM.qryAPCOS.ParamByName('ROUTE').Value       := DM.qryEORDO2MT.FieldByName('ROUTE').Value;
        DM.qryAPCOS.ParamByName('CNC_STAT').Value    := DM.qryEORDO2MT.FieldByName('CNC_STAT').Value;
        DM.qryAPCOS.ParamByName('CNC_INDEX').Value   := DM.qryEORDO2MT.FieldByName('CNC_INDEX').Value;
//        DM.qryAPCOS.ParamByName('CNC_INDEXNM').Value := DM.qryEORDO2MT.FieldByName('CNC_INDEXNM').Value;
        DM.qryAPCOS.ParamByName('CNC_REMK').Value    := DM.qryEORDO2MT.FieldByName('CNC_REMK').Value;
        //DM.qryAPCOS.ParamByName('CDATE').Value     := DM.qryEORDO2MT.FieldByName('CDATE').Value;

        //DM.qryAPCOS.ParamByName('CUSER_ID').Value := DM.qryEORDO2MT.FieldByName('CUSER_ID').Value;
        DM.qryAPCOS.ParamByName('UDATE').AsDateTime  := DM.qryEORDO2MT.FieldByName('UDATE').AsDateTime;
        DM.qryAPCOS.ParamByName('UUSER_ID').Value    := DM.qryEORDO2MT.FieldByName('UUSER_ID').Value;
        DM.qryAPCOS.ExecSQL;

        DM.dbAPCOS.Commit;    }
      end;


      DM.qryUpdate.Close;
      DM.qryUpdate.SQL.Clear;
      DM.qryUpdate.SQL.Add(' UPDATE EORDO2MT           '+
                           '    SET SEND_STAT = 1      '+
                           ' WHERE LC_CD     = :LC_CD  '+
                           '   AND WRK_DT    = :WRK_DT '+
                           '   AND VBELN     = :VBELN  ');
      DM.qryUpdate.ParamByName('LC_CD').Value       := FieldByName('LC_CD').Value;
      DM.qryUpdate.ParamByName('WRK_DT').Value      := FieldByName('WRK_DT').Value;
      DM.qryUpdate.ParamByName('VBELN').Value       := FieldByName('VBELN').Value;
      DM.qryUpdate.ExecSQL;

    end;
  end;

  // EORDO2DT 전송
  procedure pr_SendEORDO2DT;
  begin
    with DM.qryEORDO2DT do begin
      while not Eof do begin
        // Insert
        if not fn_IsEORDO2(2, FieldByName('LC_CD').AsString,
                              FieldByName('WRK_DT').AsString,
                              FieldByName('VBELN').AsString,
                              FieldByName('LINE').Value,
                              FieldByName('BOX_NO').Value,
                              FieldByName('MATNR').AsString ) then begin
          DM.qryAPCOS.Close;
          DM.qryAPCOS.SQL.Clear;
          DM.qryAPCOS.SQL.Add(' INSERT INTO EWRK02DT '+
                              '  (LC_CD, WRK_DT, VBELN, LINE, BOX_NO, MATNR, MAKTX, EMAKTX, XB_BOX_PCS_QTY, DONE_QTY,        '+
                              '   UPDT_QTY, LOT_NO, MDATE, BRGEW, CNC_STAT, CNC_INDEX, CNC_INDEXNM, '+
                              '   CNC_REMK, WRK_START, WRK_END, WRK_MAN, '+
                              '   SET_DESC, '+//SEND_STAT,
                              '   CDATE, CUSER_ID, UDATE, UUSER_ID)                                     '+
                              ' VALUES '+
                              '  (:LC_CD, :WRK_DT, :VBELN, :LINE, :BOX_NO, :MATNR, :MAKTX, :EMAKTX, :XB_BOX_PCS_QTY, :DONE_QTY,        '+
                              '   :UPDT_QTY, :LOT_NO, :MDATE, :BRGEW, :CNC_STAT, :CNC_INDEX, :CNC_INDEXNM, '+
                              '   :CNC_REMK, :WRK_START, :WRK_END, :WRK_MAN, '+
                              '   :SET_DESC, '+//:SEND_STAT,
                              '   :CDATE, :CUSER_ID, :UDATE, :UUSER_ID)                                     ');
          DM.qryAPCOS.ParamByName('LC_CD').Value          := FieldByName('LC_CD').Value;
          DM.qryAPCOS.ParamByName('WRK_DT').Value         := FieldByName('WRK_DT').Value;
          DM.qryAPCOS.ParamByName('VBELN').Value          := FieldByName('VBELN').Value;
          DM.qryAPCOS.ParamByName('LINE').Value           := FieldByName('LINE').Value;
          DM.qryAPCOS.ParamByName('BOX_NO').Value         := FieldByName('BOX_NO').Value;
          DM.qryAPCOS.ParamByName('MATNR').Value          := FieldByName('MATNR').Value;
          DM.qryAPCOS.ParamByName('MAKTX').Value          := FieldByName('MAKTX').Value;
          DM.qryAPCOS.ParamByName('EMAKTX').Value         := FieldByName('EMAKTX').Value;
          DM.qryAPCOS.ParamByName('XB_BOX_PCS_QTY').Value := FieldByName('XB_BOX_PCS_QTY').Value;

          DM.qryAPCOS.ParamByName('DONE_QTY').Value       := FieldByName('DONE_QTY').Value;
          DM.qryAPCOS.ParamByName('UPDT_QTY').Value       := FieldByName('UPDT_QTY').Value;
          DM.qryAPCOS.ParamByName('LOT_NO').Value         := FieldByName('LOT_NO').Value;
          DM.qryAPCOS.ParamByName('MDATE').Value          := FieldByName('MDATE').Value;
          DM.qryAPCOS.ParamByName('BRGEW').Value          := FieldByName('BRGEW').Value;
          DM.qryAPCOS.ParamByName('CNC_STAT').Value       := FieldByName('CNC_STAT').Value;
          DM.qryAPCOS.ParamByName('CNC_INDEX').Value      := FieldByName('CNC_INDEX').Value;
          DM.qryAPCOS.ParamByName('CNC_INDEXNM').Value    := FieldByName('CNC_INDEXNM').Value;
          DM.qryAPCOS.ParamByName('CNC_REMK').Value       := FieldByName('CNC_REMK').Value;
          DM.qryAPCOS.ParamByName('WRK_START').Value      := FieldByName('WRK_START').Value;
          DM.qryAPCOS.ParamByName('WRK_END').Value        := FieldByName('WRK_END').Value;

          DM.qryAPCOS.ParamByName('WRK_MAN').Value        := FieldByName('WRK_MAN').Value;
          DM.qryAPCOS.ParamByName('SET_DESC').Value       := FieldByName('SET_DESC').Value;
          //DM.qryAPCOS.ParamByName('SEND_STAT').Value      := FieldByName('SEND_STAT').Value;
          DM.qryAPCOS.ParamByName('CDATE').Value          := FieldByName('CDATE').Value;
          DM.qryAPCOS.ParamByName('CUSER_ID').Value       := FieldByName('CUSER_ID').Value;
          DM.qryAPCOS.ParamByName('UDATE').Value          := FieldByName('UDATE').Value;
          DM.qryAPCOS.ParamByName('UUSER_ID').Value       := FieldByName('UUSER_ID').Value;
          DM.qryAPCOS.ExecSQL;

        end
        // Update
        else begin

          DM.qryAPCOS.Close;
          DM.qryAPCOS.SQL.Clear;
          DM.qryAPCOS.SQL.Add(' UPDATE EWRK02DT '+
                              ' SET LC_CD = :LC_CD,   '+
                              '     WRK_DT = :WRK_DT, '+
                              '     VBELN = :VBELN,   '+
                              '     LINE = :LINE,     '+
                              '     BOX_NO = :BOX_NO, '+
                              '     MATNR = :MATNR,   '+
                              '     MAKTX = :MAKTX,   '+
                              '     EMAKTX = :EMAKTX, '+
                              '     XB_BOX_PCS_QTY = :XB_BOX_PCS_QTY, '+
                              '     DONE_QTY = :DONE_QTY, '+
                              '     UPDT_QTY = :UPDT_QTY, '+
                              '     LOT_NO = :LOT_NO, '+
                              '     MDATE = :MDATE, '+
                              '     BRGEW = :BRGEW, '+
                              '     CNC_STAT = :CNC_STAT, '+
                              '     CNC_INDEX = :CNC_INDEX, '+
                              '     CNC_INDEXNM = :CNC_INDEXNM, '+
                              '     CNC_REMK = :CNC_REMK, '+
                              '     WRK_START = :WRK_START, '+
                              '     WRK_END = :WRK_END, '+
                              '     WRK_MAN  = :WRK_MAN, '+
                              '     SET_DESC = :SET_DESC, '+//SEND_STAT = :SEND_STAT,
                              '     UDATE = :UDATE, '+
                              '     UUSER_ID = :UUSER_ID '+
                              ' WHERE LC_CD     = :LC_CD       '+
                              '   AND WRK_DT    = :WRK_DT      '+
                              '   AND VBELN     = :VBELN       '+
                              '   AND LINE      = :LINE        '+
                              '   AND BOX_NO    = :BOX_NO      '+
                              '   AND MATNR     = :MATNR       ');
          DM.qryAPCOS.ParamByName('LC_CD').Value          := FieldByName('LC_CD').Value;
          DM.qryAPCOS.ParamByName('WRK_DT').Value         := FieldByName('WRK_DT').Value;
          DM.qryAPCOS.ParamByName('VBELN').Value          := FieldByName('VBELN').Value;
          DM.qryAPCOS.ParamByName('LINE').Value           := FieldByName('LINE').Value;
          DM.qryAPCOS.ParamByName('BOX_NO').Value         := FieldByName('BOX_NO').Value;
          DM.qryAPCOS.ParamByName('MATNR').Value          := FieldByName('MATNR').Value;
          DM.qryAPCOS.ParamByName('MAKTX').Value          := FieldByName('MAKTX').Value;
          DM.qryAPCOS.ParamByName('EMAKTX').Value         := FieldByName('EMAKTX').Value;
          DM.qryAPCOS.ParamByName('XB_BOX_PCS_QTY').Value := FieldByName('XB_BOX_PCS_QTY').Value;

          DM.qryAPCOS.ParamByName('DONE_QTY').Value       := FieldByName('DONE_QTY').Value;
          DM.qryAPCOS.ParamByName('UPDT_QTY').Value       := FieldByName('UPDT_QTY').Value;
          DM.qryAPCOS.ParamByName('LOT_NO').Value         := FieldByName('LOT_NO').Value;
          DM.qryAPCOS.ParamByName('MDATE').Value          := FieldByName('MDATE').Value;
          DM.qryAPCOS.ParamByName('BRGEW').Value          := FieldByName('BRGEW').Value;
          DM.qryAPCOS.ParamByName('CNC_STAT').Value       := FieldByName('CNC_STAT').Value;
          DM.qryAPCOS.ParamByName('CNC_INDEX').Value      := FieldByName('CNC_INDEX').Value;
          DM.qryAPCOS.ParamByName('CNC_INDEXNM').Value    := FieldByName('CNC_INDEXNM').Value;
          DM.qryAPCOS.ParamByName('CNC_REMK').Value       := FieldByName('CNC_REMK').Value;
          DM.qryAPCOS.ParamByName('WRK_START').Value      := FieldByName('WRK_START').Value;
          DM.qryAPCOS.ParamByName('WRK_END').Value        := FieldByName('WRK_END').Value;

          DM.qryAPCOS.ParamByName('WRK_MAN').Value        := FieldByName('WRK_MAN').Value;
          DM.qryAPCOS.ParamByName('SET_DESC').Value       := FieldByName('SET_DESC').Value;
          //DM.qryAPCOS.ParamByName('SEND_STAT').Value      := FieldByName('SEND_STAT').Value;
          //DM.qryAPCOS.ParamByName('CDATE').Value          := FieldByName('CDATE').Value;
          //DM.qryAPCOS.ParamByName('CUSER_ID').Value       := FieldByName('CUSER_ID').Value;
          DM.qryAPCOS.ParamByName('UDATE').Value          := FieldByName('UDATE').Value;
          DM.qryAPCOS.ParamByName('UUSER_ID').Value       := FieldByName('UUSER_ID').Value;
          DM.qryAPCOS.ExecSQL;
        end;
        Next;
      end;

      DM.qryUpdate.Close;
      DM.qryUpdate.SQL.Clear;
      DM.qryUpdate.SQL.Add(' UPDATE EORDO2DT           '+
                           ' SET SEND_STAT = 1         '+
                           ' WHERE LC_CD     = :LC_CD  '+
                           '   AND WRK_DT    = :WRK_DT '+
                           '   AND VBELN     = :VBELN  '+
                           '   AND LINE      = :LINE   '+
                           '   AND BOX_NO    = :BOX_NO '+
                           '   AND MATNR     = :MATNR  ');
      DM.qryUpdate.ParamByName('LC_CD').Value  := DM.qryEORDO2DT.FieldByName('LC_CD').Value;
      DM.qryUpdate.ParamByName('WRK_DT').Value := DM.qryEORDO2DT.FieldByName('WRK_DT').Value;
      DM.qryUpdate.ParamByName('VBELN').Value  := DM.qryEORDO2DT.FieldByName('VBELN').Value;
      DM.qryUpdate.ParamByName('LINE').Value   := DM.qryEORDO2DT.FieldByName('LINE').Value;
      DM.qryUpdate.ParamByName('BOX_NO').Value := DM.qryEORDO2DT.FieldByName('BOX_NO').Value;
      DM.qryUpdate.ParamByName('MATNR').Value  := DM.qryEORDO2DT.FieldByName('MATNR').Value;
      DM.qryUpdate.ExecSQL;
    end;
  end;


begin
  // 마스터 유무
  if not fn_IsSendData('','',1) then Exit;

  with DM.qryEORDO2MT do begin
    // APCOS에 연결
    try
      DM.dbAPCOS.Open;
    except
      on E: Exception do begin
        pr_ShowMessage('APCOS에 접속할 수 없습니다.');
        Exit;
      end;
    end;


    while not EOF do begin
      pr_SendEORDO2MT;

      if fn_IsSendData(FieldByName('WRK_DT').AsString,
                       FieldByName('VBELN').AsString, 2) then begin
        pr_SendEORDO2DT;
      end;

      DM.qryEORDO2MT.Next;
    end;


  end;

end;

procedure pr_SendIFZZINF;
begin
  with DM.qryEORDO2DT do begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT LC_CD, VBELN, CUST_CD, MATNR, KAN_CD,                     '+
            '        DLV_CUST_NM, MAKTX, IND_QTY, OUT_QTY, BOX_QTY,            '+
            '        PCS_QTY, BOX_PCS_QTY, XB_BOX_PCS_QTY, DONE_QTY, REST_QTY, '+
            '        WRK_STAT, REG_DATE, CNC_STAT, CNC_REMK, EMAKTX            '+
            '        CDATE, CUSER_ID, UPDT_DT, UPDT_ID                         '+
            '   FROM dbo.IFZZINF                                               '+
            '  WHERE LC_CD = :LC_CD                                            '+
            '  AND   SEND_STAT = 0                                             ');
    Open;
    if IsEmpty then Exit;

    while EOF do begin    
      DM.qryAPCOS.Close;
      DM.qryAPCOS.SQL.Clear;
      DM.qryAPCOS.SQL.Add(' INSERT INTO IFZZINF '+
                          '  (LC_CD, VBELN, CUST_CD, MATNR, KAN_CD,                     '+
                          '   DLV_CUST_NM, MAKTX, IND_QTY, OUT_QTY, BOX_QTY,            '+
                          '   PCS_QTY, BOX_PCS_QTY, XB_BOX_PCS_QTY, DONE_QTY, REST_QTY, '+
                          '   WRK_STAT, REG_DATE, CNC_STAT, CNC_REMK, EMAKTX            '+
                          '   CDATE, CUSER_ID, UPDT_DT, UPDT_ID)                        '+
                          ' VALUES '+
                          '  (:LC_CD, :VBELN, :CUST_CD, :MATNR, :KAN_CD,                     '+
                          '   :DLV_CUST_NM, :MAKTX, :IND_QTY, :OUT_QTY, :BOX_QTY,            '+
                          '   :PCS_QTY, :BOX_PCS_QTY, :XB_BOX_PCS_QTY, :DONE_QTY, :REST_QTY, '+
                          '   :WRK_STAT, :REG_DATE, :CNC_STAT, :CNC_REMK, :EMAKTX            '+
                          '   :CDATE, :CUSER_ID, :UPDT_DT, :UPDT_ID)                         ');
      DM.qryAPCOS.ParamByName('LC_CD').Value          := FieldByName('LC_CD').Value;
      DM.qryAPCOS.ParamByName('VBELN').Value          := FieldByName('VBELN').Value;
      DM.qryAPCOS.ParamByName('CUST_CD').Value        := FieldByName('CUST_CD').Value;
      DM.qryAPCOS.ParamByName('MATNR').Value          := FieldByName('MATNR').Value;
      DM.qryAPCOS.ParamByName('KAN_CD').Value         := FieldByName('KAN_CD').Value;
      DM.qryAPCOS.ParamByName('DLV_CUST_NM').Value    := FieldByName('DLV_CUST_NM').Value;
      DM.qryAPCOS.ParamByName('MAKTX').Value          := FieldByName('MAKTX').Value;
      DM.qryAPCOS.ParamByName('IND_QTY').Value        := FieldByName('IND_QTY').Value;
      DM.qryAPCOS.ParamByName('OUT_QTY').Value        := FieldByName('OUT_QTY').Value;
      DM.qryAPCOS.ParamByName('BOX_QTY').Value        := FieldByName('BOX_QTY').Value;
      DM.qryAPCOS.ParamByName('PCS_QTY').Value        := FieldByName('PCS_QTY').Value;
      DM.qryAPCOS.ParamByName('BOX_PCS_QTY').Value    := FieldByName('BOX_PCS_QTY').Value;
      DM.qryAPCOS.ParamByName('XB_BOX_PCS_QTY').Value := FieldByName('XB_BOX_PCS_QTY').Value;
      DM.qryAPCOS.ParamByName('DONE_QTY').Value       := FieldByName('DONE_QTY').Value;
      DM.qryAPCOS.ParamByName('REST_QTY').Value       := FieldByName('REST_QTY').Value;
      DM.qryAPCOS.ParamByName('WRK_STAT').Value       := FieldByName('WRK_STAT').Value;
      DM.qryAPCOS.ParamByName('REG_DATE').Value       := FieldByName('REG_DATE').Value;
      DM.qryAPCOS.ParamByName('CNC_STAT').Value       := FieldByName('CNC_STAT').Value;
      DM.qryAPCOS.ParamByName('CNC_REMK').Value       := FieldByName('CNC_REMK').Value;
      DM.qryAPCOS.ParamByName('EMAKTX').Value         := FieldByName('EMAKTX').Value;
      DM.qryAPCOS.ParamByName('CDATE').Value          := FieldByName('CDATE').Value;
      DM.qryAPCOS.ParamByName('CUSER_ID').Value       := FieldByName('CUSER_ID').Value;
      DM.qryAPCOS.ParamByName('UPDT_DT').Value        := FieldByName('UPDT_DT').Value;
      DM.qryAPCOS.ParamByName('UPDT_ID').Value        := FieldByName('UPDT_ID').Value;

      ExecSQL;

      Next;
    end;
  end;
end;

end.
