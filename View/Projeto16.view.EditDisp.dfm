object ModalDispEdit: TModalDispEdit
  Left = 0
  Top = 0
  Caption = 'ModalDispEdit'
  ClientHeight = 487
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 144
    Top = 169
    Width = 53
    Height = 15
    Caption = 'hostname'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 144
    Top = 214
    Width = 175
    Height = 15
    Caption = 'sistema operacional e arquitetura'
    FocusControl = DBEdit2
  end
  object Label5: TLabel
    Left = 216
    Top = 104
    Width = 242
    Height = 37
    Caption = 'Alterar Dispositivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 144
    Top = 185
    Width = 400
    Height = 23
    DataField = 'hostname'
    DataSource = dsDisp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 144
    Top = 235
    Width = 400
    Height = 23
    DataField = 'sistema_operacional_arq'
    DataSource = dsDisp
    TabOrder = 1
  end
  object Alterar: TButton
    Left = 144
    Top = 285
    Width = 169
    Height = 50
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = AlterarClick
  end
  object Cancel: TButton
    Left = 368
    Top = 285
    Width = 176
    Height = 50
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = CancelClick
  end
  object QDispConected: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 27
    Top = 16
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
    Left = 27
    Top = 72
  end
  object qValidEmail: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 19
    Top = 176
    object qValidEmailid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qValidEmailemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 255
    end
  end
  object DSEMail: TDataSource
    DataSet = qValidEmail
    Left = 19
    Top = 248
  end
end
