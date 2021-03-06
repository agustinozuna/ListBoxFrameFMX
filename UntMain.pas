unit UntMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Effects, FMX.MultiView, FMX.ListBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frameList, FMX.Edit, FMX.SearchBox;

type
  TfrmMain = class(TForm)
    layout_principal: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    img_menu: TImage;
    ShadowEffect2: TShadowEffect;
    mtvMenu: TMultiView;
    rect_menu: TRectangle;
    AnimationMenu: TFloatAnimation;
    Layout5: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Path1: TPath;
    Layout4: TLayout;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    lytExit: TLayout;
    lytIcoExit: TLayout;
    pthIcoExit: TPath;
    lytTextExit: TLayout;
    lblExit: TLabel;
    speLogoff: TSpeedButton;
    Rectangle4: TRectangle;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Circle3: TCircle;
    Circle4: TCircle;
    ShadowEffect1: TShadowEffect;
    ListBoxExample: TListBox;
    StyleBook1: TStyleBook;
    SearchBox1: TSearchBox;
    lytCont: TLayout;
    FDMemTable: TFDMemTable;
    FDMemTableID_VEHICULO: TIntegerField;
    FDMemTableCHAPA: TStringField;
    FDMemTableMARCA: TStringField;
    FDMemTableANHO: TIntegerField;
    FDMemTableFECHA: TDateTimeField;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure Close_Menu();
begin
  with frmMain do
  begin
    mtvMenu.Mode := TMultiViewMode.Drawer;
  end;
end;

procedure Open_Menu();
begin
  with frmMain do
  begin
    mtvMenu.Mode := TMultiViewMode.Panel;
  end;
end;

procedure Menu();
var
  larg_screen: Integer;
begin
{$IFDEF ANDROID}
  larg_screen := Screen.width;
{$ENDIF}
{$IFDEF MSWINDOWS}
  larg_screen := frmMain.width;
{$ENDIF}
  with frmMain do
  begin
    begin
      if (larg_screen < 600) then
      begin
        // Si la pantalla es menor a 600 se cerrara el menu(cambia de modo a Drawer)
        Close_Menu;
      end;

      if (larg_screen >= 600) then
      begin
        // Si la pantalla es mayor a 599 se abrira el menu (cambia de modo a Panel)
        Open_Menu;
      end;
    end;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Menu();
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  item: TListBoxItem;
  vFrame: TframeListExample;
begin
  ListBoxExample.Clear;
  ListBoxExample.BeginUpdate;
  FDMemTable.First;
  while not FDMemTable.Eof do
  begin
      item := TListBoxItem.Create(self);
      vFrame := TframeListExample.Create(self);
      vFrame.Name:= 'Frame'+FDMemTable.FieldByName('ID_VEHICULO').AsString;;
      vFrame.Align := TAlignLayout.Client;
      vFrame.Parent := item;
      // ---------------------------------------
      //for the search by (CHAPA) and (MARCA)
      item.Text := FDMemTable.FieldByName('CHAPA').AsString+' '+ FDMemTable.FieldByName('MARCA').AsString;
      //Text visible:= false in style designer
      // ---------------------------------------
      item.Height := 167;
      item.Margins.Left:= 3;
      item.Margins.Right:= 3;
      item.Margins.Top:= 3;
      item.Margins.Bottom:= 3;
      vFrame.lblTituloPrincipal.Text :=  FDMemTable.FieldByName('CHAPA').AsString;
      vFrame.lblSubTitu1.Text :=   FDMemTable.FieldByName('FECHA').AsString;
      vFrame.lblSubTitu2.Text :=   FDMemTable.FieldByName('MARCA').AsString;
      vFrame.lblSubTitu3.Text :=   FDMemTable.FieldByName('ANHO').AsString;
      item.Parent := ListBoxExample;

    FDMemTable.Next;
  end;
  ListBoxExample.EndUpdate;

end;

end.
