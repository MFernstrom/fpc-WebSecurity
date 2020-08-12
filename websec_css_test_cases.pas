unit websec_css_test_cases;

{$mode objfpc}{$H+}

interface

uses
  websec_css,
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
  s := websec_css.escapeCss('.body {background-color: #ffffff}');
  CheckEquals('\2Ebody\20\7Bbackground\2Dcolor\3A\20\23ffffff\7D', s, 'Failed websec_css.escapeCss()');
end;

procedure TTestCases.TestCssUnescape;
var
  s: string;
begin
  s := websec_css.unescapeCss('\2Ebody\20\7Bbackground\2Dcolor\3A\20\23ffffff\7D');
  CheckEquals('.body {background-color: #ffffff}', s, 'Failed websec_css.unescapeCss()');
end;

end.

