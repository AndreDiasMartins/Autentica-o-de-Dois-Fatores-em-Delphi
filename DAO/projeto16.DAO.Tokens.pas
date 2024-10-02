unit projeto16.DAO.Tokens;

interface

uses
  projeto16.Model.Tokens, projeto16.DAO.Connection, Projeto14.comuns.Types, FireDAC.Comp.Client, System.SysUtils, dialogs, System.Classes;

const
  acmModulo = '';

type

  TTokensDAO = class

  private
    FSQL: TStringList;
    FInsertUpdate: TInsertUpdate;
  public
    constructor Create;
    destructor Destroy; override;

    function Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
    function New(var R: TTokensModel; out StrErr: string): Boolean;
    function Edit(Token: string; var R: TTokensModel; out StrErr: string): Boolean;
    function Delete(Token: string; out StrErr: string): Boolean;
    function Post(var R: TTokensModel; out StrErr: string): Boolean;
    function Upsert(var R: TTokensModel; out StrErr: string): Boolean;
    function Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
  end;

implementation

{ TTokensDAO }

constructor TTokensDAO.Create;
begin
  FSQL := TStringList.Create;
  FInsertUpdate := TInsertUpdate.iuNone;
end;

destructor TTokensDAO.Destroy;
begin
  FreeAndNil(FSQL);

  inherited;
end;

function TTokensDAO.Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[Tokens]: Imposs�vel abrir query.';
    FSQL.Clear;
    FSQL.Add('SELECT token, iduser, data_criacao, data_exp ');
    FSQL.Add('FROM Tokens ');
    FSQL.Add('WHERE token=:token');

    TDAO.GetInstance.FDQuery.Close;
    TDAO.GetInstance.FDQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[Tokens]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.FDQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TTokensDAO.New(var R: TTokensModel; out StrErr: string): Boolean;
begin
  R.Token := '';
  R.Iduser := 0;
  R.Data_criacao := Date;
  R.Data_exp := Date;

  FInsertUpdate := TInsertUpdate.iuInsert;
  Result := True;
end;

function TTokensDAO.Edit(Token: string; var R: TTokensModel; out StrErr: string): Boolean;
begin
  FInsertUpdate := TInsertUpdate.iuUpdate;
  StrErr := '';
  try
    StrErr := 'DAO[Tokens]: N�o foi poss�vel editar.';
    FSQL.Clear;
    FSQL.Add('SELECT token, iduser, data_criacao, data_exp ');
    FSQL.Add('FROM Tokens ');
    FSQL.Add('WHERE token=:token ');
    TDAO.GetInstance.FDQuery.Close;
    TDAO.GetInstance.FDQuery.Open(FSQL.Text, [Token]);

    StrErr := 'DAO[Tokens]: Registro n�o encontrado.';
    if TDAO.GetInstance.FDQuery.RecordCount = 0 then
      Abort;

    StrErr := 'DAO[Tokens]: Falha ao retornar campos.';
    R.Token := TDAO.GetInstance.FDQuery.Fields[0].AsString;
    R.Iduser := TDAO.GetInstance.FDQuery.Fields[1].AsInteger;
    R.Data_criacao := TDAO.GetInstance.FDQuery.Fields[2].AsDateTime;
    R.Data_exp := TDAO.GetInstance.FDQuery.Fields[3].AsDateTime;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;

end;

function TTokensDAO.Delete(Token: string; out StrErr: string): Boolean;
var
  AText: string;
begin
  TDAO.GetInstance.Connection.StartTransaction;
  try
    StrErr := 'DAO[Tokens]: Falha ao executar SQL.';
    FSQL.Clear;
    FSQL.Add('DELETE FROM Tokens ');
    FSQL.Add('WHERE token=:token ');
    TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [Token]);

    StrErr := 'DAO[Tokens]: Falha ao concluir transa��o.';
    TDAO.GetInstance.Connection.Commit;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;

end;

function TTokensDAO.Post(var R: TTokensModel; out StrErr: string): Boolean;
var
  AText: string;
begin
  TDAO.GetInstance.Connection.StartTransaction;
  try
    case FInsertUpdate of

      TInsertUpdate.iuInsert:
        begin
          StrErr := 'DAO[Tokens]: Falha ao incluir registro.';
          FSQL.Clear;
          FSQL.Add('INSERT INTO Tokens (token, iduser, data_criacao, data_exp) ');
          FSQL.Add('VALUES (:token, :iduser, :data_criacao, :data_exp) ');
          TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [R.Token, R.Iduser, R.Data_criacao, R.Data_exp]);

        end;

      TInsertUpdate.iuUpdate:
        begin
          StrErr := 'DAO[Tokens]: Falha ao alterar registro.';
          FSQL.Clear;
          FSQL.Add('UPDATE Tokens ');
          FSQL.Add('SET iduser=:iduser, data_criacao=:data_criacao, data_exp=:data_exp ');
          FSQL.Add('WHERE token=:token ');
          TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [R.Iduser, R.Data_criacao, R.Data_exp, R.Token]);

        end;

    else
      StrErr := 'DAO[Tokens]: Status de inclus�o ou altera��o n�o determinado.';
      Abort;
    end;

    StrErr := 'DAO[Tokens]: Falha ao concluir transa��o.';
    TDAO.GetInstance.Connection.Commit;

    StrErr := '';
    FInsertUpdate := TInsertUpdate.iuNone;
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TTokensDAO.Upsert(var R: TTokensModel; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[Tokens]: Falha ao definir status.';
    FSQL.Clear;
    FSQL.Add('SELECT COALESCE(MAX(*), 0) ');
    FSQL.Add('FROM Tokens ');
    FSQL.Add('WHERE token=:token ');
    if TDAO.GetInstance.Connection.ExecSQLScalar(FSQL.Text, [R.Token]) = 1 then
      FInsertUpdate := TInsertUpdate.iuUpdate
    else
      FInsertUpdate := TInsertUpdate.iuInsert;

    if not Post(R, StrErr) then
      Abort;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TTokensDAO.Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    case AReport of
      0:
        begin
          StrErr := 'DAO[Tokens]: Imposs�vel abrir query.';
          FSQL.Clear;
          FSQL.Add('SELECT token, iduser, data_criacao, data_exp ');
          FSQL.Add('FROM Tokens ');
          FSQL.Add('WHERE token=:token');
        end;
    else
      StrErr := 'DAO[Tokens]: Relat�rio n�o definido.';
      Abort;
    end;

    TDAO.GetInstance.FDQuery.Close;
    TDAO.GetInstance.FDQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[Tokens]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.FDQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

end.
