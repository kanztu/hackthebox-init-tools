### Web traffic
- #### Burpsuite
  - Source: https://portswigger.net/burp
  - To perform web packet monitering, tempering, proxy, repeating

### Brute force
- #### wfuzz
  - Soruce: https://github.com/xmendez/wfuzz
  - Finding subdomain, path, etc.
  - Usage:
    ```bash
    wfuzz -c -f sub-fighter -w subdomains-top1million-5000.txt -u 'http://thetoppers.htb' -H "Host: FUZZ.thetoppers.htb" --hw 1036 # hw for negative for payload in size
    ```
 - #### gobuster
   - Source: https://github.com/OJ/gobuster
   - Finding subdomain, path, etc.
  - Usage:
    ```bash
    gobuster dir -t 100 -x php,txt -w /usr/share/wordlists/dirb/big.txt -u http://10.10.10.10:8080/"
    ```
### Scaning frameware (offline)
 - #### wappalyzer
   - Source: https://github.com/wappalyzer/wappalyzer
   - Usage
    ```bash
    node wappalyzer/src/drivers/npm/cli.js http://$targetip | jq .
    ```