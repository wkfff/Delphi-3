object FPM700ActualStock: TFPM700ActualStock
  Left = 322
  Top = 172
  Caption = #51116#44256#49892#49324' '#51088#47308' '#49373#49457
  ClientHeight = 460
  ClientWidth = 844
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
    Left = 209
    Top = 135
    Width = 433
    Height = 193
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 58
      Top = 30
      Width = 56
      Height = 13
      Caption = #49892#49324#51068#49884
    end
    object Label2: TLabel
      Left = 30
      Top = 65
      Width = 84
      Height = 13
      Caption = #47196#52992#51060#49496#53076#46300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 219
      Top = 65
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
    object Label3: TLabel
      Left = 72
      Top = 100
      Width = 42
      Height = 13
      Caption = #51652#54665#50984
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Msk_In_Dt: TDateTimePicker
      Left = 122
      Top = 26
      Width = 90
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
      TabOrder = 0
      TabStop = False
    end
    object Mak_Location_From: TMaskEdit
      Left = 122
      Top = 61
      Width = 90
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
      TabOrder = 1
      Text = 'A-00-00-0'
    end
    object Mak_Location_To: TMaskEdit
      Left = 234
      Top = 61
      Width = 90
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
      TabOrder = 2
      Text = 'Z-99-99-9'
    end
    object Button2: TButton
      Left = 85
      Top = 140
      Width = 75
      Height = 25
      Caption = #51064#49604' F2'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 273
      Top = 140
      Width = 75
      Height = 25
      Caption = #45803#44592' &X'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button4Click
    end
    object cbAll: TCheckBox
      Left = 336
      Top = 63
      Width = 57
      Height = 17
      Caption = #51204#52404
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object Pgbar: TProgressBar
      Left = 125
      Top = 102
      Width = 263
      Height = 9
      TabOrder = 6
      Visible = False
    end
  end
  object qryOpen: TQuery
    DatabaseName = 'DAIHAN'
    SQL.Strings = (
      'SELECT * FROM MT100'
      'where RETIRE_DATE = '#39'99991231'#39
      'ORDER BY USERID')
    Left = 32
    Top = 256
  end
end