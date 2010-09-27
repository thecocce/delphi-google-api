object frmDebug: TfrmDebug
  Left = 235
  Top = 140
  Width = 696
  Height = 480
  Caption = 'DEBUG'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMinimized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 259
    Width = 688
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button13: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 0
      OnClick = Button13Click
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 41
    Width = 688
    Height = 218
    Align = alClient
    Indent = 19
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 0
    Top = 262
    Width = 688
    Height = 191
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
