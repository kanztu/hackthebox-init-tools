### Burte-force for hash craking
- #### John the ripper
  - md5
  ```bash
  john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt hash.txt
  ```
  - PGP
  ```bash
  gpg2john key > gpg.john
  john -w=/usr/share/wordlists/rockyou.txt gpg.john 
  ```
- #### hashcat
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

### RSA
  - Concept
    - `BEGIN RSA PUBLIC KEY` is PKCS#1
    - `BEGIN PUBLIC KEY` is PKCS#8
    - https://www.tutorialspoint.com/cryptography_with_python/cryptography_with_python_understanding_rsa_algorithm.htm
  - Factor q and p with factordb
    - http://factordb.com/
  - To convert from PKCS#8 to PKCS#1
    - `openssl rsa -pubin -in <filename> -RSAPublicKey_out`
  - To convert from PKCS#1 to PKCS#8:
    - `openssl rsa -RSAPublicKey_in -in <filename> -pubout`
  - Check n and e
    - `openssl rsa -pubin -inform PEM -text -noout --modulus < pubkey.pem`
  - RSACtfTool
    - Source: https://github.com/RsaCtfTool/RsaCtfTool
    - Description: RSA multi attacks tool : uncipher data from weak public key and try to recover private key Automatic selection of best attack for the given public key
    - Usage: https://github.com/RsaCtfTool/RsaCtfTool#usage