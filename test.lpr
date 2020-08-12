program test;

{$mode objfpc}{$H+}

uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,
  TextTestRunner,
  websec_html_test_cases,
  websec_js_test_cases,
  websec_css_test_cases,
  websec_url_test_cases;
begin
  WriteLn('Testing websec units');
  websec_html_test_cases.RegisterTests;
  websec_js_test_cases.RegisterTests;
  websec_css_test_cases.RegisterTests;
  websec_url_test_cases.RegisterTests;

  RunRegisteredTests
end.

