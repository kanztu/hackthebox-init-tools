#!/bin/bash
wd=$(dirname "$0")

echo "sudo"; sudo echo "got root" 
export interface=tun0
export myip=`ifconfig $interface |grep "inet " |awk '{print $2}'`
echo "myip:" $myip
echo -ne "target ip: "
read targetip
export targetip


#* Alias
alias mscan="sudo masscan -e $interface -p- $targetip --rate=5000"
alias nnmap="sudo nmap -T5 -sC  $targetip"
alias rlisten="nc -lvnp 4444"
alias gobusterz="gobuster dir -x php -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt -u "
alias gobusterc="gobuster dir -x php -w /usr/share/wordlists/dirb/common.txt -u "
alias gobusterb="gobuster dir -t 100 -x php,txt -w /usr/share/wordlists/dirb/big.txt -u "
function wapp(){
    node $wd/tools/wappalyzer/src/drivers/npm/cli.js http://$@| jq .
}


function http(){
     python3 -m http.server $@
}

echo "Skip port scan?"
read ok
[[ $targetip != "" ]] && [[ $ok != "" ]] && mscan

cat <<EOF
    myip:       $myip
    targetip:  $targetip
    alias:
        mscan="sudo masscan -e $interface -p- $targetip --rate=5000"
        nnmap="sudo nmap -T5 -sC  $targetip"
        rlisten="nc -lvnp 4444"
        http
        wapp
        alias gobusterz="gobuster dir -t 100 -x php,txt -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt -u "
        alias gobusterc="gobuster dir -t 100 -x phptxt -w /usr/share/wordlists/dirb/common.txt -u "
        alias gobusterb="gobuster dir -t 100 -x phptxt -w /usr/share/wordlists/dirb/big.txt -u "
EOF
