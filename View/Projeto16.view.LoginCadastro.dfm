object fLoginCadastro: TfLoginCadastro
  Left = 0
  Top = 0
  Caption = #231'.'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblSatusCD: TLabel
    Left = 104
    Top = 68
    Width = 14
    Height = 38
    Caption = '..'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Segoe UI Emoji'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 104
    Top = 156
    Width = 27
    Height = 15
    Caption = 'login'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 104
    Top = 220
    Width = 31
    Height = 15
    Caption = 'senha'
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 102
    Top = 177
    Width = 400
    Height = 23
    DataField = 'login'
    DataSource = dsQuery
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 102
    Top = 237
    Width = 400
    Height = 23
    DataField = 'senha'
    DataSource = dsQuery
    PasswordChar = '*'
    TabOrder = 1
  end
  object ButtonCd: TButton
    Left = 203
    Top = 312
    Width = 200
    Height = 50
    TabOrder = 2
    OnClick = ButtonCdClick
  end
  object CheckBox1: TCheckBox
    Left = 104
    Top = 266
    Width = 121
    Height = 17
    Caption = 'Visualizar Senha'
    TabOrder = 3
    OnClick = CheckBox1Click
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
  object QueryValidEmail: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 144
    object QueryValidEmailid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryValidEmaillogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
  end
  object DataSourceValidEmail: TDataSource
    DataSet = QueryValidEmail
    Left = 48
    Top = 200
  end
end
