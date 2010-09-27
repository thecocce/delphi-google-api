unit HTTPTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, frameLogin, ComCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Panel1: TPanel;
    FrmLogin1: TFrmLogin;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Ghttp,XMLIntf,XMLDoc,GGlobal,GLogin,strutils,clipbrd;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var method:TGRequestMethod;
    doc:IXMLDocument;
    i:integer;
    s:string;
begin
     case RadioGroup1.ItemIndex of
          1:method:=rPUT;
          2:method:=rPOST;
          3:method:=rDELETE;
          else method:=rGET;
     end;    // case

     s:=edit1.Text;

     for i:=0 to memo1.Lines.count-1 do
         s:=s+ifthen(i=0,'?','&')+memo1.Lines[i];

     doc:=NewXMLDocument();
     Doc.Encoding:=GCharSet;
     if frmLogin1.Account.SendRequest(method,edit2.Text,s,doc).Ok then
        TreeView1.Items.clear;
        XMLToTreeview('RESULT',TreeView1,doc);
        TreeView1.Items[0].Expand(false);
        TreeView1.Items[0].Item[1].Expand(false);

     clipboard.AsText:=s+'&auth='+FrmLogin1.Account.Auth;
end;

procedure TForm1.FormCreate(Sender: TObject);
var s:TGLoginService;
begin
     for s:=low(TGLoginService) to high(TGLoginService) do
         combobox1.items.add(GLoginService[s]);
     combobox1.ItemIndex:=ord(gsContacts);
     FrmLogin1.Initialize(gsContacts);

end;

end.
