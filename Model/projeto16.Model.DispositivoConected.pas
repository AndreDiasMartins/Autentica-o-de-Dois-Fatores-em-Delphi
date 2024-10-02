unit projeto16.Model.DispositivoConected;

interface

uses
  Dialogs;

type
  TDispositivoConectedModel = class
  private
    FId: Integer;
    FHostname: string;
    FSistema_operacional_arq: string;
    FIduser: Integer;
    FEmail: String;
  public
    constructor Create;
    destructor Destroy; override;

    property ID: Integer read FId write FId;
    property Hostname: string read FHostname write FHostname;
    property Sistema_operacional_arq: string read FSistema_operacional_arq write FSistema_operacional_arq;
    property Iduser: Integer read FIduser write FIduser;
    property Email: String read FEmail write FEmail;
  end;

implementation

{ TDispositivoConectedModel }

constructor TDispositivoConectedModel.Create;
begin

end;

destructor TDispositivoConectedModel.Destroy;
begin

  inherited;
end;

end.

//  with FDispositivoConectedController.DispositivoConectedModel do
//  begin
//    QUERYid.AsInteger:= Id;
//    QUERYhostname.AsString:= Hostname;
//    QUERYsistema_operacional_arq.AsString:= Sistema_operacional_arq;
//    QUERYiduser.AsInteger:= Iduser;
//  end;

//  with FDispositivoConectedController.DispositivoConectedModel do
//  begin
//    Id:= QUERYid.AsInteger;
//    Hostname:= QUERYhostname.AsString;
//    Sistema_operacional_arq:= QUERYsistema_operacional_arq.AsString;
//    Iduser:= QUERYiduser.AsInteger;
//  end;

// if not FDispositivoConectedController.New(StrErr) then
//   Abort;

// if not FDispositivoConectedController.Edit(id, StrErr) then
//   Abort;

// if not FDispositivoConectedController.Delete(id, StrErr) then
//   Abort;

// if not FDispositivoConectedController.Post(StrErr) then
//   Abort;

// if not FDispositivoConectedController.Open(Query, [], StrErr) then
//   Abort;
