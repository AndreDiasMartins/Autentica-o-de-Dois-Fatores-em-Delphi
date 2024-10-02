unit projeto16.Token.TokenG;

interface

uses
  System.SysUtils, System.Classes;

type
  TTokenGenerator = class
  private
    class var FInstance: TTokenGenerator;
    class function GetInstance: TTokenGenerator; static;
  public
    class property Instance: TTokenGenerator read GetInstance;
    function GenerateToken: string;
  end;

implementation

{ TTokenGenerator }

class function TTokenGenerator.GetInstance: TTokenGenerator;
begin
  if FInstance = nil then
  begin
    FInstance := TTokenGenerator.Create;
  end;
  Result := FInstance;
end;

function TTokenGenerator.GenerateToken: string;
const
  Characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
var
  i: Integer;
  Token: string;
begin
  Randomize;  // Inicializa o gerador de números aleatórios
  Token := '';
  for i := 1 to 6 do
  begin
    Token := Token + Characters[Random(Length(Characters)) + 1];
  end;
  Result := Token;
end;

initialization
  TTokenGenerator.FInstance := nil;

finalization
  FreeAndNil(TTokenGenerator.FInstance);

end.

