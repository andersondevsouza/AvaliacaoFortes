unit View.Relatorio.AbastecimentoPorDia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  View.Relatorio.AbastecimentoPorDiaRL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, System.StrUtils,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModule, Datasnap.DBClient;

type
  TfrmRelatorioPorDia = class(TForm)
    edtInicio: TMaskEdit;
    edtFim: TMaskEdit;
    rdgTipoTanque: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    btnGerarRelatorio: TButton;
    btnSair: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function DoCriarRelatorio: TClientDataSet;
  public
    { Public declarations }
  end;

var
  frmRelatorioPorDia: TfrmRelatorioPorDia;

implementation

{$R *.dfm}

uses Model.Abastecimento;

procedure TfrmRelatorioPorDia.btnGerarRelatorioClick(Sender: TObject);
begin
  frmRelatorioPorDiaRL := TfrmRelatorioPorDiaRL.Create(Self);
  try
    frmRelatorioPorDiaRL.rllbDataInicioFim.Caption := Concat(
      'De ',
      edtInicio.Text,
      ' Até ',
      edtFim.Text
    );

    var FDataSet := DoCriarRelatorio;
    try
      if FDataSet.RecordCount > 0 then begin
        frmRelatorioPorDiaRL.cdsRelatorio.CloneCursor(FDataSet, True);
        frmRelatorioPorDiaRL.RLReport1.PreviewModal;
      end else begin
        Application.MessageBox('ATENÇÃO: Nenhum abastecimento encontrado!',
          'Informação', MB_OK);
      end;
    finally
      FDataSet.Free;
    end;
  finally
    frmRelatorioPorDiaRL.Free;
  end;
end;

procedure TfrmRelatorioPorDia.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

function TfrmRelatorioPorDia.DoCriarRelatorio: TClientDataSet;
begin
  Result := nil;

  if edtInicio.Text = edtInicio.EditMask then begin
    Application.MessageBox('ATENÇÃO: Informe a data de inicio',
      'Informação', MB_OK);
    edtInicio.SetFocus;
    exit;
  end;

  if edtFim.Text = edtFim.EditMask then begin
    Application.MessageBox('ATENÇÃO: Informe a data final',
      'Informação', MB_OK);
    edtFim.SetFocus;
    exit;
  end;

  var LFilter := '';
  case rdgTipoTanque.ItemIndex of
    0: LFilter := ' and t.tipo_combustivel = ''G'' ';
    1: LFilter := ' and t.tipo_combustivel = ''D'' ';
  end;

  var LAbastecimento := TAbastecimento.New;
  Result := LAbastecimento.GerarRelatorio(
    LFilter,
    StrToDate(edtInicio.Text),
    StrToDate(edtFim.Text));
end;

procedure TfrmRelatorioPorDia.FormShow(Sender: TObject);
begin
  edtInicio.Text := DateToStr(Date);
  edtFim.Text := DateToStr(Date);
end;

end.
