unit Utils4D;

interface

uses
  System.Classes,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.OleCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  SHDocVw,
  Utils4D.Interfaces;

type
  TUtils4D = class(TInterfacedObject, IUtils4D)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IUtils4D;
    function DataSet(DataSet: TDataSet): IUtils4DDataSet;
    function Edit(Edit: TEdit): IUtils4DEdit;
    function WebBrowser(WebBrowser: TWebBrowser): IUtils4DWebBrowser;
    function Form(Form: TForm): IUtils4DForm;
  end;

implementation

end.
