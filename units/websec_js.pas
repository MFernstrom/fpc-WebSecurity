unit websec_js;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, RegExpr;

function escapeJs(js: String):String;
function unescapeJs(js: String):String;

implementation
{
  Based on https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html
  Rule #3
}
function escapeJs(js: String): String;
var
  ch: Char;
  ascii: Integer;
begin
  Result := '';
  for ch in js do begin
    ascii := ord(ch);
    // Only encode ascii under 256
    // Don't encode alphanumeric values
    if not (ch in ['0'..'9']) and not (ch in ['a'..'z']) then
      Result := Result + '\x' + IntToHex(ascii, 2)
    else
      Result := Result + ch;
  end;
end;

function unescapeJs(js: String): String;
var
  re: TRegExpr;
begin
  Result := js;
  re := TRegExpr.Create('\\x([\d\w]{2})');
  try
    if re.Exec(js) then begin
      Result := Result.Replace('\x' + re.Match[1], Chr(StrToInt('$'+re.Match[1])));
      while re.ExecNext do
        Result := Result.Replace('\x' + re.Match[1], Chr(StrToInt('$'+re.Match[1])));
    end;
  finally
    re.Free;
  end;
end;

end.

