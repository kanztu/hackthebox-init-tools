### Burte-force for hash craking
- #### John the ripper
  - md5
  ```bash
  john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt hash.txts
  ```
- #### https://crackstation.net/
    -  Weak hash cracking

### JWT - JSON Web Tokens
- #### Concept
  - HS256 / HSXXX, using systematic key to perform signature (sign and verify)
  - RS256 / RSXXX, using asystematic key to perform signature (pubkey for sign and prikey for verify)
- #### Tools
  - JWT debugger, https://jwt.io/
- #### Vulnerability
  - JWT Key Confusion PoC (CVE-2015-9235)
    - https://github.com/aalex954/jwt-key-confusion-poc
    - If server support both RS and HS to verify the JWT, it is possible to perform exploit.
    - PoC: Tempering the token from RSXXX to HSXXX, and sign the payload with pubkey. Then, server will use systematic method to verify the message (i.e. by public key). Consequently, the auth is successful.