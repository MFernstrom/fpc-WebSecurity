unit websec_url;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, strutils;

{
  Based on https://github.com/MFernstrom/urlEncodeDecode/blob/master/urlEncodeDecode.pas
  which implements url encoding decoding to solve the Rosetta Code challenges.
}

function urlEncode(url: String):String;
function urlDecode(url: String):String;

implementation
function urlEncode(url: String): String;
var
  ch: AnsiChar;
begin
  Result := '';
  for ch in url do begin
    if ((Ord(ch) < 65) or (Ord(ch) > 90)) and ((Ord(ch) < 97) or (Ord(ch) > 122)) then begin
      Result := Result + '%' + IntToHex(Ord(ch), 2);
    end else
      Result := Result + ch;
  end;
end;

function urlDecode(url: String): String;
var
  ch: Char;
  pos, skip: Integer;

begin
  pos := 0;
  skip := 0;
  Result := '';

  for ch in url do begin
    if skip = 0 then begin
      if (ch = '%') and (pos < url.length -2) then begin
        skip := 2;
        Result := Result + AnsiChar(Hex2Dec('$' + url[pos+2] + url[pos+3]));

      end else begin
        Result := Result + ch;
      end;

    end else begin
      skip := skip - 1;
    end;
    pos := pos +1;
  end;
end;

end.

