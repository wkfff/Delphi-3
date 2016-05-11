object FQSearch: TFQSearch
  Left = 192
  Top = 114
  Width = 872
  Height = 603
  Caption = #49345#49464#48324#48372#50976#54788#54889' - '#47928#49436#50976#53685#49884#49828#53596
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    864
    569)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 24
    Height = 12
    Caption = #54408#47785
  end
  object Label2: TLabel
    Left = 232
    Top = 12
    Width = 24
    Height = 12
    Caption = #44277#44288
  end
  object Label5: TLabel
    Left = 525
    Top = 12
    Width = 24
    Height = 12
    Caption = #49345#53468
  end
  object cbPummok: TComboBox
    Left = 36
    Top = 8
    Width = 181
    Height = 20
    Style = csDropDownList
    DropDownCount = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 0
  end
  object cbAmba: TComboBox
    Left = 264
    Top = 8
    Width = 249
    Height = 20
    Style = csDropDownList
    DropDownCount = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 1
  end
  object cbStock: TComboBox
    Left = 557
    Top = 8
    Width = 60
    Height = 20
    Style = csDropDownList
    DropDownCount = 20
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    ItemIndex = 0
    TabOrder = 2
    Text = #51204#52404
    Items.Strings = (
      #51204#52404
      #48372#50976
      #48176#54252
      #49688#47532)
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 33
    Width = 854
    Height = 488
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE_SNM'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPERTY_STATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPERTY_SERIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPERTY_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORT_DATE'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RENT_DATE'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORGAN_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPAIR_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAINTENANCE_GUBUN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAINTENANCE_START_DATE'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAINTENANCE_END_DATE'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARKS'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 4
    Top = 536
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #51312#54924' F1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 84
    Top = 536
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #50641#49472' F2'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 782
    Top = 536
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #45803#44592' &X'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button3: TButton
    Left = 164
    Top = 536
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #51064#49604' F3'
    TabOrder = 7
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = qrSPM100
    Left = 56
    Top = 56
  end
  object qrSPM100: TQuery
    DatabaseName = 'MFSDM'
    SQL.Strings = (
      
        'SELECT A.*, ISNULL(B.ORGAN_NAME, '#39#39') ORGAN_NAME, C.CODE_SNM FROM' +
        ' SPM100 A '
      '  LEFT OUTER JOIN STH002 B'
      '  ON A.ORGAN_CODE = B.ORGAN_CODE '
      '  JOIN ( SELECT * FROM COMMON WHERE CODE_TP = '#39'0002'#39' ) C'
      '  ON A.PROPERTY_GUBUN = C.CODE_CD'
      'WHERE A.PROPERTY_SECTION = :PROPERTY_SECTION'
      '  AND A.PROPERTY_GUBUN LIKE :PROPERTY_GUBUN'
      '  AND A.PROPERTY_STATE LIKE :PROPERTY_STATE'
      '  AND A.ORGAN_CODE LIKE :ORGAN_CODE'
      '  AND A.PROPERTY_STATE <> '#39#54028#44592#39
      'ORDER BY A.PROPERTY_SECTION, A.PROPERTY_GUBUN, A.BARCODE')
    Left = 24
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPERTY_SECTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PROPERTY_GUBUN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PROPERTY_STATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORGAN_CODE'
        ParamType = ptUnknown
      end>
    object qrSPM100BARCODE: TStringField
      DisplayLabel = #51088#49328#49884#47532#50620
      FieldName = 'BARCODE'
      Origin = 'MFSDM.SPM100.BARCODE'
      FixedChar = True
      Size = 16
    end
    object qrSPM100PROPERTY_SECTION: TStringField
      DisplayLabel = #51088#49328#44396#48516
      FieldName = 'PROPERTY_SECTION'
      Origin = 'MFSDM.SPM100.PROPERTY_SECTION'
      FixedChar = True
      Size = 4
    end
    object qrSPM100PROPERTY_GUBUN: TStringField
      DisplayLabel = #54408#47785#44396#48516
      FieldName = 'PROPERTY_GUBUN'
      Origin = 'MFSDM.SPM100.PROPERTY_GUBUN'
      FixedChar = True
      Size = 4
    end
    object qrSPM100PROPERTY_STATE: TStringField
      DisplayLabel = #49345#53468
      FieldName = 'PROPERTY_STATE'
      Origin = 'MFSDM.SPM100.PROPERTY_STATE'
      FixedChar = True
      Size = 4
    end
    object qrSPM100PROPERTY_SERIAL: TStringField
      DisplayLabel = #51068#47144#48264#54840
      FieldName = 'PROPERTY_SERIAL'
      Origin = 'MFSDM.SPM100.PROPERTY_SERIAL'
      FixedChar = True
      Size = 16
    end
    object qrSPM100PROPERTY_NAME: TStringField
      DisplayLabel = #44508#44201#47749
      FieldName = 'PROPERTY_NAME'
      Origin = 'MFSDM.SPM100.PROPERTY_NAME'
      FixedChar = True
      Size = 50
    end
    object qrSPM100IMPORT_DATE: TStringField
      DisplayLabel = #46020#51077#51068#51088
      FieldName = 'IMPORT_DATE'
      Origin = 'MFSDM.SPM100.IMPORT_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100IMPORT_PRICE: TFloatField
      DisplayLabel = #46020#51077#44032#44201
      FieldName = 'IMPORT_PRICE'
      Origin = 'MFSDM.SPM100.IMPORT_PRICE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qrSPM100RENT_DATE: TStringField
      DisplayLabel = #48176#54252#51068#51088
      FieldName = 'RENT_DATE'
      Origin = 'MFSDM.SPM100.RENT_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100ORGAN_CODE: TStringField
      DisplayLabel = #44277#44288#53076#46300
      FieldName = 'ORGAN_CODE'
      Origin = 'MFSDM.SPM100.ORGAN_CODE'
      FixedChar = True
      Size = 4
    end
    object qrSPM100REPAIR_DATE: TStringField
      DisplayLabel = #49688#47532#51032#47280#51068
      FieldName = 'REPAIR_DATE'
      Origin = 'MFSDM.SPM100.REPAIR_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100MAINTENANCE_GUBUN: TStringField
      DisplayLabel = #50976#51648#48372#49688
      FieldName = 'MAINTENANCE_GUBUN'
      Origin = 'MFSDM.SPM100.MAINTENANCE_GUBUN'
      FixedChar = True
      Size = 4
    end
    object qrSPM100MAINTENANCE_START_DATE: TStringField
      DisplayLabel = #44060#49884#51068#51088
      FieldName = 'MAINTENANCE_START_DATE'
      Origin = 'MFSDM.SPM100.MAINTENANCE_START_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100MAINTENANCE_END_DATE: TStringField
      DisplayLabel = #51333#47308#51068#51088
      FieldName = 'MAINTENANCE_END_DATE'
      Origin = 'MFSDM.SPM100.MAINTENANCE_END_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100VERSIONS: TStringField
      DisplayLabel = #48260#51204#51221#48372
      FieldName = 'VERSIONS'
      Origin = 'MFSDM.SPM100.VERSIONS'
      FixedChar = True
    end
    object qrSPM100CERTIFICATE_END_DATE: TStringField
      DisplayLabel = #51064#51613#47564#47308#51068#51088
      FieldName = 'CERTIFICATE_END_DATE'
      Origin = 'MFSDM.SPM100.CERTIFICATE_END_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100SECURITY_USERID: TStringField
      DisplayLabel = #50516#54840#47784#46280'ID'
      FieldName = 'SECURITY_USERID'
      Origin = 'MFSDM.SPM100.SECURITY_USERID'
      FixedChar = True
      Size = 10
    end
    object qrSPM100REMARKS: TStringField
      DisplayLabel = #48708#44256
      FieldName = 'REMARKS'
      Origin = 'MFSDM.SPM100.REMARKS'
      FixedChar = True
      Size = 50
    end
    object qrSPM100RETIRE_DATE: TStringField
      DisplayLabel = #54028#44592#51068#51088
      FieldName = 'RETIRE_DATE'
      Origin = 'MFSDM.SPM100.RETIRE_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
      Size = 8
    end
    object qrSPM100I_DATE: TStringField
      DisplayLabel = #46321#47197#51068
      FieldName = 'I_DATE'
      Origin = 'MFSDM.SPM100.I_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
    end
    object qrSPM100I_ID: TStringField
      DisplayLabel = #46321#47197#51088
      FieldName = 'I_ID'
      Origin = 'MFSDM.SPM100.I_ID'
      FixedChar = True
    end
    object qrSPM100U_DATE: TStringField
      DisplayLabel = #49688#51221#51068
      FieldName = 'U_DATE'
      Origin = 'MFSDM.SPM100.U_DATE'
      EditMask = '!9999/99/00;0;_'
      FixedChar = True
    end
    object qrSPM100U_ID: TStringField
      DisplayLabel = #49688#51221#51088
      FieldName = 'U_ID'
      Origin = 'MFSDM.SPM100.U_ID'
      FixedChar = True
    end
    object qrSPM100ORGAN_NAME: TStringField
      DisplayLabel = #48176#54252#44277#44288
      FieldName = 'ORGAN_NAME'
      Origin = 'MFSDM.STH002.ORGAN_NAME'
      FixedChar = True
      Size = 10
    end
    object qrSPM100CODE_SNM: TStringField
      DisplayLabel = #54408#47785#47749
      FieldName = 'CODE_SNM'
      FixedChar = True
      Size = 60
    end
  end
end
