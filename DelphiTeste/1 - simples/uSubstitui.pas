unit uSubstitui;

interface

uses
  uISubstitui, Classes, SysUtils;

type
  TSubstituirString = class(TInterfacedObject, ISubstitui)
  private
    procedure GravarSaida(psOriginal, psVelho, psNovo, psAtual: String);
    { private declarations }
  protected
    { protected declarations }
    function RetornaStringPosicao(psStr: String; pnPosicao, pnCount: Integer): String;
  public
    { public declarations }
    function Substituir(Str, Velho, Novo: String): String;
  end;

implementation


{ TSubstituirString }

procedure TSubstituirString.GravarSaida(psOriginal, psVelho, psNovo, psAtual: String);
var
  oArqText: TextFile;
begin
  AssignFile(oArqText, ExtractFilePath(ParamStr(0)) + 'Resultado.txt');

  try
    ReWrite(oArqText);
    WriteLn(oArqText, 'String: ' + psOriginal);
    WriteLn(oArqText, 'Velho: ' + psVelho);
    WriteLn(oArqText, 'Novo: ' + psNovo);
    WriteLn(oArqText, 'Resultado: ' + psAtual);

  finally
    CloseFile(oArqText);
  end;
end;

function TSubstituirString.RetornaStringPosicao(psStr: String; pnPosicao, pnCount: Integer): String;
var
  nContador: Integer;
begin
  nContador := 1;
  Result := '';

  while nContador <= pnCount do
  begin
    Result := Result + psStr[pnPosicao];

    Inc(pnPosicao);
    Inc(nContador);
  end;
end;

function TSubstituirString.Substituir(Str, Velho, Novo: String): String;
var
  nContador: Integer;
  sParcString: String;
begin
  sParcString := '';
  nContador := 1;

  while nContador <= Length(Str) do
  begin
    if Velho = RetornaStringPosicao(Str, nContador, Length(Velho)) then
    begin
      sParcString := sParcString + Novo;
      Inc(nContador, Length(Velho));
      Continue;
    end
    else
      sParcString := sParcString + Str[nContador];

    Inc(nContador);
  end;

  Result := sParcString;
  GravarSaida(Str, Velho, Novo, Result);
end;

end.

