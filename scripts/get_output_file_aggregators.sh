#!/bin/bash

# Get output files from each aggregator machines
mkdir -p ./output_stats_aggregators
i=1
while read p; do
    mkdir -p ./output_stats_aggregators/output_stats_aggregator_$i

    scp -i ../../credentials/id_rsa ocarval@$p:~/output_stats_aggregator.json ./output_stats_aggregators/output_stats_aggregator_$i/output_stats_aggregator_$i.json

    # Get edge stats output folder at each aggregator machine
    scp -i ../../credentials/id_rsa -r ocarval@$p:~/output_stats_edges ./output_stats_aggregators/output_stats_aggregator_$i/output_stats_edges

    ((i++))
done < ./pssh_aggregator_hosts.txt
