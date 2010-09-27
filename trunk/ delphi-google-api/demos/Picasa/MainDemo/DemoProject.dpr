program DemoProject;

uses
  Forms,
  Demo in 'Demo.pas' {Form1},
  GPicasa in '..\..\..\source\GPicasa.pas',
  frameLogin in '..\..\Prototipes\frameLogin.pas' {FrmLogin: TFrame},
  DebugUnit in '..\..\Common\DebugUnit.pas' {frmDebug};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
