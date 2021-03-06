object frmRePrint: TfrmRePrint
  Left = 190
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DAS '#51077#49688#45236#50669' '#51116#48156#54665
  ClientHeight = 444
  ClientWidth = 562
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
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 116
    Height = 15
    Caption = 'DAS '#51077#49688#45236#50669' '#51116#48156#54665
  end
  object CheckListBox1: TCheckListBox
    Left = 200
    Top = 48
    Width = 353
    Height = 337
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 400
    Width = 75
    Height = 33
    Caption = #51064#49604
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 480
    Top = 400
    Width = 75
    Height = 33
    Caption = #45803#44592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 136
    Top = 8
    Width = 417
    Height = 29
    CalAlignment = dtaLeft
    Date = 40508.6611977315
    Time = 40508.6611977315
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ImeName = 'Korean Input System (IME 2000)'
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object ListBox1: TListBox
    Left = 8
    Top = 48
    Width = 185
    Height = 337
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ImeName = 'Korean Input System (IME 2000)'
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object qrTemp: TQuery
    DatabaseName = 'Daihan'
    Left = 16
    Top = 56
  end
  object qrSchedule: TQuery
    DatabaseName = 'Daihan'
    SQL.Strings = (
      'SELECT * FROM'
      '('
      #9'SELECT A.CUST_CODE, MAX(B.CUST_NAME) CUST_NAME,'
      #9'  MAX(A.CELL) CELL, MAX(A.CELL_RESTORE) CELL_RESTORE,'
      #9'  COUNT(*) TCNT,'
      
        '          SUM(CASE WHEN C.ORDER_STAT >= '#39'15'#39' THEN 1 ELSE 0 END) ' +
        'SCNT,'
      '          MAX(A.U_ID) U_ID'
      #9'FROM PD120 C, PM100 D, PD126 A, MT200 B'
      #9'WHERE C.ORDER_NO = D.ORDER_NO'
      #9'  AND C.ITEM_CODE = D.ITEM_CODE'
      #9'  AND C.ORDER_UNIT = D.ORDER_UNIT'
      #9'  AND C.ORDER_TYPE = D.ORDER_TYPE'
      #9'  AND C.ORDER_DT = A.ORDER_DT'
      #9'  AND D.CUST_CODE = A.CUST_CODE'
      #9'  AND A.CUST_CODE = B.CUST_CODE'
      #9'  AND A.ORDER_DT = :ORDER_DT'
      '          AND D.CUST_CODE = :CUST_CODE'
      #9'GROUP BY A.CUST_CODE'
      ') E'
      'ORDER BY E.TCNT DESC, E.CELL_RESTORE'
      '')
    Left = 48
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDER_DT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUST_CODE'
        ParamType = ptUnknown
        Value = '%%'
      end>
  end
end
