# Master nodes
rm ./pssh_master_hosts.txt
touch ./pssh_master_hosts.txt
az vm list-ip-addresses -n iot-gppd-otavio-auto-master --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv >> ./pssh_master_hosts.txt

while read p; do
    ssh-keyscan $p >> $HOME/.ssh/known_hosts
done <./pssh_master_hosts.txt

