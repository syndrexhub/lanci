#!/bin/bash
# Jagoanneon
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl http://akses.jagoanneon-premium.xyz:81/akses | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Akses Di Izinkan...${NC}"
else
echo -e "${RED}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083857684916"
exit 0
fi
clear
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
read -rp "Masukkan Bug: " -e bug
tr="$(cat ~/log-install.txt | grep -w "Trojan" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan-wstls$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-trojan-wsnone$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-trojan$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojan-grpc$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray.service
trojanlink="trojan://${user}@${domain}:${tr}/${bug}"
link="trojan://${user}@${bug}:443/?sni=${domain}&type=ws&host=${domain}&path=/Ronggolawe&encryption=none#$user"
link2="trojan://${user}@${bug}:80/?type=ws&host=${domain}&path=/Ronggolawe&encryption=none#$user"
link3="trojan://${user}@${bug}:443/?mode=multi&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=${bug}#$user"
service cron restart
clear
echo -e ""
echo -e "════════════════" | lolcat
echo -e "=•=•-XRAYS/TROJAN-=•=•"
echo -e "════════════════" | lolcat
echo -e "Remarks    : ${user}"
echo -e "IP/Host    : ${MYIP}"
echo -e "Address    : ${domain}"
echo -e "Port TCP   : ${tr}"
echo -e "Port GRPC  : 443"
echo -e "Port WSTLS : 443"
echo -e "Port WSNONE: 80"
echo -e "Key        : ${user}"
echo -e "Bug        : ${bug}"
echo -e "Created    : $hariini"
echo -e "Expired    : $exp"
echo -e "════════════════" | lolcat
echo -e "Link TR  : "
echo -e ">>>> ${trojanlink}"
echo -e "════════════════" | lolcat
echo -e "Link TR GRPC  : "
echo -e ">>>> ${link3}"
echo -e "════════════════" | lolcat
echo -e "Link TR WSTLS  : "
echo -e ">>>> ${link}"
echo -e "════════════════" | lolcat
echo -e "Link TR WSNONE  : "
echo -e ">>>> ${link2}"
echo -e "════════════════" | lolcat
echo -e "${RED}AutoScriptSSH By Ronggolawe${NC}"
echo -e "════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
