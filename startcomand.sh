#!/bin/bash
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
# ==================================================
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=www.jagoanneon-premium.me
organizationalunit=www.jagoanneon-premium.me
commonname=www.jagoanneon-premium.me
email=admin@jagoanneon-premium.me

# simple password minimal
wget -O /etc/pam.d/common-password "https://${akbarvpn}/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl
apt -y install net-tools

# Install Requirements Tools
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# install webserver
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${akbarvpn}/nginx.conf > /etc/nginx/nginx.conf
curl https://${akbarvpn}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://https://raw.githubusercontent.com/jagoanneon01/njajal/main/index.html1"
/etc/init.d/nginx restart
cd

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/jagoanneon01/njajal/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500


# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 2253' /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "Port 42" >> /etc/ssh/sshd_config
/etc/init.d/ssh restart

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 1153"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
cd
# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O addhost "https://raw.githubusercontent.com/jagoanneon01/njajal/main/addhost.sh"
wget -O newhost "https://raw.githubusercontent.com/jagoanneon01/njajal/main/newhost.sh"
wget -O about "https://raw.githubusercontent.com/jagoanneon01/njajal/main/about.sh"
wget -O info "https://raw.githubusercontent.com/jagoanneon01/njajal/main/info.sh"
wget -O wbmn "https://raw.githubusercontent.com/jagoanneon01/njajal/main/webmin.sh"
wget -O menu "https://raw.githubusercontent.com/jagoanneon01/Rizal/main/menu.sh"
wget -O trial-vmess "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trial/trial-vmess.sh"
wget -O trial-vless "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trial/trial-vless.sh"
wget -O trial-trojan "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trial/trial-trojan.sh"
wget -O trial-trojango "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trial/trial-trojango.sh"
wget -O trial-grpc "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trial/trial-grpc.sh"
wget -O speedtest "https://raw.githubusercontent.com/jagoanneon01/njajal/main/speedtest_cli.py"
wget -O clearlog "https://raw.githubusercontent.com/jagoanneon01/njajal/main/clearlog.sh"
wget -O xp "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xp.sh"
wget -O addvmess "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/addv2ray.sh"
wget -O addvless "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/addvless.sh"
wget -O addtrojan "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/addtrojan.sh"
wget -O delvmess "https://https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/delv2ray.sh"
wget -O delvless "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/delvless.sh"
wget -O deltrojan "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/deltrojan.sh"
wget -O cekvmess "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/cekv2ray.sh"
wget -O cekvless "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/cekvless.sh"
wget -O cektrojan "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/cektrojan.sh"
wget -O renewvmess "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/renewv2ray.sh"
wget -O renewvless "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/renewvless.sh"
wget -O renewtrojan "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/renewtrojan.sh"
wget -O certv2ray "https://raw.githubusercontent.com/jagoanneon01/njajal/main/xray/certv2ray.sh"
wget -O addtrgo "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trojango/addtrgo.sh"
wget -O deltrgo "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trojango/deltrgo.sh"
wget -O renewtrgo "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trojango/renewtrgo.sh"
wget -O cektrgo "https://raw.githubusercontent.com/jagoanneon01/njajal/main/trojango/cektrgo.sh"
wget -O running "https://raw.githubusercontent.com/jagoanneon01/njajal/main/running.sh"

chmod +x addhost
chmod +x newhost
chmod +x menu
sed -i -e 's/\r$//' menu
chmod +x trial-vmess
sed -i -e 's/\r$//' trial-vmess
chmod +x trial-vless
sed -i -e 's/\r$//' trial-vless
chmod +x trial-trojan
sed -i -e 's/\r$//' trial-trojan
chmod +x trial-trojango
sed -i -e 's/\r$//' trial-trojango
chmod +x trial-grpcc
sed -i -e 's/\r$//' trial-grpcc
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x clearlog
chmod +x wbmn
chmod +x xp
chmod +x addvmess
sed -i -e 's/\r$//' addvmess
chmod +x addvless
sed -i -e 's/\r$//' addvless
chmod +x addtrojan
sed -i -e 's/\r$//' addtrojan
chmod +x delvmess
sed -i -e 's/\r$//' delvmess
chmod +x delvless
sed -i -e 's/\r$//' delvless
chmod +x deltrojan
sed -i -e 's/\r$//' deltrojan
chmod +x cekvmess
sed -i -e 's/\r$//' cekvmess
chmod +x cekvless
sed -i -e 's/\r$//' cekvless
chmod +x cektrojan
sed -i -e 's/\r$//' cektrojan
chmod +x renewvmess
sed -i -e 's/\r$//' renewvmess
chmod +x renewvless
sed -i -e 's/\r$//' renewvless
chmod +x renewtrojan
sed -i -e 's/\r$//' renewtrojan
chmod +x certv2ray
sed -i -e 's/\r$//' certv2ray
chmod +x addtrgo
sed -i -e 's/\r$//' addtrgo
chmod +x deltrgo
sed -i -e 's/\r$//' deltrgo
chmod +x renewtrgo
sed -i -e 's/\r$//' renewtrgo
chmod +x cektrgo
sed -i -e 's/\r$//' cektrgo

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "0 1 * * * root delexp" >> /etc/crontab
echo "10 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
echo "0 0 * * * root clearlog && reboot" >> /etc/crontab
echo "0 12 * * * root clearlog && reboot" >> /etc/crontab
echo "0 18 * * * root clearlog && reboot" >> /etc/crontab


# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd

# finishing
clear

