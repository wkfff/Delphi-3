object FUser: TFUser
  Left = 18
  Top = 154
  Caption = #49324#50857#51088'ID '#44288#47532
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
    ColCount = 17
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
      #49324#50857#51088#50500#51060#46356
      #49324#50857#51088
      #50516#54840
      #48512#49436
      #51649#44400
      #44592#48376#50948#52824
      #51060#47700#51068
      #54648#46300#54256
      #51204#54868#48264#54840
      #54869#51064#51068#51088
      #44428#54620
      #53748#49324#51068#51088
      #51089#50629#50948#52824'1_FROM'
      #51089#50629#50948#52824'1_TO'
      #51089#50629#50948#52824'2_FROM'
      #51089#50629#50948#52824'2_TO'
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
    ExplicitHeight = 475
    DesignSize = (
      975
      452)
    ColWidths = (
      33
      90
      51
      38
      38
      38
      64
      51
      51
      64
      64
      38
      64
      106
      92
      106
      92)
    RowHeights = (
      22
      22)
    object pnCode: TPanel
      Left = 259
      Top = 92
      Width = 482
      Height = 309
      Anchors = []
      BorderStyle = bsSingle
      Caption = ' '
      TabOrder = 2
      Visible = False
      OnMouseDown = pnCodeMouseDown
      object Label69: TLabel
        Left = 238
        Top = 100
        Width = 56
        Height = 13
        Caption = #51649#47924#44428#54620
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label75: TLabel
        Left = 17
        Top = 100
        Width = 42
        Height = 13
        Caption = #49457'  '#47749
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label76: TLabel
        Left = 17
        Top = 64
        Width = 42
        Height = 13
        Caption = #49324#50857'ID'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 238
        Top = 136
        Width = 56
        Height = 13
        Caption = #53748#49324#51068#51088
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 136
        Width = 42
        Height = 13
        Caption = #50516'  '#54840
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 17
        Top = 172
        Width = 56
        Height = 13
        Caption = #48176#49569#44428#50669
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 238
        Top = 172
        Width = 56
        Height = 13
        Caption = #44592#48376#50948#52824
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 14
        Top = 204
        Width = 56
        Height = 13
        Caption = #51089#50629#50948#52824
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object pnCodeTitle: TPanel
        Left = 1
        Top = 1
        Width = 478
        Height = 32
        Align = alTop
        Caption = #49324#50857#51088' '#44288#47532
        Color = clInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnMouseMove = pnCodeTitleMouseMove
      end
      object Button13: TButton
        Left = 148
        Top = 257
        Width = 85
        Height = 35
        Caption = #54869#51064
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 244
        Top = 257
        Width = 85
        Height = 35
        Caption = #45803#44592
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = Button14Click
      end
      object edCodeName: TEdit
        Left = 76
        Top = 96
        Width = 154
        Height = 19
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft IME 2003'
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        OnKeyPress = edCodeKeyPress
      end
      object edCode: TEdit
        Left = 76
        Top = 60
        Width = 154
        Height = 19
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSAlpha
        ImeName = 'Microsoft IME 2003'
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edCodeKeyPress
      end
      object cbAUTH_LEVEL: TComboBox
        Left = 308
        Top = 96
        Width = 154
        Height = 21
        Style = csDropDownList
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ParentFont = False
        TabOrder = 9
        OnKeyPress = edCodeKeyPress
        Items.Strings = (
          '[0001]'#44288#47532#51088
          '[1000]'#51068#48152)
      end
      object meClose: TMaskEdit
        Left = 308
        Top = 132
        Width = 154
        Height = 19
        EditMask = '!9999/99/00;0;_'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        Text = ''
        OnKeyPress = edCodeKeyPress
      end
      object edPass: TEdit
        Left = 76
        Top = 132
        Width = 154
        Height = 19
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        MaxLength = 5
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
        OnKeyPress = edCodeKeyPress
      end
      object cbJOB_TITLE: TComboBox
        Left = 76
        Top = 168
        Width = 154
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        TabOrder = 11
        Text = '1000'
        Items.Strings = (
          '1000'
          '2000'
          '3000'
          '4000'
          '5000'
          '6000'
          '7000'
          '8000'
          '9000'
          '1001'
          '2001'
          '3001'
          '4001'
          '5001'
          '6001'
          '7001'
          '8001'
          '9001')
      end
      object edtLOC_CODE: TMaskEdit
        Left = 308
        Top = 168
        Width = 109
        Height = 19
        Color = clWhite
        EditMask = 'L-99-99-9;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 9
        ParentFont = False
        TabOrder = 4
        Text = ' -  -  - '
        OnKeyPress = edCodeKeyPress
      end
      object edtLOC_FROM: TMaskEdit
        Left = 76
        Top = 200
        Width = 107
        Height = 19
        Color = clWhite
        EditMask = 'L-99-99-9;1;_'
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
        OnKeyPress = edCodeKeyPress
      end
      object edtLOC_TO: TMaskEdit
        Left = 204
        Top = 200
        Width = 109
        Height = 19
        Color = clWhite
        EditMask = 'L-99-99-9;1;_'
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
        OnKeyPress = edCodeKeyPress
      end
      object edtLOC_FROM2: TMaskEdit
        Left = 76
        Top = 224
        Width = 108
        Height = 19
        Color = clWhite
        EditMask = 'L-99-99-9;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 9
        ParentFont = False
        TabOrder = 12
        Text = ' -  -  - '
        OnKeyPress = edCodeKeyPress
      end
      object edtLOC_TO2: TMaskEdit
        Left = 204
        Top = 224
        Width = 109
        Height = 19
        Color = clWhite
        EditMask = 'L-99-99-9;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 9
        ParentFont = False
        TabOrder = 13
        Text = ' -  -  - '
        OnKeyPress = edCodeKeyPress
      end
    end
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
      Caption = #52628#44032' F1'
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
      Caption = #49688#51221' F2'
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
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT USERID, NAME,      PASSWD,     WORK_DEPT,    JOB_TITLE, '
      '       CASE WHEN LEN(LOC_CODE) = 0 THEN '#39#39
      '            WHEN RTRIM(LOC_CODE) = '#39#39' THEN '#39#39' '
      '            WHEN LOC_CODE IS NULL THEN '#39#39
      
        '            ELSE substring(LOC_CODE,1,1)+'#39'-'#39'+substring(LOC_CODE,' +
        '2,2)+'#39'-'#39'+substring(LOC_CODE,4,2)+'#39'-'#39'+substring(LOC_CODE,6,1)'
      '       END AS LOC_CODE,'
      '       EMAIL,  CELLPHONE, WORK_PHONE, CONFIRM_DATE, b.CODE_SNM,'
      '       RETIRE_DATE,'
      '       CASE WHEN LEN(LOC_FROM) = 0 THEN '#39#39
      '            WHEN RTRIM(LOC_FROM) = '#39#39' THEN '#39#39' '
      '            WHEN LOC_FROM IS NULL THEN '#39#39
      
        '            ELSE substring(LOC_FROM,1,1)+'#39'-'#39'+substring(LOC_FROM,' +
        '2,2)+'#39'-'#39'+substring(LOC_FROM,4,2)+'#39'-'#39'+substring(LOC_FROM,6,1)'
      '       END AS LOC_FROM,'
      '       CASE WHEN LEN(LOC_TO) = 0 THEN '#39#39
      '            WHEN RTRIM(LOC_TO) = '#39#39' THEN '#39#39' '
      '            WHEN LOC_TO IS NULL THEN '#39#39
      
        '            ELSE substring(LOC_TO,1,1)+'#39'-'#39'+substring(LOC_TO,2,2)' +
        '+'#39'-'#39'+substring(LOC_TO,4,2)+'#39'-'#39'+substring(LOC_TO,6,1)'
      '       END AS LOC_TO,'
      '       CASE WHEN LEN(LOC_FROM2) = 0 THEN '#39#39
      '            WHEN RTRIM(LOC_FROM2) = '#39#39' THEN '#39#39
      '            WHEN LOC_FROM2 IS NULL THEN '#39#39
      
        '            ELSE substring(LOC_FROM2,1,1)+'#39'-'#39'+substring(LOC_FROM' +
        '2,2,2)+'#39'-'#39'+substring(LOC_FROM2,4,2)+'#39'-'#39'+substring(LOC_FROM2,6,1)'
      '       END AS LOC_FROM2,'
      '       CASE WHEN LEN(LOC_TO2) = 0 THEN '#39#39
      '            WHEN RTRIM(LOC_TO2) = '#39#39' THEN '#39#39
      '            WHEN LOC_TO2 IS NULL THEN '#39#39
      
        '            ELSE substring(LOC_TO2,1,1)+'#39'-'#39'+substring(LOC_TO2,2,' +
        '2)+'#39'-'#39'+substring(LOC_TO2,4,2)+'#39'-'#39'+substring(LOC_TO2,6,1)'
      '       END AS LOC_TO2'
      '  FROM MT100 a'
      '  JOIN MT900 b'
      '    ON AUTH_LEVEL = b.CODE_CD'
      '   AND b.CODE_TP  = '#39'1000'#39
      '   AND b.CODE_CD  <> '#39#39
      ' WHERE RETIRE_DATE = '#39'99991231'#39
      ' ORDER BY NAME')
    Left = 88
    Top = 176
  end
end
