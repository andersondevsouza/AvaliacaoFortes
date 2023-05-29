object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 664
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 408
    Top = 312
    object Abastecimento1: TMenuItem
      Caption = 'Abastecimento'
      OnClick = Abastecimento1Click
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelatriodeAbastecimentoporData1: TMenuItem
        Caption = 'Relat'#243'rio de Abastecimento por Data'
        OnClick = RelatriodeAbastecimentoporData1Click
      end
    end
  end
end
