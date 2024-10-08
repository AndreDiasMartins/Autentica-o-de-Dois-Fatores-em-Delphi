unit Projeto16.view.Modal2F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfModal2F = class(TForm)
    btValidar: TButton;
    TokenSelect: TMaskEdit;
    btCancelar: TButton;
    Label1: TLabel;
    procedure btValidarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  strict private
    class var FInstance: TfModal2F;
  private
    FToken: string;
  public
    class function GetInstance: TfModal2F;
    class procedure ReleaseInstance;

    function Execute(Token: String; out StrErr: String): Boolean;
  end;

implementation

{$R *.dfm}
{ TModal2F }

procedure TfModal2F.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfModal2F.Execute(Token: String; out StrErr: String): Boolean;
begin
  try
    FToken := Token;

    StrErr := 'Opera��o Abortada!';
    if ShowModal <> mrOk then
      abort;

    StrErr := '';
    Result := True;
  except
    Result := False;
  end;
end;

class function TfModal2F.GetInstance: TfModal2F;
begin
  if not Assigned(FInstance) then
    FInstance := TfModal2F.Create(nil);
  Result := FInstance;
end;

class procedure TfModal2F.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

procedure TfModal2F.btValidarClick(Sender: TObject);
var
  StrErr: string;
begin
  try
    StrErr := 'Token informado n�o � v�lido.';
    if FToken <> TokenSelect.Text then
      abort;

    ModalResult := mrOk;
  except
    ShowMessage(StrErr);
    ModalResult := mrNone;
  end;
end;

initialization

finalization

TfModal2F.ReleaseInstance;

end.
