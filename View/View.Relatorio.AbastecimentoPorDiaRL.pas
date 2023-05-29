unit View.Relatorio.AbastecimentoPorDiaRL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLReport, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TfrmRelatorioPorDiaRL = class(TForm)
    RLReport1: TRLReport;
    dsQryRelatorio: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    rllbDataInicioFim: TRLLabel;
    RLDraw1: TRLDraw;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDraw2: TRLDraw;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand4: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDraw4: TRLDraw;
    cdsRelatorio: TClientDataSet;
    cdsRelatorioData: TDateField;
    cdsRelatorioTanque: TStringField;
    cdsRelatorioBomba: TStringField;
    cdsRelatorioPreco_litro: TFloatField;
    cdsRelatorioTotal: TFloatField;
    cdsRelatorioImposto: TFloatField;
    cdsRelatorioQtd_litros: TFloatField;
    RLBand5: TRLBand;
    RLDraw5: TRLDraw;
    RLLabel9: TRLLabel;
    rllbTotalLitros: TRLLabel;
    rllbTotal: TRLLabel;
    rllbTotalImposto: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTotalImposto: Double;
    FTotalQtd: Double;
    FTotal: Double;
  public
    { Public declarations }
  end;

var
  frmRelatorioPorDiaRL: TfrmRelatorioPorDiaRL;

implementation

{$R *.dfm}

procedure TfrmRelatorioPorDiaRL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsRelatorio.Free;
end;

procedure TfrmRelatorioPorDiaRL.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FTotalImposto := FTotalImposto + cdsRelatorioImposto.Value;
  FTotalQtd := FTotalQtd + cdsRelatorioQtd_litros.Value;
  FTotal := FTotal + cdsRelatorioTotal.Value;
end;

procedure TfrmRelatorioPorDiaRL.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rllbTotalImposto.Caption := FloatToStrF(FTotalImposto, ffNumber, 10,3);
  rllbTotalLitros.Caption := FloatToStrF(FTotalQtd, ffNumber, 10,3);
  rllbTotal.Caption := FloatToStrF(FTotal, ffNumber, 10,3);
end;

procedure TfrmRelatorioPorDiaRL.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FTotalImposto := 0;
  FTotalQtd := 0;
  FTotal := 0;
end;

end.
