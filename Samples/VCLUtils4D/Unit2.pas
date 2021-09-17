unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.StrUtils;

type
  TForm2 = class(TForm)
    btnCancelar: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSalvar: TBitBtn;
    edtCEP: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure HabDesEndereco(Flag: Boolean);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Utils4D.ViaCEP, Utils4D.eMail, System.MaskUtils;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  TUtils4DeMail
    .New(465, 'smtp.gmail.com', 'sistemadelphi16122020@gmail.com', 'teste16122020*')
//      .ReplyToAddress('')
//      .Attachment('Local do arquivo PDF')
      .Subject('Cadastro de Cliente InfoSistemas')
      .FromAddress('sistemadelphi16122020@gmail.com')       // remetente
      .FromName('TESTE INFOSISTEMAS')
      .RecipientsAddress('sistemadelphi16122020@gmail.com') // destinatário

      .AddBody('<html><head><meta content=''text/html; charset=iso-8859-1'' http-equiv=''Content-Type'' />')
      .AddBody('<title>EMAIL AUTOMATICO - Cliente '+ '<NOMECLIENTE>' +'</title> </head>')
      .AddBody('<body bgcolor=''#FFFFFF''>')
      .AddBody('<p><b> Nome : </b>' + '<NOME_CLIENTE>')
      .AddBody('<p><b> CPF : </b>' + FormatMaskText('999.999.999-99;0;_', '<CPF_CLIENTE>'))
      .AddBody('<p><b> Identidade : </b>' + '<RG_CLIENTE>')
      .AddBody('<p><b> DDD : </b>' + '<DDD>')
      .AddBody('<p><b> Telefone : </b>' + FormatMaskText('99999-9999;0;_', '<TELEFONE>'))
      .AddBody('<p><b> E-mail : </b>' + '<EMAIL>')
      .AddBody('<p><b> CEP : </b>' + FormatMaskText('99.999-999;0;_', '<CEP>'))
      .AddBody('<p><b> Logradouro : </b>' + '<LOGRADOURO>')
      .AddBody('<p><b> Número : </b>' + 'NUMERO')
      .AddBody('<p><b> Complemento : </b>' + 'COMPLEMENTO')
      .AddBody('<p><b> Bairro : </b>' + '<BAIRRO>')
      .AddBody('<p><b> Cidade : </b>' + 'CIDADE')
      .AddBody('<p><b> Estado : </b>' + 'ESTADO')
      .AddBody('<p><b> País : </b>' + 'PAIS')
      .AddBody('</body></html>')
    .Send;
end;

procedure TForm2.HabDesEndereco(Flag: Boolean);
var
  LColor: TColor;

begin
  if Flag then
    LColor := clWhite
  else
    LColor := clBtnFace;

  Edit1.Enabled := Flag;
  Edit1.Text := IfThen(Flag, Trim(Edit1.Text));
  Edit1.Color := LColor;

  Edit2.Enabled := Flag;
  Edit2.Text := IfThen(Flag, Trim(Edit2.Text));
  Edit2.Color := LColor;

  Edit3.Enabled := Flag;
  Edit3.Text := IfThen(Flag, Trim(Edit3.Text));
  Edit3.Color := LColor;

  Edit4.Enabled := Flag;
  Edit4.Text := IfThen(Flag, Trim(Edit4.Text));
  Edit4.Color := LColor;

  Edit5.Enabled := Flag;
  Edit5.Text := IfThen(Flag, Trim(Edit5.Text));
  Edit5.Color := LColor;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  Result: IBuscaCEP;

begin
  try
    Result := TViaCEP.New.Buscar(edtCEP.Text);

    Edit1.Text := Result.UF;
    Edit2.Text := Result.Logradouro;
    Edit3.Text := Result.IBGE;
    Edit4.Text := Result.Bairro;
    Edit5.Text := Result.Localidade;
  //  Edit6.Text := Result.CEP;
  //  Edit1.Text := Result.Complemento;
  //  Edit1.Text := Result.GIA;
  //  Edit1.Text := Result.DDD;
    HabDesEndereco(True);
  except
    edtCEP.Clear;
  end;
end;

end.
