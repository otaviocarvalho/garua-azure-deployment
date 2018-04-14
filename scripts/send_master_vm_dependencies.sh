#!/bin/bash
scp -i ../../credentials/id_rsa pssh_edge_hosts.txt ocarval@$IP:~/
scp -r -i ../../credentials/id_rsa ../../credentials ocarval@$IP:~
