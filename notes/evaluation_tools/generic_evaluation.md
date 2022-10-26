### linpeas.sh
- #### Description
  - LinPEAS is a script that search for possible paths to escalate privileges on Linux/Unix*/MacOS hosts. 
- #### Resources: 
  - https://blog.cyberethical.me/linpeas
- #### Source
  - https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS
- #### Usage
  -  On target side
    ```bash
    curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
    ```

### Metasploit Framework 6
- #### Description
  - msf6 contain a db for latest exploit for CVE and different service. Also, it contains PoC script to perform execution.
- #### Resources: 
  - https://nooblinux.com/metasploit-tutorial/
  - https://www.offensive-security.com/metasploit-unleashed/msfconsole-commands/
- #### Source
  - https://www.metasploit.com/
- #### Usage
  - Start
    ```bash
    sudo msfdb run
    ```

### SearchSploit
- #### Description
  - The Exploit Database is an archive of public exploits and corresponding vulnerable software, developed for use by penetration testers and vulnerability researchers.
- #### Source
  - https://github.com/offensive-security/exploitdb
- #### Usage
  - Search
    ```bash
    searchsploit afd windows local # Search for port
    searchsploit samba 3.0 # Search for application
    searchsploit -m exploits/unix/remote/16320.rb # Search for PoC path
    ```

### checksec
- #### Description
  -  To identify an executable's security properties, including vulnerablity for buffer overflow
- #### Resources
  - https://opensource.com/article/21/6/linux-checksec
  - https://www.twblogs.net/a/5beb9e5e2b717720b51f7a15
- #### Usage
  - Usage
    ```bash
    checksec ${binary}
    ```

### nmap
- #### Description
  -  Nmap provided scripts for detect possible vulnerabiliy for port(s).
- #### Usage
  - Usage
    ```bash
    nmap -p ${port} -script vuln -oA ${output-file} ${targetip}
    ```
### Encoder and Decoder
- #### https://gchq.github.io/CyberChef/