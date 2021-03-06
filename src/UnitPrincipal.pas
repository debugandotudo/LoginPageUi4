unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,FMX.Ani;

type
  TFrmPrincipal = class(TForm)
    TabControl: TTabControl;
    tabSignIn: TTabItem;
    tabSignUp: TTabItem;
    Rectangle2: TRectangle;
    layLogin: TLayout;
    imgLogin: TImage;
    layImgLogin: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    rectEmailSignIn: TRectangle;
    Rectangle1: TRectangle;
    lblEmailSignIn: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    edtEmailSignIn: TEdit;
    StyleBook1: TStyleBook;
    rectSenhaSignIn: TRectangle;
    lblSenhaSignIn: TLabel;
    Layout2: TLayout;
    Image2: TImage;
    edtSenhaSignIn: TEdit;
    Rectangle3: TRectangle;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    layCreate: TLayout;
    Layout3: TLayout;
    Image3: TImage;
    rectNameSignUp: TRectangle;
    lblNameSignUp: TLabel;
    Layout4: TLayout;
    Image4: TImage;
    edtNameSignUp: TEdit;
    rectPhoneSignUp: TRectangle;
    lblPhoneSignUp: TLabel;
    Layout5: TLayout;
    Image5: TImage;
    edtPhoneSignUp: TEdit;
    rectConfPassSignUp: TRectangle;
    lblConfPassSignUp: TLabel;
    Layout6: TLayout;
    Image6: TImage;
    edtConfPassSignUp: TEdit;
    rectPasswordSignUp: TRectangle;
    lblPasswordSignUp: TLabel;
    Layout7: TLayout;
    Image7: TImage;
    edtPasswordSignUp: TEdit;
    rectEmailSignUp: TRectangle;
    lblEmailSignUp: TLabel;
    Layout8: TLayout;
    Image8: TImage;
    edtEmailSignUp: TEdit;
    Rectangle4: TRectangle;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtEmailSignInEnter(Sender: TObject);
    procedure edtEmailSignInExit(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    procedure AnimaLabelEdit(lbl: Tlabel;const inverso : Boolean = False);
    procedure AnimaRectEdit(rect: TRectangle; const inverso : Boolean = False);
    { Private declarations }
  public
    { Public declarations }
    animacao,animacao2,animacao3: TFloatAnimation;
    animaColor : TColorAnimation;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}



procedure TFrmPrincipal.edtEmailSignInEnter(Sender: TObject);
var edt : TEdit;
    lbl : TLabel;

begin
  lbl := TLabel(FindComponent('lbl'+TEdit(Sender).TagString));
  edt :=   TEdit(Sender);

  with edt do
  begin
    TextPrompt := EmptyStr;
    Margins.Top := 6;
  end;
  TRectangle(FindComponent('rect'+ edt.TagString )).Tag := 1;

  AnimaLabelEdit( lbl );
  AnimaRectEdit( TRectangle(FindComponent('rect'+ edt.TagString )) );
end;
procedure TFrmPrincipal.edtEmailSignInExit(Sender: TObject);
var edt : TEdit;
    lbl : TLabel;

begin

  lbl := TLabel(FindComponent('lbl'+TEdit(Sender).TagString));
  edt :=   TEdit(Sender);

  with edt do
  begin
    TextPrompt := lbl.Text;
    Margins.Top := 15;
  end;
  TRectangle(FindComponent('rect'+ edt.TagString )).Tag := 1;
  AnimaLabelEdit( lbl , True);
  AnimaRectEdit( TRectangle(FindComponent('rect'+ edt.TagString )) ,True);
end;

procedure TFrmPrincipal.AnimaLabelEdit(lbl : TLabel; const inverso : Boolean = False);
begin

  animacao := TFloatAnimation.Create(lbl);
  with animacao do begin
    Parent       := lbl;
    PropertyName := 'Margins.Bottom';
    Duration     := 0.3;
    StartValue   := -(lbl.Height + lbl.Margins.Top);
    StopValue    := 0;
    Inverse      := inverso;
  end;

  animacao2 := TFloatAnimation.Create(lbl);
  with animacao2 do begin
    Parent       := lbl;
    PropertyName := 'Opacity';
    Duration     := 0.5;

    StartValue   := 0;
    StopValue    := 1;
    Inverse      := inverso;
  end;
  animacao.Start;
  animacao2.Start;
end;

procedure TFrmPrincipal.AnimaRectEdit(rect: TRectangle; const inverso : Boolean = False);
begin
  
  animacao3 := TFloatAnimation.Create(rect);
  with animacao3 do begin
    Parent       := rect;
    PropertyName := 'Opacity';
    Duration     := 0.5;
    StartValue   := 0.4;
    StopValue    := 1;
    Inverse      := inverso;
  end;
  animacao3.Start;

  animaColor := TColorAnimation.Create(rect);
    with animaColor do begin
    Parent       := rect;
    PropertyName := 'Fill.Color';
    Duration     := 0.5;
    StartValue   := $FF201A30;
    StopValue    := $FF534F65;
    Inverse      := inverso;
  end;
  animaColor.Start;


end;




procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  TabControl.TabIndex := tabSignIn.Index;

  edtEmailSignIn.TagString := 'EmailSignIn';
  edtSenhaSignIn.TagString := 'SenhaSignIn';


  edtNameSignUp.TagString     := 'NameSignUp';
  edtPhoneSignUp.TagString    := 'PhoneSignUp';
  edtEmailSignUp.TagString    := 'EmailSignUp';
  edtPasswordSignUp.TagString := 'PasswordSignUp';
  edtConfPassSignUp.TagString := 'ConfPassSignUp';


end;

procedure TFrmPrincipal.Image3Click(Sender: TObject);
begin
  TabControl.GotoVisibleTab(tabSignIn.Index);
end;

procedure TFrmPrincipal.Label6Click(Sender: TObject);
begin
  TabControl.GotoVisibleTab(tabSignUp.Index);
end;

procedure TFrmPrincipal.Label9Click(Sender: TObject);
begin
  TabControl.GotoVisibleTab(tabSignIn.Index);
end;

end.
