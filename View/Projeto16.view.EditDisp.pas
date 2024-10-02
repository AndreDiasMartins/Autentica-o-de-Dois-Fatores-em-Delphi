unit Projeto16.view.EditDisp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.RegularExpressions;

type
  TModalDispEdit = class(TForm)
    QDispConected: TFDMemTable;
    QDispConectedid: TIntegerField;
    QDispConectedhostname: TWideStringField;
    QDispConectedsistema_operacional_arq: TWideStringField;
    QDispConectediduser: TIntegerField;
    QDispConectedemail: TWideStringField;
    dsDisp: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Alterar: TButton;
    Cancel: TButton;
    qValidEmail: TFDMemTable;
    qValidEmailid: TIntegerField;
    qValidEmailemail: TWideStringField;
    DSEMail: TDataSource;
    procedure CancelClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
  Strict Private
    { Private declarations }
    class var FInstance: TModalDispEdit;

  private
    { Private declarations }
  public
    { Public declarations }
    class function GetInstance: TModalDispEdit;
    class procedure ReleaseInstance;
    function Execute(hostname: String; sistemaOperacional: String; Email: String; out StrErr: String): Boolean;
    function ValidarEmail(const AEmail: string): Boolean;
  end;

var
  ModalDispEdit: TModalDispEdit;

implementation

uses
  Projeto16.Controller.DispositivoConected;

{$R *.dfm}
{ TModalDispEdit }

procedure TModalDispEdit.AlterarClick(Sender: TObject);
var
  AText: String;
  StrErr: String;
  AEmail : String;
begin
  try
    StrErr := '';



    if QDispConectedhostname.AsString.IsEmpty then
      AText := AText + 'Insira o campo Hostname' + sLineBreak;

    if QDispConectedsistema_operacional_arq.AsString.IsEmpty then
      AText := AText + 'Insira o campo sistema operacional e arquitetura' + sLineBreak;

    if QDispConectedemail.AsString.IsEmpty then
      AText := AText + 'Insira o campo Email' + sLineBreak

    else if not ValidarEmail(QDispConectedemail.AsString) then
      AText := AText + 'Insira um email v�lido' + sLineBreak;

    AEmail:= QDispConectedemail.AsString;
    if not TDispositivoConectedController.GetInstance.validEmail(qValidEmail, [AEmail], StrErr) then
      abort;

    if qValidEmailemail.AsString <> '' then
      AText := AText + 'Email ja esta sendo utilizado!' + sLineBreak;

    if qValidEmailemail.AsString = AEmail then
      AText := '';

    StrErr := AText;
    if StrErr <> EmptyStr then
      abort;

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ModalResult := mrNone;
      ShowMessage(StrErr + ' - ' + E.Message);
    end;

  end;

end;

function TModalDispEdit.ValidarEmail(const AEmail: string): Boolean;
const
  EmailRegexPattern = '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$';
begin

  Result := TRegEx.IsMatch(AEmail, EmailRegexPattern);

end;

procedure TModalDispEdit.CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TModalDispEdit.Execute(hostname: String; sistemaOperacional: String; Email: String; out StrErr: String): Boolean;
begin
  try
    StrErr := 'Erro ao Abrir QDispConected.';
    QDispConected.Close;
    QDispConected.CreateDataSet;
    QDispConected.Append;
    QDispConectedhostname.AsString := hostname;
    QDispConectedsistema_operacional_arq.AsString := sistemaOperacional;
    QDispConectedemail.AsString := Email;

    if ShowModal <> mrOk then
      abort;

    StrErr := 'Erro ao retornar valores.';
    Hostname := QDispConectedhostname.AsString;
    sistemaOperacional:= QDispConectedsistema_operacional_arq.AsString;
    Email:= QDispConectedemail.AsString;

    ReleaseInstance;
    StrErr := '';
    Result := True;
  except
    StrErr := 'Opera��o Abortada!';
    Result := False;
  end;
end;

class function TModalDispEdit.GetInstance: TModalDispEdit;
begin
  if not Assigned(FInstance) then
    FInstance := TModalDispEdit.Create(nil);
  Result := FInstance;
end;

class procedure TModalDispEdit.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

end.
