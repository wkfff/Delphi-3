object FSD110: TFSD110
  Left = 264
  Top = 167
  BorderStyle = bsSingle
  Caption = #46321#44592#48264#54840' '#51201#50857
  ClientHeight = 516
  ClientWidth = 1003
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 1003
    Height = 78
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 22
      Width = 48
      Height = 12
      Caption = #49569#51109#54028#51068
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Gauge1: TGauge
      Left = 80
      Top = 48
      Width = 489
      Height = 22
      Progress = 0
    end
    object Label2: TLabel
      Left = 17
      Top = 53
      Width = 36
      Height = 12
      Caption = #51652#54665#50984
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtFileName: TEdit
      Left = 80
      Top = 18
      Width = 489
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object Button3: TButton
      Left = 573
      Top = 16
      Width = 37
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 613
      Top = 16
      Width = 92
      Height = 25
      Caption = #51201#50857
      Enabled = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object memLog: TMemo
      Left = 728
      Top = 14
      Width = 273
      Height = 62
      Align = alRight
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 1003
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1003
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
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 88
    Width = 1003
    Height = 387
    Cursor = crDefault
    Align = alClient
    ColCount = 25
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
    TabOrder = 3
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
      #44256#44061#51452#47928#52376#47749
      #46321#44592#48264#54840
      #53469#48176#51452#47928#48264#54840
      #54252#51109#48149#49828#47749
      #49688#52712#51064#47749
      #49688#52712#51064#50864#54200#48264#54840
      #49688#52712#51064#51452#49548
      #51204#54868#48264#54840
      #54648#46300#54256#48264#54840
      #45236#50857#47932#51068#47144#48264#54840
      #49345#54408#53076#46300
      #49345#54408#47749
      #49345#54408#47784#45944
      #49324#51060#51592
      #49353#49345
      #49688#47049
      #45800#44032
      #44552#50529
      #48176#49569#47700#49884#51648
      #51652#54665#51221#48372#48152#50689#49345#53468
      #46321#47197#51068#49884
      #51452#47928#51068#49884
      #51077#44552#51068#49884
      #51452#47928#48264#54840)
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
      90
      64
      90
      77
      64
      103
      77
      64
      77
      103
      64
      51
      64
      51
      38
      38
      38
      38
      77
      116
      64
      64
      64
      64)
    RowHeights = (
      22
      22)
    object pnlSend: TPanel
      Left = 304
      Top = 124
      Width = 393
      Height = 120
      BevelInner = bvRaised
      BevelWidth = 2
      TabOrder = 2
      Visible = False
      object gaugeProgress: TGauge
        Left = 34
        Top = 68
        Width = 334
        Height = 31
        ForeColor = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        ParentFont = False
        Progress = 0
      end
      object Label54: TLabel
        Left = 35
        Top = 16
        Width = 296
        Height = 13
        AutoSize = False
        Caption = 'Now Processing ...        Please Wait ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblSndSts: TLabel
        Left = 36
        Top = 50
        Width = 285
        Height = 15
        AutoSize = False
        Caption = 'Excel Data ===>  Temp Table Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
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
  object dlgOpenFile: TOpenDialog
    Left = 608
    Top = 120
  end
end
