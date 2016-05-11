object FPM100CustInPre: TFPM100CustInPre
  Left = 236
  Top = 179
  Caption = #47588#51077#49324#48324' '#51452#47928#45236#50669
  ClientHeight = 512
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 46
    Width = 56
    Height = 13
    Caption = #44144#47000#52376#47749
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 209
    Width = 994
    Height = 262
    Cursor = crDefault
    Align = alClient
    ColCount = 12
    Ctl3D = False
    DrawingStyle = gdsClassic
    FixedColor = 6476526
    RowCount = 2
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
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
      #49440#53469
      #44144#47000#52376#47749
      #51452#47928#48264#54840
      #51228#49345#54408#44396#48516
      'CAT. NO'
      #51228#49345#54408#47749
      #51452#47928#49688#47049
      #51452#47928#45800#50948
      #51116#44256#49688#47049
      #51116#44256#45800#50948
      #51228#49345#54408#53076#46300)
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
    ExplicitWidth = 1002
    ExplicitHeight = 266
    ColWidths = (
      33
      38
      64
      64
      77
      61
      64
      64
      64
      64
      64
      77)
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
      object Label5: TLabel
        Left = 27
        Top = 31
        Width = 126
        Height = 12
        Caption = #48148#53076#46300' '#46972#48296' '#48156#54665#51473'...'
      end
      object Gauge1: TGauge
        Left = 27
        Top = 45
        Width = 401
        Height = 23
        Progress = 0
      end
      object Gauge2: TGauge
        Left = 27
        Top = 69
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
    ExplicitTop = 475
    ExplicitWidth = 1002
    DesignSize = (
      994
      41)
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
      TabOrder = 0
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
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 165
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
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
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
      OnClick = Button2Click
    end
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 994
    Height = 199
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 1002
    object Label23: TLabel
      Left = 50
      Top = 36
      Width = 42
      Height = 13
      Caption = #44144#47000#52376
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 305
      Top = 33
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
    object Label2: TLabel
      Left = 8
      Top = 70
      Width = 84
      Height = 13
      Caption = #47588#51077#47749#49464#48264#54840
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 62
      Top = 105
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
    object Label4: TLabel
      Left = 212
      Top = 105
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
    object edtCUST_CODE: TEdit
      Left = 101
      Top = 32
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
      Left = 656
      Top = 21
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
    object edtORDER_NO: TEdit
      Left = 101
      Top = 66
      Width = 202
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
    object edtCUST_NAME: TEdit
      Left = 327
      Top = 32
      Width = 322
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 3
    end
    object dtpI_DATE: TDateTimePicker
      Left = 100
      Top = 101
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
      Left = 157
      Top = 136
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
    object edtBARCODE: TEdit
      Left = 288
      Top = 95
      Width = 277
      Height = 18
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
      TabOrder = 6
    end
    object cedtVBELN: TCurrencyEdit
      Left = 568
      Top = 95
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
      TabOrder = 7
      Value = 1.000000000000000000
    end
    object GroupBox4: TGroupBox
      Left = 781
      Top = 136
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
        ParentFont = False
        TabOrder = 0
        Text = 'COM1'
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM29')
      end
    end
    object GroupBox3: TGroupBox
      Left = 438
      Top = 136
      Width = 331
      Height = 57
      Caption = #54532#47536#53552#51333#47448
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 9
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
    object CheckBox1: TCheckBox
      Left = 40
      Top = 158
      Width = 81
      Height = 17
      Caption = #51204#52404#49440#53469
      TabOrder = 10
      OnClick = CheckBox1Click
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
    ExplicitWidth = 1002
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      
        'SELECT distinct E.CUST_NAME, A.ORDER_NO, F.CODE_SNM, C.CATNO, C.' +
        'ITEM_NAME,'
      
        '        B.QTY, CAST(B.ORDER_EA_UNIT as VARCHAR(8))+'#39'/'#39'+B.ORDER_U' +
        'NIT, '
      '  CAST(FLOOR((B.QTY * B.ORDER_EA_UNIT) / C.QTY) as VARCHAR(20)),'
      
        '        CAST(C.QTY as VARCHAR(8))+'#39'/'#39'+C.QTY_UNIT STOCK_UNIT, B.I' +
        'TEM_CODE'
      'FROM ('
      '    SELECT isnull(ORDER_NO,'#39#39') ORDER_NO'
      '      FROM PM100_IF'
      '     WHERE ORDER_CLOSE = '#39'Y'#39
      '       AND (STATE  = '#39'00'#39' or STATE  = '#39'10'#39')'
      '       AND ORDER_TYPE  = :ORDER_TYPE ) A'
      'JOIN PM100_IF B'
      '  ON A.ORDER_NO   = B.ORDER_NO'
      'JOIN MT300 C'
      '  ON B.ITEM_CODE  = C.ITEM_CODE'
      'JOIN MT200 E'
      '  ON B.CUST_CODE  = E.CUST_CODE'
      ' AND E.CUST_GUBUN = '#39'3000'#39
      'JOIN MT900 F'
      '  ON B.ITEM_GUBUN = F.CODE_CD'
      ' AND F.CODE_TP    = '#39'2000'#39
      ' AND F.CODE_CD    <> '#39#39
      'WHERE E.CUST_CODE  like :CUST_CODE'
      '  AND C.ITEM_GUBUN like :ITEM_GUBUN'
      '  AND A.ORDER_NO   like :ORDER_NO'
      'ORDER BY E.CUST_NAME, A.ORDER_NO, C.CATNO')
    Left = 128
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUST_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDER_NO'
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
    Left = 192
    Top = 392
  end
end
