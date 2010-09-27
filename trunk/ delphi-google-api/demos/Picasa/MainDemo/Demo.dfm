object Form1: TForm1
  Left = 166
  Top = 108
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 448
    Top = 144
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Image1: TImage
    Left = 448
    Top = 168
    Width = 225
    Height = 233
  end
  inline FrmLogin1: TFrmLogin
    Left = 16
    Top = 16
    Width = 206
    Height = 118
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 16
    Top = 144
    Width = 201
    Height = 289
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 224
    Top = 144
    Width = 201
    Height = 289
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBox2Click
  end
end
