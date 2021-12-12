unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  private
    function AdicionarTroco(poLista: TList; poCedula: TCedula): Double;
    procedure MontarTrocoReal(pnValorReal: Double; Lista: TList);
    procedure GravarSaida(poLista: TList; pnValorEntrada: Double);
  public
    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses math, SysUtils, IniFiles;


function TMaquina.AdicionarTroco(poLista: TList; poCedula: TCedula): Double;
var
  oTroco: TTroco;
  I: Integer;
begin
  //adicionando já existente
  for I := 0 to Pred(poLista.Count) do
  begin
    if TTroco(poLista.Items[I]).GetTipo = poCedula then
    begin
      TTroco(poLista.Items[I]).SetQuantidade(TTroco(poLista.Items[I]).GetQuantidade + 1);
      Result := TTroco(poLista.Items[I]).GetValorCedula(poCedula);
      Exit
    end;
  end;

  //criando novo
  oTroco := TTroco.Create(poCedula, 1);
  poLista.Add(oTroco);

  Result := oTroco.GetValorCedula(poCedula);
end;

procedure TMaquina.GravarSaida(poLista: TList; pnValorEntrada: Double);
var
  oArqText: TextFile;
  I: Integer;
  Msg: String;
begin
  AssignFile(oArqText, ExtractFilePath(ParamStr(0)) + 'Resultado.txt');

  try
    ReWrite(oArqText);

    Msg := 'Entrada de: ' + FloatToStr(pnValorEntrada);
    WriteLn(oArqText, Msg);

    Msg := 'Troco';
    WriteLn(oArqText, Msg);
    for I := 0 to Pred(poLista.Count) do
    begin
      Msg := IntToStr(TTroco(poLista.Items[I]).GetQuantidade);

      case TTroco(poLista.Items[I]).GetTipo of
        ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2: Msg := Msg + ' - nota de ';
        ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1: Msg := Msg + ' - moeda de ';
      end;

      Msg := Msg + FloatToStr(TTroco(poLista.Items[I]).GetValorCedula(TTroco(poLista.Items[I]).GetTipo));

      WriteLn(oArqText, Msg);
    end;
  finally
    CloseFile(oArqText);
  end;
end;

function TMaquina.MontarTroco(Troco: Double): TList;
begin
  Result := TList.Create;

  MontarTrocoReal(RoundTo(Troco, -2), Result);

  GravarSaida(Result, Troco);
end;

procedure TMaquina.MontarTrocoReal(pnValorReal: Double; Lista: TList);

  function VerificarValor(pnValor: Double; poCedula: TCedula): Boolean;
  begin
    Result := (pnValorReal / pnValor) >= 1;
    if Result then
      pnValorReal := RoundTo(pnValorReal - AdicionarTroco(Lista, poCedula), -2);
  end;

begin
  while pnValorReal > 0 do
  begin
    if VerificarValor(100, ceNota100) then Continue;
    if VerificarValor(50, ceNota50) then Continue;
    if VerificarValor(20, ceNota20) then Continue;
    if VerificarValor(10, ceNota10) then Continue;
    if VerificarValor(5, ceNota5) then Continue;
    if VerificarValor(2, ceNota2) then Continue;
    if VerificarValor(1, ceMoeda100) then Continue;
    if VerificarValor(0.50, ceMoeda50) then Continue;
    if VerificarValor(0.25, ceMoeda25) then Continue;
    if VerificarValor(0.10, ceMoeda10) then Continue;
    if VerificarValor(0.05, ceMoeda5) then Continue;
    if VerificarValor(0.01, ceMoeda1) then Continue;
  end;
end;

end.

