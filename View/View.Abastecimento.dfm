object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 219
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 61
    Width = 156
    Height = 13
    Caption = 'Informe a bomba de combust'#237'vel'
  end
  object Label2: TLabel
    Left = 16
    Top = 109
    Width = 61
    Height = 13
    Caption = 'R$ Valor litro'
  end
  object Label3: TLabel
    Left = 119
    Top = 109
    Width = 59
    Height = 13
    Caption = 'Quantidade '
  end
  object Label4: TLabel
    Left = 215
    Top = 109
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object dblcBomba: TDBLookupComboBox
    Left = 16
    Top = 80
    Width = 289
    Height = 21
    KeyField = 'id'
    ListField = 'descricao'
    ListSource = dsLcBomba
    TabOrder = 1
  end
  object rdgTipoCombustivel: TRadioGroup
    Left = 16
    Top = 8
    Width = 289
    Height = 47
    Caption = 'Informe o tipo de combust'#237'vel'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Gasolina'
      'Diesel')
    TabOrder = 0
    OnClick = rdgTipoCombustivelClick
  end
  object edtValorLitro: TMaskEdit
    Left = 16
    Top = 128
    Width = 96
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = ''
    OnKeyPress = edtValorLitroKeyPress
  end
  object edtQtdLitro: TMaskEdit
    Left = 119
    Top = 128
    Width = 89
    Height = 21
    TabOrder = 3
    Text = ''
    OnExit = edtQtdLitroExit
    OnKeyPress = edtQtdLitroKeyPress
  end
  object edtValorTotal: TMaskEdit
    Left = 215
    Top = 128
    Width = 89
    Height = 21
    TabOrder = 4
    Text = ''
    OnExit = edtValorTotalExit
    OnKeyPress = edtValorTotalKeyPress
  end
  object btnAbastecer: TButton
    Left = 16
    Top = 168
    Width = 289
    Height = 41
    Cursor = crHandPoint
    Caption = 'Abastecer'
    TabOrder = 5
    OnClick = btnAbastecerClick
  end
  object dsLcBomba: TDataSource
    DataSet = cdsBomba
    Left = 240
    Top = 128
  end
  object cdsBomba: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 128
    object cdsBombaid: TIntegerField
      FieldName = 'id'
    end
    object cdsBombadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object cdsBombapreco_litro: TFloatField
      FieldName = 'preco_litro'
    end
  end
end
