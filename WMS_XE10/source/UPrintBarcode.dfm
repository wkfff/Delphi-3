object FPMPRINTBARCODE: TFPMPRINTBARCODE
  Left = 255
  Top = 148
  Caption = #46972#48296' '#48148#53076#46300' '#52636#47141
  ClientHeight = 539
  ClientWidth = 928
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
    Top = 498
    Width = 928
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      928
      41)
    object Label13: TLabel
      Left = 181
      Top = 14
      Width = 83
      Height = 13
      Caption = #54532#47536#53552#54252#53944':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 4
      Top = 8
      Width = 75
      Height = 25
      Caption = #48156#54665' F1'
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
      Left = 854
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
    object edtComport: TEdit
      Left = 267
      Top = 8
      Width = 49
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 10
    BevelOuter = bvNone
    TabOrder = 1
  end
  object sgMain: TAdvStringGrid
    Left = 0
    Top = 119
    Width = 928
    Height = 379
    Cursor = crDefault
    Align = alClient
    ColCount = 6
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
      'CAT. NO'
      #51228#49345#54408#47749
      #50500#51060#53596#47749
      #49884#47532#50620#48264#54840
      #51089#50629#51088'ID')
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
    ExplicitWidth = 936
    ExplicitHeight = 383
    ColWidths = (
      33
      61
      64
      64
      77
      65)
    RowHeights = (
      22
      22)
  end
  object pcCondition: TPageControl
    Left = 0
    Top = 0
    Width = 928
    Height = 119
    ActivePage = TabSheet3
    Align = alTop
    DockSite = True
    TabOrder = 3
    ExplicitWidth = 936
    object TabSheet2: TTabSheet
      Caption = #51228#54408#48148#53076#46300
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 14
        Top = 18
        Width = 48
        Height = 12
        Caption = #51228#54408#53076#46300
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
        Left = 280
        Top = 15
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
      object Label10: TLabel
        Left = 11
        Top = 57
        Width = 56
        Height = 13
        Caption = #49373#49328#51068#51088
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 263
        Top = 57
        Width = 70
        Height = 13
        Caption = #48156#54665#48148#53076#46300
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 698
        Top = 57
        Width = 56
        Height = 13
        Caption = #48156#54665#47588#49688
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtCATNO1: TEdit
        Left = 76
        Top = 14
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
      object edtITEM_NAME1: TEdit
        Left = 303
        Top = 14
        Width = 314
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 1
      end
      object dtpI_DATE1: TDateTimePicker
        Left = 75
        Top = 54
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
      object edtBARCODE1: TEdit
        Left = 356
        Top = 45
        Width = 319
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 19
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object Edit10: TEdit
        Left = 763
        Top = 45
        Width = 107
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '1'
      end
      object UpDown3: TUpDown
        Left = 870
        Top = 45
        Width = 16
        Height = 33
        Associate = Edit10
        Position = 1
        TabOrder = 5
      end
      object edtITEM_CODE1: TEdit
        Left = 671
        Top = 14
        Width = 66
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = #49345#54408#48148#53076#46300
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 15
        Top = 18
        Width = 48
        Height = 12
        Caption = #49345#54408#53076#46300
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 280
        Top = 15
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
        Left = 11
        Top = 57
        Width = 56
        Height = 13
        Caption = #51077#44256#45380#50900
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 263
        Top = 57
        Width = 70
        Height = 13
        Caption = #48156#54665#48148#53076#46300
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 698
        Top = 57
        Width = 56
        Height = 13
        Caption = #48156#54665#47588#49688
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtCATNO2: TEdit
        Left = 76
        Top = 14
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
      object edtITEM_NAME2: TEdit
        Left = 303
        Top = 14
        Width = 314
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 1
      end
      object dtpI_DATE2: TDateTimePicker
        Left = 75
        Top = 54
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
      object edtBARCODE2: TEdit
        Left = 356
        Top = 45
        Width = 319
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 19
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object Edit8: TEdit
        Left = 763
        Top = 45
        Width = 107
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '1'
      end
      object UpDown2: TUpDown
        Left = 870
        Top = 45
        Width = 16
        Height = 33
        Associate = Edit8
        Position = 1
        TabOrder = 5
      end
      object edtITEM_CODE2: TEdit
        Left = 671
        Top = 14
        Width = 66
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
    end
    object TabSheet1: TTabSheet
      Caption = #49548#54805#48148#53076#46300
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 15
        Top = 18
        Width = 48
        Height = 12
        Caption = #49345#54408#53076#46300
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
        Left = 280
        Top = 15
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
      object Label7: TLabel
        Left = 11
        Top = 57
        Width = 56
        Height = 13
        Caption = #51077#44256#45380#50900
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 263
        Top = 57
        Width = 70
        Height = 13
        Caption = #48156#54665#48148#53076#46300
        Color = clBtnFace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 698
        Top = 57
        Width = 56
        Height = 13
        Caption = #48156#54665#47588#49688
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
      end
      object edtCATNO3: TEdit
        Left = 76
        Top = 14
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
      object edtITEM_NAME3: TEdit
        Left = 303
        Top = 14
        Width = 314
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 1
      end
      object dtpI_DATE3: TDateTimePicker
        Left = 75
        Top = 54
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
      object edtBARCODE3: TEdit
        Left = 356
        Top = 45
        Width = 319
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 19
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object Edit7: TEdit
        Left = 763
        Top = 45
        Width = 107
        Height = 19
        Color = 13893363
        Ctl3D = False
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = #44404#47548
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '1'
      end
      object UpDown1: TUpDown
        Left = 870
        Top = 45
        Width = 16
        Height = 33
        Associate = Edit7
        Position = 1
        TabOrder = 5
      end
      object edtITEM_CODE3: TEdit
        Left = 671
        Top = 14
        Width = 66
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
    end
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT distinct C.CATNO, C.ITEM_NAME, F.CODE_SNM, A.ORDER_NO,'
      '                B.ORDER_UNIT, B.QTY, D.INOUT_QTY,'
      
        '                substring(D.LOC_CODE,1,1)+'#39'-'#39'+substring(D.LOC_CO' +
        'DE,2,2)+'#39'-'#39'+substring(D.LOC_CODE,4,2)+'#39'-'#39'+substring(D.LOC_CODE,6' +
        ',1) LOC_CODE,'
      
        '                CONVERT(varchar(10),cast(D.EXP_DATE as datetime)' +
        ',(120)) EXP_DATE, E.CUST_NAME, D.I_ID'
      'FROM ('
      '  SELECT ORDER_NO FROM PM100'
      '  WHERE ORDER_STAT IN ( '#39'20'#39', '#39'25'#39')'
      ' AND ORDER_TYPE = '#39'1000'#39' ) A'
      'JOIN PM100 B'
      '  ON A.ORDER_NO   = B.ORDER_NO'
      'JOIN MT300 C'
      '  ON B.ITEM_CODE  = C.ITEM_CODE'
      'JOIN PD110 D'
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
      'WHERE C.ITEM_GUBUN like :ITEM_GUBUN'
      '  AND D.EXP_DATE = :EXP_DATE'
      '  AND C.CATNO      like :CATNO'
      'ORDER BY E.CUST_NAME, A.ORDER_NO')
    Left = 512
    Top = 304
    ParamData = <
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
        Name = 'CATNO'
        ParamType = ptUnknown
      end>
  end
  object Comm1Prnt1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 592
    Top = 304
  end
end
