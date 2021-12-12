unit uElemento;

interface

uses uinterfaceObservable, Generics.Collections, System.Classes, SysUtils;

type
  TElemento = class(TInterfacedObject, iObservable, iSubject)
  private
    { private declarations }

    FList: TList<iSubject>;
    FListIndiretamente: TList<iSubject>;
    FIndex: Integer;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(pnIndex: Integer);
    destructor Destroy; override;

    //observer
    function Add(poSubject: iSubject): iObservable;
    function Notify(poSubject: iSubject): iObservable;

    //subject
    function Update(poSubject: iSubject): iSubject;

    property prpIndex: Integer read FIndex;
    property prpListaDireta: TList<iSubject> read FList;
    property prpListaIndireta: TList<iSubject> read FListIndiretamente;
  end;

implementation

{ TElemento }

function TElemento.Add(poSubject: iSubject): iObservable;
begin
  if FList.IndexOf(poSubject) = -1 then
    FList.Add(poSubject);
end;

constructor TElemento.Create(pnIndex: Integer);
begin
  FList := TList<iSubject>.Create;
  FListIndiretamente := TList<iSubject>.Create;
  FIndex := pnIndex;
end;

destructor TElemento.Destroy;
begin
  FList.Clear;
  FListIndiretamente.Clear;

  FreeAndNil(FList);
  FreeAndNil(FListIndiretamente);
end;

function TElemento.Notify(poSubject: iSubject): iObservable;
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
  begin
    if FList.Items[I] <> poSubject then
      FList.Items[I].Update(poSubject);
  end;
end;

function TElemento.Update(poSubject: iSubject): iSubject;
begin
  if FList.Contains(poSubject) then
    Exit;

  if FListIndiretamente.Contains(poSubject) then
    Exit;

  FListIndiretamente.Add(poSubject);

  Notify(poSubject);
end;

end.
