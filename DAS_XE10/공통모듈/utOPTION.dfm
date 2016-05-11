object fmOPTION: TfmOPTION
  Left = 191
  Top = 113
  BorderIcons = [biSystemMenu]
  Caption = #54872#44221#49444#51221
  ClientHeight = 385
  ClientWidth = 655
  Color = clWindow
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object bvOPTION: TBevel
    Left = 8
    Top = 336
    Width = 639
    Height = 4
    Shape = bsBottomLine
  end
  object pnlADD: TPanel
    Left = 184
    Top = 11
    Width = 457
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 6
    Visible = False
    object lblMSEC: TLabel
      Left = 245
      Top = 96
      Width = 53
      Height = 15
      Caption = #52488'(1/100)'
    end
    object lblMIN: TLabel
      Left = 245
      Top = 72
      Width = 53
      Height = 15
      Caption = 'mm(v/'#48516')'
    end
    object lblBASIC: TLabel
      Left = 16
      Top = 96
      Width = 52
      Height = 15
      Caption = #44592#48376' '#49884#44036
    end
    object lblCONV: TLabel
      Left = 16
      Top = 73
      Width = 64
      Height = 15
      Caption = #52968#48288#50612' '#49549#46020
    end
    object lblDARKNEES: TLabel
      Left = 16
      Top = 136
      Width = 24
      Height = 15
      Caption = #50728#46020
    end
    object lblCOMMTIME: TLabel
      Left = 272
      Top = 176
      Width = 52
      Height = 15
      Caption = #53685#49888' '#49884#44036
    end
    object lblCOMMCNT: TLabel
      Left = 272
      Top = 200
      Width = 52
      Height = 15
      Caption = #53685#49888' '#54943#49688
    end
    object lblPCK_ZONE: TLabel
      Left = 274
      Top = 224
      Width = 40
      Height = 15
      Caption = #51316' '#44396#44036
    end
    object lblLGNUM: TLabel
      Left = 16
      Top = 264
      Width = 52
      Height = 15
      Caption = #52285#44256' '#44396#48516
    end
    object lblLINE_GB: TLabel
      Left = 16
      Top = 288
      Width = 52
      Height = 15
      Caption = #46972#51064' '#44396#48516
    end
    object lblJOB_AREA: TLabel
      Left = 274
      Top = 246
      Width = 52
      Height = 15
      Caption = #51089#50629' '#44396#44036
    end
    object gbSPEED: TGroupBox
      Left = 8
      Top = 160
      Width = 241
      Height = 89
      Caption = #49549#46020
      TabOrder = 4
      object lblBACKFEED: TLabel
        Left = 8
        Top = 64
        Width = 48
        Height = 15
        Caption = 'Backfeed'
      end
      object lblSLEW: TLabel
        Left = 8
        Top = 40
        Width = 24
        Height = 15
        Caption = #54924#51204
      end
      object lblPRINT: TLabel
        Left = 8
        Top = 16
        Width = 36
        Height = 15
        Caption = #54532#47536#53944
      end
      object cbPRTSPEED: TComboBox
        Left = 80
        Top = 12
        Width = 153
        Height = 23
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
        OnChange = edtCORPChange
        Items.Strings = (
          '50.8 mm/sec'
          '76.2 mm/sec'
          '101.6 mm/sec'
          '127 mm/sec'
          '152.4 mm/sec'
          '203.2 mm/sec '
          '220.5 mm/sec'
          '245 mm/sec'
          '269.5 mm/sec'
          '304.8 mm/sec')
      end
      object cbSLEWSPEED: TComboBox
        Left = 80
        Top = 36
        Width = 153
        Height = 23
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 1
        OnChange = edtCORPChange
        Items.Strings = (
          '50.8 mm/sec'
          '76.2 mm/sec'
          '101.6 mm/sec'
          '127 mm/sec'
          '152.4 mm/sec'
          '203.2 mm/sec '
          '220.5 mm/sec'
          '245 mm/sec'
          '269.5 mm/sec'
          '304.8 mm/sec')
      end
      object cbBFSPEED: TComboBox
        Left = 80
        Top = 60
        Width = 153
        Height = 23
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 2
        OnChange = edtCORPChange
        Items.Strings = (
          '50.8 mm/sec'
          '76.2 mm/sec'
          '101.6 mm/sec'
          '127 mm/sec'
          '152.4 mm/sec'
          '203.2 mm/sec '
          '220.5 mm/sec'
          '245 mm/sec'
          '269.5 mm/sec'
          '304.8 mm/sec')
      end
    end
    object pnlADDTEXT: TPanel
      Left = 2
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtCONV: TEdit
      Left = 88
      Top = 69
      Width = 154
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 6
      TabOrder = 1
      OnChange = edtCORPChange
    end
    object edtBASIC: TEdit
      Left = 88
      Top = 93
      Width = 154
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 3
      TabOrder = 2
      OnChange = edtCORPChange
    end
    object ckbAUTO: TCheckBox
      Left = 5
      Top = 40
      Width = 122
      Height = 17
      Caption = #48512#52265#50948#52824' '#51088#46041#44228#49328
      TabOrder = 0
      OnClick = ckbAUTOClick
    end
    object udDARKNEES: TUpDown
      Left = 224
      Top = 132
      Width = 16
      Height = 20
      Min = -30
      Max = 30
      TabOrder = 5
      OnChangingEx = udDARKNEESChangingEx
    end
    object edtDARKNEES: TEdit
      Left = 88
      Top = 132
      Width = 137
      Height = 23
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 6
      OnChange = edtCORPChange
    end
    object edtCOMMTIME: TEdit
      Left = 336
      Top = 173
      Width = 97
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 6
      TabOrder = 7
      OnChange = edtCORPChange
    end
    object edtCOMMCNT: TEdit
      Left = 336
      Top = 197
      Width = 81
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 1
      TabOrder = 8
      OnChange = edtCORPChange
    end
    object udCOMMCNT: TUpDown
      Left = 416
      Top = 196
      Width = 16
      Height = 20
      Max = 10
      TabOrder = 9
      OnChangingEx = udCOMMCNTChangingEx
    end
    object chkOldCrc: TCheckBox
      Left = 272
      Top = 272
      Width = 97
      Height = 17
      Caption = #44396'CRC '#48260#51204
      TabOrder = 10
      OnClick = edtCORPChange
    end
    object edtPCK_ZONE: TEdit
      Left = 336
      Top = 221
      Width = 97
      Height = 23
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 1
      TabOrder = 11
      OnChange = edtCORPChange
    end
    object edtLGNUM: TEdit
      Left = 88
      Top = 261
      Width = 153
      Height = 23
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 3
      TabOrder = 12
      OnChange = edtCORPChange
    end
    object edtLINE_GB: TEdit
      Left = 88
      Top = 286
      Width = 153
      Height = 23
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 1
      TabOrder = 13
      OnChange = edtCORPChange
    end
    object cboJOB_AREA: TComboBox
      Left = 336
      Top = 244
      Width = 97
      Height = 23
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      TabOrder = 14
      Text = #51068#48152
      OnChange = edtCORPChange
      Items.Strings = (
        #51068#48152
        #53804#51077
        #52845#47049
        #44160#54408)
    end
    object chkConv_All: TCheckBox
      Left = 272
      Top = 296
      Width = 112
      Height = 17
      Caption = #52968#48288#50612' '#51204#52404' '#51228#50612
      TabOrder = 15
      OnClick = edtCORPChange
    end
  end
  object pnlDisplay: TPanel
    Left = 184
    Top = 11
    Width = 457
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 9
    Visible = False
    object lblDisplayID: TLabel
      Left = 235
      Top = 68
      Width = 52
      Height = 15
      Caption = #51204#44305#54032' ID'
    end
    object lblDisplayName: TLabel
      Left = 9
      Top = 68
      Width = 52
      Height = 15
      Caption = #51204#44305#54032' '#47749
    end
    object pnlDISPLAYTEXT: TPanel
      Left = 2
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edtDisplayID: TEdit
      Left = 291
      Top = 65
      Width = 154
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 6
      TabOrder = 1
      OnChange = edtCORPChange
    end
    object chkDisplayYN: TCheckBox
      Left = 5
      Top = 40
      Width = 122
      Height = 17
      Caption = #51204#44305#54032' '#49324#50857
      TabOrder = 0
    end
    object rgrpDisplay: TRadioGroup
      Left = 5
      Top = 96
      Width = 340
      Height = 41
      Caption = #51204#44305#54032' '#54364#49884
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #51652#54665#50984
        #44144#47000#52376
        #51652#54665#50984'+'#44144#47000#52376)
      TabOrder = 3
    end
    object btnAddDisplay: TButton
      Left = 216
      Top = 280
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 5
      OnClick = btnAddDisplayClick
    end
    object btnEditDisplay: TButton
      Left = 296
      Top = 280
      Width = 75
      Height = 25
      Caption = #49688#51221
      TabOrder = 6
      OnClick = btnEditDisplayClick
    end
    object btnDelDisplay: TButton
      Left = 376
      Top = 280
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 7
      OnClick = btnDelDisplayClick
    end
    object edtDisplayName: TEdit
      Left = 65
      Top = 65
      Width = 154
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      MaxLength = 6
      TabOrder = 8
      OnChange = edtCORPChange
    end
    object stgDisplay: TStringGrid
      Left = 1
      Top = 155
      Width = 456
      Height = 121
      Color = clInfoBk
      ColCount = 2
      DefaultColWidth = 160
      DefaultRowHeight = 20
      RowCount = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
      OnClick = stgDisplayClick
      OnDrawCell = stgDisplayDrawCell
      ColWidths = (
        160
        160)
      RowHeights = (
        20
        20)
    end
  end
  object pnlCOMM: TPanel
    Left = 184
    Top = 11
    Width = 457
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 5
    Visible = False
    object lblPort: TLabel
      Left = 4
      Top = 94
      Width = 52
      Height = 15
      Caption = #54252#53944' '#48264#54840
    end
    object lblBaud: TLabel
      Left = 4
      Top = 118
      Width = 52
      Height = 15
      Caption = #54252#53944' '#49549#46020
    end
    object lblData: TLabel
      Left = 160
      Top = 70
      Width = 64
      Height = 15
      Caption = #45936#51060#53552' '#48708#53944
    end
    object lblStop: TLabel
      Left = 160
      Top = 94
      Width = 52
      Height = 15
      Caption = #49828#53681' '#48708#53944
    end
    object lblParity: TLabel
      Left = 160
      Top = 118
      Width = 64
      Height = 15
      Caption = #54168#47532#54000' '#48708#53944
    end
    object lblTitle: TLabel
      Left = 4
      Top = 70
      Width = 40
      Height = 15
      Caption = #54252#53944' '#47749
    end
    object pnlCOMMTEXT: TPanel
      Left = 2
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbPort: TComboBox
      Left = 75
      Top = 90
      Width = 78
      Height = 23
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 1
      OnChange = cbPortChange
      Items.Strings = (
        'Com1'
        'Com2'
        'Com3'
        'Com4'
        'Com5'
        'Com6'
        'Com7'
        'Com8'
        'LPT1')
    end
    object cbBaud: TComboBox
      Left = 75
      Top = 114
      Width = 78
      Height = 23
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 2
      OnChange = edtCORPChange
      Items.Strings = (
        '9600'
        '19200'
        '38400'
        '57600'
        '115200')
    end
    object cbParity: TComboBox
      Left = 227
      Top = 114
      Width = 78
      Height = 23
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 3
      OnChange = edtCORPChange
      Items.Strings = (
        'Even'
        'Mark'
        'None'
        'Odd'
        'Space')
    end
    object cbStop: TComboBox
      Left = 227
      Top = 90
      Width = 78
      Height = 23
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 4
      OnChange = edtCORPChange
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object cbData: TComboBox
      Left = 227
      Top = 66
      Width = 78
      Height = 23
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 5
      OnChange = edtCORPChange
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object chkUseYN: TCheckBox
      Left = 9
      Top = 44
      Width = 69
      Height = 17
      Caption = #49324#50857#50668#48512
      TabOrder = 6
    end
    object btnCommAdd: TButton
      Left = 216
      Top = 280
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 8
      OnClick = btnCommAddClick
    end
    object btnCommDel: TButton
      Left = 376
      Top = 280
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 9
      OnClick = btnCommDelClick
    end
    object edtTitle: TEdit
      Left = 75
      Top = 66
      Width = 78
      Height = 23
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 10
    end
    object btnCommEdit: TButton
      Left = 296
      Top = 280
      Width = 75
      Height = 25
      Caption = #49688#51221
      TabOrder = 11
      OnClick = btnCommEditClick
    end
    object stgComm: TStringGrid
      Left = 1
      Top = 155
      Width = 456
      Height = 121
      Color = clInfoBk
      ColCount = 2
      DefaultColWidth = 160
      DefaultRowHeight = 20
      RowCount = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 7
      OnClick = stgCommClick
      OnDrawCell = stgCommDrawCell
      ColWidths = (
        160
        160)
      RowHeights = (
        20
        20)
    end
  end
  object pnlDATABASE: TPanel
    Left = 184
    Top = 11
    Width = 457
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 7
    Visible = False
    object lblTYPE: TLabel
      Left = 1
      Top = 63
      Width = 83
      Height = 15
      Caption = #46300#46972#51060#48260' '#51060#47492' :'
    end
    object lblSERVER: TLabel
      Left = 1
      Top = 111
      Width = 59
      Height = 15
      Caption = #49436#48260' '#51060#47492' :'
    end
    object lblUSER: TLabel
      Left = 196
      Top = 87
      Width = 59
      Height = 15
      Caption = #49324#50857#51088' ID :'
    end
    object lblPASS: TLabel
      Left = 196
      Top = 111
      Width = 59
      Height = 15
      Caption = #50516'       '#54840' :'
    end
    object lblDBNAME: TLabel
      Left = 1
      Top = 87
      Width = 59
      Height = 15
      Caption = 'DB   '#51060#47492' :'
    end
    object lblLCPATH: TLabel
      Left = 1
      Top = 134
      Width = 59
      Height = 15
      Caption = #44221'       '#47196' :'
    end
    object pnlDEFUALTTEXT: TPanel
      Left = 2
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbTYPE: TComboBox
      Left = 90
      Top = 59
      Width = 241
      Height = 23
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
    end
    object edtSERVER: TEdit
      Left = 90
      Top = 107
      Width = 100
      Height = 23
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
    end
    object edtUSERID: TEdit
      Left = 285
      Top = 83
      Width = 100
      Height = 23
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
    end
    object edtPASSWORD: TEdit
      Left = 285
      Top = 107
      Width = 100
      Height = 23
      ImeName = 'Microsoft IME 2003'
      PasswordChar = '*'
      TabOrder = 5
    end
    object edtDBNAME: TEdit
      Left = 90
      Top = 83
      Width = 100
      Height = 23
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
    end
    object edtLCPATH: TEdit
      Left = 90
      Top = 130
      Width = 161
      Height = 23
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 6
    end
    object btnLCPATH: TButton
      Left = 257
      Top = 126
      Width = 76
      Height = 25
      Caption = #52286#50500#48372#44592'...'
      TabOrder = 7
      OnClick = btnLCPATHClick
    end
    object rbtnRDB: TRadioButton
      Left = 1
      Top = 38
      Width = 56
      Height = 17
      Caption = #49436#48260#50857
      TabOrder = 8
      OnClick = rbtnRDBClick
    end
    object rbtnLDB: TRadioButton
      Left = 66
      Top = 38
      Width = 56
      Height = 17
      Caption = #47196#52972#50857
      TabOrder = 9
      OnClick = rbtnLDBClick
    end
    object btnDbAdd: TButton
      Left = 216
      Top = 280
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 11
      OnClick = btnDbAddClick
    end
    object btnDbDel: TButton
      Left = 376
      Top = 280
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 12
      OnClick = btnDbDelClick
    end
    object btnDbEdit: TButton
      Left = 296
      Top = 280
      Width = 75
      Height = 25
      Caption = #49688#51221
      TabOrder = 13
      OnClick = btnDbEditClick
    end
    object stgDB: TStringGrid
      Left = 1
      Top = 155
      Width = 456
      Height = 121
      Color = clInfoBk
      ColCount = 2
      DefaultColWidth = 160
      DefaultRowHeight = 20
      RowCount = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 10
      OnClick = stgDBClick
      OnDrawCell = stgDBDrawCell
      ColWidths = (
        160
        160)
      RowHeights = (
        20
        20)
    end
  end
  object pnlNORMAL: TPanel
    Left = 184
    Top = 11
    Width = 457
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 4
    Visible = False
    object pcSYSTEM: TPageControl
      Left = 3
      Top = 32
      Width = 451
      Height = 283
      ActivePage = tsSYSTEM
      TabOrder = 1
      object tsSYSTEM: TTabSheet
        Caption = #49884#49828#53596' '#51221#48372
        object lblCORP: TLabel
          Left = 8
          Top = 16
          Width = 67
          Height = 15
          Caption = #54924'   '#49324'   '#47749' :'
        end
        object lblPJNAME: TLabel
          Left = 8
          Top = 40
          Width = 67
          Height = 15
          Caption = #54532#47196#51229#53944#47749' :'
        end
        object lblVERSION: TLabel
          Left = 8
          Top = 64
          Width = 67
          Height = 15
          Caption = #48260'         '#51204' :'
        end
        object lblEDTDATE: TLabel
          Left = 8
          Top = 88
          Width = 67
          Height = 15
          Caption = #49688' '#51221' '#51068' '#51088' :'
        end
        object lblLOGOIMG: TLabel
          Left = 8
          Top = 112
          Width = 67
          Height = 15
          Caption = #54924' '#49324' '#47196' '#44256' :'
        end
        object lblLBLIMG: TLabel
          Left = 8
          Top = 136
          Width = 67
          Height = 15
          Caption = #46972' '#48296' '#44536' '#47548' :'
        end
        object lblCOPYRIGHT: TLabel
          Left = 8
          Top = 184
          Width = 64
          Height = 15
          Caption = 'Copyright  :'
        end
        object lblICON: TLabel
          Left = 8
          Top = 160
          Width = 67
          Height = 15
          Caption = #50500'   '#51060'   '#53080' :'
        end
        object edtCORP: TEdit
          Left = 84
          Top = 12
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 0
          OnChange = edtCORPChange
        end
        object edtPJNAME: TEdit
          Left = 84
          Top = 36
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 1
          OnChange = edtCORPChange
        end
        object edtVERSION: TEdit
          Left = 84
          Top = 60
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 2
          OnChange = edtCORPChange
        end
        object edtEDTDATE: TEdit
          Left = 84
          Top = 84
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 3
          OnChange = edtCORPChange
        end
        object edtLOGOIMG: TEdit
          Left = 84
          Top = 108
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 4
          OnChange = edtCORPChange
        end
        object edtLBLIMG: TEdit
          Left = 84
          Top = 132
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 6
          OnChange = edtCORPChange
        end
        object edtCOPYRIGHT: TEdit
          Left = 84
          Top = 180
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 10
          OnChange = edtCORPChange
        end
        object btnFIND1: TButton
          Left = 296
          Top = 105
          Width = 75
          Height = 25
          Caption = #52286#50500#48372#44592'...'
          TabOrder = 5
          OnClick = btnFIND1Click
        end
        object btnFIND2: TButton
          Left = 296
          Top = 130
          Width = 75
          Height = 25
          Caption = #52286#50500#48372#44592'...'
          TabOrder = 7
          OnClick = btnFIND2Click
        end
        object btnFIND3: TButton
          Left = 296
          Top = 154
          Width = 75
          Height = 25
          Caption = #52286#50500#48372#44592'...'
          TabOrder = 9
          OnClick = btnFIND3Click
        end
        object edtICON: TEdit
          Left = 84
          Top = 156
          Width = 209
          Height = 23
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          TabOrder = 8
          OnChange = edtCORPChange
        end
      end
    end
    object pnlNORTEXT: TPanel
      Left = 3
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlJOB: TPanel
    Left = 184
    Top = 11
    Width = 465
    Height = 318
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 8
    Visible = False
    object pnlJOBTEXT: TPanel
      Left = 2
      Top = 4
      Width = 111
      Height = 25
      BevelInner = bvLowered
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnADD: TButton
      Left = 224
      Top = 280
      Width = 75
      Height = 25
      Caption = #52628#44032'...'
      TabOrder = 2
      OnClick = btnADDClick
    end
    object btnEDIT: TButton
      Left = 304
      Top = 280
      Width = 75
      Height = 25
      Caption = #49688#51221'...'
      TabOrder = 3
      OnClick = btnEDITClick
    end
    object btnDELETE: TButton
      Left = 384
      Top = 280
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 4
      OnClick = btnDELETEClick
    end
    object edtDatPath: TEdit
      Left = 128
      Top = 6
      Width = 305
      Height = 23
      Enabled = False
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 5
      OnChange = edtCORPChange
    end
    object btnDatPath: TButton
      Left = 440
      Top = 3
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 6
      OnClick = btnDatPathClick
    end
    object stgData: TStringGrid
      Left = 0
      Top = 41
      Width = 461
      Height = 233
      ParentCustomHint = False
      Color = clInfoBk
      ColCount = 2
      DefaultColWidth = 160
      DefaultRowHeight = 20
      RowCount = 2
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      OnDrawCell = stgDataDrawCell
      ColWidths = (
        160
        160)
      RowHeights = (
        20
        20)
    end
  end
  object tvOPTION: TTreeView
    Left = 8
    Top = 11
    Width = 161
    Height = 318
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnChange = tvOPTIONChange
    Items.NodeData = {
      0303000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000000000001047CC718BC24C115C8260000000000000001000000FFFFFFFFFF
      FFFFFF0000000000000000000000000104B5D1E0C224C115C826000000000000
      0002000000FFFFFFFFFFFFFFFF000000000000000003000000010480BD00AC24
      C115C8280000000000000003000000FFFFFFFFFFFFFFFF000000000000000000
      000000010544004200200015C8F4BC280000000000000004000000FFFFFFFFFF
      FFFFFF000000000000000000000000010578C7C4C12000A9BA5DB82A00000000
      00000005000000FFFFFFFFFFFFFFFF000000000000000000000000010604C811
      AD10D3200015C8F4BC}
  end
  object btnOK: TButton
    Left = 360
    Top = 352
    Width = 89
    Height = 25
    Caption = #54869#51064'(&O)'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCANCLE: TButton
    Left = 456
    Top = 352
    Width = 89
    Height = 25
    Caption = #52712#49548'(&C)'
    TabOrder = 2
    OnClick = btnCANCLEClick
  end
  object btnAPPLY: TButton
    Left = 552
    Top = 352
    Width = 89
    Height = 25
    Caption = #51201#50857'(&A)'
    Enabled = False
    TabOrder = 3
    OnClick = btnAPPLYClick
  end
  object odIMG: TOpenDialog
    Filter = 
      #48708#53944#47605' '#54028#51068'(*.bmp)|*.BMP|JPEG(*.JPG;*,JPEG;*.JPE;*.JFIF)|*.JPG;*,JPEG' +
      ';*.JPE;*.JFIF|GIF(*.GIF)|*.GIF|TIFF(*.TIF;*.TIFF)|*.TIF;*.TIFF|P' +
      'NG(*.PNG)|*.PNG|ICO(*.ICO)|*.ICO|'#47784#46304' '#44536#47548' '#54028#51068'|*.BMP;*.JPG;*,JPEG;*.J' +
      'PE;*.JFIF;*.GIF;*.TIF;*.TIFF;*.PNG;*.ICO|'#47784#46304' '#54028#51068'|*.*'
    FilterIndex = 7
    InitialDir = 'C:\'
    Left = 392
    Top = 16
  end
  object odDAT: TOpenDialog
    Filter = #51064#49604#54028#51068'|*.DAT|'#47784#46304#54028#51068'|*.*'
    Left = 360
    Top = 16
  end
end
