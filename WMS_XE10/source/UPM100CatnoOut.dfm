object FPM100CatnoOut: TFPM100CatnoOut
  Left = 262
  Top = 118
  Caption = #51228#49345#54408#48324' '#52636#44256#45236#50669
  ClientHeight = 512
  ClientWidth = 949
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
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 949
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      949
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
      Left = 875
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
    Width = 949
    Height = 98
    Align = alTop
    Caption = ' [ '#51312#54924#51312#44148' ] '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 36
      Top = 35
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
    object Label5: TLabel
      Left = 32
      Top = 61
      Width = 60
      Height = 12
      Caption = #51228#49345#54408#53076#46300
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
      Left = 304
      Top = 58
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
    object Label2: TLabel
      Left = 200
      Top = 40
      Width = 6
      Height = 12
      Caption = '~'
    end
    object GroupBox1: TGroupBox
      Left = 656
      Top = 21
      Width = 334
      Height = 62
      Caption = ' [ '#51228#49345#54408#44396#48516' ] '
      TabOrder = 0
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
      Top = 32
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
    object edtCATNO: TEdit
      Left = 100
      Top = 57
      Width = 202
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 2
    end
    object edtITEM_NAME: TEdit
      Left = 327
      Top = 57
      Width = 322
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
    object dtpI_DATE2: TDateTimePicker
      Left = 212
      Top = 32
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
      TabOrder = 4
      TabStop = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 108
    Width = 949
    Height = 363
    Cursor = crDefault
    Align = alClient
    ColCount = 21
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
    OnDblClick = sgMainDblClick
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
      'CAT. NO'
      #51228#49345#54408#47749
      #51228#49345#54408#44396#48516
      #47588#51077#47749#49464#48264#54840
      #51452#47928#49688#47049
      #50696#51221#49688#47049
      #52636#44256#49688#47049
      #51452#47928#45800#50948
      #51116#44256#45800#50948
      #52636#44256' LOC NO'
      #52636#44256#51068
      #44144#47000#52376#47749
      #54588#53433#51648#49884#51068#49884
      #54588#53433#51648#49884#51088
      #54588#53433#51068#49884
      #54588#53433#51089#50629#51088
      #48520#47448#51089#50629#51068#49884
      #48516#47448#51089#50629#51088
      #44160#54408#51089#50629#51068#49884
      #44160#54408#51089#50629#51088)
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
      61
      64
      77
      90
      64
      64
      64
      64
      64
      87
      51
      64
      90
      77
      64
      77
      90
      77
      90
      77)
    RowHeights = (
      22
      22)
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT distinct C.CATNO, C.ITEM_NAME, F.CODE_SNM, A.ORDER_NO,'
      '                B.QTY,'
      '                CASE WHEN (C.QTY = 0) THEN '#39'0'#39
      
        '                        ELSE FLOOR((B.QTY * B.ORDER_EA_UNIT)/C.Q' +
        'TY)'
      '                END AS COUNTING,'
      '                D.INOUT_QTY,'
      
        '                CAST(B.ORDER_EA_UNIT as VARCHAR(8))+'#39'/'#39'+B.ORDER_' +
        'UNIT,'
      '                CAST(C.QTY as VARCHAR(8))+'#39'/'#39'+C.QTY_UNIT,'
      
        '                substring(G.LOC_CODE,1,1)+'#39'-'#39'+substring(G.LOC_CO' +
        'DE,2,2)+'#39'-'#39'+substring(G.LOC_CODE,4,2)+'#39'-'#39'+substring(G.LOC_CODE,6' +
        ',1) LOC_CODE,'
      
        '                CONVERT(varchar(10),cast(D.EXP_DATE as datetime)' +
        ',(120)) EXP_DATE,'
      '                E.CUST_NAME'
      '         , D.I_DATE'
      '         , H.NAME'
      '         , D.P_DATE'
      '         , I.NAME'
      '         , D.D_DATE'
      '         , J.NAME'
      '         , D.C_DATE'
      '         , K.NAME'
      'FROM ('
      '  SELECT ORDER_NO FROM PM100'
      '  WHERE ORDER_STAT IN ( '#39'20'#39', '#39'10'#39', '#39'25'#39')'
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
      'LEFT JOIN MT100 H'
      '  ON H.USERID      = D.I_ID'
      'LEFT JOIN MT100 I'
      '  ON I.USERID      = D.P_ID'
      'LEFT JOIN MT100 J'
      '  ON J.USERID      = D.D_ID'
      'LEFT JOIN MT100 K'
      '  ON K.USERID      = D.C_ID'
      'WHERE C.ITEM_GUBUN like :ITEM_GUBUN'
      '  AND D.EXP_DATE BETWEEN :EXP_DATE1 AND :EXP_DATE2'
      '  AND C.CATNO      like :CATNO'
      'ORDER BY E.CUST_NAME, A.ORDER_NO')
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN'
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
      end>
  end
end