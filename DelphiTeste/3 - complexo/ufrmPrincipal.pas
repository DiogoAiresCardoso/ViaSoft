unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uInterfaceObservableStatus, uNetwork;

type
  TfrmPrincipal = class(TForm, iSubject)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtElementoOrigem: TEdit;
    Label2: TLabel;
    edtElementoDestino: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edtQtdElementos: TEdit;
    btnCriar: TButton;
    btnConectar: TButton;
    mmoStatus: TMemo;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    edtVerificaOrigem: TEdit;
    edtVerificaDestino: TEdit;
    btnVerificar: TButton;
    procedure btnCriarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
    FNetwork: TNetwork;
  public
    { Public declarations }
    function Atualizar(msg: String): iSubject;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }


procedure TfrmPrincipal.btnCriarClick(Sender: TObject);
begin
  FNetwork := TNetwork.Create(StrToInt(edtQtdElementos.Text));
  FNetwork.Add(Self);
  FNetwork.CriarElementos;
end;

procedure TfrmPrincipal.btnVerificarClick(Sender: TObject);
begin
  FNetwork.Query(StrToInt(edtVerificaOrigem.Text), StrToInt(edtVerificaDestino.Text));
end;

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  FNetwork.Connect(StrToInt(edtElementoOrigem.Text), StrToInt(edtElementoDestino.Text));
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FNetwork.Free;
end;

function TfrmPrincipal.Atualizar(msg: String): iSubject;
begin
  mmoStatus.Lines.Add('------------');
  mmoStatus.Lines.Add(msg);
end;

end.
