unit uinterfaceObservable;

interface

type

  iSubject = interface
    ['{22ABD87C-2A4D-4C87-B9AE-4A1C60487629}']
    function Update(poSubject: iSubject): iSubject;
  end;

  iObservable = interface
    ['{3737232C-024C-4F36-B439-F367B92F717D}']
    function Add(poSubject: iSubject): iObservable;
    function Notify(poSubject: iSubject): iObservable;
  end;

implementation

end.
