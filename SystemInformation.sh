#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "🚀 Welcome to Your Information System! 🚀"

echo   # This will print a newline

# Display CPU information
echo -e "###${YELLOW} CPU information ${NC}###\n"

echo "Model: $(sysctl -n machdep.cpu.brand_string)"
echo "Usage: $(top -l 1 -s 0 | awk '/CPU usage/ {print $3 + $5 "%"}')"

#Report memory usage
echo -e "\n###${YELLOW} Memory Usage ${NC}###\n"
if command -v vm_stat &> /dev/null; then
    vm_stat
else
    echo "vm_start command not found"
fi

#Disk space
echo -e "\n###${YELLOW} Disk Space information ${NC}###\n"
df -h

#Network Statistic
echo -e "\n###${YELLOW} Network Statistic ${NC}###\n"
if command -v ifconfig &> /dev/null; then
    ip_address=$(ifconfig | grep 'inet ' | awk '{print $2}' | grep '10')
    nonloopback=$(ifconfig | grep 'inet' | awk '{print $2}' | grep '127')
    echo "Your IP address is: $ip_address"
    echo "Your non-loopback IP address is: $nonloopback"
else
    echo "ifconfig command not found"
fi