unit frameLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls,GClientLoginAuth,GLogin;

type
  TFrmLogin = class(TFrame)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    password: TEdit;
    ActionList1: TActionList;
    acLogin: TAction;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Button1: TButton;
    eMail: TComboBox;
    procedure acLoginExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure eMailSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     Account:TClientLoginAuth;
     OnLogin:TNotifyEvent;
     procedure Initialize(const pService:TGLoginService; const pTitle:string='');
     procedure DisableCache;
  end;

implementation

uses StrUtils;
{$R *.dfm}

const root='..\..\Prototipes\';

procedure TFrmLogin.acLoginExecute(Sender: TObject);
begin
     Account.CachesActive:=CheckBox1.checked;

     if Account.logged then begin
        Account.logout;
     end else begin
        Account.Email:=email.text;
        Account.Password:=password.text;
        try
           GroupBox1.enabled:=false;
           Account.login();
           Label3.Caption:=Account.LastResultText;
        finally
               GroupBox1.enabled:=true;
        end;
     end;

     Label3.Caption:=account.LastResultText;
     aclogin.Caption:=ifthen(account.logged,'Logout','Login');
     if assigned(onLogin) then onLogin(sender);
end;

procedure TFrmLogin.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
     email.enabled:=            assigned(Account) and (not Account.Logged);
     password.enabled:=         email.enabled;
     aclogin.enabled:=(trim(email.Text)<>'') and (trim(password.Text)<>'');
end;

procedure TFrmLogin.CheckBox1Click(Sender: TObject);
begin
     if assigned(account) then
        Account.CachesActive:=CheckBox1.checked;
end;

procedure TFrmLogin.DisableCache;
begin
    if assigned(Account) then account.CachesActive:=false;
    checkbox1.Checked:=false;
    CheckBox1.visible:=false;

end;

procedure TFrmLogin.eMailSelect(Sender: TObject);
begin
  if fileexists(root+'pwdlist.sec') then
  with TStringList.Create do
  try
    loadfromfile(root+'pwdlist.sec');
    if count>=email.ItemIndex then
      password.Text:=strings[email.ItemIndex];
  finally
    free;
  end;
end;

procedure TFrmLogin.Initialize(const pService: TGLoginService; const pTitle:string='');
begin
     Account:=TClientLoginAuth.Create(self);
     Account.Service:=pService;
     if pTitle<>'' then
        GroupBox1.caption:=pTitle;
     if fileexists(root+'emaillist.sec') then
      email.Items.LoadFromFile(root+'emaillist.sec');
end;

end.
