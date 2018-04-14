#!/bin/bash
#pssh -h pssh_aggregator_hosts.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" \
        #'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_aggregator.go \
            #-c 50051 -s iot-gppd-otavio-auto-master:50052 \
            #< /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'

parallel-ssh -h pssh_aggregator_hosts.txt -t 600 -p 1 -l ocarval -v -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" \
        'bash -c "GOPATH=/home/ocarval/go nohup go run /home/ocarval/go/src/grpc_poc/iot/client/iot_aggregator.go \
            -c 50051 -s iot-gppd-otavio-auto-master:50052 \
            < /dev/null >>/home/ocarval/script.out 2>>/home/ocarval/script.err &"'
