unit projeto16.Model.Login;

interface

uses
  Dialogs;

type
  TLoginModel = class
  private
    FId: Integer;
    FLogin: string;
    FSenha: string;
  public
    constructor Create;
    destructor Destroy; override;

    property ID: Integer read FId write FId;
    property Login: string read FLogin write FLogin;
    property Senha: string read FSenha write FSenha;
  end;

implementation

{ TLoginModel } 

constructor TLoginModel.Create;
begin

end;

destructor TLoginModel.Destroy;
begin

  inherited;
end;

end.

//  with FLoginController.LoginModel do
//  begin
//    QUERYid.AsInteger:= Id;
//    QUERYlogin.AsString:= Login;
//    QUERYsenha.AsString:= Senha;
//  end;

//  with FLoginController.LoginModel do
//  begin
//    Id:= QUERYid.AsInteger;
//    Login:= QUERYlogin.AsString;
//    Senha:= QUERYsenha.AsString;
//  end;

// if not FLoginController.New(StrErr) then
//   Abort;

// if not FLoginController.Edit(id, StrErr) then
//   Abort;

// if not FLoginController.Delete(id, StrErr) then
//   Abort;

// if not FLoginController.Post(StrErr) then
//   Abort;

// if not FLoginController.Open(Query, [], StrErr) then
//   Abort;
