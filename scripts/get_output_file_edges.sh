#!/bin/bash
mkdir -p ~/output_stats_edges
i=1
while read p; do
    scp -i ~/credentials/id_rsa ocarval@$p:~/output_stats_client.json ~/output_stats_edges/output_stats_edge_$i.json
    ((i++))
done < ./pssh_edge_hosts.txt
