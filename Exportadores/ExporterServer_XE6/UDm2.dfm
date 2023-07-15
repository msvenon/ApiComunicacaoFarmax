object Dm2: TDm2
  OldCreateOrder = False
  Left = 251
  Top = 106
  Height = 223
  Width = 624
  object SqlUsuarios: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE'#13#10' CD_USUARIO IN'#13#10' (SELECT ID_' +
      'PRODUTO FROM TEMP_PRODUTOS WHERE PROCESSO = 142)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SQLConnection1
    Left = 32
    Top = 16
  end
  object DspUsuarios: TDataSetProvider
    DataSet = SqlUsuarios
    Left = 32
    Top = 64
  end
  object CdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUsuarios'
    Left = 32
    Top = 112
    object CdsUsuariosCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsUsuariosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object CdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object CdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object CdsUsuariosPODEVENDER: TStringField
      FieldName = 'PODEVENDER'
      Size = 1
    end
    object CdsUsuariosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 1
    end
    object CdsUsuariosTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsUsuariosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPermissoesModulos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE'#13#10' CD_PERMISSAO IN'#13#10' (SELECT I' +
      'D_PRODUTO FROM TEMP_PRODUTOS WHERE PROCESSO = 144)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SQLConnection1
    Left = 232
    Top = 16
  end
  object DspPermissoesModulos: TDataSetProvider
    DataSet = SqlPermissoesModulos
    Left = 232
    Top = 64
  end
  object CdsPermissoesModulos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPermissoesModulos'
    Left = 232
    Top = 112
    object CdsPermissoesModulosCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
    end
    object CdsPermissoesModulosCD_MODULO: TFloatField
      FieldName = 'CD_MODULO'
    end
    object CdsPermissoesModulosPERMITIDO: TStringField
      FieldName = 'PERMITIDO'
      Size = 1
    end
    object CdsPermissoesModulosINCLUSAO: TStringField
      FieldName = 'INCLUSAO'
      Size = 1
    end
    object CdsPermissoesModulosALTERACAO: TStringField
      FieldName = 'ALTERACAO'
      Size = 1
    end
    object CdsPermissoesModulosEXCLUSAO: TStringField
      FieldName = 'EXCLUSAO'
      Size = 1
    end
    object CdsPermissoesModulosIMPRESSAO: TStringField
      FieldName = 'IMPRESSAO'
      Size = 1
    end
    object CdsPermissoesModulosENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object SqlPermissoes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' *'#13#10'FROM'#13#10' USUARIOS'#13#10'WHERE'#13#10' CD_PERMISSAO IN'#13#10' (SELECT I' +
      'D_PRODUTO FROM TEMP_PRODUTOS WHERE PROCESSO = 143)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SQLConnection1
    Left = 120
    Top = 16
  end
  object DspPermissoes: TDataSetProvider
    DataSet = SqlPermissoes
    Left = 120
    Top = 64
  end
  object CdsPermissoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPermissoes'
    Left = 120
    Top = 112
    object CdsPermissoesCD_USUARIO: TFloatField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object CdsPermissoesCD_PERMISSAO: TFloatField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object CdsPermissoesNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsPermissoesLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object CdsPermissoesSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object CdsPermissoesPODEVENDER: TStringField
      FieldName = 'PODEVENDER'
      Size = 1
    end
    object CdsPermissoesCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 1
    end
    object CdsPermissoesTX_DESCONTO_MAXIMO: TFloatField
      FieldName = 'TX_DESCONTO_MAXIMO'
    end
    object CdsPermissoesENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 1
    end
  end
  object CdsUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 24
  end
end
