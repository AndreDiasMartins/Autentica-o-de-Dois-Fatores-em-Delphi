object fLogin: TfLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fLogin'
  ClientHeight = 376
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 153
    Top = 24
    Width = 72
    Height = 36
    Caption = 'Login'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI Emoji'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 41
    Top = 105
    Width = 300
    Height = 23
    DataField = 'login'
    DataSource = dsQuery
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 41
    Top = 159
    Width = 300
    Height = 23
    DataField = 'senha'
    DataSource = dsQuery
    PasswordChar = '*'
    TabOrder = 1
  end
  object ButtonLogin: TButton
    Left = 87
    Top = 231
    Width = 200
    Height = 50
    Caption = 'Login'
    TabOrder = 2
    OnClick = ButtonLoginClick
  end
  object CheckBox1: TCheckBox
    Left = 41
    Top = 188
    Width = 113
    Height = 17
    Caption = 'Visualizar Senha'
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object dsUser: TDataSource
    DataSet = qUser
    Left = 112
    Top = 88
  end
  object qUser: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 112
    Top = 32
    object qUserid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qUserlogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
    object qUsersenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
  end
  object Query: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 32
    object Queryid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Querylogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
    object Querysenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
  end
  object dsQuery: TDataSource
    DataSet = Query
    Left = 48
    Top = 88
  end
  object QDispConected: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 272
    Top = 32
    object QDispConectedid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QDispConectedhostname: TWideStringField
      FieldName = 'hostname'
      Origin = 'hostname'
      Size = 255
    end
    object QDispConectedsistema_operacional_arq: TWideStringField
      FieldName = 'sistema_operacional_arq'
      Origin = 'sistema_operacional_arq'
      Size = 255
    end
    object QDispConectediduser: TIntegerField
      FieldName = 'iduser'
      Origin = 'iduser'
    end
    object QDispConectedemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 255
    end
  end
  object dsDisp: TDataSource
    DataSet = QDispConected
    Left = 344
    Top = 32
  end
end
