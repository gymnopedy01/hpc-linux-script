#!/bin/bash

while IFS= read -r server
do
    echo "= $server ="
    ssh -n "$server" uptime
done < server_list.txt