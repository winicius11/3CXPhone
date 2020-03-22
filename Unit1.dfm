object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ativar telefone'
  ClientHeight = 136
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    320
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 103
    Width = 304
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
    ExplicitTop = 253
  end
  object edtBranch: TLabeledEdit
    Left = 8
    Top = 76
    Width = 304
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Ramal'
    TabOrder = 1
    OnKeyUp = edtBranchKeyUp
  end
  object edtName: TLabeledEdit
    Left = 8
    Top = 21
    Width = 304
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
    OnKeyUp = edtNameKeyUp
  end
end
