#!/bin/bash

while IFS= read -r server; 
do
    ping -c 1 "$server" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -n "$server OK"
    else
        echo -n "$server FAIL"
    fi
done < "$1"