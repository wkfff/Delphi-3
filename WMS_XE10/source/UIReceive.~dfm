object FIReceive: TFIReceive
  Left = 508
  Top = 197
  Width = 681
  Height = 616
  Caption = #45936#51060#53552#49688#49888
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 520
    Top = 8
    Width = 146
    Height = 568
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 224
      Width = 7
      Height = 13
    end
    object Label2: TLabel
      Left = 80
      Top = 504
      Width = 55
      Height = 16
      Caption = 'ver 1.20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 27
      Top = 228
      Width = 91
      Height = 13
      Caption = #51200#51109' '#44148#49688' : 0'
    end
    object Label4: TLabel
      Left = 27
      Top = 252
      Width = 91
      Height = 13
      Caption = #49892#54056' '#44148#49688' : 0'
    end
    object ComboBox1: TComboBox
      Left = 59
      Top = 10
      Width = 79
      Height = 21
      ImeName = #54620#44397#50612'('#54620#44544')'
      ItemHeight = 13
      TabOrder = 0
      Text = 'Com1'
      Items.Strings = (
        'Com1'
        'Com2'
        'Com3'
        'Com4'
        'Com5'
        'Com6'
        'Com7'
        'Com8'
        'Com9')
    end
    object Panel3: TPanel
      Left = 12
      Top = 268
      Width = 123
      Height = 124
      BevelInner = bvLowered
      Color = 14457716
      TabOrder = 1
      Visible = False
      object Button4: TButton
        Left = 8
        Top = 8
        Width = 108
        Height = 25
        Caption = 'Speed : 9600'
        TabOrder = 3
        TabStop = False
      end
      object Button5: TButton
        Left = 8
        Top = 36
        Width = 108
        Height = 25
        Caption = 'Data : 8'
        TabOrder = 2
        TabStop = False
      end
      object Button6: TButton
        Left = 8
        Top = 64
        Width = 108
        Height = 25
        Caption = 'Stop : 1'
        TabOrder = 1
        TabStop = False
      end
      object Button7: TButton
        Left = 8
        Top = 92
        Width = 108
        Height = 25
        Caption = 'Parity : None'
        TabOrder = 0
        TabStop = False
      end
    end
    object Button14: TButton
      Left = 31
      Top = 526
      Width = 85
      Height = 36
      Caption = #45803#44592' &X'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button14Click
    end
    object Panel1: TPanel
      Left = 6
      Top = 10
      Width = 51
      Height = 21
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #54252#53944
      TabOrder = 3
    end
    object Button3: TButton
      Left = 31
      Top = 44
      Width = 85
      Height = 36
      Caption = #49884#51089' F1'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button10: TButton
      Left = 31
      Top = 84
      Width = 85
      Height = 36
      Caption = #51473#51648' F2'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 31
      Top = 172
      Width = 85
      Height = 36
      Caption = #51200#51109' F3'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button11Click
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 8
    Width = 504
    Height = 568
    Caption = 'Panel4'
    TabOrder = 1
    object ListBox4: TListBox
      Left = 24
      Top = 440
      Width = 457
      Height = 97
      ImeName = #54620#44397#50612'('#54620#44544')'
      ItemHeight = 13
      TabOrder = 0
      Visible = False
    end
    object Button1: TPanel
      Left = 4
      Top = 4
      Width = 496
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #49688#49888' '#45936#51060#53552
      TabOrder = 1
    end
    object ListBox3: TListBox
      Left = 3
      Top = 34
      Width = 496
      Height = 527
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      ImeName = #54620#44397#50612'('#54620#44544')'
      ItemHeight = 12
      ParentFont = False
      TabOrder = 2
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 200
    Top = 72
  end
  object comm1: TComPort
    BaudRate = br19200
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    DiscardNull = True
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrEnable
    FlowControl.ControlRTS = rtsEnable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Timeouts.ReadTotalConstant = 1000
    OnRxChar = comm1RxChar
    OnTxEmpty = comm1TxEmpty
    Left = 140
    Top = 72
  end
end
