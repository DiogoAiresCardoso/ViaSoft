unit uNetwork;

interface

uses Generics.Collections, uElemento, uInterfaceObservableStatus;

type
  TNetwork = class(TInterfacedObject, iObserver)
  private
    { private declarations }
    FList: TList<iSubject>;
    FQtdElementos: Integer;
    FElementos: TDictionary<Integer,TElemento>;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(pnQtdElementos: Integer);
    destructor Destroy; override;

    procedure CriarElementos;

    procedure Connect(pnIndexOrigem, pnIndexDestino: Integer);
    function Query(pnIndexOrigem, pnIndexDestino: Integer): Boolean;


    function Add(poSubject: iSubject): iObserver;
    function Notify(msg: String): iObserver;
  end;

implementation

uses
  System.SysUtils;

{ TNetwork }

function TNetwork.Add(poSubject: iSubject): iObserver;
begin
  if FList.IndexOf(poSubject) <= 0 then
    FList.Add(poSubject);
end;

procedure TNetwork.Connect(pnIndexOrigem, pnIndexDestino: Integer);
var
  oOrigem, oDestino: TElemento;
begin
  oOrigem := FElementos.Items[pnIndexOrigem];
  oDestino := FElementos.Items[pnIndexDestino];

  oOrigem.Add(oDestino);
  oDestino.Add(oOrigem);

  oOrigem.Notify(oDestino);
  oDestino.Notify(oOrigem);
end;

constructor TNetwork.Create(pnQtdElementos: Integer);
begin
  FList         := TList<iSubject>.Create;
  FQtdElementos := pnQtdElementos;
  FElementos    := TDictionary<Integer,TElemento>.Create;
end;

procedure TNetwork.CriarElementos;
var
  I: Integer;
begin
  for I := 0 to Pred(FQtdElementos) do
  begin
    FElementos.Add(I, TElemento.Create(I));
    Notify('Criado elemento ' + IntToStr(I));
  end;
end;

destructor TNetwork.Destroy;
begin
  FList.Clear;
  FElementos.Clear;

  FreeAndNil(FList);
  FreeAndNil(FElementos);
end;

function TNetwork.Notify(msg: String): iObserver;
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
    FList.Items[I].Atualizar(msg);
end;

function TNetwork.Query(pnIndexOrigem, pnIndexDestino: Integer): Boolean;
var
  oOrigem, oDestino: TElemento;
begin
  oOrigem := FElementos.Items[pnIndexOrigem];
  oDestino := FElementos.Items[pnIndexDestino];

  Result := ((oOrigem.prpListaDireta.Contains(oDestino)) or (oOrigem.prpListaIndireta.Contains(oDestino)));
  Notify(BoolToStr(Result, True));
end;

end.
