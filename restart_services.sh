#!/bin/bash

declare -a arr=("SERVICE1" "SERVICE2" "SERVICE3")

PS3='
What would you like to perform?
'
options=("Start" "Stop" "Restart" "Enable" "Disable" "Status")
select opt in "${options[@]}"
do
    case $opt in
        "Start")
            for i in "${arr[@]}"; do
                echo "Starting $i..."
                sudo systemctl start "$i"
            done
            break
            ;;
        "Stop")
            for i in "${arr[@]}"; do
                echo "Stopping $i..."
                sudo systemctl stop "$i"
            done
            break
            ;;
        "Restart")
            for i in "${arr[@]}"; do
                echo "Restarting $i..."
                sudo systemctl restart "$i"
            done
            break
            ;;
        "Enable")
            for i in "${arr[@]}"; do
                echo "Enabling $i..."
                sudo systemctl enable "$i"
            done
            break
            ;;
        "Disable")
            for i in "${arr[@]}"; do
                echo "Disabling $i..."
                sudo systemctl disable "$i"
            done
            break
            ;;
        "Status")
            for i in "${arr[@]}"; do
                echo "Checking status for $i..."
                sudo systemctl status "$i" | grep Active
            done
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
