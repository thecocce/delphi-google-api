object Form1: TForm1
  Left = 182
  Top = 54
  Width = 696
  Height = 573
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 249
    Width = 688
    Height = 297
    Align = alClient
    Indent = 19
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 249
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 200
      Width = 22
      Height = 13
      Caption = 'URL'
    end
    inline FrmLogin1: TFrmLogin
      Left = 192
      Top = 8
      Width = 206
      Height = 118
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 16
      Top = 216
      Width = 657
      Height = 21
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 400
      Top = 8
      Width = 97
      Height = 113
      Caption = 'Method'
      ItemIndex = 0
      Items.Strings = (
        'GET'
        'PUT'
        'POST'
        'DELETE')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 128
      Width = 657
      Height = 65
      Caption = 'Params'
      TabOrder = 3
      object Memo1: TMemo
        Left = 2
        Top = 15
        Width = 653
        Height = 48
        Align = alClient
        TabOrder = 0
      end
    end
    object Button1: TButton
      Left = 528
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 4
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 8
      Width = 169
      Height = 113
      Caption = 'Service'
      TabOrder = 5
      object Label2: TLabel
        Left = 5
        Top = 64
        Width = 68
        Height = 13
        Caption = 'GData version'
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 80
        Top = 56
        Width = 49
        Height = 21
        TabOrder = 1
        Text = '3.0'
      end
    end
  end
end
