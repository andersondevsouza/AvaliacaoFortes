object frmRelatorioPorDiaRL: TfrmRelatorioPorDiaRL
  Left = 0
  Top = 0
  Caption = 'frmRelatorioPorDiaRL'
  ClientHeight = 543
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 32
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dsQryRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      BandType = btHeader
      object RLDraw1: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 83
      end
      object RLLabel1: TRLLabel
        Left = 222
        Top = 32
        Width = 273
        Height = 19
        Align = faCenter
        Caption = 'Relat'#243'rio de Abastecimento por Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbDataInicioFim: TRLLabel
        Left = 8
        Top = 60
        Width = 100
        Height = 16
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 145
      Width = 718
      Height = 96
      DataFields = 'Data'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        BandType = btColumnHeader
        object RLDraw2: TRLDraw
          Left = 0
          Top = -1
          Width = 718
          Height = 25
        end
        object RLLabel2: TRLLabel
          Left = 8
          Top = 3
          Width = 35
          Height = 15
          Caption = 'Data: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 53
          Top = 3
          Width = 29
          Height = 15
          DataField = 'Data'
          DataSource = dsQryRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 24
        Width = 718
        Height = 23
        BeforePrint = RLBand3BeforePrint
        object RLDraw4: TRLDraw
          Left = 0
          Top = -1
          Width = 718
          Height = 24
        end
        object RLDBText2: TRLDBText
          Left = 16
          Top = 4
          Width = 130
          Height = 16
          AutoSize = False
          DataField = 'Tanque'
          DataSource = dsQryRelatorio
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 152
          Top = 3
          Width = 138
          Height = 16
          AutoSize = False
          DataField = 'Bomba'
          DataSource = dsQryRelatorio
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 296
          Top = 3
          Width = 84
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Bomba'
          DataSource = dsQryRelatorio
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 400
          Top = 3
          Width = 91
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd_litros'
          DataSource = dsQryRelatorio
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 504
          Top = 3
          Width = 107
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Total'
          DataSource = dsQryRelatorio
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 629
          Top = 4
          Width = 78
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Imposto'
          DataSource = dsQryRelatorio
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 47
        Width = 718
        Height = 23
        BandType = btSummary
        BeforePrint = RLBand5BeforePrint
        object RLDraw5: TRLDraw
          Left = 0
          Top = -1
          Width = 718
          Height = 24
        end
        object RLLabel9: TRLLabel
          Left = 339
          Top = 5
          Width = 41
          Height = 15
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbTotalLitros: TRLLabel
          Left = 400
          Top = 5
          Width = 91
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbTotal: TRLLabel
          Left = 504
          Top = 5
          Width = 107
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbTotalImposto: TRLLabel
          Left = 629
          Top = 5
          Width = 78
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLDraw3: TRLDraw
        Left = 0
        Top = -1
        Width = 718
        Height = 25
      end
      object RLLabel3: TRLLabel
        Left = 16
        Top = 5
        Width = 45
        Height = 15
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 152
        Top = 5
        Width = 43
        Height = 15
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 429
        Top = 5
        Width = 62
        Height = 15
        Caption = 'Qtd. Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 562
        Top = 5
        Width = 49
        Height = 15
        Caption = 'R$ Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 640
        Top = 5
        Width = 67
        Height = 15
        Caption = 'R$ Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 296
        Top = 5
        Width = 84
        Height = 15
        Caption = 'R$ Pre'#231'o Litro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsQryRelatorio: TDataSource
    DataSet = cdsRelatorio
    Left = 464
    Top = 280
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 280
    object cdsRelatorioData: TDateField
      FieldName = 'Data'
    end
    object cdsRelatorioTanque: TStringField
      FieldName = 'Tanque'
      Size = 50
    end
    object cdsRelatorioBomba: TStringField
      FieldName = 'Bomba'
      Size = 50
    end
    object cdsRelatorioPreco_litro: TFloatField
      FieldName = 'Preco_litro'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object cdsRelatorioTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object cdsRelatorioImposto: TFloatField
      FieldName = 'Imposto'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object cdsRelatorioQtd_litros: TFloatField
      FieldName = 'Qtd_litros'
    end
  end
end
