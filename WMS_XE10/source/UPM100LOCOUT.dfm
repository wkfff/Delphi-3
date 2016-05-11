object FPM100LocOut: TFPM100LocOut
  Left = 244
  Top = 162
  Caption = 'LOC'#48324' '#52636#44256#45236#50669
  ClientHeight = 512
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
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
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 46
    Width = 56
    Height = 13
    Caption = #44144#47000#52376#47749
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 142
    Width = 994
    Height = 329
    Cursor = crDefault
    Align = alClient
    ColCount = 10
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
      'LOC NO'
      #51228#49345#54408#44396#48516
      'CAT. NO'
      #51228#49345#54408#47749
      #52636#44256#49688#47049
      #51452#47928#45800#50948
      #51116#44256#45800#50948
      #52636#44256#51068
      #47588#51077#47749#49464#48264#54840)
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
    ColWidths = (
      33
      54
      77
      61
      64
      64
      64
      64
      51
      90)
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
    DesignSize = (
      994
      41)
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
    object Button3: TButton
      Left = 85
      Top = 8
      Width = 75
      Height = 25
      Caption = #50641#49472' F2'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 994
    Height = 132
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label23: TLabel
      Left = 50
      Top = 52
      Width = 42
      Height = 13
      Caption = #44144#47000#52376
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 305
      Top = 49
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
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 36
      Top = 26
      Width = 56
      Height = 13
      Caption = #52636#44256#51068#51088
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 78
      Width = 84
      Height = 13
      Caption = #44144#47000#47749#49464#48264#54840
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 105
      Width = 84
      Height = 13
      Caption = #47196#52992#51060#49496#53076#46300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 217
      Top = 105
      Width = 7
      Height = 13
      Caption = '~'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object edtCUST_CODE: TEdit
      Left = 101
      Top = 48
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
    object GroupBox1: TGroupBox
      Left = 656
      Top = 21
      Width = 334
      Height = 62
      Caption = ' [ '#51228#49345#54408#44396#48516' ] '
      TabOrder = 1
      object RadioButton1: TRadioButton
        Left = 99
        Top = 29
        Width = 58
        Height = 17
        Caption = #51228#54408
        TabOrder = 1
      end
      object RadioButton0: TRadioButton
        Left = 34
        Top = 29
        Width = 58
        Height = 17
        Caption = #51204#52404
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 174
        Top = 29
        Width = 58
        Height = 17
        Caption = #49345#54408
        TabOrder = 2
      end
      object RadioButton3: TRadioButton
        Left = 238
        Top = 29
        Width = 58
        Height = 17
        Caption = #48708#47588#54408
        TabOrder = 3
      end
    end
    object dtpI_DATE1: TDateTimePicker
      Left = 100
      Top = 23
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
      TabOrder = 2
      TabStop = False
    end
    object edtORDER_NO: TEdit
      Left = 101
      Top = 74
      Width = 202
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 3
    end
    object edtCUST_NAME: TEdit
      Left = 327
      Top = 48
      Width = 322
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
    object Mak_Location_From: TMaskEdit
      Left = 100
      Top = 101
      Width = 111
      Height = 21
      Color = clWhite
      EditMask = 'L\-99\-99\-9;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 9
      ParentFont = False
      TabOrder = 5
      Text = ' -  -  - '
    end
    object Mak_Location_To: TMaskEdit
      Left = 230
      Top = 101
      Width = 112
      Height = 21
      Color = clWhite
      EditMask = 'L\-99\-99\-9;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 9
      ParentFont = False
      TabOrder = 6
      Text = ' -  -  - '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      
        'SELECT distinct substring(G.LOC_CODE,1,1)+'#39'-'#39'+substring(G.LOC_CO' +
        'DE,2,2)+'#39'-'#39'+substring(G.LOC_CODE,4,2)+'#39'-'#39'+substring(G.LOC_CODE,6' +
        ',1) LOC_CODE,'
      '                F.CODE_SNM, C.CATNO, C.ITEM_NAME, D.INOUT_QTY,'
      
        '                CAST(B.ORDER_EA_UNIT as VARCHAR(8))+'#39'/'#39'+B.ORDER_' +
        'UNIT,'
      '                CAST(C.QTY as VARCHAR(8))+'#39'/'#39'+C.QTY_UNIT,'
      
        '                CONVERT(varchar(10),cast(D.EXP_DATE as datetime)' +
        ',(120)), A.ORDER_NO'
      '-- select *'
      'FROM ('
      '  SELECT ORDER_NO'
      '   -- select *'
      '    FROM PM100'
      '   WHERE ORDER_STAT IN ('#39'20'#39','#39'25'#39')'
      '     AND ORDER_TYPE = '#39'2000'#39' ) A'
      'JOIN PM100 B'
      '  ON A.ORDER_NO   = B.ORDER_NO'
      'JOIN MT300 C'
      '  ON B.ITEM_CODE  = C.ITEM_CODE'
      'JOIN PD120 D'
      '  ON B.ORDER_TYPE = D.ORDER_TYPE'
      ' AND B.ORDER_NO   = D.ORDER_NO'
      ' AND B.ITEM_CODE  = D.ITEM_CODE'
      ' AND B.ORDER_UNIT = D.ORDER_UNIT'
      'JOIN MT200 E'
      '  ON B.CUST_CODE  = E.CUST_CODE'
      'JOIN MT900 F'
      '  ON B.ITEM_GUBUN = F.CODE_CD'
      ' AND F.CODE_TP    = '#39'2000'#39
      ' AND F.CODE_CD    <> '#39#39
      'JOIN PD124 G'
      '  ON D.ORDER_DT   = G.ORDER_DT'
      ' AND D.ITEM_CODE  = G.ITEM_CODE'
      ' AND D.ORDER_UNIT = G.ORDER_UNIT'
      'WHERE E.CUST_CODE  like :CUST_CODE'
      '  AND C.ITEM_GUBUN like :ITEM_GUBUN'
      '  AND D.EXP_DATE = :EXP_DATE'
      '  AND A.ORDER_NO like :ORDER_NO'
      '  AND G.LOC_CODE BETWEEN :LOC_CODE1 AND :LOC_CODE2'
      'ORDER BY LOC_CODE, C.CATNO')
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CUST_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDER_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOC_CODE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOC_CODE2'
        ParamType = ptUnknown
      end>
  end
end
