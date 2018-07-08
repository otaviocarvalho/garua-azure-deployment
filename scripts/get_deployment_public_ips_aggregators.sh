#!/bin/bash
if [[ -z "$1" || -z "$2" ]]; then
    echo "Number of machines or region is empty, please provide it. >> ./get_edge_deployment_public_ips_aggregators.sh <number-of-machines> <region>"
else
    # Edge nodes
    rm ./pssh_aggregator_hosts_$2.txt
    touch ./pssh_aggregator_hosts_$2.txt
    for i in `seq 1 $1`;
    do
        az vm list-ip-addresses -g iot-gppd-otavio-resource-group-runnable-$2 -n iot-gppd-otavio-auto-aggregator-$i --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_aggregator_hosts_$2.txt
    done
fi

