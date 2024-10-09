#!/bin/bash

echo "  ___  ____  _____ _   _ ____   ___  ____ _____ ____  
 / _ \|  _ \| ____| \ | |  _ \ / _ \|  _ \_   _/ ___| 
| | | | |_) |  _| |  \| | |_) | | | | |_) || | \___ \ 
| |_| |  __/| |___| |\  |  __/| |_| |  _ < | |  ___) |
 \___/|_|   |_____|_| \_|_|    \___/|_| \_\|_| |____/ By TMouad101


Welcome, Dear User,
This script allows you to check which open ports your network allows you to use.
Please choose one of the options below:
"

# Allowing the user to choose either standard ranges or his own range


echo "Choose a range of ports:"
echo "1) 1 - 1023 (Well-Known Ports)"
echo "2) 1024 - 49151 (Registered Ports)"
echo "3) 49152 - 65535 (Dynamic/Private Ports)"
echo "4) Enter your own range"
echo "5) Single port mode
"

read -p "Enter your choice (1-5): " choice

s_port=""
e_port=""
single_port=""

case $choice in
    1)
        s_port=0
        e_port=1023
        ;;
    2)
        s_port=1024
        e_port=49151
        ;;
    3)
        s_port=49152
        e_port=65535
        ;;
    4)
        read -p "Enter the starting port (1-65534): " s_port
        read -p "Enter the ending port (2-65535): " e_port
        
	if [ -z "$s_port" ] || [ -z "$e_port" ] || [ "$s_port" -lt 1 ] || [ "$e_port" -gt 65535 ]; then 
    	echo "You missed the right syntax."
    	echo "the ports must be between 1 and 65535"
    	exit 1
	fi
	if [ "$s_port" -eq "$e_port" ]; then
	echo "You'd better choose single port mode"
	exit 1
	fi
        ;;
    5)
    	read -p "Enter the port (1-65534): " single_port
    	if [ -z "$single_port" ] || [ -z "$single_port" ] || [ "$single_port" -lt 1 ] || [ "$single_port" -gt 65535 ]; then 
    	echo "You missed the right syntax."
    	echo "the ports must be between 1 and 65535"
    	exit 1
	fi
	if [ "$(curl -s --connect-timeout 0.5 portquiz.net:$single_port | grep 'successful' | cut -d ' ' -f 3 | tr -d '!')" = "successful" ]; then
  	  echo "Port $single_port: Open"
  	  exit 1
	else
  	  echo "Port $single_port: Closed"
  	  exit 1
  	fi
  	;;
       		
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac




echo " ____  ____   ___   ____ _____ ____ ____ ___ _   _  ____ 
|  _ \|  _ \ / _ \ / ___| ____/ ___/ ___|_ _| \ | |/ ___|
| |_) | |_) | | | | |   |  _| \___ \___ \| ||  \| | |  _ 
|  __/|  _ <| |_| | |___| |___ ___) |__) | || |\  | |_| |
|_|   |_| \_\\___/ \____|_____|____/____/___|_| \_|\____|

                                 
Just chill and relax, keep in mind that the time depends on how long the range of ports you have provided.☕
You'll find a .txt file with the final result in the same location as the script.
"
sets=$((((($e_port - $s_port) / 20) * 10) / 60))
time=$(( (($e_port - $s_port) / 120) +$sets ))

    if [ "$time" -lt 1 ]; then
    	echo  "Estimated time: Less than a minute"
	else
	    echo "Estimated time: $time minutes"
	fi

echo "-------------........NEW SCAN........-------------" >> ports.txt
count=0
# Loop through the specified port range
    for port in $(seq "$s_port" "$e_port"); do
        if [ "$(curl -s --connect-timeout 0.5 portquiz.net:$port | grep 'successful' | cut -d ' ' -f 3 | tr -d '!')" = "successful" ]; then
            echo "Port $port: Open"
            echo "Port $port: Open" >> ports.txt
            
        fi
#to bypass requests number issue
    count=$((count+1))  
    if [ $((count % 20)) -eq 0 ]; then  
        sleep 10 	
        count=0
    fi
    done



