unit Projeto16.view.Dashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ComObj, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Projeto16.view.LoginCadastro, Vcl.ExtCtrls;

type
  TfDashoboard = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Button4: TButton;
    Button2: TButton;
    consulta: TButton;
    edit: TButton;
    qUSers: TFDMemTable;
    qUSersid: TIntegerField;
    qUSerslogin: TWideStringField;
    qUSerssenha: TWideStringField;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DispoConsulta: TButton;
    EditDisp: TButton;
    DelEdit: TButton;
    QDispConected: TFDMemTable;
    dsDisp: TDataSource;
    QDispConectedid: TIntegerField;
    QDispConectedhostname: TWideStringField;
    QDispConectedsistema_operacional_arq: TWideStringField;
    QDispConectediduser: TIntegerField;
    QDispConectedemail: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure consultaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DispoConsultaClick(Sender: TObject);
    procedure EditDispClick(Sender: TObject);
    procedure DelEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDashoboard: TfDashoboard;

implementation

uses
  Projeto16.view.Login, Projeto16.Controller.Login, Vcl.Dialogs,
  Projeto16.Controller.DispositivoConected, Projeto16.view.EditDisp;

{$R *.dfm}

{ TfDashoboard }
procedure TfDashoboard.Button2Click(Sender: TObject);
var
  StrErr: String;
  ALogin: String;
  APassword: String;
begin
  try
    ALogin := '';
    APassword := '';

    if not TfLoginCadastro.GetInstance.Execute(dsInsert, ALogin, APassword, StrErr) then
      abort;

    if not TLoginController.GetInstance.New(StrErr) then
      abort;

    StrErr := 'Falha na atribuição de valores dos campos.';
    with TLoginController.GetInstance.LoginModel do
    begin
      Login := ALogin;
      Senha := APassword;
    end;

    if not TLoginController.GetInstance.Post(StrErr) then
      abort;

    consulta.Click;
    ShowMessage('Registro Cadastrado com sucesso.');
  except
    ShowMessage(StrErr);
  end;
end;

procedure TfDashoboard.Button4Click(Sender: TObject);
var
  StrErr: String;
begin
  try
    StrErr := 'Selecione o usuário desejado.';
    if qUSers.RecordCount = 0 then
      abort;

    StrErr := '';
    if MessageDLG('Deseja excluir o Usúario Selecionado? ' + qUSerslogin.AsString, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      abort;

    if not TLoginController.GetInstance.Delete(qUSersid.AsInteger, StrErr) then
      abort;

    consulta.Click;
  except
    ShowMessage(StrErr);
  end;

end;

procedure TfDashoboard.consultaClick(Sender: TObject);
var
  StrErr: String;
begin
  try
    if not TLoginController.GetInstance.Open(qUSers, ['%'], StrErr) then
      abort;
  except
    ShowMessage(StrErr);
  end;
end;

procedure TfDashoboard.DelEditClick(Sender: TObject);
var
  StrErr: String;
begin
  try

    StrErr := 'Voce precisa selecionar um Dispositivo antes!';
    if QDispConected.RecordCount = 0 then
      abort;

    if MessageDLG('Deseja excluir o Dispositivo Selecionado? ' + qUSerslogin.AsString, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      abort;

    if not TDispositivoConectedController.GetInstance.Delete(QDispConectedid.AsInteger, StrErr) then
      abort;

    ShowMessage('Dispositivo Excluido com Sucesso!');
    DispoConsulta.Click;

  except
    ShowMessage(StrErr);
  end;

end;

procedure TfDashoboard.DispoConsultaClick(Sender: TObject);
var
  StrErr: String;
begin
  try

    if not TDispositivoConectedController.GetInstance.Open(QDispConected, ['%'], StrErr) then
      abort;

  except
    ShowMessage(StrErr);

  end;

end;

procedure TfDashoboard.editClick(Sender: TObject);
var
  StrErr: string;
  ALogin: String;
  APassword: String;
begin
  try
    StrErr := 'Voce precisa selecionar um Aluno antes!';
    if qUSers.RecordCount = 0 then
      abort;

    StrErr := 'Falha na atribuição de valores dos campos.';
    ALogin := qUSerslogin.AsString;
    APassword := qUSerssenha.AsString;

    if not TfLoginCadastro.GetInstance.Execute(dsUpdate, ALogin, APassword, StrErr) then
      abort;

    if not TLoginController.GetInstance.edit(qUSersid.AsInteger, StrErr) then
      abort;

    with TLoginController.GetInstance.LoginModel do
    begin
      id := id;
      Login := ALogin;
      Senha := APassword;
    end;

    if not TLoginController.GetInstance.Post(StrErr) then
      abort;

    consulta.Click;
    ShowMessage('Registro alterado com sucesso.');
  except
    ShowMessage(StrErr);

  end;

end;

procedure TfDashoboard.EditDispClick(Sender: TObject);
var
  StrErr: String;
  Ahostname: String;
  AsistemaOperacional: String;
  AEmail: String;
begin
  try
    StrErr := 'Voce precisa selecionar um Aluno antes!';
    if QDispConected.RecordCount = 0 then
      abort;

    if not TDispositivoConectedController.GetInstance.edit(QDispConectedid.AsInteger, StrErr) then
      abort;

    with TDispositivoConectedController.GetInstance.DispositivoConectedModel do
    begin
      Ahostname := Hostname;
      AsistemaOperacional := Sistema_operacional_arq;
      AEmail := Email;
    end;

    if not TModalDispEdit.GetInstance.Execute(Ahostname, AsistemaOperacional, AEmail, StrErr) then
      abort;

    ShowMessage(Ahostname);
    ShowMessage(AsistemaOperacional);

    with TDispositivoConectedController.GetInstance.DispositivoConectedModel do
    begin
      Hostname := Ahostname;
      Sistema_operacional_arq := AsistemaOperacional;
      Email := AEmail;
    end;

    if not TDispositivoConectedController.GetInstance.Post(StrErr) then
      abort;

    consulta.Click;
    ShowMessage('Registro alterado com sucesso.');
  except
    ShowMessage(StrErr);
  end;
end;

procedure TfDashoboard.FormShow(Sender: TObject);
var
  StrErr: string;
begin
  try
    if not TfLogin.GetInstance.Execute(StrErr) then
      abort;

  except
    ShowMessage(StrErr);
    Close
  end;
end;

end.
