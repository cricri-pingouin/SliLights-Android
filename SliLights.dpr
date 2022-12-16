program SliLights;

uses
  System.StartUpCopy,
  FMX.Forms,
  MyLights in 'MyLights.pas' {HeaderFooterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.Run;
end.
