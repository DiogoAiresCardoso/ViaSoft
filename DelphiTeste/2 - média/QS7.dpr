program QS7;

uses
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas';

{$R *.RES}

begin
  uMaquina.TMaquina.Create.MontarTroco(1186.88);
end.

