object DAO: TDAO
  Height = 410
  Width = 619
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Dbandre'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object fdQuery: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from login')
    Left = 176
    Top = 32
    object fdQueryid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQuerylogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
    object fdQuerysenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Fontes\Projeto4\Win32\Debug\libpq.dll'
    Left = 72
    Top = 104
  end
  object FDQuery1: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from dispositivosconnected')
    Left = 176
    Top = 104
    object FDQuery1id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1hostname: TWideStringField
      FieldName = 'hostname'
      Origin = 'hostname'
      Size = 255
    end
    object FDQuery1sistema_operacional_arq: TWideStringField
      FieldName = 'sistema_operacional_arq'
      Origin = 'sistema_operacional_arq'
      Size = 255
    end
    object FDQuery1iduser: TIntegerField
      FieldName = 'iduser'
      Origin = 'iduser'
    end
    object FDQuery1email: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 255
    end
  end
  object FDValidEmailDIsp: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select id, email from dispositivosconnected')
    Left = 264
    Top = 104
    object FDValidEmailDIspid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDValidEmailDIspemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 255
    end
  end
  object FDValidEmailLogin: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select id,login from login')
    Left = 264
    Top = 32
    object FDValidEmailLoginid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDValidEmailLoginlogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
  end
end
