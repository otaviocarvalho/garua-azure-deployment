#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Region is empty, please provide it. >> ./get_output_file_edges.sh <region>"
else
    mkdir -p ~/output_stats_edges_$1
    i=1
    while read p; do
        scp -i ~/credentials/id_rsa ocarval@$p:~/output_stats_client.json ~/output_stats_edges_$1/output_stats_edge_$i.json
        ((i++))
    done < ./pssh_edge_hosts_$1.txt
fi
