object FSD220Reg: TFSD220Reg
  Left = 220
  Top = 114
  Width = 1010
  Height = 550
  Caption = #48152#49569#46321#47197
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
  object Splitter1: TSplitter
    Left = 504
    Top = 10
    Width = 4
    Height = 465
    Cursor = crHSplit
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 1002
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      1002
      41)
    object btnClose: TButton
      Left = 921
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
      TabOrder = 0
      OnClick = btnCloseClick
    end
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
  object Panel3: TPanel
    Left = 0
    Top = 10
    Width = 504
    Height = 465
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object grpS01: TGroupBox
      Left = 0
      Top = 0
      Width = 504
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
        Left = 7
        Top = 76
        Width = 48
        Height = 12
        Caption = #48152#49569#51068#51088
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
        Left = 157
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
        Left = 37
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
        Left = 31
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
        Left = 206
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
        Left = 229
        Top = 24
        Width = 268
        Height = 20
        Brush.Color = clBtnFace
        Shape = stRoundRect
      end
      object Label9: TLabel
        Left = 277
        Top = 76
        Width = 24
        Height = 12
        Caption = #49345#53468
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
        Left = 59
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
        TabOrder = 1
        TabStop = False
      end
      object dtpI_DATE2: TDateTimePicker
        Left = 170
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
      object edtITEM_CODE: TEdit
        Left = 59
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
        Left = 235
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
        TabOrder = 3
      end
      object edtPNO: TEdit
        Left = 59
        Top = 48
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
        TabOrder = 4
      end
      object cbSET_STAT: TComboBox
        Left = 304
        Top = 72
        Width = 56
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 5
        Text = #51204#52404
        Items.Strings = (
          #51204#52404
          #45824#44592
          #52712#49548
          #51652#54665
          #50756#47308)
      end
    end
    object sgMain: TAdvStringGrid
      Left = 0
      Top = 107
      Width = 504
      Height = 317
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
      OnClick = sgMainClick
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
        #49345#54408#53076#46300
        #49345#54408#47749
        #51077#44256#50696#51221#51068#51088
        #51077#44256#50696#51221#49688#47049
        #51077#44256#49688#47049
        #52636#44256#49688#47049
        #48152#54408#49688#47049
        #44368#54872#49688#47049
        #48152#49569#49688#47049
        #46321#47197#51068#51088
        #46321#47197#51088
        #49688#51221#51068#51088
        #49688#51221#51088)
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
        46
        58
        31
        57
        59
        60
        59
        64
        62
        50
        64
        47)
    end
    object Panel5: TPanel
      Left = 0
      Top = 424
      Width = 504
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        504
        41)
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
        TabOrder = 0
        OnClick = Button2Click
      end
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
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Panel4: TPanel
    Left = 508
    Top = 10
    Width = 494
    Height = 465
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 494
      Height = 153
      Align = alTop
      Caption = ' [ '#46321#47197#54637#47785' ] '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 98
        Width = 48
        Height = 12
        Caption = #48152#49569#51068#51088
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 35
        Top = 29
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
      object Label6: TLabel
        Left = 29
        Top = 75
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
      object SpeedButton1: TSpeedButton
        Left = 204
        Top = 72
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
      object Shape1: TShape
        Left = 227
        Top = 71
        Width = 260
        Height = 20
        Brush.Color = clBtnFace
        Shape = stRoundRect
      end
      object Label7: TLabel
        Left = 17
        Top = 52
        Width = 36
        Height = 12
        Caption = #44144#47000#52376
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 121
        Width = 48
        Height = 12
        Caption = #48152#49569#49688#47049
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 293
        Top = 121
        Width = 24
        Height = 12
        Caption = #50672#48264
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dtpBACK_DATE: TDateTimePicker
        Left = 57
        Top = 94
        Width = 142
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
      object edtITEM_CODEsub: TEdit
        Left = 57
        Top = 71
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
        TabOrder = 2
      end
      object edtITEM_NAMEsub: TStaticText
        Left = 233
        Top = 75
        Width = 246
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtPNOsub: TEdit
        Left = 57
        Top = 25
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
        ReadOnly = True
        TabOrder = 0
      end
      object edtCUST_CODE: TEdit
        Left = 57
        Top = 48
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
        ReadOnly = True
        TabOrder = 1
      end
      object cedtBACK_QTY: TCurrencyEdit
        Left = 57
        Top = 117
        Width = 142
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0.;-\,0.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 4
      end
      object cedtBACK_DATE_SEQ: TCurrencyEdit
        Left = 345
        Top = 117
        Width = 142
        Height = 21
        AutoSize = False
        Color = clScrollBar
        DecimalPlaces = 0
        DisplayFormat = ',0.;-\,0.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object sgSub: TAdvStringGrid
      Left = 0
      Top = 153
      Width = 494
      Height = 271
      Cursor = crDefault
      Align = alClient
      ColCount = 14
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
      OnClick = sgSubClick
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
      OnGetAlignment = sgSubGetAlignment
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
        #49345#54408#53076#46300
        #49345#54408#47749
        #48152#49569#51068#51088
        #50672#48264
        #48152#49569#49688#47049
        #48152#49569#51204#49569#51068#51088
        #48152#49569#49324#50976
        #46321#47197#51068#51088
        #46321#47197#51088
        #49688#51221#51068#51088
        #49688#51221#51088)
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
        57
        72
        58
        31
        57
        62
        85
        91
        64
        62
        94)
    end
    object Panel6: TPanel
      Left = 0
      Top = 424
      Width = 494
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Button5: TButton
        Left = 176
        Top = 8
        Width = 75
        Height = 25
        Caption = #49688#51221' F5'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button5Click
      end
      object Button3: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = #51312#54924' F3'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button7: TButton
        Left = 412
        Top = 8
        Width = 75
        Height = 25
        Caption = #52712#49548' F7'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button7Click
      end
      object Button6: TButton
        Left = 260
        Top = 8
        Width = 75
        Height = 25
        Caption = #49325#51228' F6'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button4: TButton
        Left = 92
        Top = 8
        Width = 75
        Height = 25
        Caption = #52628#44032' F4'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Button4Click
      end
    end
  end
  object qryOpen: TQuery
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      'SELECT distinct a.PNO'
      '      ,a.CUST_CODE'
      '      ,a.ITEM_CODE'
      '      ,c.ITEM_NAME'
      
        '      ,substring(CONVERT([varchar](20),cast(IMP_EXPDATE as datet' +
        'ime),(120)),1,10) IMP_EXPDATE'
      '      ,a.IMP_EXPQTY'
      '      ,a.IMP_QTY'
      '      ,a.EXP_QTY'
      '      ,a.RET_QTY'
      '      ,a.CHN_QTY'
      '      ,a.BACK_QTY'
      '      ,a.I_DATE'
      '      ,a.I_ID'
      '      ,a.U_DATE'
      '      ,a.U_ID'
      '  FROM SM200 a'
      '  JOIN SD220 b'
      '    ON a.PNO       = b.PNO'
      '   AND a.CUST_CODE = b.CUST_CODE'
      '   AND a.ITEM_CODE = b.ITEM_CODE'
      '  JOIN MT200 c'
      '    ON a.ITEM_CODE = c.ITEM_CODE'
      'WHERE a.SET_STAT like :SET_STAT'
      '     AND a.ITEM_CODE like :ITEM_CODE'
      '     AND a.PNO like :PNO'
      '     AND b.BACK_DATE between :BACK_DATE1 and :BACK_DATE2')
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
        Name = 'BACK_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BACK_DATE2'
        ParamType = ptUnknown
      end>
  end
  object subqryOpen: TQuery
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      'SELECT a.PNO'
      '      ,a.CUST_CODE'
      '      ,a.ITEM_CODE'
      '      ,c.ITEM_NAME'
      
        '      ,substring(CONVERT([varchar](20),cast(BACK_DATE as datetim' +
        'e),(120)),1,10) BACK_DATE'
      '      ,BACK_DATE_SEQ'
      '      ,a.BACK_QTY    '
      
        '      ,substring(CONVERT([varchar](20),cast(SEND_EXP_DATE as dat' +
        'etime),(120)),1,10) SEND_EXP_DATE'
      '      ,BACK_COMMENT'
      '      ,a.I_DATE'
      '      ,a.I_ID'
      '      ,a.U_DATE'
      '      ,a.U_ID'
      '  FROM SD220 a'
      '  JOIN MT200 c'
      '    ON a.ITEM_CODE = c.ITEM_CODE'
      'WHERE a.PNO like :PNO'
      '     AND a.CUST_CODE like :CUST_CODE        '
      '     AND a.ITEM_CODE like :ITEM_CODE'
      ' ORDER BY 6')
    Left = 552
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUST_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_CODE'
        ParamType = ptUnknown
      end>
  end
end
