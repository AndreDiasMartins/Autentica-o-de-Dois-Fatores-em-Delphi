object fModal2F: TfModal2F
  Left = 0
  Top = 0
  Caption = 'fModal2F'
  ClientHeight = 443
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    591
    443)
  TextHeight = 15
  object Label1: TLabel
    Left = 165
    Top = 122
    Width = 229
    Height = 25
    Caption = 'Insira o Token de Valida'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btValidar: TButton
    Left = 128
    Top = 230
    Width = 141
    Height = 58
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Validar'
    TabOrder = 0
    OnClick = btValidarClick
    ExplicitWidth = 139
    ExplicitHeight = 50
  end
  object TokenSelect: TMaskEdit
    Left = 128
    Top = 174
    Width = 311
    Height = 23
    EditMask = 'AAAAAA'
    MaxLength = 6
    TabOrder = 1
    Text = '      '
  end
  object btCancelar: TButton
    Left = 304
    Top = 230
    Width = 139
    Height = 58
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
    ExplicitWidth = 137
    ExplicitHeight = 50
  end
end
