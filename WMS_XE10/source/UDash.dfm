object FDash: TFDash
  Left = 356
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #51068#48324' '#47932#46041#47049
  ClientHeight = 492
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 0
    Width = 831
    Height = 492
    Cursor = crDefault
    Align = alClient
    ColCount = 10
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
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'select case when IMP_EXPDATE is null then '#39#54633#44228#39
      #9#9#9'else IMP_EXPDATE'
      #9'   end'
      #9'  ,IMP_QTY'
      #9'  ,DANGA_IMP'
      #9'  ,EXP_QTY'
      #9'  ,DANGA_EXP '
      #9'  ,RET_QTY'
      #9'  ,DANGA_RET'
      #9'  ,BACK_QTY'
      #9'  ,DANGA_BACK'
      'from '
      
        '(SELECT distinct substring(CONVERT([varchar](20),cast(IMP_EXPDAT' +
        'E as datetime),(120)),1,10) IMP_EXPDATE'
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
      'WHERE substring(CONVERT([varchar](20),getdate(),(120)),1,7) = '
      
        #9'  substring(CONVERT([varchar](20),cast(IMP_EXPDATE as datetime)' +
        ',(120)),1,7)'
      'GROUP BY IMP_EXPDATE'
      'WITH ROLLUP ) a'
      'ORDER BY 1')
    Left = 88
    Top = 176
  end
end
