# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
#	return
#fi


# Put your fun stuff here.

#FILE=$HOME/.fortunes

#if [ ! -r $FILE ]
#then
#    echo "### $0: Can't read fortune file \"$FILE\"!" >&2
#        exit 1
#	fi

	# Could also use test -s $FILE here:
#	MAX=$(wc -l < $FILE)   # Count the lines of $FILE, put into MAX.
#	if [ "$MAX" -eq 0 ]
#	
#then
#	    echo "### $0: Sorry, No fortunes in file \"$FILE\"!" >&2
#	        exit 1
#		fi

#		let "num = ($RANDOM % $MAX) + 1"  # The "%" operator computes the remainder.

command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n



#		sed -n "${num}p" $FILE


#echo $(lastlog | grep $(whoami)) > Scripts/lastlog


######################################################## COSMETICS ###################################################################################


####################################################### SALUTATION ###################################################################################



hour=$(date +%H) 

if [ $hour -gt 5 -a $hour -lt 12 ];  then

echo -e "\nGood Morning, $( whoami | sed 's/^\(.\)/\U\1/')"

elif [ $hour -ge 12 -a $hour -lt 16 ]; then

echo -e "\nGood Afternoon, $( whoami | sed 's/^\(.\)/\U\1/')"

elif [ $hour -ge 16 -a $hour -lt 21 ]; then

echo -e "\nGood Evening, $( whoami | sed 's/^\(.\)/\U\1/')"

else

#elif [21 < $hour < 5]; then

echo -e "\nYou Should Be Sleeping, $( whoami | sed 's/^\(.\)/\U\1/')"

fi


####################################################### LAST LOGIN ###################################################################################

echo -e "\nYou last logged in from $(last -w | grep $(whoami) | awk NR==3 | awk '{print $3}') at $(last -w | grep $(whoami) | awk NR==3 | awk '{print substr($0, index($0, $4)) }')"
if [ $(last -w | grep $(whoami) | awk NR==3 | awk '{print $3}') = $(last -w |grep $(whoami)| awk NR==1 |awk '{print $3}') ]; then
echo -e "And you are currently logged in from the same location listed above"

else

echo -e "And you are currently logged in from $(last -w|grep $(whoami) | awk NR==1 | awk '{print $3}')"

fi

####################################################### UPTIME #######################################################################################

if [ $(uptime | grep --only-matching day ) == "day" ]; then

echo -e "\nThe System has been running since $(uptime | awk '{print $3, $4, $5}' | sed s/,//g | sed s/:/" hours and "/g) minutes"

else

echo -e "\nThe System has been running since $( uptime | awk '{print $3}'  | sed s/:/" hours and "/g | sed s/,/" minutes"/g )"

fi
####################################################### DATA DOWNLOADED ##############################################################################

echo -e "\nSince Boot, the system has downloaded $(ifconfig | awk NR==5 | awk '{print $6, $7}' | sed s/"("// | sed s/")"//) of data"

####################################################### DISK SPACE ###################################################################################

echo -e "\nThe System is currently using $( df -h | awk NR==2 | awk '{print $3}' | sed s/G/" "GB/) of space and in total $( df -h | awk NR==2 | awk '{print $4}' | sed s/G/" "GB/) of space is left in the partition"

####################################################### TEMPERATURE ##################################################################################

echo -e "\nThe System's current temperature is $(acpi -t | awk '{print $4, $5}') celsius and it's current battery  capacity is $(acpi -V | awk NR==2 | awk '{print $NF}')"

####################################################### DEVICES INSERTED #############################################################################

#### Number of Inserted Device ####

x=$(lsblk -sdn | grep -v sr | grep -v sda | wc -l)

#### Location of Inserted Device ####

y=$(lsblk -sdn | grep sd | grep -v sda)

#### Unfilterd Inserted Devices ####

z=$(lsblk -sdn | grep sd | wc -l)

#### Extra Devices ####

w=$x-1

if [ $z -eq 3 ]; then

echo -e "\nYou do not have any devices inserted"

elif [ $x -eq 1 ]; then

echo -e "\nYou have 1 device ($(ls -f /dev/disk/by-label)) inserted at /dev/$(echo $y | awk '{print $1}')"

else

echo -e "\nYou have $x devices ($(ls --format=comma /dev/disk/by-label/)) inserted "

fi


##################################################### MEMORY CARD ####################################################################################


#if [ $(lsblk -sdn | grep ^m | awk '{print $1}') -eq "mmcblk0p1" ]; then

#echo -e "\nYou also have a memory card inserted but not mounted"

#elif [ $(lsblk -sdn | grep ^m | awk '{print $1}') -eq 0 ]; then 

#echo -e "\nYou do not have any memory cards inserted"

#fi


######################################################## DEVICE MOUNTED ##############################################################################

d=$(df -h | awk '{print $1}' | grep sd[b-z][1-9]$ | wc -l)

if [ $d -eq 0  ]; then

echo -e "\nYou do not have any devices mounted"

elif [ $d -eq 1 ]; then

echo -e "\nYou have 1 device mounted at $(df -h | grep sd[b-z] |  awk '{print $NF}')"

else

echo -e "\nYou have $(($(lsblk -dn | grep sd | wc -l) - 1)) devices inserted at /dev/$(echo $y | awk NR == ($x -1) | awk '{print $1}') and /dev/sd/$(echo $y | awk NR == $x| awk '{print $1}')\n"

fi






######################################################## LINUX LOOG ##################################################################################





######################################################## COSMETICS ###################################################################################







alias ll="ls -l"
#alias aria="aria2c --enable-rpc --rpc-listen-all -d /home/tomegathericon/Torrents --save-session /home/tomegathericon/Torrents/save"

alias aria=" aria2c --enable-dht --dht-entry-point=dht.transmissionbt.com:6881 --dht-listen-port=6881 --disable-ipv6 --enable-rpc --rpc-listen-all -d /home/tomegathericon/Torrents --save-session /home/tomegathericon/Torrents/save"

alias cls="clear"
alias la="ls -al"
alias vuze="screen java -jar /home/tomegathericon/Vuze/Vuze_4510.jar --ui=console"


