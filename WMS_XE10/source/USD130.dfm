object FSD130: TFSD130
  Left = 324
  Top = 175
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
  object grpS01: TGroupBox
    Left = 0
    Top = 10
    Width = 994
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
    ExplicitWidth = 1002
    object Label3: TLabel
      Left = 23
      Top = 76
      Width = 48
      Height = 12
      Caption = #51077#44256#51068#51088
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
      Left = 23
      Top = 52
      Width = 48
      Height = 12
      Caption = #51217#49688#51068#51088
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
      Left = 23
      Top = 27
      Width = 48
      Height = 12
      Caption = #51452#47928#48264#54840
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 173
      Top = 52
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
      Top = 72
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
    object dtpI_DATE2: TDateTimePicker
      Left = 186
      Top = 72
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
      TabOrder = 3
      TabStop = False
    end
    object grpGubun: TGroupBox
      Left = 573
      Top = 24
      Width = 404
      Height = 62
      Caption = ' [ '#49345#53468' '#44396#48516' ] '
      TabOrder = 1
      object rbSt_01: TRadioButton
        Left = 99
        Top = 29
        Width = 58
        Height = 17
        Caption = #45824#44592
        TabOrder = 1
        OnClick = rbSt_AllClick
      end
      object rbSt_02: TRadioButton
        Left = 174
        Top = 29
        Width = 58
        Height = 17
        Caption = #52712#49548
        TabOrder = 2
        OnClick = rbSt_AllClick
      end
      object rbSt_03: TRadioButton
        Left = 246
        Top = 29
        Width = 69
        Height = 17
        Caption = #51652#54665
        TabOrder = 3
        OnClick = rbSt_AllClick
      end
      object rbSt_All: TRadioButton
        Left = 34
        Top = 29
        Width = 58
        Height = 17
        Caption = #51204#52404
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbSt_AllClick
      end
      object rbSt_04: TRadioButton
        Left = 329
        Top = 29
        Width = 69
        Height = 17
        Caption = #50756#47308
        TabOrder = 4
        OnClick = rbSt_AllClick
      end
    end
    object edtORDER_NO: TEdit
      Left = 75
      Top = 24
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
    object dtpACC_DATE1: TDateTimePicker
      Left = 75
      Top = 48
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
    object dtpACC_DATE2: TDateTimePicker
      Left = 186
      Top = 48
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
      TabOrder = 5
      TabStop = False
    end
    object GroupBox1: TGroupBox
      Left = 306
      Top = 24
      Width = 244
      Height = 62
      Caption = ' [ '#48152#54408'/'#44368#54872' ] '
      TabOrder = 6
      object rbRET_QTY: TRadioButton
        Left = 99
        Top = 29
        Width = 58
        Height = 17
        Caption = #48152#54408
        TabOrder = 1
      end
      object rb_All: TRadioButton
        Left = 34
        Top = 29
        Width = 58
        Height = 17
        Caption = #51204#52404
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbCHN_QTY: TRadioButton
        Left = 174
        Top = 29
        Width = 58
        Height = 17
        Caption = #44368#54872
        TabOrder = 2
      end
    end
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 117
    Width = 994
    Height = 354
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
    TabOrder = 1
    GridLineColor = 10930928
    HoverRowCells = [hcNormal, hcSelected]
    OnGetAlignment = sgMainGetAlignment
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
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
    ExplicitHeight = 358
    ColWidths = (
      33
      37
      48
      46
      72
      34
      72
      57
      60
      60
      59
      64
      62
      59
      64
      64
      64
      64
      64)
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
    TabOrder = 2
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 1002
  end
  object qryOpen: TQuery
    DatabaseName = 'ONEADAY'
    SQL.Strings = (
      'SELECT ACC_NO'
      '      ,ACC_DATE'
      '      ,ACC_PER'
      '      ,REQ_NAME'
      '      ,a.ORDER_NO'
      '      ,b.ITEM_CODE'
      '      ,ITEM_NAME'
      '      ,REQ_TEL'
      '      ,ACC_COMMENT'
      '      ,e.CODE_SNM GUBUN'
      '      ,f.CODE_SNM GUBUN_DET'
      '      ,d.CODE_SNM ORDER_STAT'
      '      ,IMP_POST_NO'
      '      ,IMP_DATE'
      '      ,IMP_QTY'
      '      ,EXP_POST_NO'
      '      ,SEND_IMP_DATE'
      '      ,EXP_DATE'
      '--'#9'  ,b.I_DATE'
      '--'#9'  ,b.I_ID'
      '--'#9'  ,b.U_DATE'
      '--'#9'  ,b.U_ID'
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
      '     where ORDER_STAT like :ORDER_STAT'
      '        and a.ORDER_NO like :ORDER_NO'
      '        and ACC_DATE between :ACC_DATE1 and :ACC_DATE2'
      '        and IMP_DATE between :IMP_DATE1 and :IMP_DATE2'
      '        and b.GUBUN like :GUBUN')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_STAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDER_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACC_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACC_DATE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMP_DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IMP_DATE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GUBUN'
        ParamType = ptUnknown
      end>
  end
end
