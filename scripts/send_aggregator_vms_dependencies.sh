#!/bin/bash
declare ipsAggregatorVms="./pssh_aggregator_hosts.txt"

for ip in $(cat < "$ipsAggregatorVms");
do
    scp -r -i ../../credentials/id_rsa ./pssh_edge_hosts.txt ocarval@$ip:~
    scp -r -i ../../credentials/id_rsa ../../credentials ocarval@$ip:~
done
