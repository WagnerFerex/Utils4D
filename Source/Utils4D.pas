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
  TUtils4D = class(TInterfacedObject)
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

{ TUtils4D }

constructor TUtils4D.Create;
begin

end;

function TUtils4D.DataSet(DataSet: TDataSet): IUtils4DDataSet;
begin

end;

destructor TUtils4D.Destroy;
begin

  inherited;
end;

function TUtils4D.Edit(Edit: TEdit): IUtils4DEdit;
begin

end;

function TUtils4D.Form(Form: TForm): IUtils4DForm;
begin

end;

class function TUtils4D.New: IUtils4D;
begin

end;

function TUtils4D.WebBrowser(WebBrowser: TWebBrowser): IUtils4DWebBrowser;
begin

end;

end.
