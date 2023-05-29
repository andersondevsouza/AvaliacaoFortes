unit View.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient, System.StrUtils;

const
  EmptyStr = '';
  PERCENTUAL_IMPOSTO = 15;

type
  TfrmAbastecimento = class(TForm)
    dblcBomba: TDBLookupComboBox;
    Label1: TLabel;
    rdgTipoCombustivel: TRadioGroup;
    edtValorLitro: TMaskEdit;
    Label2: TLabel;
    edtQtdLitro: TMaskEdit;
    Label3: TLabel;
    edtValorTotal: TMaskEdit;
    Label4: TLabel;
    btnAbastecer: TButton;
    dsLcBomba: TDataSource;
    cdsBomba: TClientDataSet;
    cdsBombaid: TIntegerField;
    cdsBombadescricao: TStringField;
    cdsBombapreco_litro: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure rdgTipoCombustivelClick(Sender: TObject);
    procedure edtQtdLitroExit(Sender: TObject);
    procedure btnAbastecerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorTotalExit(Sender: TObject);
    procedure edtValorLitroKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdLitroKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorTotalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function DoValidacoes: Boolean;
    function DoCalcularImposto(const AValor, APercImposto: Double): Double;
    function DoCalculaTotal(const AQtdLitro, APrecoLitro: Double): Double;
    function DoCalculaQtd(const ATotal, APrecoLitro: Double): Double;
    procedure DoListarBombas;
    procedure DoChamarCalcularTotal;
    procedure DoChamarCalcularQtdLitros;
    procedure DoConfirmarAbastecimento;
    procedure DoLimparCampos;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses Model.Bombas, Model.Abastecimento;

{ TfrmAbastecimento }

procedure TfrmAbastecimento.btnAbastecerClick(Sender: TObject);
begin
  if not DoValidacoes then
    Exit;

  if Application.MessageBox('ATEN��O: Deseja confirmar o abastecimento?',
    'Confirma��o', MB_yesno + MB_iconInformation) = mrYes then begin
      try
        DoConfirmarAbastecimento;
        Application.MessageBox('Abastecimento realizado com sucesso!',
          'Informa��o', MB_OK);
        DoLimparCampos;
        Self.Close;
      except
        on E: Exception do
          ShowMessage('Erro: ' + E.Message);
      end;
    end;
end;

function TfrmAbastecimento.DoCalculaQtd(const ATotal,
  APrecoLitro: Double): Double;
begin
  var LAbastecimento := TAbastecimento.New;
  Result := LAbastecimento.CalcularQtdLitros(ATotal, APrecoLitro);
end;

function TfrmAbastecimento.DoCalcularImposto(const AValor,
  APercImposto: Double): Double;
begin
  var LAbastecimento := TAbastecimento.New;
  Result := LAbastecimento.CalcularImposto(AValor, APercImposto);
end;

function TfrmAbastecimento.DoCalculaTotal(const AQtdLitro,
  APrecoLitro: Double): Double;
begin
  var LAbastecimento := TAbastecimento.New;
  Result := LAbastecimento.CalcularValorTotal(AQtdLitro, APrecoLitro);
end;

procedure TfrmAbastecimento.DoChamarCalcularQtdLitros;
begin
  var LQtdLitros :=
    DoCalculaQtd(StrToFloat(edtValorTotal.Text), StrToFloat(edtValorLitro.Text));
  edtQtdLitro.Text := FloatToStrF(LQtdLitros, ffNumber, 10,3);
end;

procedure TfrmAbastecimento.DoChamarCalcularTotal;
begin
  var LTotal :=
    DoCalculaTotal(StrToFloat(edtQtdLitro.Text), StrToFloat(edtValorLitro.Text));
  edtValorTotal.Text := FloatToStrF(LTotal, ffNumber, 10,3);
end;

procedure TfrmAbastecimento.DoConfirmarAbastecimento;
begin
  var LImposto := FloatToStrF(DoCalcularImposto(StrToFloat(edtValorTotal.Text),
    PERCENTUAL_IMPOSTO), ffNumber, 10,3);

  var LAbastecimento := TAbastecimento.New
    .BombaId(dblcBomba.KeyValue)
    .QtdLitros(StrToFloat(edtQtdLitro.Text))
    .ValorTotal(StrToFloat(edtValorTotal.Text))
    .ValorImposto(StrToFloat(LImposto))
    .Criar;
end;

procedure TfrmAbastecimento.DoLimparCampos;
begin
  edtValorLitro.Text := '0,000';
  edtValorTotal.Text := '0,000';
  edtQtdLitro.Text := '0,000';

  dblcBomba.KeyValue := 0;
end;

procedure TfrmAbastecimento.DoListarBombas;
begin
  cdsBomba.EmptyDataSet;

  var LTipoCombustivel := EmptyStr;
  case rdgTipoCombustivel.ItemIndex of
    0: LTipoCombustivel := 'G';
    1: LTipoCombustivel := 'D';
  end;

  var LBomba := TBomba.New;
  var LDataSet := LBomba.ListarBombas(LTipoCombustivel);
  try
    if LDataSet.RecordCount > 0 then
      cdsBomba.CloneCursor(LDataSet, True)
    else begin
      Application.MessageBox('ATEN��O: Nenhuma bomba cadastrada no tanque',
         'Informa��o',MB_OK);
    end;
  finally
    LDataSet.Free;
  end;
end;

function TfrmAbastecimento.DoValidacoes: Boolean;
begin
  Result := True;

  if dblcBomba.Text = EmptyStr then begin
    Application.MessageBox('ATEN��O: Selecione a bomba de combust�vel!',
      'Aviso', MB_OK);
    Exit(False);
  end;

  if edtQtdLitro.Text = '0,000' then begin
    Application.MessageBox('ATEN��O: Informe a quantidade de litros desejada!',
      'Aviso', MB_OK);
    Exit(False);
  end;
end;

procedure TfrmAbastecimento.edtQtdLitroExit(Sender: TObject);
begin
  edtQtdLitro.Text := FloatToStrF(StrToFloat(edtQtdLitro.Text), ffNumber, 10,3);
  DoChamarCalcularTotal;
end;

procedure TfrmAbastecimento.edtQtdLitroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9'] = false) then
    key := #0;
end;

procedure TfrmAbastecimento.edtValorLitroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in ['0'..'9', ','] = false) then
    key := #0;
end;

procedure TfrmAbastecimento.edtValorTotalExit(Sender: TObject);
begin
  edtValorTotal.Text := FloatToStrF(StrToFloat(edtValorTotal.Text),
   ffNumber, 10,3);
  DoChamarCalcularQtdLitros;
end;

procedure TfrmAbastecimento.edtValorTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in ['0'..'9', ','] = false) then
    key := #0;
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsBomba.Free;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  DoLimparCampos;

  cdsBomba.CreateDataSet;
  rdgTipoCombustivelClick(Sender);
end;

procedure TfrmAbastecimento.rdgTipoCombustivelClick(Sender: TObject);
begin
  DoListarBombas;
  edtValorLitro.Text := FloatToStrF(cdsBombapreco_litro.AsFloat, ffNumber, 12,2);
  DoChamarCalcularTotal;
end;

end.
