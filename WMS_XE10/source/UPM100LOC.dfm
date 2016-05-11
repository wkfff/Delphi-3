object FPM100LOC: TFPM100LOC
  Left = 385
  Top = 204
  Caption = #51077#44256' LOC '#51312#54924
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
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 117
    Width = 994
    Height = 354
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
      #51077#44256#51068#51088
      #47588#51077#47749#49464#48264#54840
      #51228#49345#54408#53076#46300
      #51228#49345#54408#47749
      'CAT NO'
      #47588#51077#45800#50948
      #51652#54665#49345#53468
      #51077#44256'LOC NO.'
      #50724#45908#49688#47049
      #51077#44256#49688#47049
      #51077#44256#44160#49688#49688#47049
      'LOC '#44396#48516
      #51116#44256' LOC NO.'
      #51116#44256#49688#47049
      #51116#44256#45800#50948#54872#49328#49688#47049
      #51228#49345#54408#44396#48516
      #46321#47197#51068
      #46321#47197#51088
      #49688#51221#51068
      #49688#51221#51088)
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
    ExplicitWidth = 1002
    ExplicitHeight = 358
    ColWidths = (
      33
      64
      90
      77
      64
      54
      64
      64
      87
      64
      64
      90
      66
      94
      64
      116
      77
      51
      51
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
    object Button2: TButton
      Left = 104
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
    TabOrder = 2
    ExplicitWidth = 1002
  end
  object GroupBox2: TGroupBox
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
    TabOrder = 3
    ExplicitWidth = 1002
    object Label2: TLabel
      Left = 35
      Top = 25
      Width = 36
      Height = 12
      Caption = 'CAT NO'
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
      Left = 11
      Top = 50
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
      Left = 294
      Top = 47
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
    object SpeedButton1: TSpeedButton
      Left = 294
      Top = 22
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
      Left = 185
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
    object edtCATNO: TEdit
      Left = 87
      Top = 21
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
    object GroupBox3: TGroupBox
      Left = 648
      Top = 24
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
    object edtITEM_CODE: TEdit
      Left = 87
      Top = 46
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
      Left = 322
      Top = 46
      Width = 310
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
    object dtpI_DATE1: TDateTimePicker
      Left = 87
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
      TabOrder = 4
      TabStop = False
    end
    object dtpI_DATE2: TDateTimePicker
      Left = 198
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
      TabOrder = 5
      TabStop = False
    end
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      
        'SELECT'#9'a.EXP_DATE, a.ORDER_NO, a.ITEM_CODE, ITEM_NAME, b.CATNO, ' +
        'a.ORDER_UNIT'
      '        ,d.CODE_SNM, a.LOC_CODE  ,a.INOUT_QTY   '#9',a.CHECK_QTY'
      '        ,LOC_GUBUN'#9#9',c.LOC_CODE'#9#9',c.QTY'#9#9#9',QTY_EA'#9#9#9',g.CODE_SNM'
      
        '        ,a.I_DATE'#9#9',a.I_ID'#9#9#9',a.U_DATE      ,a.U_ID,a.ORDER_STAT' +
        ',f.ITEM_GUBUN'
      '  FROM PD110 a'
      '  JOIN MT300 b'
      '    on a.ITEM_CODE = b.ITEM_CODE'
      '  JOIN PM700 c'
      '    ON a.ITEM_CODE  = c.ITEM_CODE'
      '   AND a.ORDER_UNIT = c.ORDER_UNIT'
      '  JOIN MT900 d'
      '    on code_tp = '#39'0001'#39
      '   and a.ORDER_STAT = d.code_cd'
      '   and code_cd <> '#39'99'#39
      '  JOIN PM100 f'
      '    ON a.ORDER_TYPE = f.ORDER_TYPE'
      '   AND a.ORDER_NO   = f.ORDER_NO'
      '   AND a.ITEM_CODE  = f.ITEM_CODE'
      '   AND a.ORDER_UNIT = f.ORDER_UNIT'
      '  JOIN MT900 g'
      '    on g.code_tp = '#39'0004'#39
      '   and f.ITEM_GUBUN = g.code_cd'
      '   and g.code_cd <> '#39'99'#39
      ' WHERE a.ORDER_TYPE  = '#39'1000'#39
      '   AND f.INOUT_GUBUN = '#39'I'#39
      '   AND b.CATNO     like :CATNO'
      '   AND a.ITEM_CODE like :ITEM_CODE'
      '   AND a.EXP_DATE BETWEEN :EXP_DATE1 AND :EXP_DATE2 '
      '   AND (1 = :ITEM_GUBUN1'
      '        OR f.ITEM_GUBUN like :ITEM_GUBUN2)'
      'ORDER BY a.EXP_DATE, a.ORDER_NO, a.ITEM_CODE')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CATNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_CODE'
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
        Name = 'ITEM_GUBUN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ITEM_GUBUN2'
        ParamType = ptUnknown
      end>
  end
end
