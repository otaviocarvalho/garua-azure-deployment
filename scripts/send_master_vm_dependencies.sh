#!/bin/bash
scp -i ../../credentials/id_rsa pssh_edge_hosts.txt ocarval@191.232.164.150:~/
scp -r -i ../../credentials/id_rsa ../../credentials ocarval@191.232.164.150:~
