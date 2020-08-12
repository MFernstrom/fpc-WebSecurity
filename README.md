# fpc-WebSecurity
fpc-WebSecurity is a collection of functions and procedures in FreePascal for increasing your web application security.

The Lazarus project is an FPTest project, and the test cases are simple enough to provide examples of how to use the units.

Units are split up by what they do, and lives under the /unit/ directory
* units/websec_html
* units/websec_js
* units/websec_url
* units/websec_css

There are functions for escaping/unescaping and encoding/decoding strings.

Code is based on the OWASP cheatsheet for XSS (Cross Site Scripting) protection.

<img src="Lazarus.png" width="150" />
