#!/bin/bash

#"${Red}[${Green}+${Red}

Black='\033[1;30m'
Red='\033[1;31m'
Green='\033[1;32m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Purple='\033[1;35m'
Cyan='\033[1;36m'
White='\033[1;37m'

if [ $(id -u) != 0 ]
then
	echo
	echo
	echo -e "${Red} Execute como root"
	echo
	echo
	exit
else
	echo
fi

trap ctrl_c INT
ctrl_c() {
clear
echo "[*] (Ctrl + C ) Detectado ... Tentando sair.."
sleep 1
echo ""
echo "[*] Fechando todos servicos , Wait  ..."
sleep 1
echo ""
echo "[*] Obrigado por usar o skype arch!  =)."
echo ""
exit
}
echo -e "${Red}"
echo   "____ ___ ____   ____ ___ ___ _____  _    ___  "
echo "| __ )_ _/ ___| / ___/ _ \_ _|_   _|/ \  / _ \ "
echo "|  _ \| |\___ \| |  | | | | |  | | / _ \| | | |"
echo "| |_) | | ___) | |__| |_| | |  | |/ ___ \ |_| |"
echo "|____/___|____/ \____\___/___| |_/_/   \_\___/ "
echo ""
echo ""
echo "Scanner site, By: Biscoitao"
echo "Greetz: Last, Bacon, Inocent, b33ck, ang33l, v4p0r, d3z3n0v3."


whois='/usr/bin/whois'
nslookup='/usr/bin/nslookup'
nmap='/usr/bin/nmap'
theharvester='/usr/bin/theharvester'
metagoofil='/usr/bin/metagoofil'
dnsrecon='/usr/bin/dnsrecon'
sublist3r='/usr/bin/sublist3r'
wafw00f='/usr/bin/wafw00f'
whatweb='/usr/bin/whatweb'
wpscan='/usr/bin/wpscan'
sslscan='/usr/bin/sslscan'
sslyze='/usr/bin/sslyze'
echo -e "${Red}[${Green}+${Red}] Checando diretorios! . . ."
if [ -e $whois ];then echo -e "${Red}[${Green}+${Red}] Whois Encontrado!";else echo -e "${Red}[${Green}x${Red}] Whois nao encontrado, baixando." && sudo apt-get install whois -y > /dev/null;fi
sleep 1
if [ -e $nslookup ];then echo -e "${Red}[${Green}+${Red}] Nslookup Encontrado!";else echo -e "${Red}[${Green}x${Red}] Nslookup nao encontrado, baixando." && sudo apt-get install nslookup -y > /dev/null;fi
sleep 1
if [ -e $nmap ];then echo -e "${Red}[${Green}+${Red}] Nmap Encontrado!";else echo -e "${Red}[${Green}x${Red}] Nmap nao encontrado, baixando." && sudo apt-get install nmap -y > /dev/null;fi
sleep 1
if [ -e $theharvester ];then echo -e "${Red}[${Green}+${Red}] TheHarvester Encontrado!";else echo -e "${Red}[${Green}x${Red}] TheHarvester nao encontrado, baixando." && sudo apt-get install theharvester -y > /dev/null;fi
sleep 1
if [ -e $metagoofil ];then echo -e "${Red}[${Green}+${Red}] Metagoofil Encontrado!";else echo -e "${Red}[${Green}x${Red}] Metagoofil nao encontrado, baixando." && sudo apt-get install metagoofil -y > /dev/null;fi
sleep 1
if [ -e $dnsrecon ];then echo -e "${Red}[${Green}+${Red}] Dnsrecon Encontrado!";else echo -e "${Red}[${Green}x${Red}] Dnsrecon nao encontrado, baixando." && sudo apt-get install dnsrecon -y > /dev/null;fi
sleep 1
if [ -e $sublist3r ];then echo -e "${Red}[${Green}+${Red}] Sublist3r Encontrado!";else echo -e "${Red}[${Green}x${Red}] Sublist3r nao encontrado, baixando." && sudo apt-get install sublist3r -y > /dev/null;fi
sleep 1
if [ -e $wafw00f ];then echo -e "${Red}[${Green}+${Red}] Wafw00f Encontrado!";else echo -e "${Red}[${Green}x${Red}] Wafw00f nao encontrado, baixando." && sudo apt-get install wafw00f -y > /dev/null;fi
sleep 1
if [ -e $whatweb ];then echo -e "${Red}[${Green}+${Red}] Whatweb Encontrado!";else echo -e "${Red}[${Green}x${Red}] Whatweb nao encontrado, baixando." && sudo apt-get install whatweb -y > /dev/null;fi
sleep 1
if [ -e $wpscan ];then echo -e "${Red}[${Green}+${Red}] Wpscan Encontrado!";else echo -e "${Red}[${Green}x${Red}] Wpscan nao encontrado, baixando." && sudo apt-get install wpscan -y > /dev/null;fi
sleep 1
if [ -e $sslscan ];then echo -e "${Red}[${Green}+${Red}] Sslscan Encontrado!";else echo -e "${Red}[${Green}x${Red}] Sslscan nao encontrado, baixando." && sudo apt-get install sslscan -y > /dev/null;fi
sleep 1
if [ -e $sslyze ];then echo -e "${Red}[${Green}+${Red}] Sslyze Encontrado!";else echo -e "${Red}[${Green}x${Red}] Sslyze nao encontrado, baixando." && sudo apt-get install sslyze -y > /dev/null;fi

#SCANNING

echo "Coloque aqui o site que deseja atacar: "
read RESPOSTA
#----------------------------------------------
echo -e ${Green}
whois $RESPOSTA
nslookup $RESPOSTA
sudo nmap -v -O $RESPOSTA
theharvester -d $RESPOSTA -l 500 -b google
metagoofil -d $RESPOSTA -t doc,pdf,xls,csv,txt -l 200 -n 50 -o metagoofiles -f scan.html
sudo dnsrecon -d $RESPOSTA
sublist3r --domain $RESPOSTA
sudo wafw00f http://$RESPOSTA
whatweb $RESPOSTA
sudo wpscan --url http://$RESPOSTA --enumerate u
sslscan $RESPOSTA
sslyze --resum --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $RESPOSTA
