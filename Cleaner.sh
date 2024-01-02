#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

check_existance()
{
    file="$1"

     if find $HOME -name $file 2>/dev/null | grep -q .; then
        counter=$(find $HOME -name $file 2>/dev/null | grep -c .)
        if [ $counter == 1 ]; then
            PathFile=$(find $HOME -name $file 2>/dev/null)
            `rm -rf $PathFile`
            echo -e "$GREEN Successfully removed your file$NC"
        else
            echo -e "$GREEN warning: multiple files found$NC"
        fi
    else
        echo "$1 does not exist in $HOME or its subdirectories."
    fi
}

echo -e "\n\t\t❚█══Cleaner🧹══█❚\n"
echo -e "\t     Github : ${BLUE}Dakhch Oussama${NC}"

beforeclean=$(df -h $HOME | grep $HOME | awk '{print $4}' | tr 'i' 'B')

# Remove Trash
echo -e "\n${YELLOW}Emptying Trash Directory...${NC}\n"
sleep 2
path="$HOME/.Trash"
if [ $path ]; then
    `rm -rf /Users/odakhch/.Trash/* &>/dev/null`
    echo -e "=>${GREEN} remove Trash Files${NC}"
else
    echo -e "=>${RED} something rong in path${NC}"
fi


# Remove Cached File

echo -e "\n${YELLOW}Deleting Cached Data...${NC}\n"
sleep 2
`rm -rf "$HOME"/library/Caches/* &>/dev/null`
`rm -rf "$HOME"/Library/Application\ Support/Caches/*`
echo -e "=>${GREEN} remove Cached files${NC}"

#Remove Library Cached

echo -e "\n${YELLOW}Deleting Library Cached...${NC}\n"
sleep 2
PathSlack="$HOME/Library/Application\ Support/Slack/Cache/*"
echo -e "=>${GREEN} remove Slack Cached Files${NC}"
rm -rf $PathSlack &>/dev/null
sleep 1
PathDiscord="$HOME/Library/Application\ Support/discord/Cache/*"
rm -rf $PathDiscord &>/dev/null
sleep 1
echo -e "=>${GREEN} remove Discord Cached Files${NC}"
PathGoogle="$HOME/Library/Caches/Google/Chrome/Default/Cache/*"
rm -rf $PathGoogle &>/dev/null
sleep 1
echo -e "=>${GREEN} remove Google Cached Files${NC}"

#Remove DS_Store

echo -e "\n${YELLOW}Deleting Cached Data...${NC}\n"
sleep 2
`find $HOME/Desktop -name .DS_Store -exec /bin/rm {} + &>/dev/null`
echo -e "=>${GREEN} remove DS_Store${NC}"

sleep 1
# Choose File
clear
echo -en "\n$BLUE Do you want to delete a file or folder by its name : $NC"
read -e response

if [ "$response" == "yes" ] || [ "$response" == "y" ]; then
    echo -en "\n${RED}Provide the names of the folders or files you want to delete: ${NC}"
    read files

    if [ -n $files ]; then
        check_existance $files
    fi

    if [ -e $files ]; then
        echo "You enter folder"
    elif [ -f $files ]; then
        echo "You enter file"
    fi
fi


sleep 1
# Availaible storage

afterclean=$(df -h $HOME | grep $HOME | awk '{print $4}' | tr 'i' 'B')

echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo -e "\t$YELLOW Before Clean $NC : $RED $beforeclean $NC"
echo -e "\t$YELLOW After  Clean $NC : $GREEN $afterclean $NC"
echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo -e "${GREEN}Cleaning completed.${NC}"
