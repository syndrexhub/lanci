#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
echo "Masukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo "Ketikkan Perintah newhost setelah proses instalasi Script Selesai"
read -p "Hostname / Domain: " host
echo "IP="$host >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
#install ssh
wget https://raw.githubusercontent.com/jagoanneon01/njajal/main/startcomand.sh && chmod +x startcomand.sh && sed -i -e 's/\r$//' startcomand.sh && screen -S startcomand ./startcomand.sh
#install xray
wget https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/ins-xray.sh && chmod +x ins-xray.sh && sed -i -e 's/\r$//' ins-xray.sh && screen -S xray ./ins-xray.sh
# Trojango
wget https://raw.githubusercontent.com/jagoanneon01/njajal/main/trojango/ins-trojango.sh && chmod +x ins-trojango.sh && sed -i -e 's/\r$//' trojango && ./ins-trojango.sh
# install xray grpc
wget https://raw.githubusercontent.com/jagoanneon01/njajal/main/grpc/fb-grpc.sh && chmod +x fb-grpc.sh && sed -i -e 's/\r$//' fb-grpc.sh && screen -S grpc ./fb-grpc.sh
#

rm -f /root/startcomand.sh
rm -f /root/ins-xray.sh
rm -f /root/ins-trojango.sh
rm -f /root/fb-grpc.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, "  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC        : 2086"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC        : 2096"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
