object FSD130Exp: TFSD130Exp
  Left = 261
  Top = 169
  Caption = #48152#54408'/'#44368#54872' '#51312#54924
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
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 0
    Width = 994
    Height = 471
    Cursor = crDefault
    Align = alClient
    ColCount = 19
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
      #51217#49688#48264#54840
      #51217#49688#51068
      #51217#49688#51088
      #50836#52397#51088
      #51452#47928#48264#54840
      #49345#54408#53076#46300
      #49345#54408#47749
      #50672#46973#52376
      #50836#44396#49324#54637
      #48516#47448
      #48516#47448#49345#49464
      #52376#47532#49345#53468
      #49688#44144#49569#51109
      #51077#44256#51068#51088
      #51077#44256#49688#47049
      #52636#44256#49569#51109
      #54872#48520#51068
      #51333#47308#51068)
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
    ExplicitHeight = 475
    ColWidths = (
      33
      64
      51
      51
      51
      64
      64
      51
      51
      64
      38
      64
      64
      64
      64
      64
      64
      51
      51)
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
    TabOrder = 1
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
  end
  object qryOpen: TQuery
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      'SELECT ACC_NO'
      #9#9#9'  ,ACC_DATE'
      #9#9#9'  ,ACC_PER'
      #9#9#9'  ,REQ_NAME'
      #9#9#9'  ,a.ORDER_NO'
      #9#9#9'  ,b.ITEM_CODE'
      #9#9#9'  ,ITEM_NAME'
      #9#9#9'  ,REQ_TEL'
      #9#9#9'  ,ACC_COMMENT'
      #9#9#9'  ,e.CODE_SNM GUBUN'
      #9#9#9'  ,f.CODE_SNM GUBUN_DET'
      #9#9#9'  ,d.CODE_SNM ORDER_STAT'
      #9#9#9'  ,IMP_POST_NO'
      #9#9#9'  ,IMP_DATE'
      #9#9#9'  ,IMP_QTY'
      #9#9#9'  ,EXP_POST_NO'
      #9#9#9'  ,SEND_IMP_DATE'
      #9#9#9'  ,EXP_DATE'
      #9#9'--'#9'  ,b.I_DATE'
      #9#9'--'#9'  ,b.I_ID'
      #9#9'--'#9'  ,b.U_DATE'
      #9#9'--'#9'  ,b.U_ID'
      #9'  from SM100 a'
      '      JOIN SD130 b'
      '        ON a.ORDER_NO = b.ORDER_NO'
      '      JOIN MT200 c'
      #9'    ON b.ITEM_CODE = c.ITEM_CODE'
      '      JOIN MT300 d'
      #9'    ON a.ORDER_STAT = d.CODE_CD'
      '       AND d.CODE_TP = '#39'0001'#39
      #9'   AND d.CODE_CD <> '#39'00'#39
      '      JOIN MT300 e'
      #9'    ON b.GUBUN = e.CODE_CD'
      '       AND e.CODE_TP = '#39'0002'#39
      #9'   AND e.CODE_CD <> '#39'00'#39
      '      JOIN MT300 f'
      #9'    ON b.GUBUN_DET = f.CODE_CD'
      '       AND f.CODE_TP = '#39'0003'#39
      #9'   AND f.CODE_CD <> '#39'00'#39
      '--     where ORDER_STAT = '#39'01'#39)
    Left = 88
    Top = 176
  end
end
