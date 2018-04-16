#!/bin/bash
declare masterIp=$(head -1 ./pssh_master_hosts.txt)
scp -r -i ../../credentials/id_rsa ../../credentials ocarval@$masterIp:~
