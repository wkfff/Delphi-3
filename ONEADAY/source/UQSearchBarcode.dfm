object FQSearchBarcode: TFQSearchBarcode
  Left = 259
  Top = 133
  Width = 1024
  Height = 742
  ActiveControl = edBarcode
  Caption = #51228#54408#51060#47141' '#51312#54924
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    1016
    708)
  PixelsPerInch = 96
  TextHeight = 16
  object Label9: TLabel
    Left = 390
    Top = 19
    Width = 85
    Height = 16
    Caption = #48148#53076#46300#49828#52884
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 10
    Top = 19
    Width = 34
    Height = 16
    Anchors = [akTop, akRight]
    Caption = #44592#44036
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 206
    Top = 13
    Width = 15
    Height = 29
    Anchors = [akTop, akRight]
    Caption = '~'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 56
    Width = 723
    Height = 578
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STDT_DATE'
        Title.Alignment = taCenter
        Title.Caption = #51068#51088
        Width = 157
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BARCODE'
        Title.Alignment = taCenter
        Title.Caption = #48148#53076#46300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM_STATE_NAME'
        Title.Alignment = taCenter
        Title.Caption = #49345#53468
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM_NAME'
        Title.Alignment = taCenter
        Title.Caption = #51228#54408#47749
        Width = 188
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORGAN_NAME'
        Title.Alignment = taCenter
        Title.Caption = #44144#47000#52376#47749
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REMARKS'
        Title.Alignment = taCenter
        Title.Caption = #48708#44256
        Width = 400
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'I_DATE'
        Title.Alignment = taCenter
        Title.Caption = #46321#47197#51068
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'I_NAME'
        Title.Alignment = taCenter
        Title.Caption = #46321#47197#51088
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'U_DATE'
        Title.Alignment = taCenter
        Title.Caption = #49688#51221#51068
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'U_NAME'
        Title.Alignment = taCenter
        Title.Caption = #49688#51221#51088
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 734
    Top = 56
    Width = 276
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #49345'  '#49464'  '#45236'  '#50669
    Color = clGradientActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object sb0001: TScrollBox
    Left = 734
    Top = 81
    Width = 276
    Height = 553
    HorzScrollBar.Range = 242
    VertScrollBar.Range = 420
    Anchors = [akTop, akRight, akBottom]
    AutoScroll = False
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object Label36: TLabel
      Left = 9
      Top = 12
      Width = 64
      Height = 16
      Caption = #48148' '#53076' '#46300
    end
    object Label37: TLabel
      Left = 9
      Top = 48
      Width = 64
      Height = 16
      Caption = #49345'    '#53468
    end
    object Label38: TLabel
      Left = 9
      Top = 120
      Width = 64
      Height = 16
      Caption = #51068'    '#51088
    end
    object Label48: TLabel
      Left = 9
      Top = 195
      Width = 64
      Height = 16
      Caption = #46321#47197#51068#51088
    end
    object Label49: TLabel
      Left = 9
      Top = 231
      Width = 64
      Height = 16
      Caption = #46321' '#47197' '#51088
    end
    object Label50: TLabel
      Left = 9
      Top = 267
      Width = 64
      Height = 16
      Caption = #49688#51221#51068#51088
    end
    object Label51: TLabel
      Left = 9
      Top = 303
      Width = 64
      Height = 16
      Caption = #49688' '#51221' '#51088
    end
    object Label2: TLabel
      Left = 9
      Top = 84
      Width = 64
      Height = 16
      Caption = #51228' '#54408' '#47749
    end
    object Label11: TLabel
      Left = 9
      Top = 157
      Width = 64
      Height = 16
      Caption = #44144' '#47000' '#52376
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 337
      Width = 64
      Height = 16
      Caption = 'A/S '#49324#50976
    end
    object DBEdit35: TDBEdit
      Left = 88
      Top = 8
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'BARCODE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit36: TDBEdit
      Left = 88
      Top = 44
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'ITEM_STATE_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit37: TDBEdit
      Left = 88
      Top = 116
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'STDT_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit48: TDBEdit
      Left = 88
      Top = 191
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'I_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit49: TDBEdit
      Left = 88
      Top = 227
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'I_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit50: TDBEdit
      Left = 88
      Top = 263
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'U_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit51: TDBEdit
      Left = 88
      Top = 299
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'U_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 80
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'ITEM_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 88
      Top = 153
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'ORGAN_NAME'
      DataSource = DataSource1
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBMemo1: TDBMemo
      Left = 87
      Top = 337
      Width = 185
      Height = 89
      Color = clBtnFace
      DataField = 'REMARKS'
      DataSource = DataSource1
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 9
    end
  end
  object edBarcode: TEdit
    Left = 480
    Top = 9
    Width = 244
    Height = 37
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    MaxLength = 15
    ParentFont = False
    TabOrder = 3
    OnKeyDown = edBarcodeKeyDown
  end
  object dpBar1: TDateTimePicker
    Left = 49
    Top = 11
    Width = 149
    Height = 32
    Anchors = [akTop, akRight]
    CalAlignment = dtaLeft
    Date = 39792.0831913657
    Format = 'yyyy-MM-dd'
    Time = 39792.0831913657
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 4
  end
  object dpBar2: TDateTimePicker
    Left = 228
    Top = 11
    Width = 149
    Height = 32
    Anchors = [akTop, akRight]
    CalAlignment = dtaLeft
    Date = 39792.0831913657
    Format = 'yyyy-MM-dd'
    Time = 39792.0831913657
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft IME 2003'
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 680
    Width = 1016
    Height = 28
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 6
    object pnlMessage: TPanel
      Left = 0
      Top = 0
      Width = 67
      Height = 28
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvNone
      Caption = #47700#49884#51648
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 67
      Top = 0
      Width = 949
      Height = 28
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel4: TPanel
        Left = 810
        Top = 1
        Width = 138
        Height = 26
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvNone
        Caption = #51312#54924#44148#49688' : 0'
        TabOrder = 0
      end
    end
  end
  object Button2: TButton
    Left = 5
    Top = 640
    Width = 85
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = #50641#49472' F3'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 925
    Top = 640
    Width = 85
    Height = 35
    Anchors = [akRight, akBottom]
    Caption = #45803#44592' &X'
    TabOrder = 8
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = qryMain
    Left = 152
    Top = 176
  end
  object qryMain: TQuery
    DatabaseName = 'JIT'
    SQL.Strings = (
      'SELECT [STDT_DATE]'
      '      ,[BARCODE]'
      '      ,case ITEM_STATE '
      '                   when '#39'0'#39' then '#39#48156#54665#39
      #9#9'   when '#39'1'#39' then '#39#51077#44256#39
      #9#9'   when '#39'2'#39' then '#39#51077#44256#48152#54408#39
      #9#9'   when '#39'3'#39' then '#39#52636#44256#39
      #9#9'   when '#39'4'#39' then '#39#52636#44256#48152#54408#39
      #9#9'   when '#39'5'#39' then '#39'A/S'#48152#54408#39
      #9#9'   when '#39'6'#39' then '#39#54224#44592#39
      #9#9'   when '#39'9'#39' then '#39#52712#49548#39
      '       end as ITEM_STATE_NAME'
      '      ,a.ITEM_STATE'
      '      ,a.[ITEM_CODE]'
      '      ,b.[ITEM_NAME]'
      '      ,a.ORGAN_CODE'
      '      ,isnull(e.ORGAN_NAME,'#39#39') ORGAN_NAME'
      '      ,a.[CLOSE_DATE]'
      '      ,a.[REMARKS]'
      '      ,a.[I_DATE]'
      '      ,c.NAME as I_NAME'
      '      ,a.[U_DATE]'
      '      ,d.NAME as U_NAME'
      '  FROM dbo.SPD101 a'
      '  JOIN dbo.STH003 b'
      '    ON a.ITEM_CODE = b.ITEM_CODE'
      '   and b.CLOSE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH001 c'
      '    ON a.I_ID = c.USERID'
      '   and c.RETIRE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH001 d'
      '    ON a.I_ID = d.USERID'
      '   and d.RETIRE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH002 e'
      '    ON a.ORGAN_CODE = e.ORGAN_CODE'
      '   and e.CLOSE_DATE = '#39'99991231'#39
      'where a.BARCODE = :BARCODE'
      '  and a.STDT_DATE between :STDT_DATE1 and :STDT_DATE2'
      'order by a.STDT_DATE desc')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'BARCODE'
        ParamType = ptUnknown
        Value = #39'%%'#39
      end
      item
        DataType = ftString
        Name = 'STDT_DATE1'
        ParamType = ptUnknown
        Value = '20080210'
      end
      item
        DataType = ftString
        Name = 'STDT_DATE2'
        ParamType = ptUnknown
        Value = '20080210'
      end>
    object qryMainSTDT_DATE: TStringField
      FieldName = 'STDT_DATE'
      FixedChar = True
    end
    object qryMainBARCODE: TStringField
      FieldName = 'BARCODE'
      FixedChar = True
      Size = 16
    end
    object qryMainITEM_STATE_NAME: TStringField
      FieldName = 'ITEM_STATE_NAME'
      FixedChar = True
      Size = 8
    end
    object qryMainITEM_STATE: TStringField
      FieldName = 'ITEM_STATE'
      FixedChar = True
      Size = 2
    end
    object qryMainITEM_CODE: TStringField
      FieldName = 'ITEM_CODE'
      FixedChar = True
    end
    object qryMainITEM_NAME: TStringField
      FieldName = 'ITEM_NAME'
      FixedChar = True
      Size = 50
    end
    object qryMainORGAN_CODE: TStringField
      FieldName = 'ORGAN_CODE'
      FixedChar = True
      Size = 4
    end
    object qryMainORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      FixedChar = True
      Size = 40
    end
    object qryMainCLOSE_DATE: TStringField
      FieldName = 'CLOSE_DATE'
      FixedChar = True
    end
    object qryMainREMARKS: TStringField
      FieldName = 'REMARKS'
      FixedChar = True
      Size = 100
    end
    object qryMainI_DATE: TStringField
      FieldName = 'I_DATE'
      FixedChar = True
    end
    object qryMainI_NAME: TStringField
      FieldName = 'I_NAME'
      FixedChar = True
      Size = 10
    end
    object qryMainU_DATE: TStringField
      FieldName = 'U_DATE'
      FixedChar = True
    end
    object qryMainU_NAME: TStringField
      FieldName = 'U_NAME'
      FixedChar = True
      Size = 10
    end
  end
end
