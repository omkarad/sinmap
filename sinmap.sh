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
options[0]=" Target specification. "
options[1]=" Host discovery. "
options[2]=" Scan techniques. "
options[3]=" Port specification and scan order. "
options[4]=" Service / Version detection. "
options[5]=" Script scan. "
options[6]=" OS detection. "
options[7]=" Timing and performance settings. "
options[8]=" Firewall / IDS evasion and spoofing. "
options[9]=" Output. "
options[10]=" Misc options. "

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
        #Option 3 selected
        echo " "
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