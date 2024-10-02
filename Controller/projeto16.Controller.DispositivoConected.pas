unit projeto16.Controller.DispositivoConected;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Projeto14.comuns.Types, projeto16.Model.DispositivoConected, projeto16.DAO.DispositivoConected;

type

  TDispositivoConectedController = class
  strict private
    class var FInstance: TDispositivoConectedController;
  private
    FDispositivoConectedModel: TDispositivoConectedModel;
    FDispositivoConectedDAO: TDispositivoConectedDAO;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TDispositivoConectedController;
    class procedure ReleaseInstance;

    function Open(var Query: TFDMemTable; AParams: Array of variant; out StrErr: string): Boolean;
    function validEmail(var Query: TFDMemTable; AParams: Array of variant; out StrErr: string): Boolean;
    function ValidDisp(var Query: TFDMemTable; AParams: Array of variant; out StrErr: string): Boolean;
    function New(out StrErr: string): Boolean;
    function Edit(Id: Integer; out StrErr: string): Boolean;
    function Delete(Id: Integer; out StrErr: string): Boolean;
    function Post(out StrErr: string): Boolean;
    function Upsert(out StrErr: string): Boolean;
    function Report(var Query: TFDMemTable; AReport: Integer; AParams: Array of variant; out StrErr: string): Boolean;

    property DispositivoConectedModel: TDispositivoConectedModel read FDispositivoConectedModel write FDispositivoConectedModel;
  end;

implementation

{ TDispositivoConectedController }

constructor TDispositivoConectedController.Create;
begin
  FDispositivoConectedModel := TDispositivoConectedModel.Create;
  FDispositivoConectedDAO := TDispositivoConectedDAO.Create;
end;

destructor TDispositivoConectedController.Destroy;
begin
  FreeAndNil(FDispositivoConectedDAO);
  FreeAndNil(FDispositivoConectedModel);

  inherited;
end;

class function TDispositivoConectedController.GetInstance: TDispositivoConectedController;
begin
  if not Assigned(FInstance) then
    FInstance := TDispositivoConectedController.Create;
  Result := FInstance;
end;

class procedure TDispositivoConectedController.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

function TDispositivoConectedController.Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Open(Query, AParams, StrErr);
end;

function TDispositivoConectedController.ValidDisp(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.ValidDisp(Query, AParams, StrErr);
end;


function TDispositivoConectedController.validEmail(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.validEmail(Query, AParams, StrErr);
end;

function TDispositivoConectedController.New(out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.New(FDispositivoConectedModel, StrErr);
end;

function TDispositivoConectedController.Edit(Id: Integer; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Edit(Id, FDispositivoConectedModel, StrErr);
end;

function TDispositivoConectedController.Delete(Id: Integer; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Delete(Id, StrErr);
end;

function TDispositivoConectedController.Post(out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Post(FDispositivoConectedModel, StrErr);
end;

function TDispositivoConectedController.Upsert(out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Upsert(FDispositivoConectedModel, StrErr);
end;

function TDispositivoConectedController.Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FDispositivoConectedDAO.Report(Query, AReport, AParams, StrErr);
end;

initialization

finalization

 TDispositivoConectedController.ReleaseInstance;
end.
