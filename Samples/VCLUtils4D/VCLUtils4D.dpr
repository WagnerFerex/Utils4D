program VCLUtils4D;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  Utils4D in '..\..\Source\Utils4D.pas',
  Utils4D.Interfaces in '..\..\Source\Utils4D.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
