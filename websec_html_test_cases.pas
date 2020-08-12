unit websec_html_test_cases;

{$mode objfpc}{$H+}

interface

uses
  websec_html,
  TestFramework;

type

  { TTestCases }

  TTestCases = class(TTestCase)
  published
    procedure TestHtmlEscape;
    procedure TestHtmlUnescape;
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

procedure TTestCases.TestHtmlEscape;
var
  s: string;
begin
  s := websec_html.escapeHtml('"#&''()/;<>');
  CheckEquals('&#34;&35;&38;&39;&40;&41;&47;&59;&60;&62;', s, 'Failed websec_html.escapeHtml()');
end;

procedure TTestCases.TestHtmlUnescape;
var
  s: string;
begin
  s := websec_html.unescapeHtml('&#34;&35;&38;&39;&40;&41;&47;&59;&60;&62;');
  CheckEquals('"#&''()/;<>', s, 'Failed websec_html.unescapeHtml()');
end;

end.

