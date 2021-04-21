unit RegisterKey;

interface

uses
  Winapi.Windows;

type
  TRegisterKey = class
  private
    procedure DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
  public
    class function New: TRegisterKey;
  end;

var
  RegisterKey: TRegisterKey;

implementation

uses
  Vcl.Forms, Winapi.Messages;

{ TRegisterKey }

procedure TRegisterKey.DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.message  = WM_KEYDOWN then
  begin
    if Msg.wParam = VK_RETURN then
    begin
      keybd_event(VK_TAB, 0, 0, 0);
      Handled := true;
    end;
  end;
end;

class function TRegisterKey.New: TRegisterKey;
begin
  Result := Self.Create;
end;

end.
