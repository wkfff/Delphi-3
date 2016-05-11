object FIItem: TFIItem
  Left = 268
  Top = 122
  Caption = #51228#54408' '#47560#49828#53552' '#51221#48372
  ClientHeight = 512
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    994
    512)
  PixelsPerInch = 96
  TextHeight = 16
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 177
    Width = 994
    Height = 294
    Cursor = crDefault
    Align = alClient
    ColCount = 13
    Ctl3D = False
    DrawingStyle = gdsClassic
    FixedColor = 6476526
    RowCount = 2
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssBoth
    ShowHint = False
    TabOrder = 0
    OnClick = sgMainClick
    GridLineColor = 10930928
    HoverRowCells = [hcNormal, hcSelected]
    OnGetAlignment = sgMainGetAlignment
    HintShowCells = True
    HintShowLargeText = True
    HintShowSizing = True
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    AutoNumAlign = True
    AutoSize = True
    Bands.Active = True
    Bands.PrimaryColor = clWindow
    Bands.SecondaryColor = 15395562
    CellNode.ShowTree = False
    ColumnHeaders.Strings = (
      'No'
      'CAT. NO'
      #51228#49345#54408#47749
      #51228#49345#54408#44396#48516
      #54032#47588#45800#50948
      'CS'#51077#49688#49688#47049
      'PK'#51077#49688#49688#47049
      #51116#44256#45800#50948#45817#49688#47049
      #51116#44256#45800#50948
      #49345#54408#48148#53076#46300
      #51228#49345#54408#53076#46300
      #46321#47197#51068
      #46321#47197#51088
      #49688#51221#51068
      #49688#51221#51088)
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.ControlStyle = csClassic
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    EnhRowColMove = False
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FilterEdit.TypeNames.Strings = (
      'Starts with'
      'Ends with'
      'Contains'
      'Not contains'
      'Equal'
      'Not equal'
      'Larger than'
      'Smaller than'
      'Clear')
    FixedColWidth = 33
    FixedRowHeight = 22
    FixedFont.Charset = HANGEUL_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -12
    FixedFont.Name = #44404#47548#52404
    FixedFont.Style = [fsBold]
    Flat = True
    FloatFormat = '%.2f'
    HoverButtons.Buttons = <>
    HoverButtons.Position = hbLeftFromColumnLeft
    HTMLSettings.ImageFolder = 'images'
    HTMLSettings.ImageBaseName = 'img'
    MouseActions.RowSelect = True
    Multilinecells = True
    Navigation.AllowClipboardRowGrow = False
    Navigation.AllowClipboardColGrow = False
    Navigation.EditSelectAll = False
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.Borders = pbNoborder
    PrintSettings.Centered = False
    PrintSettings.PageNumSep = '/'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SortSettings.DefaultFormat = ssAutomatic
    SortSettings.Column = 22
    SortSettings.Show = True
    SortSettings.BlankPos = blLast
    SortSettings.AutoFormat = False
    SortSettings.Direction = sdDescending
    SortSettings.NormalCellsOnly = True
    VAlignment = vtaCenter
    Version = '7.9.0.1'
    WordWrap = False
    ColWidths = (
      33
      61
      64
      77
      64
      78
      78
      103
      64
      77
      77
      51
      51)
    RowHeights = (
      22
      22)
    object pnlPrint: TPanel
      Left = 273
      Top = 78
      Width = 454
      Height = 122
      TabOrder = 2
      Visible = False
      object Label1: TLabel
        Left = 27
        Top = 42
        Width = 126
        Height = 12
        Caption = #48148#53076#46300' '#46972#48296' '#48156#54665#51473'...'
      end
      object Gauge1: TGauge
        Left = 27
        Top = 56
        Width = 401
        Height = 23
        Progress = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 994
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      994
      41)
    object Button2: TButton
      Left = 167
      Top = 8
      Width = 75
      Height = 25
      Caption = #50641#49472' F3'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 4
      Top = 8
      Width = 75
      Height = 25
      Caption = #51312#54924' F1'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 920
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #45803#44592' &X'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 85
      Top = 8
      Width = 75
      Height = 25
      Caption = #48156#54665' F2'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Caption = #49688#51221' F4'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button5Click
    end
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 994
    Height = 167
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label23: TLabel
      Left = 35
      Top = 27
      Width = 42
      Height = 12
      Caption = 'CAT. NO'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 294
      Top = 24
      Width = 21
      Height = 18
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 191
      Top = 65
      Width = 70
      Height = 13
      Caption = #48156#54665#48148#53076#46300
      Color = clBtnFace
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Pitch = fpVariable
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 706
      Top = 65
      Width = 56
      Height = 13
      Caption = #48156#54665#47588#49688
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 49
      Top = 65
      Width = 28
      Height = 13
      Caption = #51068#51088
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtCATNO: TEdit
      Left = 87
      Top = 23
      Width = 202
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 648
      Top = 24
      Width = 334
      Height = 62
      Caption = ' [ '#51228#49345#54408#44396#48516' ] '
      TabOrder = 1
      object RadioButton1: TRadioButton
        Left = 99
        Top = 29
        Width = 58
        Height = 17
        Caption = #51228#54408
        TabOrder = 1
      end
      object RadioButton0: TRadioButton
        Left = 34
        Top = 29
        Width = 58
        Height = 17
        Caption = #51204#52404
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 174
        Top = 29
        Width = 58
        Height = 17
        Caption = #49345#54408
        TabOrder = 2
      end
      object RadioButton3: TRadioButton
        Left = 238
        Top = 29
        Width = 58
        Height = 17
        Caption = #48708#47588#54408
        TabOrder = 3
      end
    end
    object edtITEM_NAME: TEdit
      Left = 320
      Top = 23
      Width = 310
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 2
    end
    object edtBARCODE: TEdit
      Left = 268
      Top = 55
      Width = 277
      Height = 33
      Color = 13893363
      Ctl3D = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = #44404#47548
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 19
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object dtpI_DATE: TDateTimePicker
      Left = 87
      Top = 61
      Width = 92
      Height = 20
      Date = 37452.839074166700000000
      Time = 37452.839074166700000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 4
      TabStop = False
    end
    object GroupBox2: TGroupBox
      Left = 40
      Top = 96
      Width = 273
      Height = 57
      Caption = #46972#48296#51333#47448
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object rbtn3: TRadioButton
        Left = 184
        Top = 24
        Width = 65
        Height = 17
        Caption = #49548#54805
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rbtn2: TRadioButton
        Left = 104
        Top = 24
        Width = 65
        Height = 17
        Caption = #49345#54408
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = rbtn2Click
      end
      object rbtn1: TRadioButton
        Left = 24
        Top = 24
        Width = 65
        Height = 17
        Caption = #51228#54408
        Checked = True
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = rbtn1Click
      end
    end
    object cedtVBELN: TCurrencyEdit
      Left = 552
      Top = 55
      Width = 81
      Height = 33
      AutoSize = False
      Color = 13893363
      Ctl3D = True
      DecimalPlaces = 0
      DisplayFormat = ',0'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = #44404#47548
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2003'
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      Value = 1.000000000000000000
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 96
      Width = 331
      Height = 57
      Caption = #54532#47536#53552#51333#47448
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object rbtnS: TRadioButton
        Left = 192
        Top = 24
        Width = 65
        Height = 17
        Caption = #49548#54805
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rbtnL: TRadioButton
        Left = 72
        Top = 24
        Width = 65
        Height = 17
        Caption = #45824#54805
        Checked = True
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 773
      Top = 96
      Width = 209
      Height = 57
      Caption = #54532#47536#53552#54252#53944
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object cbPort: TComboBox
        Left = 40
        Top = 24
        Width = 145
        Height = 20
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'COM1'
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4')
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pnCode: TPanel
    Left = 268
    Top = 200
    Width = 482
    Height = 165
    Anchors = []
    BorderStyle = bsSingle
    Caption = ' '
    TabOrder = 4
    Visible = False
    object Label76: TLabel
      Left = 41
      Top = 66
      Width = 70
      Height = 13
      Caption = #49345#54408#48148#53076#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object pnCodeTitle: TPanel
      Left = 1
      Top = 1
      Width = 476
      Height = 32
      Align = alTop
      Caption = #51228#54408' '#47560#49828#53552' '#51221#48372
      Color = clInactiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Button13: TButton
      Left = 148
      Top = 112
      Width = 85
      Height = 35
      Caption = #54869#51064
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 244
      Top = 112
      Width = 85
      Height = 35
      Caption = #52712#49548
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button14Click
    end
    object edtKAN_CODE: TEdit
      Left = 116
      Top = 60
      Width = 245
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeMode = imSAlpha
      ImeName = 'Microsoft IME 2003'
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
    end
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT   CATNO,ITEM_NAME'
      #9'  ,b.CODE_SNM'#9
      '      ,UNIT'
      '      ,UNIT_CS'
      '      ,UNIT_PK  '
      '      ,QTY'
      '      ,QTY_UNIT'
      '      ,KAN_CODE'
      '      ,ITEM_CODE'
      '      ,a.I_DATE'
      '      ,a.I_ID'
      '      ,a.U_DATE'
      '      ,a.U_ID'
      '      ,ITEM_GUBUN'
      '  FROM MT300 a'
      '  JOIN MT900 b'
      '    ON a.ITEM_GUBUN = b.CODE_CD'
      '   AND CODE_TP = '#39'2000'#39
      '   AND CODE_CD <> '#39#39
      'WHERE a.CATNO like :CATNO'
      '   AND (1 = :ITEM_GUBUN1'
      '        OR a.ITEM_GUBUN like :ITEM_GUBUN2)'
      '   AND LEN(ITEM_CODE) = 7'
      'ORDER BY CATNO')
    Left = 104
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CATNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN2'
        ParamType = ptUnknown
      end>
  end
  object Comm1Prnt1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 168
    Top = 344
  end
end
