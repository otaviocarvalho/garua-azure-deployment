#!/bin/bash
while read p; do
    ssh -i ~/credentials/id_rsa ocarval@$p -x killall go
done < ~/garua-azure-deployment/scripts/pssh_edge_hosts.txt
