object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'frmPrincipal'
  ClientHeight = 243
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 79
    Width = 281
    Height = 73
    Caption = 'Conectar elementos'
    TabOrder = 1
    object Label3: TLabel
      Left = 10
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Origem'
    end
    object Label2: TLabel
      Left = 102
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object edtElementoOrigem: TEdit
      Left = 10
      Top = 34
      Width = 86
      Height = 21
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtElementoDestino: TEdit
      Left = 102
      Top = 34
      Width = 81
      Height = 21
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnConectar: TButton
      Left = 189
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 65
    Caption = 'Criar elementos'
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 20
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object edtQtdElementos: TEdit
      Left = 10
      Top = 34
      Width = 86
      Height = 21
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Text = '5'
    end
    object btnCriar: TButton
      Left = 102
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 1
      OnClick = btnCriarClick
    end
  end
  object mmoStatus: TMemo
    Left = 295
    Top = 8
    Width = 242
    Height = 223
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 158
    Width = 281
    Height = 73
    Caption = 'Verificar conex'#227'o elementos'
    TabOrder = 3
    object Label1: TLabel
      Left = 10
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Origem'
    end
    object Label5: TLabel
      Left = 102
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object edtVerificaOrigem: TEdit
      Left = 10
      Top = 34
      Width = 86
      Height = 21
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtVerificaDestino: TEdit
      Left = 102
      Top = 34
      Width = 81
      Height = 21
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnVerificar: TButton
      Left = 189
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Verificar'
      TabOrder = 2
      OnClick = btnVerificarClick
    end
  end
end
