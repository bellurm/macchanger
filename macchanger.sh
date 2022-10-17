#! /usr/bin/bash
# blog-cyberworm.com

# It's just an usage.
function usage() {
	echo -e "[*] WARNING: If you want to set a MAC address random use the usage below."
	echo -e "[*] USAGE: ./macchanger.sh <iface>\n\n"
	
	echo -e "[*] WARNING: If you want to set a MAC address manually use the usage below."
	echo -e "[*] USAGE: ./macchanger.sh <iface> <MAC Address (00:...)>\n\n"

}

iface=$1 	    # eth0, wlan0 etc.
manualMAC=$2 	# Enter the MAC address manually

argsCount=$#	# Count the given argument or arguments.
	
if [[ $argsCount == 1 ]]
then
	# Create a random MAC address.
	randomMac=`printf '00:%02x:%02x:%02x:%02x:%02x\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]`
	
	# Set the random MAC address.
	macchanger -m "$randomMac" $iface
	
elif [[ $argsCount == 2 ]]
then
	# Set the MAC address entered manually.
	macchanger -m "$manualMAC" $iface
	
else
	echo -e "\nPlease, follow the usage.\n\n"
	usage
fi
