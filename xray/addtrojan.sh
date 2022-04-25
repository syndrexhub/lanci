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
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojan.json
sed -i '/#xray-trojan-wsnone$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojan.json
sed -i '/#xray-trojan$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojangrpc.json
systemctl restart xray.service
trojanlink="trojan://${user}@${domain}:${tr}/${bug}"
link="trojan://${user}@${bug}:2053/?sni=${domain}&type=ws&host=${domain}&path=/Ronggolawe&encryption=none#$user"
link2="trojan://${user}@${bug}:2080/?type=ws&host=${domain}&path=/Ronggolawe&encryption=none#$user"
link3="trojan://${user}@${bug}:3443/?mode=multi&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=${domain}#$user"
service cron restart
clear
echo -e ""
echo -e "═══════════════════════" | lolcat
echo -e "====•=•-XRAYS/TROJAN-=•=•==" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Remarks     : ${user}" | lolcat
echo -e "IP/Host     : ${MYIP}" | lolcat
echo -e "Address     : ${domain}" | lolcat
echo -e "Port TCP    : ${tr}" | lolcat
echo -e "Port GRPC   : 3443" | lolcat
echo -e "Port WSTLS  : 2053" | lolcat
echo -e "Port WSNONE : 2080" | lolcat
echo -e "Network     : TCP & Grpc" | lolcat
echo -e "Mode        : Multi" | lolcat
echo -e "SecurityGRPC: TLS" | lolcat
echo -e "Type        : GRPC" | lolcat
echo -e "Key         : ${user}" | lolcat
echo -e "Bug         : ${bug}" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Link TR  : " | lolcat
echo -e ">>>> ${trojanlink}" | lolcat
echo -e "════════════════" | lolcat
echo -e "Link TR GRPC  : " | lolcat
echo -e ">>>> ${link3}" | lolcat
echo -e "════════════════" | lolcat
echo -e "Link TR WSTLS  : " | lolcat
echo -e ">>>> ${link}" | lolcat
echo -e "════════════════" | lolcat
echo -e "Link TR WSNONE  : " | lolcat
echo -e ">>>> ${link2}" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Created     : $hariini" | lolcat
echo -e "Expired     : $exp" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "${RED}AutoScriptSSH By Ronggolawe${NC}"
echo -e "═══════════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
