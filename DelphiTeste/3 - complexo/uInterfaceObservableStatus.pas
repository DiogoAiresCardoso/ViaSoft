unit uInterfaceObservableStatus;

interface

type
  iSubject = interface
    ['{A5EEA856-B666-4854-8756-E360A3DD5249}']
    function Atualizar(msg: String): iSubject;
  end;

  iObserver = interface
    ['{02743E54-A718-41D6-8896-2027FCDB882E}']
    function Add(poSubject: iSubject): iObserver;
    function Notify(msg: String): iObserver;
  end;

implementation

end.
