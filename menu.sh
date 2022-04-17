#!/bin/bash
WKT=$(curl -s ipinfo.io/timezone )
clear
echo -e " SEDANG PROSES OM HARAP BERSABAR"
sleep 2
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━ Menu ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* menu               : Menampilkan Daftar Perintah"
echo -e "* Attention         : Silahkan Ketik Perintah Sesuai Dengan List Di Menu"
echo -e "* Sekarang         : $WKT " | lolcat
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ TRIAL-VPN ━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* trial-vmess      : Membuat Trial Akun Vmess"
echo -e "* trial-vless         : Membuat Trial Akun Vless"
echo -e "* trial-trojan        : Membuat Trial Akun trojan"
echo -e "* trial-trojango    : Membuat Trial Akun trojan-go"
echo -e "* trial-grpcc         : Membuat Trial Akun grpc"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ TROJAN-GO ━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addtrgo         : Membuat Akun Trojan-GO"
echo -e "* deltrgo          : Menghapus Akun Trojan-GO"
echo -e "* cektrgo         : Cek User Login Trojan-GO"
echo -e "* renewtrgo     : Memperpanjang Masa Aktif Akun Trojan-GO"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ GRPC ━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* fb-addgrpc        : Membuat Akun GRPC"
echo -e "* fb-delgrpc         : Menghapus Akun GRPC"
echo -e "* fb-cekgrpc        : Memperpanjang Masa Aktif Akun GRPC"
echo -e "* fb-renewgrpc    : Cek User Login GRPC"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━ VMESS ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addvmess        : Membuat Akun V2RAY Vmess Websocket"
echo -e "* delvmess         : Menghapus Akun V2RAY Vmess Websocket"
echo -e "* renewvmess    : Memperpanjang Masa Aktif Akun Vmess"
echo -e "* cekvmess        : Cek User Login V2RAY"
echo -e "* cert2vray          : Memperbarui Sertifikat Akun V2RAY [ Apabila Ganti Domain]"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ VLESS ━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addvless       : Membuat Akun V2RAY Vless Websocket"
echo -e "* delvless        : Menghapus Akun V2RAY Vless Websocket"
echo -e "* renewvless  : Memperpanjang Masa Aktif Akun Vless"
echo -e "* cekvless       : Cek User Login V2RAY"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ Trojan ━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addtrojan       : MEMBUAT Akun Trojan"
echo -e "* deltrojan        : Menghapus Akun Trojan"
echo -e "* renewtrojan   : Memperpanjang Masa Aktif Trojan"
echo -e "* cektrojan.       : Cek User Login Trojan"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━ SYSTEM ━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "* addhost     : Mengganti Domain [Bagi yang memiliki domain]"
echo -e "* newhost      : Menambahkan Subdomain Baru [Bagi Yang Tidak Memilki Domain]"
echo -e "* ram          : Cek Penggunaan Ram Dari Vps"
echo -e "* reboot       : Reboot VPS"
echo -e "* speedtest    : Speedtest VPS"
echo -e "* info         : Menampilkan Informasi Vps"
echo -e "* vnstat       : Menampilkan Penggunaan Bandwidth Vps"
echo -e "* about        : Info Script Auto Install"
echo -e "* exit         : Logout Dari VPS "
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "AutoScript By JAGOANNEON" | lolcat
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
