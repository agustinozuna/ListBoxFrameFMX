unit frameList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Effects;

type
  TframeListExample = class(TFrame)
    lyCont: TLayout;
    reCont: TRectangle;
    lytAccessory: TLayout;
    pthBtnAccess: TPath;
    speAccess: TSpeedButton;
    Layout1: TLayout;
    lblSubTitu1: TLabel;
    lblSubTitu2: TLabel;
    lblSubTitu3: TLabel;
    lytBtnMostrarVehiculo: TLayout;
    pthVerVehiculo: TPath;
    speMostrarVehiculo: TSpeedButton;
    lblTituloPrincipal: TLabel;
    ListBoxItemStyle1: TRectangle;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
