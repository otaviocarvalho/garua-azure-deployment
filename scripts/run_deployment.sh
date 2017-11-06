#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Number of machines is empty, please provide it. >> ./run_deployment <number-of-machines>"
fi

./create_deployment.sh -i "1236dd96-fdcf-4661-9cb4-0d973d4d7ee4" -g "iot-gppd-otavio-resource-group" -n "iot-gppd-edge-test-deployment-auto-install" -f "../deployments/deployment_template_iot_edge_multiple.json"
./get_edge_deployment_public_ips.sh $1
./update_vm_dependencies.sh $1
