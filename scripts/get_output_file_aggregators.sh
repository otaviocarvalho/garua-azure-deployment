#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Region is empty, please provide it. >> ./get_output_file_aggregators.sh <region>"
else
    # Get output files from each aggregator machines
    mkdir -p ./output_stats_aggregators_$1
    i=1
    while read p; do
        mkdir -p ./output_stats_aggregators_$1/output_stats_aggregator_$i

        scp -i ../../credentials/id_rsa ocarval@$p:~/output_stats_aggregator.json ./output_stats_aggregators_$1/output_stats_aggregator_$i/output_stats_aggregator_$i.json

        # Get edge stats output folder at each aggregator machine
        scp -i ../../credentials/id_rsa -r ocarval@$p:~/output_stats_edges_$1 ./output_stats_aggregators_$1/output_stats_aggregator_$i/output_stats_edges

        ((i++))
    done < ./pssh_aggregator_hosts_$1.txt
fi
