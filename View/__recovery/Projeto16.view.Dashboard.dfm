object fDashoboard: TfDashoboard
  Left = 0
  Top = 0
  Caption = 'fDashboard'
  ClientHeight = 661
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1113
    Height = 661
    Align = alClient
    Color = clBtnText
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1113
      661)
    object Label1: TLabel
      Left = 112
      Top = 184
      Width = 34
      Height = 15
      Caption = 'Label1'
    end
    object DBGrid1: TDBGrid
      Left = 31
      Top = 132
      Width = 1018
      Height = 186
      Anchors = [akLeft, akTop, akRight]
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Button4: TButton
      Left = 799
      Top = 66
      Width = 274
      Height = 60
      Caption = 'Deletar'
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button2: TButton
      Left = 287
      Top = 66
      Width = 250
      Height = 60
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = Button2Click
    end
    object consulta: TButton
      Left = 31
      Top = 66
      Width = 250
      Height = 60
      Caption = 'Consulta'
      TabOrder = 3
      OnClick = consultaClick
    end
    object edit: TButton
      Left = 543
      Top = 66
      Width = 250
      Height = 60
      Caption = 'Editar'
      TabOrder = 4
      OnClick = editClick
    end
    object DBGrid2: TDBGrid
      Left = 31
      Top = 452
      Width = 1018
      Height = 186
      Anchors = [akLeft, akTop, akRight]
      DataSource = dsDisp
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DispoConsulta: TButton
      Left = 32
      Top = 386
      Width = 249
      Height = 60
      Caption = 'Consulta'
      TabOrder = 6
      OnClick = DispoConsultaClick
    end
    object EditDisp: TButton
      Left = 287
      Top = 386
      Width = 250
      Height = 60
      Caption = 'Editar'
      TabOrder = 7
      OnClick = EditDispClick
    end
    object DelEdit: TButton
      Left = 543
      Top = 386
      Width = 274
      Height = 60
      Caption = 'Deletar'
      TabOrder = 8
      OnClick = DelEditClick
    end
  end
  object qUSers: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1093
    Top = 97
    object qUSersid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qUSerslogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 50
    end
    object qUSerssenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = qUSers
    Left = 1087
    Top = 41
  end
  object QDispConected: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1088
    Top = 392
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
    Left = 1088
    Top = 448
  end
end
