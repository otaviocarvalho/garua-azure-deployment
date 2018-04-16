#!/bin/bash
pssh -h pssh_master_hosts.txt -t 600 -p 1 -l ocarval -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" 'bash -c "GOPATH=/home/ocarval/go nohup go run go/src/grpc_poc/iot/server/iot_server.go < /dev/null >>script.out 2>>script.err &"'
#parallel-ssh -h pssh_master_hosts.txt -t 600 -p 1 -l ocarval -x "-o StrictHostKeyChecking=no -i ../../credentials/id_rsa" 'bash -c "GOPATH=/home/ocarval/go nohup go run go/src/grpc_poc/iot/server/iot_server.go < /dev/null >>script.out 2>>script.err &"'
