#!/bin/bash
mkdir -p ~/output_stats
i=1
while read p; do
    scp -i ~/credentials/id_rsa ocarval@$p:~/output_stats.json ~/output_stats/output_stats_$i.json
    ((i++))
done < ~/garua-azure-deployment/scripts/pssh_edge_hosts.txt
