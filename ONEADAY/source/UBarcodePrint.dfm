object FBarcodePrint: TFBarcodePrint
  Left = 245
  Top = 127
  Width = 1010
  Height = 550
  Caption = #48148#53076#46300#54532#47536#53944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  DesignSize = (
    1002
    516)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 473
    Width = 993
    Height = 41
    TabOrder = 0
    DesignSize = (
      993
      41)
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #48156#54665' F1'
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
      Left = 911
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
  end
  object GroupBox4: TGroupBox
    Left = 3
    Top = 8
    Width = 993
    Height = 136
    Anchors = [akLeft, akTop, akRight]
    Caption = #48148#53076#46300' '#48156#54665
    TabOrder = 1
    DesignSize = (
      993
      136)
    object lblSerial2: TLabel
      Left = 440
      Top = 91
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
      Left = 19
      Top = 24
      Width = 56
      Height = 13
      Caption = #48156#54665#51068#51088
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
    object lblDATE: TLabel
      Left = 98
      Top = 24
      Width = 70
      Height = 13
      Caption = '2009-08-31'
      Color = clSilver
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
      Left = 19
      Top = 24
      Width = 217
      Height = 13
      Caption = #48156#54665#47588#49688#47484' '#51077#47141#54616#50668' '#48156#54665#54633#45768#45796'.'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Pitch = fpVariable
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 61
      Width = 961
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 21
      Top = 91
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
    object edtSerial2: TEdit
      Left = 505
      Top = 81
      Width = 107
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
      MaxLength = 5
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 612
      Top = 81
      Width = 22
      Height = 33
      Associate = edtSerial2
      Min = 0
      Position = 0
      TabOrder = 1
      Wrap = False
    end
    object Edit1: TEdit
      Left = 106
      Top = 81
      Width = 319
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
      TabOrder = 2
      Text = '8812345678901'
    end
  end
  object sgMain: TAdvStringGrid
    Left = 3
    Top = 145
    Width = 993
    Height = 325
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    Ctl3D = False
    DefaultRowHeight = 21
    DefaultDrawing = False
    FixedColor = 6476526
    FixedCols = 0
    RowCount = 2
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 1
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goRowSelect]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 2
    GridLineColor = 10930928
    ActiveCellShow = False
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clGray
    Bands.PrimaryColor = clWindow
    Bands.PrimaryLength = 1
    Bands.SecondaryColor = 16185078
    Bands.SecondaryLength = 1
    Bands.Print = False
    AutoNumAlign = True
    AutoSize = False
    VAlignment = vtaCenter
    EnhTextSize = False
    EnhRowColMove = False
    SizeWithForm = False
    Multilinecells = False
    DragDropSettings.OleAcceptFiles = True
    DragDropSettings.OleAcceptText = True
    SortSettings.AutoColumnMerge = False
    SortSettings.Column = 0
    SortSettings.Show = False
    SortSettings.IndexShow = False
    SortSettings.IndexColor = clYellow
    SortSettings.Full = True
    SortSettings.SingleColumn = False
    SortSettings.IgnoreBlanks = False
    SortSettings.BlankPos = blLast
    SortSettings.AutoFormat = False
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
    FixedColWidth = 48
    FixedRowHeight = 21
    FixedFont.Charset = HANGEUL_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -12
    FixedFont.Name = #44404#47548
    FixedFont.Style = []
    FixedAsButtons = False
    FloatFormat = '%.2f'
    IntegralHeight = False
    WordWrap = False
    ColumnHeaders.Strings = (
      'No'
      #48156#54665#49884#44036
      #48148#53076#46300
      #48156#54665#47588#49688)
    Lookup = False
    LookupCaseSensitive = False
    LookupHistory = False
    BackGround.Top = 0
    BackGround.Left = 0
    BackGround.Display = bdTile
    BackGround.Cells = bcNormal
    Filter = <>
    ColWidths = (
      48
      93
      204
      222)
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
    Left = 792
    Top = 16
  end
  object Timer1: TTimer
    Interval = 100
    Left = 840
    Top = 16
  end
end
