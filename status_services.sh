#!/bin/bash

declare -a arr=("SERVICE1" "SERVICE2" "SERVICE3")

for i in "${arr[@]}"
do
        echo "Status of $i..."
        systemctl status "$i" | grep Active
done
