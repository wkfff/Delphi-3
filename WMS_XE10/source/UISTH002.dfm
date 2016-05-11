object FISTH002: TFISTH002
  Left = 276
  Top = 230
  Width = 1000
  Height = 480
  Caption = #44144#47000#52376' '#53076#46300' '#44288#47532
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    992
    446)
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 5
    Top = 8
    Width = 982
    Height = 390
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORGAN_CODE'
        Title.Alignment = taCenter
        Title.Caption = #44144#47000#52376#53076#46300
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORGAN_NAME'
        Title.Alignment = taCenter
        Title.Caption = #44144#47000#52376#47749
        Width = 402
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARKS'
        Title.Alignment = taCenter
        Title.Caption = #48708#44256
        Width = 426
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSE_DATE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'I_DATE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'I_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'U_DATE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'U_ID'
        Visible = False
      end>
  end
  object Button4: TButton
    Left = 901
    Top = 405
    Width = 85
    Height = 35
    Anchors = [akRight, akBottom]
    Caption = #45803#44592' &X'
    TabOrder = 1
    OnClick = Button4Click
  end
  object pnCode: TPanel
    Left = 255
    Top = 95
    Width = 482
    Height = 274
    Anchors = []
    BorderStyle = bsSingle
    Caption = ' '
    TabOrder = 2
    Visible = False
    OnMouseDown = pnCodeMouseDown
    object Label75: TLabel
      Left = 52
      Top = 100
      Width = 64
      Height = 16
      Caption = #44144#47532#52376#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label76: TLabel
      Left = 36
      Top = 64
      Width = 80
      Height = 16
      Caption = #44144#47000#52376#53076#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 84
      Top = 136
      Width = 32
      Height = 16
      Caption = #48708#44256
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 52
      Top = 168
      Width = 64
      Height = 16
      Caption = #54224#44592#51068#51088
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object pnCodeTitle: TPanel
      Left = 1
      Top = 1
      Width = 476
      Height = 32
      Align = alTop
      Caption = #44144#47000#52376' '#53076#46300' '#44288#47532
      Color = clInactiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnMouseMove = pnCodeTitleMouseMove
    end
    object Button13: TButton
      Left = 148
      Top = 215
      Width = 85
      Height = 35
      Caption = #54869#51064
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 244
      Top = 215
      Width = 85
      Height = 35
      Caption = #52712#49548
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button14Click
    end
    object edCodeName: TEdit
      Left = 127
      Top = 96
      Width = 154
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2003'
      MaxLength = 20
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edCodeKeyDown
    end
    object edCode: TEdit
      Left = 127
      Top = 60
      Width = 154
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSAlpha
      ImeName = 'Microsoft IME 2003'
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edCodeKeyDown
    end
    object edPass: TEdit
      Left = 127
      Top = 132
      Width = 314
      Height = 24
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2003'
      MaxLength = 25
      ParentFont = False
      TabOrder = 2
      OnKeyDown = edCodeKeyDown
    end
    object meClose: TMaskEdit
      Left = 127
      Top = 164
      Width = 154
      Height = 24
      EditMask = '!9999/99/00;0;_'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft IME 2003'
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      OnKeyDown = edCodeKeyDown
    end
  end
  object Button1: TButton
    Left = 8
    Top = 405
    Width = 85
    Height = 35
    Caption = #52628#44032' F1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 405
    Width = 85
    Height = 35
    Caption = #49688#51221' F2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = qryMain
    Left = 152
    Top = 176
  end
  object qryMain: TQuery
    DatabaseName = 'JIT'
    SQL.Strings = (
      'select *'
      'from sth002'
      'where CLOSE_DATE = '#39'99991231'#39)
    Left = 88
    Top = 176
    object qryMainORGAN_CODE: TStringField
      FieldName = 'ORGAN_CODE'
      Origin = 'JIT.sth002.ORGAN_CODE'
      FixedChar = True
      Size = 4
    end
    object qryMainORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      Origin = 'JIT.sth002.ORGAN_NAME'
      FixedChar = True
    end
    object qryMainREMARKS: TStringField
      FieldName = 'REMARKS'
      Origin = 'JIT.sth002.REMARKS'
      FixedChar = True
      Size = 100
    end
    object qryMainCLOSE_DATE: TStringField
      FieldName = 'CLOSE_DATE'
      Origin = 'JIT.sth002.CLOSE_DATE'
      FixedChar = True
    end
    object qryMainI_DATE: TStringField
      FieldName = 'I_DATE'
      Origin = 'JIT.sth002.I_DATE'
      FixedChar = True
    end
    object qryMainI_ID: TStringField
      FieldName = 'I_ID'
      Origin = 'JIT.sth002.I_ID'
      FixedChar = True
    end
    object qryMainU_DATE: TStringField
      FieldName = 'U_DATE'
      Origin = 'JIT.sth002.U_DATE'
      FixedChar = True
    end
    object qryMainU_ID: TStringField
      FieldName = 'U_ID'
      Origin = 'JIT.sth002.U_ID'
      FixedChar = True
    end
  end
end
