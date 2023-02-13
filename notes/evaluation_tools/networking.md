### Port Scan (UDP)
- #### nmap
    ```bash
    sudo nmap -p 1-1000 -sU -v 
    ```

### Port Scan (TCP)
- #### masscan
    ```bash
    sudo masscan -e $interface -p- $targetip --rate=5000
    ```
### Port listen
- #### nc
    ```bash
    nc -lvnp 4444
    ```

### Wireshark
    - Reading whole scenario in human-readable format
        - Follow TCP Stream
        - Follow HTTP Stream

### Ping network and check port
```bash
for i in {1..254}; do (ping -c 1 172.17.0.${i} | grep "bytes from" | grep -v "Unreachable" &); done;
for port in {1..65535}; do echo > /dev/tcp/172.19.0.1/$port && echo "$port open"; done 2>/dev/null
```