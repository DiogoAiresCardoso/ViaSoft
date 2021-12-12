program QS6;

uses
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.RES}

begin
  uSubstitui.TSubstituirString.Create.Substituir('O rato roeu a roupa do rei de roma', 'ro', 'teste');
end.

