program ListBoxFrame;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntMain in 'UntMain.pas' {frmMain},
  frameList in 'frameList.pas' {frameListExample: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
