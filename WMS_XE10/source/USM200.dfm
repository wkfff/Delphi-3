object FSM200: TFSM200
  Left = 296
  Top = 171
  Caption = #51077#44256#51312#54924
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
  PixelsPerInch = 96
  TextHeight = 16
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 994
    Height = 107
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1002
    object Label3: TLabel
      Left = 17
      Top = 76
      Width = 54
      Height = 12
      Caption = #51312#54924' '#44592#44036
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 173
      Top = 76
      Width = 6
      Height = 12
      Alignment = taCenter
      Caption = '~'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 53
      Top = 52
      Width = 18
      Height = 12
      Caption = 'PNO'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 47
      Top = 27
      Width = 24
      Height = 12
      Caption = #49345#54408
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object sbnLine_S01: TSpeedButton
      Left = 222
      Top = 25
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
      OnClick = sbnLine_S01Click
    end
    object Shape8: TShape
      Left = 245
      Top = 24
      Width = 268
      Height = 20
      Brush.Color = clBtnFace
      Shape = stRoundRect
    end
    object dtpI_DATE1: TDateTimePicker
      Left = 75
      Top = 72
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
      TabOrder = 2
      TabStop = False
    end
    object dtpI_DATE2: TDateTimePicker
      Left = 186
      Top = 72
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
      TabOrder = 3
      TabStop = False
    end
    object grpGubun: TGroupBox
      Left = 549
      Top = 24
      Width = 431
      Height = 62
      Caption = ' [ '#49345#53468' '#44396#48516' ] '
      TabOrder = 1
      object rbSt_01: TRadioButton
        Left = 99
        Top = 29
        Width = 58
        Height = 17
        Caption = #45824#44592
        TabOrder = 1
        OnClick = rbSt_AllClick
      end
      object rbSt_02: TRadioButton
        Left = 174
        Top = 29
        Width = 58
        Height = 17
        Caption = #52712#49548
        TabOrder = 2
        OnClick = rbSt_AllClick
      end
      object rbSt_03: TRadioButton
        Left = 246
        Top = 29
        Width = 69
        Height = 17
        Caption = #51652#54665
        TabOrder = 3
        OnClick = rbSt_AllClick
      end
      object rbSt_All: TRadioButton
        Left = 34
        Top = 29
        Width = 58
        Height = 17
        Caption = #51204#52404
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbSt_AllClick
      end
      object rbSt_04: TRadioButton
        Left = 329
        Top = 29
        Width = 69
        Height = 17
        Caption = #50756#47308
        TabOrder = 4
        OnClick = rbSt_AllClick
      end
    end
    object edtITEM_CODE: TEdit
      Left = 75
      Top = 24
      Width = 142
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtITEM_NAME: TStaticText
      Left = 251
      Top = 28
      Width = 254
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtPNO: TEdit
      Left = 75
      Top = 49
      Width = 142
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 1
      ParentFont = False
      TabOrder = 5
    end
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 117
    Width = 994
    Height = 354
    Cursor = crDefault
    Align = alClient
    ColCount = 20
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
    TabOrder = 1
    GridLineColor = 10930928
    HoverRowCells = [hcNormal, hcSelected]
    OnGetCellColor = sgMainGetCellColor
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
      'PNO'
      #44144#47000#52376
      #49345#54408#47749
      #51077#44256#50696#51221#51068#51088
      #49345#53468
      #51077#44256#50696#51221#49688#47049
      #51077#44256#49688#47049
      #52636#44256#49688#47049
      #48152#54408#49688#47049
      #44368#54872#49688#47049
      #48152#49569#49688#47049
      #51077#44256#45800#44032
      #44284#49464#44396#48516
      #50864#54200#48264#54840
      #44144#47000#52376#51452#49548
      #50672#46973#52376'1'
      #54057#49828'...'
      #45812#45817#51088
      #51088#47308#46321#47197#51068#51088)
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
    SortSettings.Direction = sdDescending
    SortSettings.NormalCellsOnly = True
    VAlignment = vtaCenter
    Version = '7.9.0.1'
    WordWrap = False
    ExplicitWidth = 1002
    ExplicitHeight = 358
    ColWidths = (
      33
      33
      51
      51
      90
      38
      90
      64
      64
      64
      64
      64
      64
      64
      64
      77
      58
      59
      51
      90)
    RowHeights = (
      22
      22)
  end
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 994
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 475
    ExplicitWidth = 1002
    DesignSize = (
      994
      41)
    object Button1: TButton
      Left = 8
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
    object Button2: TButton
      Left = 92
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #50641#49472' F2'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
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
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      'SELECT PNO'
      '      ,CUST_CODE'
      '      ,ITEM_NAME'
      
        '      ,substring(CONVERT([varchar](20),cast(IMP_EXPDATE as datet' +
        'ime),(120)),1,10) IMP_EXPDATE'
      '      ,CODE_SNM'
      '      ,IMP_EXPQTY'
      '      ,IMP_QTY'
      '      ,EXP_QTY'
      '      ,RET_QTY'
      '      ,CHN_QTY'
      '      ,BACK_QTY'
      '      ,a.DANGA'
      '      ,a.TAX_GUBUN'
      '      ,CUST_ZIP'
      '      ,CUST_ADDRESS'
      '      ,CUST_TEL1'
      '      ,CUST_TEL2'
      '      ,CUST_PER'
      '      ,a.I_DATE'
      '      ,a.I_ID'
      '      ,a.U_DATE'
      '      ,a.U_ID'
      '      ,a.ITEM_CODE'
      '  FROM SM200 a'
      '  JOIN MT200 b'
      '    ON a.ITEM_CODE = b.ITEM_CODE'
      '  JOIN MT300 c'
      '    ON a.SET_STAT = c.CODE_CD  '
      '   AND c.CODE_TP = '#39'0001'#39
      '   AND c.CODE_CD <> '#39'00'#39
      'WHERE a.SET_STAT like :SET_STAT'
      '     AND a.ITEM_CODE like :ITEM_CODE'
      '     AND a.PNO like :PNO'
      '     AND a.IMP_EXPDATE between :I_DATE1 and :I_DATE2')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SET_STAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I_DATE2'
        ParamType = ptUnknown
      end>
  end
end
