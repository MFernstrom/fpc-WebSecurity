unit websec_html;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, StrUtils;

function escapeHtml(html: String):String;
function unescapeHtml(html: String):String;

implementation

{
  Based on https://www.hacksplaining.com/prevention/xss-stored
  https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html
}
function escapeHtml(html: String): String;
begin
  Result := StringsReplace(html,
    ['"', '#', '&', '''', '(', ')', '/', ';', '<', '>'],
    ['&#34;', '&35;', '&38;', '&39;', '&40;', '&41;', '&47;', '&59;', '&60;', '&62;'],
    [rfReplaceAll]);
end;

function unescapeHtml(html: String): String;
begin
  Result := StringsReplace(html,
    ['&#34;', '&35;', '&38;', '&39;', '&40;', '&41;', '&47;', '&59;', '&60;', '&62;'],
    ['"', '#', '&', '''', '(', ')', '/', ';', '<', '>'],
    [rfReplaceAll]);
end;

end.

