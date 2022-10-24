#!/bin/bash
## Key
# mkdir -p ~/.ssh
# echo 'ssh-rsa ...' > ~/.ssh/authorized_keys

## Entry
echo 'cd ~/hackthebox-init-tools' >> ~/.bashrc

# Alias
echo 'alias rlisten="nc -lvnp 4444"' >> ~/.bashrc
echo 'function settar(){
    export targetip=$@
}'

# ENV
interface=tun0
myip=$(ifconfig $interface |grep "inet " |awk '{print $2}')
echo "export myip=$myip" > ~/.bashrc

# Install mono
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
sudo apt install mono-complete -y 2>&1 | tee /tmp/mono_in.log

# install vscode and ilspy
cd /tmp
wget https://az764295.vo.msecnd.net/stable/129500ee4c8ab7263461ffe327268ba56b9f210d/code_1.72.1-1665423861_amd64.deb
sudo dpkg -i code_1.72.1-1665423861_amd64.deb
code --install-extension icsharpcode.ilspy-vscode
cd -

# Done
touch ~/Desktop/DONE

