unit Model.Bombas;

interface

uses
  System.SysUtils, DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, System.StrUtils,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModule;

type
  IBomba = interface
    ['{058CF731-7BCF-4574-B22C-0E7479E4C0BB}']
    function ListarBombas(const ATipoCombustivel: String): TClientDataSet;
  end;

type
  TBomba = class(TInterfacedObject, IBomba)
    private
      constructor Create;
    public
      class function New: IBomba;
      destructor Destroy; override;
      function ListarBombas(const ATipoCombustivel: String): TClientDataSet;
  end;

implementation

{ TBomba }

constructor TBomba.Create;
begin

end;

destructor TBomba.Destroy;
begin

  inherited;
end;

function TBomba.ListarBombas(const ATipoCombustivel: String): TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);

  var Qry := TFDQuery.Create(nil);
  Qry.Connection := dm.Connection;
  try
    Qry.SQL.Clear;
    var LSql :=  Concat('select b.id, ',
                               'b.descricao, ',
                               't.preco_litro ',
                          'from bomba b inner join tanque t on(t.id = b.tanque_id) ',
                         'where t.tipo_combustivel = :tipo');
    Qry.SQL.Add(LSql);

    Qry.ParamByName('tipo').AsString := ATipoCombustivel;
    Qry.Open;

    with Result do begin
      FieldDefs.Add('id', ftInteger);
      FieldDefs.Add('descricao', ftString, 50);
      FieldDefs.Add('preco_litro', ftFloat);

      CreateDataSet;

      Qry.First;
      while not Qry.Eof do begin
        Append;
        FieldByName('id').AsInteger := Qry.FieldByName('id').AsInteger;
        FieldByName('descricao').AsString := Qry.FieldByName('descricao').AsString;
        FieldByName('preco_litro').AsFloat := Qry.FieldByName('preco_litro').AsFloat;
        Post;

        Qry.Next;
      end;
    end;

  finally
    Qry.Free;
  end;
end;

class function TBomba.New: IBomba;
begin
  Result := Self.Create;
end;

end.
