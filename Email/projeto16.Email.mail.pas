unit projeto16.Email.mail;

interface

uses
  System.SysUtils, IdSMTP, IdMessage, IdSSLOpenSSL;

type
  TEmailManager = class
  strict private
    class var FInstance: TEmailManager;
  private
    FSMTP: TIdSMTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    FEmailMessage: TIdMessage;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TEmailManager;
    class procedure ReleaseInstance;

    Function SendEmail(const ATo, ASubject, ABody: string; out StrErr: String): Boolean;
  end;

implementation

uses
  IdExplicitTLSClientServerBase;

{ TEmailManager }

constructor TEmailManager.Create;
begin
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FSMTP := TIdSMTP.Create(nil);
  FEmailMessage := TIdMessage.Create(nil);

end;

destructor TEmailManager.Destroy;
begin
  FreeAndNil(FEmailMessage);
  FreeAndNil(FSMTP);
  FreeAndNil(FSSLHandler);

  inherited Destroy;
end;

class function TEmailManager.GetInstance: TEmailManager;
begin
  if not Assigned(FInstance) then
    FInstance := TEmailManager.Create;
  Result := FInstance;
end;

class procedure TEmailManager.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

function TEmailManager.SendEmail(const ATo, ASubject, ABody: string; out StrErr: String): Boolean;
begin
  try
    StrErr := 'Falha ao configurar SMTP.';
    with FSMTP do
    begin
      IOHandler := FSSLHandler;
      UseTLS := utUseExplicitTLS;
      Host := 'smtp.agilsistemas.inf.br'; // Substitua pelo seu servidor SMTP
      Port := 587; // Porta para TLS
      Username := 'contato@agilsistemas.inf.br'; // Substitua pelo seu usu�rio
      Password := 'abx5t8MuRh.ddzw'; // Substitua pela sua senha
    end;

    StrErr := 'Falha ao preparar email.';
    with FEmailMessage do
    begin
      From.Address := 'contato@agilsistemas.inf.br';
      Recipients.EmailAddresses := ATo;
      Subject := ASubject;
      Body.Text := ABody;
    end;

    StrErr := 'Falha ao conectar.';
    FSMTP.Connect;
    if not FSMTP.Connected then
      Abort;

    StrErr := 'Falha ao enviar.';
    FSMTP.Send(FEmailMessage);

    StrErr := 'Falha do desconectar';
    FSMTP.Disconnect;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      FSMTP.Disconnect;
      StrErr := StrErr + ' - ' + E.Message;
      Result := False;
    end;
  end;
end;

initialization

finalization

TEmailManager.ReleaseInstance;

end.
