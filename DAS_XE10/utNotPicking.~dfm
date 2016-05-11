object frmNotPicking: TfrmNotPicking
  Left = 190
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DAS '#48120#54588#53433' '#45236#50669#51312#54924
  ClientHeight = 545
  ClientWidth = 680
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
    Width = 116
    Height = 15
    Caption = 'DAS '#48120#54588#53433' '#45236#50669#51312#54924
  end
  object Button1: TButton
    Left = 8
    Top = 504
    Width = 75
    Height = 33
    Caption = #51312#54924
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 600
    Top = 504
    Width = 75
    Height = 33
    Caption = #45803#44592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 665
    Height = 457
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ImeName = 'Korean Input System (IME 2000)'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDER_UNIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PICK_QTY'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDER_NO'
        Visible = True
      end>
  end
  object qryItemScan: TQuery
    DatabaseName = 'Daihan'
    SQL.Strings = (
      
        'SELECT H.ORDER_NO, H.ITEM_CODE, H.ORDER_UNIT, MAX(H.ITEM_NAME) I' +
        'TEM_NAME, '
      
        '  MAX(H.CATNO) CATNO, MAX(H.PICK_QTY) PICK_QTY, MAX(H.LOC_CODE) ' +
        'LOC_CODE, '
      '  MIN(H.USERID) USERID, MIN(H.NAME) NAME'
      'FROM '
      '('
      
        #9'SELECT A.ORDER_NO, A.ITEM_CODE, B.ITEM_NAME, B.CATNO, A.ORDER_U' +
        'NIT, A.PICK_QTY, '
      #9'  C.LOC_CODE, D.USERID, D.NAME'
      #9'FROM PD120 A, MT300 B, PD124 C, MT100 D'
      #9'WHERE A.ITEM_CODE = B.ITEM_CODE'
      #9'  AND A.ORDER_DT = C.ORDER_DT'
      #9'  AND A.ITEM_CODE = C.ITEM_CODE'
      #9'  AND A.ORDER_UNIT = C.ORDER_UNIT'
      #9'  AND ('
      #9#9#9#9' ( C.LOC_CODE BETWEEN D.LOC_FROM AND D.LOC_TO'
      
        #9#9#9'   AND NOT (   CHARINDEX(SUBSTRING(ISNULL(D.LOC_FROM, '#39#39'),1,1' +
        '), '#39'A'#39') > 0'
      #9#9#9#9#9#9'OR CHARINDEX(SUBSTRING(ISNULL(D.LOC_TO, '#39#39'),1,1), '#39'A'#39') > 0'
      #9#9#9#9#9'   )'
      #9#9#9'  )'
      #9#9#9'   OR'
      #9#9#9#9'  ( C.LOC_CODE BETWEEN D.LOC_FROM2 AND D.LOC_TO2'
      
        #9#9#9'   AND NOT (   CHARINDEX(SUBSTRING(ISNULL(D.LOC_FROM2, '#39#39'),1,' +
        '1), '#39'A'#39') > 0'
      
        #9#9#9#9#9#9'OR CHARINDEX(SUBSTRING(ISNULL(D.LOC_TO2, '#39#39'),1,1), '#39'A'#39') > ' +
        '0'
      #9#9#9#9#9'   )'
      #9#9#9'  )'
      #9#9'  )'
      #9'  AND A.ORDER_DT = :ORDER_DT'
      #9'  AND A.ORDER_STAT = '#39'11'#39
      ') H'
      'GROUP BY H.ORDER_NO, H.ITEM_CODE, H.ORDER_UNIT'
      ''
      '')
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'ORDER_DT'
        ParamType = ptUnknown
        Value = '**'
      end>
    object qryItemScanORDER_NO: TStringField
      DisplayLabel = #44144#47000#47749#49464
      FieldName = 'ORDER_NO'
      FixedChar = True
    end
    object qryItemScanITEM_CODE: TStringField
      DisplayLabel = #51228#49345#54408#53076#46300
      FieldName = 'ITEM_CODE'
      FixedChar = True
    end
    object qryItemScanITEM_NAME: TStringField
      DisplayLabel = #51228#49345#54408#47749
      FieldName = 'ITEM_NAME'
      FixedChar = True
      Size = 100
    end
    object qryItemScanCATNO: TStringField
      FieldName = 'CATNO'
      FixedChar = True
    end
    object qryItemScanORDER_UNIT: TStringField
      DisplayLabel = #51452#47928#45800#50948
      FieldName = 'ORDER_UNIT'
      FixedChar = True
      Size = 4
    end
    object qryItemScanPICK_QTY: TFloatField
      DisplayLabel = #54588#53433#49688#47049
      FieldName = 'PICK_QTY'
    end
    object qryItemScanLOC_CODE: TStringField
      DisplayLabel = 'LOC'
      FieldName = 'LOC_CODE'
      FixedChar = True
      Size = 6
    end
    object qryItemScanUSERID: TStringField
      FieldName = 'USERID'
      FixedChar = True
      Size = 10
    end
    object qryItemScanNAME: TStringField
      DisplayLabel = #54588#53433
      FieldName = 'NAME'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = qryItemScan
    Left = 64
    Top = 64
  end
end
