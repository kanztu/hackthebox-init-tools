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
