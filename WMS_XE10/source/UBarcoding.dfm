object FBarcoding: TFBarcoding
  Left = 241
  Top = 118
  Width = 462
  Height = 156
  BorderIcons = []
  Caption = 'FBarcoding'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 122
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 27
      Top = 42
      Width = 111
      Height = 13
      Caption = #48148#53076#46300' '#46972#48296' '#48156#54665#51473'...'
    end
    object Gauge1: TGauge
      Left = 27
      Top = 56
      Width = 401
      Height = 23
      Progress = 0
    end
  end
end
