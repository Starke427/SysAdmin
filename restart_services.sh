#!/bin/bash

declare -a arr=("SERVICE1" "SERVICE2" "SERVICE3")

for i in "${arr[@]}"
do
        echo "Restarting $i..."
        systemctl restart "$i"
done
