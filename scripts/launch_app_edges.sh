#!/bin/bash
pssh -h pssh_master_hosts.txt -t 600 -p 1 -l ocarval -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" 'bash -c "GOPATH=/home/ocarval/go nohup go run go/src/grpc_poc/iot/client/iot_client.go 1 1 1 iot-gppd-otavio-auto-master:50051 < /dev/null >script.out 2>script.err &"'
