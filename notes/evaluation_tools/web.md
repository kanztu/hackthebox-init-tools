### Web traffic
- #### Burpsuite
  - Source: https://portswigger.net/burp
  - To perform web packet monitering, tempering, proxy, repeating

### Brute force
- #### wfuzz  - Soruce: https://github.com/xmendez/wfuzz
  - Finding subdomain, path, etc. vhost
  - Usage:
    ```bash    
    wfuzz -c -f sub-fighter -w /opt/useful/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt -u 'http://thetoppers.htb' -H "Host: FUZZ.thetoppers.htb" --hw 1036 # hw for negative for payload in size
    ```
 - #### gobuster
   - Source: https://github.com/OJ/gobuster
   - Finding subdomain, path, etc.
  - Usage:
    ```bash
    gobuster dir -t 100 -x php,txt -w /usr/share/wordlists/dirb/big.txt -u http://10.10.10.10:8080/
    gobuster vhost  -w /opt/useful/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt -u carpediem.htb
    ```
  - #### feroxbuster
    - Usage:
      ```bash
      feroxbuster -w /usr/share/wordlists/dirb/big.txt -u http://goodgames.htb
      ```
### Scaning frameware (offline)
 - #### wappalyzer
   - Source: https://github.com/wappalyzer/wappalyzer
   - Usage
    ```bash
    node wappalyzer/src/drivers/npm/cli.js http://$targetip | jq .
    ```

### Further exploitation
  - [Port 80 exploitaion](../port/80-tcp-http.md)