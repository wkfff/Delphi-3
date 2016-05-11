object FPD122: TFPD122
  Left = 421
  Top = 198
  Caption = #51228#54408#49884#47532#50620#51221#48372
  ClientHeight = 618
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 651
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 643
    Height = 95
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 651
    object Label5: TLabel
      Left = 24
      Top = 21
      Width = 70
      Height = 13
      Caption = #51228#49345#54408#53076#46300
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 57
      Width = 56
      Height = 13
      Caption = #52636#44256#49688#47049
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtCATNO: TEdit
      Left = 100
      Top = 17
      Width = 202
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
    object edtITEM_NAME: TEdit
      Left = 303
      Top = 17
      Width = 322
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object cedtVBELN: TCurrencyEdit
      Left = 100
      Top = 47
      Width = 81
      Height = 33
      AutoSize = False
      Color = 13893363
      Ctl3D = True
      DecimalPlaces = 0
      DisplayFormat = ',0'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = #44404#47548
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      ImeName = 'Microsoft IME 2003'
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 105
    Width = 643
    Height = 472
    Cursor = crDefault
    Align = alClient
    ColCount = 4
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
    TabOrder = 2
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
      #47588#51077#47749#49464#48264#54840
      #46321#47197#51068
      #46321#47197#51088)
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
    SortSettings.AutoFormat = False
    SortSettings.Direction = sdDescending
    SortSettings.NormalCellsOnly = True
    VAlignment = vtaCenter
    Version = '7.9.0.1'
    WordWrap = False
    ExplicitWidth = 651
    ExplicitHeight = 476
    ColWidths = (
      33
      90
      51
      51)
    RowHeights = (
      22
      22)
  end
  object Panel1: TPanel
    Left = 0
    Top = 577
    Width = 643
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 581
    ExplicitWidth = 651
    DesignSize = (
      643
      41)
    object Button4: TButton
      Left = 569
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
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 4
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
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      
        'SELECT distinct SERIAL_NO, E.I_DATE, E.I_ID, C.CATNO, C.ITEM_NAM' +
        'E, A.ORDER_NO,'
      '                B.QTY,'
      '                CASE WHEN (C.QTY = 0) THEN '#39'0'#39
      
        '                        ELSE FLOOR((B.QTY * B.ORDER_EA_UNIT)/C.Q' +
        'TY)'
      '                END AS COUNTING,'
      '                D.INOUT_QTY,'
      
        '                CAST(B.ORDER_EA_UNIT as VARCHAR(8))+'#39'/'#39'+B.ORDER_' +
        'UNIT,'
      '                CAST(C.QTY as VARCHAR(8))+'#39'/'#39'+C.QTY_UNIT,'
      
        '                substring(D.LOC_CODE,1,1)+'#39'-'#39'+substring(D.LOC_CO' +
        'DE,2,2)+'#39'-'#39'+substring(D.LOC_CODE,4,2)+'#39'-'#39'+substring(D.LOC_CODE,6' +
        ',1) LOC_CODE,'
      
        '                CONVERT(varchar(10),cast(D.EXP_DATE as datetime)' +
        ',(120)) EXP_DATE, E.I_ID'
      'FROM ('
      '  SELECT ORDER_NO FROM PM100'
      '  WHERE ORDER_STAT IN ( '#39'20'#39', '#39'25'#39')'
      ' AND ORDER_TYPE = :ORDER_TYPE ) A'
      'JOIN PM100 B'
      '  ON A.ORDER_NO   = B.ORDER_NO'
      'JOIN MT300 C'
      '  ON B.ITEM_CODE  = C.ITEM_CODE'
      'JOIN PD120 D'
      '  ON B.ORDER_TYPE = D.ORDER_TYPE'
      ' AND B.ORDER_NO   = D.ORDER_NO'
      ' AND B.ITEM_CODE  = D.ITEM_CODE'
      ' AND B.ORDER_UNIT = D.ORDER_UNIT'
      'JOIN PD122 E'
      '  ON D.ITEM_CODE  = E.ITEM_CODE'
      ' AND D.ORDER_NO   = E.ORDER_NO'
      ' AND D.ORDER_TYPE = E.ORDER_TYPE'
      ' AND D.ORDER_UNIT = E.ORDER_UNIT'
      'WHERE C.ITEM_GUBUN = '#39'P'#39
      '  AND D.EXP_DATE BETWEEN :EXP_DATE1 AND :EXP_DATE2'
      '  AND C.CATNO      LIKE  :CATNO'
      '  AND A.ORDER_NO   = :ORDER_NO'
      'ORDER BY SERIAL_NO')
    Left = 168
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXP_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXP_DATE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDER_NO'
        ParamType = ptUnknown
      end>
  end
end
