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