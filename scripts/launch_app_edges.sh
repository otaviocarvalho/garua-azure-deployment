#!/bin/bash
if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" ]]; then
    echo "Region is empty, please provide it. >> ./launch_app_edges.sh <concurrency> <number-of-requests> <batch-size> <server> <port>"
else
    #pssh -h pssh_edge_hosts_*.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i credentials/id_rsa" \
            #'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_client.go \
                #-c 1 -n 100000 -b 1 -s iot-gppd-otavio-auto-aggregator-1:50051 \
                #< /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'

    parallel-ssh -h pssh_edge_hosts_*.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i credentials/id_rsa" \
            'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_client.go \
                -c '$1' -n '$2' -b '$3' -s '$4':'$5' \
                < /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'
fi
