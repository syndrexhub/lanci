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
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"32"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"32"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmess-grpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"32"',"email": "'""$user""'"' /etc/xray/vmessgrpc.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/Ronggolawe",
      "type": "none",
      "host": "${bug}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/Ronggolawe",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
cat >/etc/xray/$user-tls.json << EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "8443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "GunService",
      "type": "none",
      "host": "${bug}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base642=$( base64 -w 0 <<< $vmess_json3)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
xrayv2ray3="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "═══════════════════════" | lolcat
echo -e "====•=•-XRAYS/V2RAY-=•=•===" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Remarks     : ${user}" | lolcat
echo -e "IP/Host     : ${MYIP}" | lolcat
echo -e "Address     : ${domain}" | lolcat
echo -e "Port TLS    : ${tls}" | lolcat
echo -e "Port No TLS : ${nontls}" | lolcat
echo -e "Port GRPC   : 8443" | lolcat
echo -e "User ID     : ${uuid}" | lolcat
echo -e "Alter ID    : 0" | lolcat
echo -e "Security WS : auto" | lolcat
echo -e "Network     : WS & Grpc" | lolcat
echo -e "Mode        : Multi" | lolcat
echo -e "SecurityGRPC: TLS" | lolcat
echo -e "Type        : GRPC" | lolcat
echo -e "Service Name: GunService" | lolcat
echo -e "Bug         : ${bug}" | lolcat
echo -e "Path        : /Ronggolawe" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Link TLS    : " | lolcat
echo -e ""
echo -e " ${xrayv2ray1}" | lolcat
echo -e "════════════════" | lolcat
echo -e "Link Non TLS : " | lolcat
echo -e ""
echo -e " ${xrayv2ray2}" | lolcat
echo -e "════════════════" | lolcat
echo -e "Link GRPC : " | lolcat
echo -e ""
echo -e " ${xrayv2ray3}" | lolcat
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
