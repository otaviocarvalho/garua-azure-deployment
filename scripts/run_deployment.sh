#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./run_deployment <number-of-machines>"
fi

NEW_UUID=$(openssl rand -hex 4)
./create_deployment.sh -i "1236dd96-fdcf-4661-9cb4-0d973d4d7ee4" -g "iot-gppd-otavio-resource-group-runnable" -n "iot-gppd-deployment-master-auto-install-$NEW_UUID" -f "../deployments/deployment_template_iot_master.json"
./create_deployment.sh -i "1236dd96-fdcf-4661-9cb4-0d973d4d7ee4" -g "iot-gppd-otavio-resource-group-runnable" -n "iot-gppd-deployment-auto-install-$NEW_UUID" -f "../deployments/deployment_template_iot_edge_multiple.json"
./get_deployment_public_ips.sh $1
./update_vm_dependencies.sh $1
