#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./get_edge_deployment_public_ips <number-of-machines>"
fi

rm ./pssh_hosts.txt
touch ./pssh_hosts.txt
for i in `seq 1 $1`;
do
    az vm list-ip-addresses -n iot-gppd-otavio-auto-edge-$i --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_hosts.txt
done

while read p; do
    ssh-keyscan $p >> $HOME/.ssh/known_hosts
done <./pssh_hosts.txt

