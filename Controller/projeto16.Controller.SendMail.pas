unit projeto16.Controller.SendMail;

interface

uses
  System.SysUtils, IdSMTP, IdMessage, IdSSLOpenSSL;

type
  TSendMailController = class
  strict private
    class var FInstance: TSendMailController;
  private
    FSMTP: TIdSMTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    FEmailMessage: TIdMessage;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TSendMailController;
    class procedure ReleaseInstance;

    Function Execute(const ATo, ASubject, ABody: string; out StrErr: String): Boolean;
  end;

implementation

uses
  IdExplicitTLSClientServerBase;

{ TEmailManager }

constructor TSendMailController.Create;
begin
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FSMTP := TIdSMTP.Create(nil);
  FEmailMessage := TIdMessage.Create(nil);

end;

destructor TSendMailController.Destroy;
begin
  FreeAndNil(FEmailMessage);
  FreeAndNil(FSMTP);
  FreeAndNil(FSSLHandler);

  inherited Destroy;
end;

class function TSendMailController.GetInstance: TSendMailController;
begin
  if not Assigned(FInstance) then
    FInstance := TSendMailController.Create;
  Result := FInstance;
end;

class procedure TSendMailController.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

function TSendMailController.Execute(const ATo, ASubject, ABody: string; out StrErr: String): Boolean;
begin
  try
    StrErr := 'Falha ao configurar SMTP.';
    with FSMTP do
    begin
      IOHandler := FSSLHandler;
      UseTLS := utUseExplicitTLS;
      Host := ''; // Substitua pelo seu servidor SMTP
      Port := 587; // Porta para TLS
      Username := ''; // Substitua pelo seu usu�rio
      Password := ''; // Substitua pela sua senha
    end;

    StrErr := 'Falha ao preparar email.';
    with FEmailMessage do
    begin
      From.Address := ''; // Substitua pelo seu usu�rio
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

TSendMailController.ReleaseInstance;

end.
