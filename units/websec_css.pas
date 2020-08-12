unit websec_css;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, RegExpr;

function escapeCss(css: String):String;
function unescapeCss(css: String):String;

implementation
{
  Based on https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html
  Rule #4
}
function escapeCss(css: String): String;
var
  ch: Char;
  ascii: Integer;
begin
  Result := '';
  for ch in css do begin
    ascii := ord(ch);
    // Only encode ascii under 256
    // Don't encode alphanumeric values
    if not (ch in ['0'..'9']) and not (ch in ['a'..'z']) then
      Result := Result + '\' + IntToHex(ascii, 2)
    else
      Result := Result + ch;
  end;
end;

function unescapeCss(css: String): String;
var
  re: TRegExpr;
begin
  Result := css;
  re := TRegExpr.Create('\\([\d\w]{2})');
  try
    if re.Exec(css) then begin
      Result := Result.Replace('\' + re.Match[1], Chr(StrToInt('$'+re.Match[1])));
      while re.ExecNext do
        Result := Result.Replace('\' + re.Match[1], Chr(StrToInt('$'+re.Match[1])));
    end;
  finally
    re.Free;
  end;
end;

end.

