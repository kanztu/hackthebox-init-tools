# Port 21/tcp

## Connect to FTP using starttls
- ### https://book.hacktricks.xyz/network-services-pentesting/pentesting-ftp
```bash
lftp
set ftp:ssl-force true
set ssl:verify-certificate no
connect 10.10.10.208
login username Password
```