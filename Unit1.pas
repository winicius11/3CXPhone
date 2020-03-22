unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.ShellAPI,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edtBranch: TLabeledEdit;
    edtName: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure edtNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBranchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ActivateButton;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  PROFILE0 = 'Profile0';
  PASSWORD = '';

  PBXADDR = '';
  CXPHONE = 'C:\Program Files (x86)\3CXPhone\3CXPhone.exe';

procedure TForm1.ActivateButton;
begin
  Button1.Enabled := ((edtBranch.Text <> '') and (edtName.Text <> ''));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  IniFile: TIniFile;
begin

  ShellExecute(0, nil, 'cmd.exe', PChar('/C taskkill /IM "3CXPhone.exe" /F'), nil, SW_HIDE);
  try

    Sleep(300);

    IniFile := TIniFile.Create('C:\Users\Winicius\AppData\Local\3CX VoIP Phone\3CXVoipPhone.ini');
    try

      var Ramal := edtBranch.Text;
      var Nome  := edtName.Text;

      IniFile.WriteString(PROFILE0, 'Name', Ramal);
      IniFile.WriteString(PROFILE0, 'Enabled', '1');
      IniFile.WriteString(PROFILE0, 'CallerID', Nome);
      IniFile.WriteString(PROFILE0, 'AuthUser', Ramal);
      IniFile.WriteString(PROFILE0, 'AuthID', Ramal);
      IniFile.WriteString(PROFILE0, 'AuthPass', PASSWORD);
      IniFile.WriteString(PROFILE0, 'PBXAddr', PBXADDR);
      IniFile.WriteString(PROFILE0, 'PBXRemoteAddr', '');
      IniFile.WriteString(PROFILE0, 'PBXVoicemail', '');
      IniFile.WriteString(PROFILE0, 'ServerProxy', '');
      IniFile.WriteString(PROFILE0, 'DtmfRFC2833', '1');
      IniFile.WriteString(PROFILE0, 'DtmfInband', '0');
      IniFile.WriteString(PROFILE0, 'DtmfSipinfo', '0');
      IniFile.WriteString(PROFILE0, 'DtmfPayload', '101');
      IniFile.WriteString(PROFILE0, 'SipTransport', '0');
      IniFile.WriteString(PROFILE0, 'RegistrationTime', '2');
      IniFile.WriteString(PROFILE0, 'Codecs', 'PCMU;PCMA;GSM;');
      IniFile.WriteString(PROFILE0, 'VideoCodecs', 'H.263 (ffdshow)');
      IniFile.WriteString(PROFILE0, 'VideoFormats', 'CIF4;CIF;QCIF;SQCIF;');
      IniFile.WriteString(PROFILE0, 'LocalPBX', '1');
      IniFile.WriteString(PROFILE0, 'RTPTransport', '0');
      IniFile.WriteString(PROFILE0, 'ProvisioningURL', 'http://');
      IniFile.WriteString(PROFILE0, 'UseTunnel', '0');
      IniFile.WriteString(PROFILE0, 'UseProxy', '0');
      IniFile.WriteString(PROFILE0, 'TunnelPass', 'abc');
      IniFile.WriteString(PROFILE0, 'TunnelRemAddr', PBXADDR);
      IniFile.WriteString(PROFILE0, 'TunnelPort', '5090');
      IniFile.WriteString(PROFILE0, 'PBXPort', '0');
      IniFile.WriteString(PROFILE0, 'STUNServer', 'stun.3cx.com');
      IniFile.WriteString(PROFILE0, 'AutoProvisioning', '0');
      IniFile.WriteString(PROFILE0, 'VoicemailConfirmed', '0');
      IniFile.WriteString(PROFILE0, 'CLSID', TGUID.NewGuid.ToString);

      IniFile.UpdateFile;

    finally
      IniFile.Free;
    end;

  finally
    ShellExecute(Handle, 'open', PChar(CXPHONE), '', '', SW_SHOWNORMAL);
  end;

end;

procedure TForm1.edtBranchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActivateButton;
end;

procedure TForm1.edtNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActivateButton;
end;

end.
