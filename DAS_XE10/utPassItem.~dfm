object frmPassItem: TfrmPassItem
  Left = 190
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DAS '#53685#44284' '#51228#49345#54408#46321#47197
  ClientHeight = 481
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
    Top = 8
    Width = 132
    Height = 15
    Caption = 'DAS '#48120#52376#47532' '#51228#49345#54408' '#45236#50669
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 324
    Height = 15
    Caption = #49345#54408' '#51473' CAT.No'#44032'     '#46608#45716'       '#49345#54408#51008' '#48376#49324#52636#44256' '#49345#54408#51077#45768#45796'.'
  end
  object Label3: TLabel
    Left = 108
    Top = 32
    Width = 14
    Height = 15
    Caption = 'PP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 152
    Top = 32
    Width = 21
    Height = 15
    Caption = 'GM'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cblItems: TCheckListBox
    Left = 8
    Top = 56
    Width = 545
    Height = 377
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 440
    Width = 75
    Height = 33
    Caption = #51312#54924
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 440
    Width = 75
    Height = 33
    Caption = #53685#44284#46321#47197
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 480
    Top = 440
    Width = 75
    Height = 33
    Caption = #45803#44592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 488
    Top = 8
    Width = 30
    Height = 41
    Caption = 'V'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 520
    Top = 8
    Width = 30
    Height = 41
    Caption = 'X'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 168
    Top = 440
    Width = 75
    Height = 33
    Caption = #45236#50669#51064#49604
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button6Click
  end
  object qryItemScan: TQuery
    DatabaseName = 'Daihan'
    SQL.Strings = (
      
        'SELECT H.ORDER_DT, H.ITEM_CODE, MAX(H.ITEM_NAME) ITEM_NAME, H.OR' +
        'DER_UNIT,'
      '  SUM(H.PICK_QTY) PICK_QTY, MAX(H.CATNO) CATNO,'
      
        '  CASE WHEN (CHARINDEX('#39' '#39',UPPER(MAX(H.KAN_CODE))))>0 THEN H.ITE' +
        'M_CODE'
      '  ELSE '
      '  UPPER(MAX(H.KAN_CODE))'
      '  END KAN_CODE'
      'FROM ('
      '  SELECT A.*, B.CUST_CODE, B1.KAN_CODE, B1.ITEM_NAME, B1.CATNO'
      '  FROM PD120 A, PM100 B, MT300 B1'
      '  WHERE A.ITEM_CODE=B1.ITEM_CODE'
      '    AND A.ORDER_DT = :ORDER_DT'
      '    AND A.ORDER_STAT = '#39'13'#39
      '    AND A.ORDER_TYPE = B.ORDER_TYPE'
      '    AND A.ORDER_NO = B.ORDER_NO'
      '    AND A.ITEM_CODE = B.ITEM_CODE'
      '    AND A.ORDER_UNIT = B.ORDER_UNIT'
      '    AND A.ITEM_CODE = B1.ITEM_CODE'
      ') H'
      'GROUP BY H.ORDER_DT, H.ITEM_CODE, H.ORDER_UNIT'
      'ORDER BY CATNO')
    Left = 16
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'ORDER_DT'
        ParamType = ptUnknown
        Value = '**'
      end>
  end
end
