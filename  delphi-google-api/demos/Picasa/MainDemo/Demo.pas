unit Demo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frameLogin,GPicasa, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    FrmLogin1: TFrmLogin;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label1: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
  private
    { Private declarations }
    Albumns:TGPicasaManager;
    procedure OnLogin(sender:TObject);
    function CurrentAlbum:TGPicasaAlbum;
    function CurrentPhoto:TGPicasaPhoto;
    procedure ShowPhoto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses GLogin,GHttp;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
     frmlogin1.Initialize(gsPicasa);
     FrmLogin1.OnLogin:=onLogin;
end;

procedure TForm1.OnLogin(sender: TObject);
begin
     if FrmLogin1.Account.Logged then begin
        Albumns:=TGPicasaManager.Create(self,FrmLogin1.Account);
        Albumns.Retrieve;
        Albumns.show(ListBox1.items);
     end else
         Albumns.Free;
end;

function TForm1.CurrentAlbum: TGPicasaAlbum;
begin
     result:=Albumns.Album(ListBox1.itemindex);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
     with CurrentAlbum do begin
          GShowPhotoIn(CaratulaUrl,Image1);
          photos.Retrieve;
          photos.show(ListBox2.items);
     end;
end;

function TForm1.CurrentPhoto: TGPicasaPhoto;
begin
     result:=CurrentAlbum.Photos.Photo(ListBox2.ItemIndex);
end;

procedure TForm1.ShowPhoto;
begin
     label1.Caption:=(currentphoto.PhotoUrl);
     GShowPhotoIn(currentphoto.PhotoUrl,Image1);
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
     ShowPhoto;
end;

end.
