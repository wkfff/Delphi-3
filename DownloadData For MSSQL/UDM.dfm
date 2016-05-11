object DM: TDM
  OldCreateOrder = False
  Height = 177
  Width = 267
  object UniConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Port = 9005
    Database = 'DAIHAN3'
    SpecificOptions.Strings = (
      'Oracle.Direct=True')
    Username = 'sa'
    Server = '168.126.28.28'
    Connected = True
    Left = 56
    Top = 16
    EncryptedPassword = '8BFF8CFF89FF8DFFCDFFCDFFCFFFCEFFBFFF8FFF8BFF8CFF'
  end
  object UniDataSource1: TUniDataSource
    DataSet = UniQuery1
    Left = 120
    Top = 16
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select item_serno from tp_serial_csv01')
    Left = 184
    Top = 16
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 56
    Top = 72
  end
  object OracleUniProvider1: TOracleUniProvider
    Left = 160
    Top = 72
  end
  object UniDataSource2: TUniDataSource
    DataSet = UniQuery2
    Left = 120
    Top = 120
  end
  object UniQuery2: TUniQuery
    Connection = UniConnection1
    Left = 192
    Top = 120
  end
  object UniConnection2: TUniConnection
    ProviderName = 'Oracle'
    SpecificOptions.Strings = (
      'Oracle.Direct=True')
    Username = 'DSMS'
    Server = '168.126.28.33:1521:ZINDEV72'
    Connected = True
    Left = 40
    Top = 120
    EncryptedPassword = '9BFF8CFF92FF8CFF'
  end
end
