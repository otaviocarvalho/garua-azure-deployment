#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./get_edge_deployment_private_ips <number-of-machines>"
else

    # Edge nodes
    rm ./pssh_edge_hosts.txt
    touch ./pssh_edge_hosts.txt
    for i in `seq 1 $1`;
    do
        az vm list-ip-addresses -n iot-gppd-otavio-auto-edge-$i --query "[0].virtualMachine.network.privateIpAddresses[0]" -o tsv >> ./pssh_edge_hosts.txt
    done

    while read p; do
        ssh-keyscan $p >> $HOME/.ssh/known_hosts
    done <./pssh_edge_hosts.txt

    # Master nodes
    rm ./pssh_master_hosts.txt
    touch ./pssh_master_hosts.txt
    az vm list-ip-addresses -n iot-gppd-otavio-auto-master --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_master_hosts.txt

    while read p; do
        ssh-keyscan $p >> $HOME/.ssh/known_hosts
    done <./pssh_master_hosts.txt

fi

