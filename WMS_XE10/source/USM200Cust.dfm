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
    DrawingStyle = gdsClassic
    FixedColor = 6476526
    RowCount = 3
    FixedRows = 2
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
    ColWidths = (
      33
      38
      51
      38
      38
      38
      38
      38
      38
      38
      38)
    RowHeights = (
      22
      22
      22)
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
      Date = 37452.839074166700000000
      Time = 37452.839074166700000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 0
      TabStop = False
    end
    object dtpI_DATE2: TDateTimePicker
      Left = 186
      Top = 42
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
