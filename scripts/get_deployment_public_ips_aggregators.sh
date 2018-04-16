#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./get_edge_deployment_public_ips <number-of-machines>"
else
    # Edge nodes
    rm ./pssh_aggregator_hosts.txt
    touch ./pssh_aggregator_hosts.txt
    for i in `seq 1 $1`;
    do
        az vm list-ip-addresses -n iot-gppd-otavio-auto-aggregator-$i --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_aggregator_hosts.txt
    done
fi

