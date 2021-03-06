object FSM200Cust: TFSM200Cust
  Left = 356
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #44144#47000#52376#48324' '#47932#46041#47049
  ClientHeight = 516
  ClientWidth = 1002
  Color = clBtnFace
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 85
    Width = 1002
    Height = 390
    Cursor = crDefault
    Align = alClient
    ColCount = 11
    Ctl3D = False
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = 6476526
    FixedCols = 1
    RowCount = 3
    FixedRows = 2
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
    TabOrder = 0
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
      #51068#51088
      #44144#47000#52376
      #49688#47049
      #44552#50529
      #49688#47049
      #44552#50529
      #49688#47049
      #44552#50529
      #49688#47049
      #44552#50529)
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
      43
      34
      36
      38
      36
      41
      64)
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 1002
    Height = 75
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 17
      Top = 46
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
      Top = 46
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
    object dtpI_DATE1: TDateTimePicker
      Left = 75
      Top = 42
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
      TabOrder = 0
      TabStop = False
    end
    object dtpI_DATE2: TDateTimePicker
      Left = 186
      Top = 42
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
      TabOrder = 1
      TabStop = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 1002
    Height = 41
    Align = alBottom
    TabOrder = 3
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
  object qryOpen: TQuery
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      
        'select case when (IMP_EXPDATE is null) and (CUST_CODE is null) t' +
        'hen '#39#54633#44228#39
      #9#9#9'when (IMP_EXPDATE is null) then '#39#49548#44228#39
      #9#9#9'else IMP_EXPDATE'
      #9'   end IMP_EXPDATE'
      '      ,case when (CUST_CODE is null) then '#39#39
      #9#9#9'else CUST_CODE'
      #9'   end IMP_EXPDATE'
      #9'  ,IMP_QTY'
      #9'  ,DANGA_IMP'
      #9'  ,EXP_QTY'
      #9'  ,DANGA_EXP'
      #9'  ,RET_QTY'
      #9'  ,DANGA_RET'
      #9'  ,BACK_QTY'
      #9'  ,DANGA_BACK'
      'from '
      
        '(SELECT distinct substring(CONVERT([varchar](20),cast(IMP_EXPDAT' +
        'E as datetime),(120)),1,10) IMP_EXPDATE'
      '      ,CUST_CODE'
      '      ,sum(IMP_QTY) IMP_QTY'
      '      ,sum(IMP_QTY*a.DANGA) DANGA_IMP'
      '      ,sum(EXP_QTY) EXP_QTY'
      '      ,sum(EXP_QTY*a.DANGA) DANGA_EXP'
      '      ,sum(RET_QTY)+sum(CHN_QTY) RET_QTY'
      '      ,sum(RET_QTY*a.DANGA)+sum(CHN_QTY*a.DANGA) DANGA_RET'
      '      ,sum(BACK_QTY) BACK_QTY'
      '      ,sum(BACK_QTY*a.DANGA) DANGA_BACK'
      '  FROM SM200 a'
      '  JOIN MT200 b'
      '    ON a.ITEM_CODE = b.ITEM_CODE'
      '  JOIN MT300 c'
      '    ON a.SET_STAT = c.CODE_CD'
      '   AND c.CODE_TP = '#39'0001'#39
      '   AND c.CODE_CD <> '#39'00'#39
      ' WHERE IMP_EXPDATE between :IMP_EXPDATE1 and :IMP_EXPDATE2'
      'GROUP BY CUST_CODE, IMP_EXPDATE'
      'WITH ROLLUP ) a'
      'ORDER BY 1, 2 desc')
    Left = 88
    Top = 176
    ParamData = <
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
