#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

check_existance()
{
     if find /Users/$login/ -name "$1" 2>/dev/null | grep -q .; then
        echo "path : $file_path"
        echo "$1 exists in /Users/nameofuser/ or its subdirectories."
    else
        echo "$1 does not exist in /Users/nameofuser/ or its subdirectories."
    fi
}

echo -e "\n\t\t     CCLEAN \n"
echo -e "\t    Github : ${BLUE}Dakhch Oussama${NC}"

echo -e "\n${YELLOW}Empty Trash...${NC}\n"
sleep 2
path="/Users/odakhch/.Trash"

if [ $path ]; then
    `rm -rf /Users/odakhch/.Trash`
    echo -e "=>${GREEN} remove Trash Files${NC}"
else
    echo -e "=>${RED} something rong in path${NC}"
fi

echo -en "\nDo you want to delete a file or folder by its name : "
read -e response

if [ "$response" == "yes" ] || [ "$response" == "y" ]; then
    echo -en "\nEnter Your intra login : "
    read login

    sleep 1
    echo -en "\n${RED}Provide the names of the folders or files you want to delete: ${NC}"
    read files

    if [ -n $login ] && [ -n $files ]; then
        check_existance $files $login
    fi

    if [ -e $files ]; then
        echo "You enter folder"
    elif [ -f $files ]; then
        echo "You enter file"
    fi
fi

echo -e "${GREEN}Cleaning completed.${NC}"