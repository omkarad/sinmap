#!/bin/bash

##=================================================##
##                                                 ##
##               Author OmkaraD                    ##
##                 Date 2018                       ##
##                Version 1.0                      ##
##                                                 ##
##   Simple bash script to manipulate nmap flags   ##
##                                                 ##
##=================================================##


## Banner

clear

echo ' _____ _____ _   _ ___  ___  ___  ______ '
echo '/  ___|_   _| \ | ||  \/  | / _ \ | ___ \'
echo '\ `--.  | | |  \| || .  . |/ /_\ \| |_/ /'
echo ' `--. \ | | | . ` || |\/| ||  _  ||  __/ '
echo '/\__/ /_| |_| |\  || |  | || | | || |    '
echo '\____/ \___/\_| \_/\_|  |_/\_| |_/\_|    '
echo ""
echo ""                         
echo "        Press ENTER to start"                                         
read 

## Main menu

comm="sudo nmap "

## Menu options
options[0]=" Misc options. "
options[1]=" Host discovery. "
options[2]=" Scan techniques. "
options[3]=" Port specification and scan order. "
options[4]=" Service / Version detection. "
options[5]=" Script scan. "
options[6]=" OS detection. "
options[7]=" Timing and performance settings. "
options[8]=" Firewall / IDS evasion and spoofing. "
options[9]=" Output. "
options[10]=" Target specification. "

## Actions to take based on selection

function ACTIONS {
    if [[ ${choices[0]} ]]; then
        #Option 1 selected
        echo " " 
    fi
    if [[ ${choices[1]} ]]; then
        #Option 2 selected
        echo " "
    fi
    if [[ ${choices[2]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[3]} ]]; then
        #Option 4 selected
        echo " "
    fi
    if [[ ${choices[4]} ]]; then
        #Option 5 selected
        echo " " 
    fi
    if [[ ${choices[5]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[6]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[7]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[8]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[9]} ]]; then
        #Option 3 selected
        echo " "
    fi
    if [[ ${choices[10]} ]]; then
		opta[0]=" Single target/target range. "
		opta[1]=" Input from list of hosts/networks. "
		opta[2]=" Choose random targets.  "
		opta[3]=" Exclude some hosts/networks. "
		opta[4]=" Exclude host/networks from file"
		
		function ACT_A {
 		   if [[ ${chca[0]} ]]; then
 		       #Option 1 selected
 		       echo " Enter host/hosts you want to scan. " && read hosts_scan  && comm="${comm} $hosts_scan"
 		   fi
 		   if [[ ${chca[1]} ]]; then
 		       #Option 2 selected
 		       echo " Write full path to file containing hosts/networks. Ex: /home/user/hosts.txt " && read hosts_scan_file &&  comm="${comm} -iL $hosts_scan_file"
 		   fi
 		   if [[ ${chca[2]} ]]; then
 		       #Option 3 selected
 		       echo " How many random targets you want to scan? Enter number. " && read hosts_rand && comm="${comm} -iR $hosts_rand"
 		   fi
 		   if [[ ${chca[3]} ]]; then
 		       #Option 4 selected
 		       echo " Enter hosts/networks you want to exclude from scan. " && read hosts_exclude &&  comm="${comm} --exclude $hosts_exclude "
 		   fi
 		   if [[ ${chca[4]} ]]; then
 		       #Option 5 selected
 		       echo " Write full path to file containing hosts/networks. Ex: /home/user/hosts.txt " && read hosts_exclude_file && comm="${comm} --excludefile $hosts_exclude_file"
 		   fi
		}
		
		
## Variables
		
		ERRORA=" "
		
## Clear screen for menu
		
		clear
		
## Menu function
		
		function MENU_A {
		    echo "Host selection options. Choose ONLY ONE option from (1-3) and if needed - one from (4-5)."
		    echo " "
		    for NUM in ${!opta[@]}; do
		        echo "[""${chca[NUM]:- }""]" $(( NUM+1 ))") ${opta[NUM]}"
		    done
		    echo "$ERRORA"
		}
		
## Menu loop
		
		while MENU_A && read -e -p "Select the desired options using their number (again to uncheck, ENTER when done): " -n1 SELECTA && [[ -n "$SELECTA" ]]; do
		    clear
		    if [[ "$SELECTA" == *[[:digit:]]* && $SELECTA -ge 1 && $SELECTA -le ${#opta[@]} ]]; then
		        (( SELECTA-- ))
		        if [[ "${chca[SELECTA]}" == "+" ]]; then
		            chca[SELECTA]=""
		        else
    		        chca[SELECTA]="+"
    	    	fi
            	ERRORA=" "
    		else
        		ERRORA="Invalid option: $SELECTA"
    		fi
		done
		
		ACT_A
    fi
}

## Variables

ERROR=" "

## Clear screen for menu

clear

## Menu function

function MENU {
    echo "Menu Options"
    echo " "
    for NUM in ${!options[@]}; do
        echo "[""${choices[NUM]:- }""]" $(( NUM+1 ))") ${options[NUM]}"
    done
    echo "$ERROR"
}

## Menu loop

while MENU && read -e -p "Select the desired options using their number in two digits format.Ex: 01 (again to uncheck, ENTER when done): " -n2 SELECTION && [[ -n "$SELECTION" ]]; do
    clear
    if [[ "$SELECTION" == *[[:digit:]]* && $SELECTION -ge 1 && $SELECTION -le ${#options[@]} ]]; then
        (( SELECTION-- ))
        if [[ "${choices[SELECTION]}" == "+" ]]; then
            choices[SELECTION]=""
        else
            choices[SELECTION]="+"
        fi
            ERROR=" "
    else
        ERROR="Invalid option: $SELECTION"
    fi
done

ACTIONS
echo "Your nmap command configuration looks like this: $comm"
echo "You sure you want to start scan? (Y/n)"
read cfrm
if [[ "$cfrm" = "y" ]]; then
    $comm
    else
    echo "Press any key to continue"
    read
fi