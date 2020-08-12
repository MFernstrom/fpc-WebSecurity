unit websec_url_test_cases;

{$mode objfpc}{$H+}

interface

uses
  websec_url,
  TestFramework;

type

  { TTestCases }

  TTestCases = class(TTestCase)
  published
    procedure TestCssEscape;
    procedure TestCssUnescape;
  end;

procedure RegisterTests;


implementation

uses
  sysutils;


procedure RegisterTests;
begin
  TestFramework.RegisterTest(TTestCases.Suite);
end;

{ TTestCases }

procedure TTestCases.TestCssEscape;
var
  s: string;
begin
  s := websec_url.urlEncode('http://foo bar/');
  CheckEquals('http%3A%2F%2Ffoo%20bar%2F', s, 'Failed websec_url.urlEncode()');
end;

procedure TTestCases.TestCssUnescape;
var
  s: string;
begin
  s := websec_url.urlDecode('http%3A%2F%2Ffoo%20bar%2F');
  CheckEquals('http://foo bar/', s, 'Failed websec_url.urlDecode()');
end;

end.

