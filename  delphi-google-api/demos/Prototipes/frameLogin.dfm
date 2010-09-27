object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Width = 206
  Height = 118
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 201
    Height = 113
    Caption = 'Authentification'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label2: TLabel
      Left = 112
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label3: TLabel
      Left = 2
      Top = 98
      Width = 197
      Height = 13
      Align = alBottom
      Alignment = taCenter
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitLeft = 3
    end
    object password: TEdit
      Left = 111
      Top = 37
      Width = 81
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Cache active'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button1: TButton
      Left = 119
      Top = 67
      Width = 75
      Height = 25
      Action = acLogin
      TabOrder = 2
    end
    object eMail: TComboBox
      Left = 16
      Top = 37
      Width = 89
      Height = 21
      TabOrder = 3
      OnSelect = eMailSelect
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 160
    Top = 8
    object acLogin: TAction
      Caption = 'Login'
      OnExecute = acLoginExecute
    end
  end
end
