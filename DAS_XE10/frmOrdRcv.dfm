object FPITest: TFPITest
  Left = 483
  Top = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PI '#53580#49828#53944
  ClientHeight = 466
  ClientWidth = 862
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Button2: TButton
    Left = 9
    Top = 8
    Width = 75
    Height = 33
    Caption = #49548#46321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 95
    Top = 8
    Width = 75
    Height = 33
    Caption = #51201#49353#51216#46321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 175
    Top = 8
    Width = 75
    Height = 33
    Caption = #45433#49353#51216#46321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 255
    Top = 8
    Width = 75
    Height = 33
    Caption = #51201#45433#49353#51216#46321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 343
    Top = 8
    Width = 75
    Height = 33
    Caption = #51201#49353#51216#47736
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 423
    Top = 8
    Width = 75
    Height = 33
    Caption = #45433#49353#51216#47736
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 503
    Top = 8
    Width = 75
    Height = 33
    Caption = #51201#45433#49353#51216#47736
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button8Click
  end
  object memRcv: TMemo
    Left = 96
    Top = 48
    Width = 750
    Height = 416
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 7
  end
  object Button9: TButton
    Left = 9
    Top = 424
    Width = 75
    Height = 33
    Caption = #45803#44592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button1: TButton
    Left = 9
    Top = 48
    Width = 75
    Height = 33
    Caption = #44221#44305#46321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Button1Click
  end
  object timBCU: TTimer
    Interval = 1
    OnTimer = timBCUTimer
    Left = 24
    Top = 352
  end
end
