#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Region is empty, please provide it. >> ./send_aggregator_vms_dependencies.sh <region>"
else
    declare ipsAggregatorVms="./pssh_aggregator_hosts_$1.txt"

    for ip in $(cat < "$ipsAggregatorVms");
    do
        scp -r -i ../../credentials/id_rsa ./pssh_edge_hosts_$1.txt ocarval@$ip:~
        scp -r -i ../../credentials/id_rsa ../../credentials ocarval@$ip:~
    done
fi
