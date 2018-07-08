#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Region is empty, please provide it. >> ./send_master_vm_dependencies.sh <region>"
else
    declare masterIp=$(head -1 ./pssh_master_hosts_$1.txt)
    scp -r -i ../../credentials/id_rsa ../../credentials ocarval@$masterIp:~
fi
