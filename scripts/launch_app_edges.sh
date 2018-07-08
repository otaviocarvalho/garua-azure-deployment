#!/bin/bash
#pssh -h pssh_edge_hosts_*.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i credentials/id_rsa" \
        #'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_client.go \
            #-c 1 -n 100000 -b 1 -s iot-gppd-otavio-auto-aggregator-1:50051 \
            #< /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'

parallel-ssh -h pssh_edge_hosts_*.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i credentials/id_rsa" \
        'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_client.go \
            -c 100 -n 100000 -b 1 -s iot-gppd-otavio-auto-aggregator-1:50051 \
            < /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'
