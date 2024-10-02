object DAO: TDAO
  Height = 513
  Width = 774
  PixelsPerInch = 120
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Dbandre'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 40
  end
  object fdQuery: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from login')
    Left = 220
    Top = 40
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
    VendorLib = 'C:\Fontes\Projeto16\DrivesBanco\libpq.dll'
    Left = 90
    Top = 130
  end
  object FDQuery1: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from dispositivosconnected')
    Left = 220
    Top = 130
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
    Left = 330
    Top = 130
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
    Left = 330
    Top = 40
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
