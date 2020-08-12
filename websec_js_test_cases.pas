unit websec_js_test_cases;

{$mode objfpc}{$H+}

interface

uses
  websec_js,
  TestFramework;

type

  { TTestCases }

  TTestCases = class(TTestCase)
  published
    procedure TestJsEscape;
    procedure TestJsUnescape;
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

procedure TTestCases.TestJsEscape;
var
  s: string;
begin
  s := websec_js.escapeJs('trace {].a23-%\/^&');
  CheckEquals('trace\x20\x7B\x5D\x2Ea23\x2D\x25\x5C\x2F\x5E\x26', s, 'Failed websec_js.escapeJs()');
end;

procedure TTestCases.TestJsUnescape;
var
  s: string;
begin
  s := websec_js.unescapeJs('trace\x20\x7B\x5D\x2Ea23\x2D\x25\x5C\x2F\x5E\x26');
  CheckEquals('trace {].a23-%\/^&', s, 'Failed websec_js.unescapeJs()');
end;

end.

