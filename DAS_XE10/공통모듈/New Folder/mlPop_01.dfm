object frmPop_01: TfrmPop_01
  Left = 192
  Top = 107
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #44160#49353#54868#47732
  ClientHeight = 546
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 367
    Height = 86
    Align = alTop
    Caption = '[ '#51312#54924#51312#44148' ]'
    TabOrder = 0
    object Shape11: TShape
      Left = 15
      Top = 25
      Width = 67
      Height = 21
      Brush.Color = 13162455
      Pen.Color = 8623776
      Shape = stRoundRect
    end
    object Label9: TLabel
      Left = 20
      Top = 30
      Width = 60
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #53076'  '#46300
      Color = 13162455
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object shpNm_W: TShape
      Left = 15
      Top = 49
      Width = 67
      Height = 21
      Brush.Color = 13162455
      Pen.Color = 8623776
      Shape = stRoundRect
    end
    object lblNm_W: TLabel
      Left = 20
      Top = 54
      Width = 60
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #47749
      Color = 13162455
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edtCode: TEdit
      Left = 91
      Top = 24
      Width = 121
      Height = 20
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      TabOrder = 0
      Text = 'edtCode'
      OnChange = edtCodeChange
      OnKeyDown = edtCodeKeyDown
      OnKeyPress = edtCodeKeyPress
    end
    object edtName: TEdit
      Left = 90
      Top = 50
      Width = 121
      Height = 20
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      TabOrder = 1
      Text = 'edtName'
      OnChange = edtCodeChange
      OnKeyDown = edtCodeKeyDown
      OnKeyPress = edtCodeKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 86
    Width = 367
    Height = 460
    Align = alClient
    TabOrder = 1
    object sg01: TStringGrid
      Left = 2
      Top = 47
      Width = 363
      Height = 375
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 20
      RowCount = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnDblClick = sg01DblClick
      OnDrawCell = sg01DrawCell
      OnKeyPress = sg01KeyPress
      ColWidths = (
        38
        64
        64)
    end
    object Panel1: TPanel
      Left = 2
      Top = 14
      Width = 363
      Height = 33
      Align = alTop
      TabOrder = 1
      object Label27: TLabel
        Left = 5
        Top = 9
        Width = 65
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = #51312#54924#44208#44284
        Color = 13882323
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape42: TShape
        Left = 72
        Top = 5
        Width = 112
        Height = 21
        Brush.Color = 13882323
        Pen.Color = 8623776
        Shape = stRoundRect
      end
      object Label2: TLabel
        Left = 160
        Top = 9
        Width = 19
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #44148
        Color = 13882323
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object lblCnt: TLabel
        Left = 86
        Top = 9
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 13882323
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 422
      Width = 363
      Height = 36
      Align = alBottom
      TabOrder = 2
      object Panel3: TPanel
        Left = 257
        Top = 1
        Width = 105
        Height = 34
        Align = alRight
        Caption = 'Panel3'
        TabOrder = 0
        object btnClose: TButton
          Left = 16
          Top = 4
          Width = 75
          Height = 25
          Caption = #52712#49548
          TabOrder = 0
          OnClick = btnCloseClick
        end
      end
      object Panel4: TPanel
        Left = 157
        Top = 1
        Width = 100
        Height = 34
        Align = alRight
        Caption = 'Panel4'
        TabOrder = 1
        object btnConfirm: TButton
          Left = 13
          Top = 4
          Width = 75
          Height = 25
          Caption = #54869#51064
          TabOrder = 0
          OnClick = btnConfirmClick
        end
      end
    end
  end
end
