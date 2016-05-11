object FIPrdt: TFIPrdt
  Left = 238
  Top = 114
  Width = 1024
  Height = 742
  ActiveControl = edBarcode
  Caption = #51077#44256' '#44288#47532
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
    Left = 6
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
  object DBGrid1: TDBGrid
    Left = 5
    Top = 144
    Width = 724
    Height = 489
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
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
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
        FieldName = 'BARCODE_DATE'
        Title.Alignment = taCenter
        Title.Caption = #48156#54665#51068#51088
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRDT_DATE'
        Title.Alignment = taCenter
        Title.Caption = #51077#44256#51068#51088
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRDT_BACK_DATE'
        Title.Alignment = taCenter
        Title.Caption = #51077#44256#48152#54408#51068#51088
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ORGAN_NAME'
        Title.Caption = #44144#47000#52376
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STORE_DATE'
        Title.Alignment = taCenter
        Title.Caption = #52636#44256#51068#51088
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STORE_BACK_DATE'
        Title.Alignment = taCenter
        Title.Caption = #52636#44256#48152#54408#51068#51088
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AS_BACK_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'A/S '#48152#54408#51068#51088
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CLOSE_DATE'
        Title.Alignment = taCenter
        Title.Caption = #54224#44592#51068#51088
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REMARKS'
        Title.Alignment = taCenter
        Title.Caption = #48708#44256
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'I_DATE'
        Title.Alignment = taCenter
        Title.Caption = #46321#47197#51068#51088
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
        Title.Caption = #49688#51221#51068#51088
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'U_NAME'
        Title.Alignment = taCenter
        Title.Caption = #49688#51221#51088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_STATE'
        Title.Caption = #49345#53468#53076#46300
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ORGAN_CODE'
        Title.Caption = #44144#47000#52376#53076#46300
        Visible = False
      end>
  end
  object edBarcode: TEdit
    Left = 96
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
    TabOrder = 1
    Text = '123456789012345'
    OnKeyDown = edBarcodeKeyDown
  end
  object Button3: TButton
    Left = 343
    Top = 10
    Width = 85
    Height = 35
    Caption = #46321#47197
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object sb0001: TScrollBox
    Left = 735
    Top = 168
    Width = 276
    Height = 465
    HorzScrollBar.Range = 242
    VertScrollBar.Range = 420
    Anchors = [akTop, akRight, akBottom]
    AutoScroll = False
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
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
      Caption = #48156' '#54665' '#51068
    end
    object Label39: TLabel
      Left = 9
      Top = 156
      Width = 68
      Height = 16
      Caption = #51077#44256#51068#51088
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label48: TLabel
      Left = 9
      Top = 226
      Width = 64
      Height = 16
      Caption = #46321#47197#51068#51088
    end
    object Label49: TLabel
      Left = 9
      Top = 262
      Width = 64
      Height = 16
      Caption = #46321' '#47197' '#51088
    end
    object Label50: TLabel
      Left = 9
      Top = 298
      Width = 64
      Height = 16
      Caption = #49688#51221#51068#51088
    end
    object Label51: TLabel
      Left = 9
      Top = 334
      Width = 64
      Height = 16
      Caption = #49688' '#51221' '#51088
    end
    object Label1: TLabel
      Left = 9
      Top = 84
      Width = 64
      Height = 16
      Caption = #51228' '#54408' '#47749
    end
    object Label3: TLabel
      Left = 9
      Top = 192
      Width = 64
      Height = 16
      Caption = #52636#44256#51068#51088
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
      DataField = 'BARCODE_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit38: TDBEdit
      Left = 88
      Top = 152
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'PRDT_DATE'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2003'
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit48: TDBEdit
      Left = 88
      Top = 222
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'I_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit49: TDBEdit
      Left = 88
      Top = 258
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'I_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit50: TDBEdit
      Left = 88
      Top = 294
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'U_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit51: TDBEdit
      Left = 88
      Top = 330
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'U_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit1: TDBEdit
      Left = 86
      Top = 80
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'ITEM_NAME'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit2: TDBEdit
      Left = 86
      Top = 188
      Width = 178
      Height = 24
      Color = clBtnFace
      DataField = 'STORE_DATE'
      DataSource = DataSource1
      ImeName = 'Microsoft IME 2003'
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 735
    Top = 144
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
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 680
    Width = 1016
    Height = 28
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 5
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
    Left = 93
    Top = 640
    Width = 85
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = #50641#49472' F3'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button5: TButton
    Left = 4
    Top = 640
    Width = 85
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = #52712#49548' F2'
    TabOrder = 7
    OnClick = Button5Click
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 1001
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    Caption = #51312#54924#51312#44148
    TabOrder = 9
    DesignSize = (
      1001
      81)
    object Label6: TLabel
      Left = 10
      Top = 41
      Width = 34
      Height = 16
      Caption = #44592#44036
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 206
      Top = 35
      Width = 15
      Height = 29
      Caption = '~'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 386
      Top = 41
      Width = 51
      Height = 16
      Caption = #44144#47000#52376
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 645
      Top = 41
      Width = 34
      Height = 16
      Caption = #51228#54408
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dpBar1: TDateTimePicker
      Left = 49
      Top = 33
      Width = 149
      Height = 32
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
      TabOrder = 0
    end
    object dpBar2: TDateTimePicker
      Left = 228
      Top = 33
      Width = 149
      Height = 32
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
      TabOrder = 1
    end
    object cbAmba: TComboBox
      Left = 443
      Top = 35
      Width = 190
      Height = 29
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 21
      ParentFont = False
      TabOrder = 2
    end
    object cbITEM_STATE: TComboBox
      Left = 684
      Top = 35
      Width = 213
      Height = 29
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 21
      ParentFont = False
      TabOrder = 3
    end
    object Button1: TButton
      Left = 908
      Top = 32
      Width = 85
      Height = 35
      Anchors = [akTop, akRight]
      Caption = #51312#54924' F1'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = qryMain
    Left = 152
    Top = 176
  end
  object qryMain: TQuery
    DatabaseName = 'JIT'
    SQL.Strings = (
      'SELECT a.[BARCODE]'
      '      ,case a.ITEM_STATE '
      #9#9#9'when '#39'0'#39' then '#39#48156#54665#39
      #9#9'   when '#39'1'#39' then '#39#51077#44256#39
      #9#9'   when '#39'2'#39' then '#39#51077#44256#48152#54408#39
      #9#9'   when '#39'3'#39' then '#39#52636#44256#39
      #9#9'   when '#39'4'#39' then '#39#52636#44256#48152#54408#39
      #9#9'   when '#39'5'#39' then '#39'A/S'#48152#54408#39
      #9#9'   when '#39'6'#39' then '#39#54224#44592#39
      #9#9'   when '#39'9'#39' then '#39#52712#49548#39
      '       end as ITEM_STATE_NAME'
      '      ,a.ITEM_STATE '
      '      ,a.[ITEM_CODE]'
      '      ,c.[ITEM_NAME]'
      '      ,a.[BARCODE_DATE]'
      '      ,a.[PRDT_DATE]'
      '      ,a.[PRDT_BACK_DATE]'
      '      ,a.[STORE_DATE]'
      '      ,a.ORGAN_CODE'
      '      ,isnull(f.ORGAN_NAME,'#39#39') ORGAN_NAME'
      '      ,a.[STORE_BACK_DATE]'
      '      ,a.[AS_BACK_DATE]'
      '      ,a.[CLOSE_DATE]'
      '      ,a.[REMARKS]'
      '      ,a.[I_DATE]'
      '      ,d.NAME as I_NAME'
      '      ,a.[U_DATE]'
      '      ,e.NAME as U_NAME'
      '  FROM [dbo].[SPM100] a'
      '  JOIN dbo.SPD101 b'
      '    ON a.BARCODE = b.BARCODE'
      '   and b.CLOSE_DATE = '#39'99991231'#39
      '   and b.ITEM_STATE = '#39'1'#39
      '  JOIN dbo.STH003 c'
      '    ON a.ITEM_CODE = c.ITEM_CODE'
      '   and c.CLOSE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH001 d'
      '    ON a.I_ID = d.USERID'
      '   and d.RETIRE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH001 e'
      '    ON a.I_ID = e.USERID'
      '   and e.RETIRE_DATE = '#39'99991231'#39
      '  LEFT JOIN dbo.STH002 f'
      '    ON a.ORGAN_CODE = f.ORGAN_CODE'
      '   and f.CLOSE_DATE = '#39'99991231'#39
      'where a.BARCODE like :BARCODE'
      '  and a.ORGAN_CODE like :ORGAN_CODE'
      '  and a.ITEM_CODE like :ITEM_CODE'
      '  and a.CLOSE_DATE = '#39'99991231'#39
      
        '  and substring(a.PRDT_DATE,1,10) between :PRDT_DATE1 and :PRDT_' +
        'DATE2')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BARCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORGAN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRDT_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRDT_DATE2'
        ParamType = ptUnknown
      end>
    object qryMainBARCODE: TStringField
      FieldName = 'BARCODE'
      FixedChar = True
      Size = 16
    end
    object qryMainITEM_STATE: TStringField
      FieldName = 'ITEM_STATE'
      FixedChar = True
      Size = 8
    end
    object qryMainITEM_STATE_NAME: TStringField
      FieldName = 'ITEM_STATE_NAME'
      FixedChar = True
      Size = 8
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
    object qryMainBARCODE_DATE: TStringField
      FieldName = 'BARCODE_DATE'
      FixedChar = True
    end
    object qryMainPRDT_DATE: TStringField
      FieldName = 'PRDT_DATE'
      FixedChar = True
    end
    object qryMainPRDT_BACK_DATE: TStringField
      FieldName = 'PRDT_BACK_DATE'
      FixedChar = True
    end
    object qryMainSTORE_DATE: TStringField
      FieldName = 'STORE_DATE'
      FixedChar = True
    end
    object qryMainORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      Visible = False
      FixedChar = True
    end
    object qryMainSTORE_BACK_DATE: TStringField
      FieldName = 'STORE_BACK_DATE'
      FixedChar = True
    end
    object qryMainAS_BACK_DATE: TStringField
      FieldName = 'AS_BACK_DATE'
      FixedChar = True
    end
    object qryMainCLOSE_DATE: TStringField
      FieldName = 'CLOSE_DATE'
      FixedChar = True
    end
    object qryMainREMARKS: TStringField
      FieldName = 'REMARKS'
      FixedChar = True
      Size = 50
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
    object qryMainORGAN_CODE: TStringField
      FieldName = 'ORGAN_CODE'
      Visible = False
      FixedChar = True
      Size = 4
    end
  end
end
