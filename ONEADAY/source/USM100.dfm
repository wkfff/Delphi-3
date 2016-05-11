object FSM100: TFSM100
  Left = 296
  Top = 171
  Width = 1010
  Height = 550
  Caption = #52636#44256#51312#54924
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
      Left = 49
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
      Left = 205
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
      Left = 55
      Top = 52
      Width = 48
      Height = 12
      Caption = #46321#44592#48264#54840
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
      Left = 55
      Top = 27
      Width = 48
      Height = 12
      Caption = #51452#47928#48264#54840
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dtpI_DATE1: TDateTimePicker
      Left = 107
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
      Left = 218
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
      Left = 461
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
    object edtORDER_NO: TEdit
      Left = 107
      Top = 24
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
    object edtPOST_NO: TEdit
      Left = 107
      Top = 49
      Width = 202
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 4
    end
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 117
    Width = 1002
    Height = 358
    Cursor = crDefault
    Align = alClient
    ColCount = 16
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
    SortSettings.Show = False
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
      #46321#44592#48264#54840
      #53469#48176#51452#47928#48264#54840
      #54252#51109#48149#49828#47749
      #49688#52712#51064#47749
      #49688#52712#51064#50864#54200#48264#54840
      #49688#52712#51064#51452#49548
      #51204#54868#48264#54840
      #54648#46300#54256#48264#54840
      #49345#54408#53076#46300
      #49345#54408#47749
      #49688#47049
      #45800#44032
      #48176#49569#47700#49884#51648
      #46321#47197#51068#51088
      #51452#47928#48264#54840
      '')
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
      54
      77
      75
      57
      98
      75
      57
      60
      60
      59
      38
      33
      76
      60
      64)
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
      
        'exec SP_SM100_ITEM_NAME :ORDER_STAT,:PNO,:POST_NO,:I_DATE1,:I_DA' +
        'TE2')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_STAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POST_NO'
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
