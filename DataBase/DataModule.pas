unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, IniFiles, Forms;

const
  DBPath = 'E:\Projetos\AvaliacaoFortes\DataBase\DB.fdb';

type
  Tdm = class(TDataModule)
    Connection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function RetornaCaminhoBanco: String;
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  var LCaminhoBD := RetornaCaminhoBanco;

  Connection.Params.Clear;
  Connection.DriverName := 'FB';
  Connection.Params.Database := LCaminhoBD;
  Connection.Params.UserName := 'SYSDBA';
  Connection.Params.Password := 'masterkey';
  Connection.Connected := True;
end;

function Tdm.RetornaCaminhoBanco: String;
begin
  var ArquivoINI := TIniFile.Create(
    Concat(
      ExtractFilePath(Application.ExeName),
      '\',
      'Configuracao.ini'
    )
  );
  try
    Result := ArquivoINI.ReadString('DataBase', 'Caminho', '');
  finally
    ArquivoIni.Free;
  end;
end;

end.