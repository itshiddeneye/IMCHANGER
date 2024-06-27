#!/bin/bash

# Function to ensure necessary tools are installed
check_install_tools() {
    if ! command -v macchanger &> /dev/null; then
        echo -e "\033[1;31mmacchanger not found, installing...\033[0m"
        sudo apt-get update
        sudo apt-get install -y macchanger
    else
        echo -e "\033[1;32mmacchanger is already installed.\033[0m"
    fi

    if ! command -v ifconfig &> /dev/null; then
        echo -e "\033[1;31mifconfig not found, installing...\033[0m"
        sudo apt-get update
        sudo apt-get install -y net-tools
    else
        echo -e "\033[1;32mifconfig is already installed.\033[0m"
    fi

    if ! command -v dhclient &> /dev/null; then
        echo -e "\033[1;31mdhclient not found, installing...\033[0m"
        sudo apt-get update
        sudo apt-get install -y isc-dhcp-client
    else
        echo -e "\033[1;32mdhclient is already installed.\033[0m"
    fi

    if ! command -v figlet &> /dev/null; then
        echo -e "\033[1;31mfiglet not found, installing...\033[0m"
        sudo apt-get update
        sudo apt-get install -y figlet
    else
        echo -e "\033[1;32mfiglet is already installed.\033[0m"
    fi
}

# Function to display a large banner
display_banner() {
    echo -e "\033[1;34m"
    figlet -f banner "TOOL BY HIDDENEYE"
    echo -e "\033[0m"
}

# Function to change the MAC address
change_mac() {
    local interface=$1
    echo -e "\033[1;33mChanging MAC address of $interface...\033[0m"
    
    # Use macchanger to assign a random MAC address from a known vendor
    sudo macchanger -a $interface

    local new_mac=$(ifconfig $interface | grep ether | awk '{ print $2 }')
    if [[ $new_mac =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
        echo -e "\033[1;32mMAC address successfully changed to $new_mac\033[0m"
    else
        echo -e "\033[1;31mFailed to change MAC address\033[0m"
    fi
}

# Function to change the IP address
change_ip() {
    local interface=$1
    echo -e "\033[1;33mChanging IP address of $interface...\033[0m"

    # Release the current IP address
    sudo dhclient -r $interface

    # Get a new IP address
    sudo dhclient $interface
    new_ip=$(ifconfig $interface | grep 'inet ' | awk '{ print $2 }')

    # Check the IP address validity
    if [[ $new_ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo -e "\033[1;32mNew IP address: $new_ip\033[0m"
    else
        echo -e "\033[1;31mFailed to obtain a valid IP address\033[0m"
    fi
}

# Function to revert to the original MAC and IP address
revert_network() {
    local interface=$1
    echo -e "\033[1;33mReverting MAC and IP address of $interface...\033[0m"

    sudo macchanger -p $interface

    sudo ifconfig $interface down
    sudo dhclient -r $interface
    sudo ifconfig $interface up
    sudo dhclient $interface

    echo -e "\033[1;32mNetwork settings reverted.\033[0m"
}

# Main function to loop and change MAC and IP every 30 seconds for 30 minutes
main() {
    local interface="eth0"  # Replace with your network interface
    local duration=$((30 * 60))
    local interval=30
    local end_time=$((SECONDS + duration))

    # Display banner
    display_banner

    # Ensure necessary tools are installed
    check_install_tools

    # Loop to change MAC and IP addresses
    local iteration=1
    while [ $SECONDS -lt $end_time ]; do
        echo -e "\033[1;34mChanging network settings... Iteration $iteration\033[0m"
        change_mac $interface  # Change MAC address
        change_ip $interface   # Change IP address
        iteration=$((iteration + 1))
        sleep $interval  # Wait for 30 seconds before next change
    done

    # Revert network settings at the end of the loop
    revert_network $interface
}

# Check for revert keyword
if [[ "$1" == "revert" ]]; then
    revert_network "eth0"  # Replace with your network interface
    exit 0
fi

# Run the main function
main
