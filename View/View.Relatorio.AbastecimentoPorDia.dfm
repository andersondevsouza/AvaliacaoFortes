object frmRelatorioPorDia: TfrmRelatorioPorDia
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimento por Dia'
  ClientHeight = 190
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 51
    Height = 13
    Caption = 'Data Inicio'
  end
  object Label2: TLabel
    Left = 144
    Top = 96
    Width = 42
    Height = 13
    Caption = 'Data Fim'
  end
  object edtInicio: TMaskEdit
    Left = 16
    Top = 112
    Width = 120
    Height = 21
    EditMask = '00/00/0000'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edtFim: TMaskEdit
    Left = 143
    Top = 112
    Width = 120
    Height = 21
    EditMask = '00/00/0000'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object rdgTipoTanque: TRadioGroup
    Left = 16
    Top = 16
    Width = 248
    Height = 66
    Caption = 'Tipo de Tanque'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Gasolina'
      'Diesel'
      'Ambos')
    TabOrder = 2
  end
  object btnGerarRelatorio: TButton
    Left = 16
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Gerar Relat'#243'rio'
    TabOrder = 3
    OnClick = btnGerarRelatorioClick
  end
  object btnSair: TButton
    Left = 143
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
    OnClick = btnSairClick
  end
end
