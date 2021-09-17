unit Utils4D.Interfaces;

interface

uses
  System.Classes,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.OleCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  SHDocVw;

type
  IUtils4DDataSet = interface;
  IUtils4DEdit = interface;
  IUtils4DWebBrowser = interface;
  IUtils4DForm = interface;
  IUtils4DSystem = interface;

  eEndereco = record
    CEP: string;
    Logradouro: string;
    Complemento: string;
    Bairro: string;
    Localidade: string;
    UF: string;
    IBGE: string;
    GIA: string;
    DDD: string;
  end;

  IUtils4D = interface
    ['{C3DA6D31-8A16-4972-985F-01DA290E7217}']
    function DataSet(DataSet: TDataSet): IUtils4DDataSet;
    function Edit(Edit: TEdit): IUtils4DEdit;
    function WebBrowser(WebBrowser: TWebBrowser): IUtils4DWebBrowser;
    function Form(Form: TForm): IUtils4DForm;
    function System: IUtils4DSystem;
  end;

  IUtils4DDataSet = interface
    ['{F12118D5-FDEA-4DFD-B08C-3ACC10FDCAE8}']
    function ToJSON: string;
    function xExport(AFileName: string): IUtils4DDataSet;
    function LoadFromExcel(AFileName: string): IUtils4DDataSet;
    function LoadFromCSV(AFileName: string): IUtils4DDataSet;
    function LoadFromTxt(AFileName: string; Delimiter: string): IUtils4DDataSet;
  end;

  IUtils4DServices = interface
    ['{0627EDCB-8776-476D-9113-BAC1B9E9AC11}']
    function BuscaCEP(CEP: string): eEndereco;
  end;

  IUtils4DEdit = interface
    ['{9F363F56-F3AA-4022-9426-ADD41FB2C50E}']
    function SetStyle(AMask: string): IUtils4DEdit;
    function NumberOnly: IUtils4DEdit;
  end;

  IUtils4DWebBrowser = interface
    ['{AEAC624D-2925-493A-9CBA-D57C94B5B137}']
    procedure RegisterIEv11;
  end;

  IUtils4DForm = interface
    ['{C81CD59D-5FCB-42AF-AA18-5F3EFA9DB294}']
    function ClearComponents: IUtils4DForm;
    function SetStyleComponents(AClass: TComponentClass; ColorBackground: Integer; FontName: string; FontSize: Integer; FontColor: TColor): IUtils4DForm; overload;
    //function SetStyleComponents(Component: T; ColorBackground: Integer; FontName: string; FontSize: Integer; FontColor: TColor): IUtils4DForm; overload;
    function SetStyleComponents(ColorBackground: Integer; FontName: string; FontSize: Integer; FontColor: TColor): IUtils4DForm; overload;
  end;

  IUtils4DSystem = interface
    ['{9FD3F7B2-88BA-4966-AB96-61BFDAEA1B7F}']
    function NextDlgCtrl: IUtils4DSystem;
    function LogException: IUtils4DSystem;
  end;

implementation

end.
