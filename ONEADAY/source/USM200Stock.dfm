object FSM200Stock: TFSM200Stock
  Left = 296
  Top = 171
  Width = 1010
  Height = 550
  Caption = #51221#49328#51312#54924
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
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
    Width = 1002
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
      CalAlignment = dtaLeft
      Date = 37452.8390741667
      Time = 37452.8390741667
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 2
      TabStop = False
    end
    object dtpI_DATE2: TDateTimePicker
      Left = 186
      Top = 72
      Width = 92
      Height = 20
      CalAlignment = dtaLeft
      Date = 37452.8390741667
      Time = 37452.8390741667
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      Kind = dtkDate
      ParseInput = False
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
    Width = 1002
    Height = 358
    Cursor = crDefault
    Align = alClient
    ColCount = 20
    Ctl3D = False
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = 6476526
    FixedCols = 1
    RowCount = 2
    FixedRows = 1
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    GridLineWidth = 1
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    GridLineColor = 10930928
    ActiveCellShow = False
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clGray
    Bands.Active = True
    Bands.PrimaryColor = clWindow
    Bands.PrimaryLength = 1
    Bands.SecondaryColor = 15395562
    Bands.SecondaryLength = 1
    Bands.Print = False
    AutoNumAlign = True
    AutoSize = True
    VAlignment = vtaCenter
    EnhTextSize = False
    EnhRowColMove = False
    SizeWithForm = False
    Multilinecells = True
    OnGetCellColor = sgMainGetCellColor
    OnGetAlignment = sgMainGetAlignment
    DragDropSettings.OleAcceptFiles = True
    DragDropSettings.OleAcceptText = True
    SortSettings.AutoColumnMerge = False
    SortSettings.Column = 22
    SortSettings.Show = True
    SortSettings.IndexShow = False
    SortSettings.IndexColor = clYellow
    SortSettings.Full = True
    SortSettings.SingleColumn = False
    SortSettings.IgnoreBlanks = False
    SortSettings.BlankPos = blLast
    SortSettings.AutoFormat = True
    SortSettings.Direction = sdDescending
    SortSettings.FixedCols = False
    SortSettings.NormalCellsOnly = True
    SortSettings.Row = 0
    FloatingFooter.Color = clBtnFace
    FloatingFooter.Column = 0
    FloatingFooter.FooterStyle = fsFixedLastRow
    FloatingFooter.Visible = False
    ControlLook.Color = clBlack
    ControlLook.CheckSize = 15
    ControlLook.RadioSize = 10
    ControlLook.ControlStyle = csClassic
    ControlLook.FlatButton = False
    EnableBlink = False
    EnableHTML = True
    EnableWheel = True
    Flat = True
    HintColor = clInfoBk
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SelectionRectangle = False
    SelectionResizer = False
    SelectionRTFKeep = False
    HintShowCells = True
    HintShowLargeText = True
    HintShowSizing = True
    PrintSettings.FooterSize = 0
    PrintSettings.HeaderSize = 0
    PrintSettings.Time = ppNone
    PrintSettings.Date = ppNone
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.PageNr = ppNone
    PrintSettings.Title = ppNone
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
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
    PrintSettings.BorderStyle = psSolid
    PrintSettings.Centered = False
    PrintSettings.RepeatFixedRows = False
    PrintSettings.RepeatFixedCols = False
    PrintSettings.LeftSize = 0
    PrintSettings.RightSize = 0
    PrintSettings.ColumnSpacing = 0
    PrintSettings.RowSpacing = 0
    PrintSettings.TitleSpacing = 0
    PrintSettings.Orientation = poPortrait
    PrintSettings.PageNumberOffset = 0
    PrintSettings.MaxPagesOffset = 0
    PrintSettings.FixedWidth = 0
    PrintSettings.FixedHeight = 0
    PrintSettings.UseFixedHeight = False
    PrintSettings.UseFixedWidth = False
    PrintSettings.FitToPage = fpNever
    PrintSettings.PageNumSep = '/'
    PrintSettings.NoAutoSize = False
    PrintSettings.NoAutoSizeRow = False
    PrintSettings.PrintGraphics = False
    HTMLSettings.Width = 100
    HTMLSettings.XHTML = False
    Navigation.AdvanceDirection = adLeftRight
    Navigation.AllowClipboardRowGrow = False
    Navigation.AllowClipboardColGrow = False
    Navigation.EditSelectAll = False
    Navigation.InsertPosition = pInsertBefore
    Navigation.HomeEndKey = heFirstLastColumn
    Navigation.TabToNextAtEnd = False
    Navigation.TabAdvanceDirection = adLeftRight
    ColumnSize.Location = clRegistry
    CellNode.Color = clSilver
    CellNode.NodeColor = clBlack
    CellNode.ShowTree = False
    MaxEditLength = 0
    MouseActions.RowSelect = True
    IntelliPan = ipVertical
    URLColor = clBlue
    URLShow = False
    URLFull = False
    URLEdit = False
    ScrollType = ssNormal
    ScrollColor = clNone
    ScrollWidth = 17
    ScrollSynch = False
    ScrollProportional = False
    ScrollHints = shNone
    OemConvert = False
    FixedFooters = 0
    FixedRightCols = 0
    FixedColWidth = 33
    FixedRowHeight = 22
    FixedFont.Charset = HANGEUL_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -12
    FixedFont.Name = #44404#47548#52404
    FixedFont.Style = [fsBold]
    FixedAsButtons = False
    FloatFormat = '%.2f'
    IntegralHeight = False
    WordWrap = False
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
    Lookup = False
    LookupCaseSensitive = False
    LookupHistory = False
    BackGround.Top = 0
    BackGround.Left = 0
    BackGround.Display = bdTile
    BackGround.Cells = bcNormal
    Filter = <>
    ColWidths = (
      33
      37
      48
      46
      72
      34
      86
      57
      60
      60
      59
      64
      62
      59
      64
      74
      64
      64
      47
      72)
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 1002
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1002
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
    Width = 1002
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
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
      '    ON a.SET_STAT = c.CODE_CD'
      '   AND c.CODE_TP = '#39'0001'#39
      '   AND c.CODE_CD <> '#39'00'#39
      'WHERE a.SET_STAT like :SET_STAT'
      '     AND a.ITEM_CODE like :ITEM_CODE'
      '     AND a.PNO like :PNO'
      '     AND a.IMP_EXPDATE between :IMP_EXPDATE1 and :IMP_EXPDATE2')
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
        Name = 'IMP_EXPDATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMP_EXPDATE2'
        ParamType = ptUnknown
      end>
  end
end
