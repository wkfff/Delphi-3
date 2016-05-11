object DM: TDM
  OldCreateOrder = False
  Left = 365
  Top = 138
  Height = 596
  Width = 488
  object dbMain: TDatabase
    DatabaseName = 'DAIHAN'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=DAIHAN3'
      'USER NAME=sa'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'BLOB EDIT LOGGING='
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'DATE MODE=0'
      'SCHEMA CACHE TIME=-1'
      'MAX QUERY TIME=300'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'HOST NAME='
      'APPLICATION NAME='
      'NATIONAL LANG NAME='
      'ENABLE BCD=FALSE'
      'TDS PACKET SIZE=4096'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32')
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
  object qrJob: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM COMMON'
      'WHERE CODE_TP = '#39'0002'#39
      '  AND ACC_CD = :ACC_CD'
      '  AND USE_YN = '#39'Y'#39
      'ORDER BY CODE_CD')
    Left = 104
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'ACC_CD'
        ParamType = ptUnknown
      end>
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    Left = 240
    Top = 16
  end
  object qrAmba: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM STH002'
      'WHERE CLOSE_DATE = '#39'99991231'#39
      'ORDER BY ORGAN_CODE')
    Left = 176
    Top = 80
  end
  object qrDate: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT CONVERT(VARCHAR(8), GETDATE(), 120) TODAYS')
    Left = 104
    Top = 16
  end
  object qrDash: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      
        'SELECT PROPERTY_SECTION, MAX(CODE_SNM) CODE_SNM, CAST(A.PROPERTY' +
        '_SECTION AS INT) TFCOUNT,'
      
        '  SUM(TCKEEP+ TCRENT+ TCREPAIR) TCOUNT, SUM(TCKEEP) TCKEEP, SUM(' +
        'TCRENT) TCRENT, SUM(TCREPAIR) TCREPAIR'
      'FROM '
      '('
      #9'SELECT A.PROPERTY_SECTION, MAX(C.CODE_SNM) CODE_SNM, '
      
        #9#9'   TCRENT   = CASE WHEN A.PROPERTY_STATE = '#39#48176#54252#39' THEN COUNT(*) ' +
        'ELSE 0 END ,'
      
        #9#9'   TCKEEP   = CASE WHEN A.PROPERTY_STATE = '#39#48372#50976#39' THEN COUNT(*) ' +
        'ELSE 0 END ,'
      
        #9#9'   TCREPAIR = CASE WHEN A.PROPERTY_STATE = '#39#49688#47532#39' THEN COUNT(*) ' +
        'ELSE 0 END '
      #9'  FROM SPM100 A'
      #9'JOIN ( SELECT CODE_CD, CODE_SNM '
      #9#9#9' FROM COMMON B'
      #9#9#9'WHERE B.CODE_TP = '#39'0001'#39
      #9#9#9'  AND B.CODE_CD > '#39'0000'#39') C'
      #9'  ON A.PROPERTY_SECTION = C.CODE_CD'
      '    GROUP BY A.PROPERTY_SECTION, A.PROPERTY_STATE'
      #9'UNION ALL'
      #9'SELECT A4.PROPERTY_SECTION, MAX(C4.CODE_SNM) CODE_SNM, '
      
        #9#9'   TCRENT   = CASE WHEN A4.PROPERTY_STATE = '#39#48176#54252#39' THEN COUNT(*)' +
        ' ELSE 0 END ,'
      
        #9#9'   TCKEEP   = CASE WHEN A4.PROPERTY_STATE = '#39#48372#50976#39' THEN COUNT(*)' +
        ' ELSE 0 END ,'
      
        #9#9'   TCREPAIR = CASE WHEN A4.PROPERTY_STATE = '#39#49688#47532#39' THEN COUNT(*)' +
        ' ELSE 0 END '
      #9'  FROM SPM400 A4'
      #9'JOIN ( SELECT CODE_CD, CODE_SNM '
      #9#9#9' FROM COMMON B4'
      #9#9#9'WHERE B4.CODE_TP = '#39'0001'#39
      #9#9#9'  AND B4.CODE_CD > '#39'0000'#39') C4'
      #9'  ON A4.PROPERTY_SECTION = C4.CODE_CD'
      '    GROUP BY A4.PROPERTY_SECTION, A4.PROPERTY_STATE'
      ') A'
      'GROUP BY A.PROPERTY_SECTION'
      'ORDER BY A.PROPERTY_SECTION'
      '')
    Left = 328
    Top = 80
  end
  object qrSTH002: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM STH002'
      'ORDER BY ORGAN_CODE')
    Left = 248
    Top = 136
    object qrSTH002ORGAN_CODE: TStringField
      DisplayLabel = #53076#46300
      FieldName = 'ORGAN_CODE'
      Origin = 'MFSDM.STH002.ORGAN_CODE'
      FixedChar = True
      Size = 4
    end
    object qrSTH002ORGAN_NAME: TStringField
      DisplayLabel = #51312#51649#47749
      FieldName = 'ORGAN_NAME'
      Origin = 'MFSDM.STH002.ORGAN_NAME'
      FixedChar = True
      Size = 10
    end
    object qrSTH002AREA: TStringField
      DisplayLabel = #51648#50669
      FieldName = 'AREA'
      Origin = 'MFSDM.STH002.AREA'
      FixedChar = True
      Size = 10
    end
    object qrSTH002CLOSE_DATE: TStringField
      DisplayLabel = #54224#51648#51068#51088
      FieldName = 'CLOSE_DATE'
      Origin = 'MFSDM.STH002.CLOSE_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSTH002I_DATE: TStringField
      DisplayLabel = #46321#47197#51068
      FieldName = 'I_DATE'
      Origin = 'MFSDM.STH002.I_DATE'
      FixedChar = True
    end
    object qrSTH002I_ID: TStringField
      DisplayLabel = #46321#47197#51088
      FieldName = 'I_ID'
      Origin = 'MFSDM.STH002.I_ID'
      FixedChar = True
    end
    object qrSTH002U_DATE: TStringField
      DisplayLabel = #49688#51221#51068
      FieldName = 'U_DATE'
      Origin = 'MFSDM.STH002.U_DATE'
      FixedChar = True
    end
    object qrSTH002U_ID: TStringField
      DisplayLabel = #49688#51221#51088
      FieldName = 'U_ID'
      Origin = 'MFSDM.STH002.U_ID'
      FixedChar = True
    end
  end
  object qrMT100: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM MT100'
      'where RETIRE_DATE = '#39'99991231'#39
      'ORDER BY USERID')
    Left = 176
    Top = 136
    object qrMT100USERID: TStringField
      DisplayLabel = #49324#50857'ID'
      FieldName = 'USERID'
      Origin = 'MFSDM.STH001.USERID'
      FixedChar = True
      Size = 10
    end
    object qrMT100NAME: TStringField
      DisplayLabel = #49324#50857#51088
      FieldName = 'NAME'
      Origin = 'MFSDM.STH001.NAME'
      FixedChar = True
      Size = 10
    end
    object qrMT100PASSWD: TStringField
      DisplayLabel = #50516#54840
      FieldName = 'PASSWD'
      Origin = 'MFSDM.STH001.PASSWD'
      FixedChar = True
      Size = 10
    end
    object qrMT100JOB_CODE: TStringField
      DisplayLabel = #51649#47924#44428#54620
      FieldName = 'JOB_CODE'
      Origin = 'MFSDM.STH001.JOB_CODE'
      FixedChar = True
      Size = 4
    end
    object StringField103: TStringField
      DisplayLabel = #51312#51649
      FieldName = 'ORGAN_CODE'
      Origin = 'MFSDM.STH002.ORGAN_CODE'
      FixedChar = True
      Size = 4
    end
    object qrMT100RETIRE_DATE: TStringField
      DisplayLabel = #53748#49324#51068#51088
      FieldName = 'RETIRE_DATE'
      Origin = 'MFSDM.STH001.RETIRE_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object StringField107: TStringField
      DisplayLabel = #46321#47197#51068
      FieldName = 'I_DATE'
      Origin = 'MFSDM.STH002.I_DATE'
      FixedChar = True
    end
    object StringField108: TStringField
      DisplayLabel = #46321#47197#51088
      FieldName = 'I_ID'
      Origin = 'MFSDM.STH002.I_ID'
      FixedChar = True
    end
    object StringField109: TStringField
      DisplayLabel = #49688#51221#51068
      FieldName = 'U_DATE'
      Origin = 'MFSDM.STH002.U_DATE'
      FixedChar = True
    end
    object StringField110: TStringField
      DisplayLabel = #49688#51221#51088
      FieldName = 'U_ID'
      Origin = 'MFSDM.STH002.U_ID'
      FixedChar = True
    end
  end
  object qrLogin: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'select *'
      'from dbo.MT100'
      'where USERID = :USERID'
      '  and PASSWD = :PASSWD')
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PASSWD'
        ParamType = ptUnknown
      end>
  end
  object qrCommon: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM COMMON'
      'WHERE CODE_TP = :CODE_TP'
      '  AND ISNULL(CHG_CD, '#39#39') LIKE :CHG_CD'
      '  AND ISNULL(ACC_CD, '#39#39') LIKE :ACC_CD'
      'ORDER BY CODE_TP, CODE_CD')
    Left = 104
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CODE_TP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CHG_CD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACC_CD'
        ParamType = ptUnknown
      end>
    object qrCommonCODE_TP: TStringField
      FieldName = 'CODE_TP'
      FixedChar = True
      Size = 10
    end
    object qrCommonCODE_CD: TStringField
      DisplayLabel = #53076#46300
      FieldName = 'CODE_CD'
      FixedChar = True
      Size = 10
    end
    object qrCommonCODE_SNM: TStringField
      DisplayLabel = #53076#46300#47749
      FieldName = 'CODE_SNM'
      FixedChar = True
      Size = 60
    end
    object qrCommonCODE_LNM: TStringField
      FieldName = 'CODE_LNM'
      FixedChar = True
      Size = 60
    end
    object qrCommonCODE_ENM: TStringField
      FieldName = 'CODE_ENM'
      FixedChar = True
      Size = 60
    end
    object qrCommonCHG_CD: TStringField
      FieldName = 'CHG_CD'
      FixedChar = True
      Size = 10
    end
    object qrCommonACC_CD: TStringField
      FieldName = 'ACC_CD'
      FixedChar = True
      Size = 10
    end
    object qrCommonREM_NM: TStringField
      FieldName = 'REM_NM'
      FixedChar = True
      Size = 60
    end
    object qrCommonVAL_D1: TStringField
      FieldName = 'VAL_D1'
      FixedChar = True
      Size = 8
    end
    object qrCommonVAL_D2: TStringField
      FieldName = 'VAL_D2'
      FixedChar = True
      Size = 8
    end
    object qrCommonVAL_C1: TStringField
      FieldName = 'VAL_C1'
      FixedChar = True
    end
    object qrCommonVAL_C2: TStringField
      FieldName = 'VAL_C2'
      FixedChar = True
    end
    object qrCommonVAL_N1: TFloatField
      FieldName = 'VAL_N1'
    end
    object qrCommonVAL_N2: TFloatField
      FieldName = 'VAL_N2'
    end
    object qrCommonUSE_YN: TStringField
      DisplayLabel = #49324#50857#50668#48512
      FieldName = 'USE_YN'
      FixedChar = True
      Size = 1
    end
    object qrCommonI_DATE: TStringField
      DisplayLabel = #46321#47197#51068
      FieldName = 'I_DATE'
      FixedChar = True
    end
    object qrCommonI_ID: TStringField
      DisplayLabel = #46321#47197#51088
      FieldName = 'I_ID'
      FixedChar = True
    end
    object qrCommonU_DATE: TStringField
      DisplayLabel = #49688#51221#51068
      FieldName = 'U_DATE'
      FixedChar = True
    end
    object qrCommonU_ID: TStringField
      DisplayLabel = #49688#51221#51088
      FieldName = 'U_ID'
      FixedChar = True
    end
  end
  object qrTemp: TQuery
    DatabaseName = 'DAIHAN'
    Left = 176
    Top = 16
  end
  object qrSTH003: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM STH003'
      'where close_date = '#39'99991231'#39
      'ORDER BY ITEM_CODE')
    Left = 328
    Top = 136
    object qrSTH003ITEM_CODE: TStringField
      FieldName = 'ITEM_CODE'
      Origin = 'JIT.STH003.ITEM_CODE'
      FixedChar = True
    end
    object qrSTH003ITEM_NAME: TStringField
      FieldName = 'ITEM_NAME'
      Origin = 'JIT.STH003.ITEM_NAME'
      FixedChar = True
      Size = 50
    end
    object qrSTH003REMARKS: TStringField
      FieldName = 'REMARKS'
      Origin = 'JIT.STH003.REMARKS'
      FixedChar = True
      Size = 100
    end
    object qrSTH003CLOSE_DATE: TStringField
      FieldName = 'CLOSE_DATE'
      Origin = 'JIT.STH003.CLOSE_DATE'
      FixedChar = True
    end
    object qrSTH003I_DATE: TStringField
      FieldName = 'I_DATE'
      Origin = 'JIT.STH003.I_DATE'
      FixedChar = True
    end
    object qrSTH003I_ID: TStringField
      FieldName = 'I_ID'
      Origin = 'JIT.STH003.I_ID'
      FixedChar = True
    end
    object qrSTH003U_DATE: TStringField
      FieldName = 'U_DATE'
      Origin = 'JIT.STH003.U_DATE'
      FixedChar = True
    end
    object qrSTH003U_ID: TStringField
      FieldName = 'U_ID'
      Origin = 'JIT.STH003.U_ID'
      FixedChar = True
    end
  end
end
