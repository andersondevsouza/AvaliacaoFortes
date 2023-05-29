program PostoDFP;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {frmMain},
  DataModule in 'DataBase\DataModule.pas' {dm: TDataModule},
  View.Abastecimento in 'View\View.Abastecimento.pas' {frmAbastecimento},
  View.Relatorio.AbastecimentoPorDia in 'View\View.Relatorio.AbastecimentoPorDia.pas' {frmRelatorioPorDia},
  View.Relatorio.AbastecimentoPorDiaRL in 'View\View.Relatorio.AbastecimentoPorDiaRL.pas' {frmRelatorioPorDiaRL},
  Model.Bombas in 'Model\Model.Bombas.pas',
  Model.Abastecimento in 'Model\Model.Abastecimento.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmRelatorioPorDiaRL, frmRelatorioPorDiaRL);
  Application.Run;
end.
