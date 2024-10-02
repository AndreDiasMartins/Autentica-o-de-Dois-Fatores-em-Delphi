program Project16;

uses
  Vcl.Forms,
  Projeto16.view.Login in 'View\Projeto16.view.Login.pas' {fLogin},
  projeto16.Controller.Login in 'Controller\projeto16.Controller.Login.pas',
  Projeto14.Comuns.Types in 'COMUNS\Projeto14.Comuns.Types.pas',
  Projeto16.DAO.Connection in 'DAO\Projeto16.DAO.Connection.pas' {DAO: TDataModule},
  projeto16.DAO.Login in 'DAO\projeto16.DAO.Login.pas',
  projeto16.Model.Login in 'Model\projeto16.Model.Login.pas',
  Projeto16.view.Modal2F in 'View\Projeto16.view.Modal2F.pas' {fModal2F},
  projeto16.Controller.Tokens in 'Controller\projeto16.Controller.Tokens.pas',
  projeto16.DAO.Tokens in 'DAO\projeto16.DAO.Tokens.pas',
  projeto16.Model.Tokens in 'Model\projeto16.Model.Tokens.pas',
  projeto16.Controller.SendMail in 'Controller\projeto16.Controller.SendMail.pas',
  projeto16.Controller.Token in 'Controller\projeto16.Controller.Token.pas',
  Projeto16.view.Dashboard in 'View\Projeto16.view.Dashboard.pas' {fDashoboard},
  projeto16.Controller.ADispositivo in 'Controller\projeto16.Controller.ADispositivo.pas',
  projeto16.Controller.DispositivoConected in 'Controller\projeto16.Controller.DispositivoConected.pas',
  projeto16.DAO.DispositivoConected in 'DAO\projeto16.DAO.DispositivoConected.pas',
  projeto16.Model.DispositivoConected in 'Model\projeto16.Model.DispositivoConected.pas',
  Projeto16.view.LoginCadastro in 'View\Projeto16.view.LoginCadastro.pas' {fLoginCadastro},
  Projeto16.view.EditDisp in 'View\Projeto16.view.EditDisp.pas' {ModalDispEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDashoboard, fDashoboard);
  Application.CreateForm(TfLoginCadastro, fLoginCadastro);
  Application.CreateForm(TModalDispEdit, ModalDispEdit);
  Application.Run;
end.
