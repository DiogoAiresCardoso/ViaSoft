program QS8;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uNetwork in 'uNetwork.pas',
  uElemento in 'uElemento.pas',
  uinterfaceObservable in 'uinterfaceObservable.pas',
  uInterfaceObservableStatus in 'uInterfaceObservableStatus.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
