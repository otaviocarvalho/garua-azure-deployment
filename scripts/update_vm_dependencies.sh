#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./update_vm_dependencies <number-of-machines>"
else
    pssh -h pssh_hosts.txt -t 600 -p $1 -l ocarval -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" bash /home/ocarval/grpc_poc/install_dependencies_cloud.sh
fi


