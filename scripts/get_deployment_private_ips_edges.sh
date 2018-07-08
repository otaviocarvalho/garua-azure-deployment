#!/bin/bash
if [[ -z "$1" || -z "$2" ]]; then
    echo "Number of machines or region is empty, please provide it. >> ./get_edge_deployment_private_ips <number-of-machines> <region>"
else

    # Edge nodes
    rm ./pssh_edge_hosts_$2.txt
    touch ./pssh_edge_hosts_$2.txt
    for i in `seq 1 $1`;
    do
        az vm list-ip-addresses -g iot-gppd-otavio-resource-group-runnable-$2 -n iot-gppd-otavio-auto-edge-$i --query "[0].virtualMachine.network.privateIpAddresses[0]" -o tsv >> ./pssh_edge_hosts_$2.txt
    done

    while read p; do
        ssh-keyscan $p >> $HOME/.ssh/known_hosts
    done <./pssh_edge_hosts_$2.txt

fi

