if [[ -z "$1" ]]; then
    echo "Region is empty, please provide it. >> ./get_deployment_public_ips_master.sh <region>"
else
    # Master nodes
    rm ./pssh_master_hosts_$1.txt
    touch ./pssh_master_hosts_$1.txt
    az vm list-ip-addresses -g iot-gppd-otavio-resource-group-runnable-master-$1 -n iot-gppd-otavio-auto-master --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_master_hosts_$1.txt

    while read p; do
        ssh-keyscan $p >> $HOME/.ssh/known_hosts
    done <./pssh_master_hosts_$1.txt

fi
