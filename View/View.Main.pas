unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, View.Abastecimento, RLReport,
  View.Relatorio.AbastecimentoPorDia;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Abastecimento1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatriodeAbastecimentoporData1: TMenuItem;
    procedure Abastecimento1Click(Sender: TObject);
    procedure RelatriodeAbastecimentoporData1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Abastecimento1Click(Sender: TObject);
begin
  frmAbastecimento := TFrmAbastecimento.Create(Self);
  try
    frmAbastecimento.ShowModal;
  finally
    frmAbastecimento.Free;
  end;
end;

procedure TfrmMain.RelatriodeAbastecimentoporData1Click(Sender: TObject);
begin
  frmRelatorioPorDia := TfrmRelatorioPorDia.Create(Self);
  try
    frmRelatorioPorDia.ShowModal;
  finally
    frmRelatorioPorDia.Free;
  end;
end;

end.
