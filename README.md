### Garua Deploy - Azure tools to automate deployment

- Create master deployment manually
bash create_deployment.sh -i '1236dd96-fdcf-4661-9cb4-0d973d4d7ee4' -g 'iot-gppd-otavio-resource-group' -n 'iot-gppd-master-deployment' -f 'deployment_template_iot_master.json'

- Create edge nodes deployment manually
bash create_deployment.sh -i '1236dd96-fdcf-4661-9cb4-0d973d4d7ee4' -g 'iot-gppd-otavio-resource-group' -n 'iot-gppd-edge-deployment' -f 'deployment_template_iot_edge_multiple.json'

- Run full deployment (still need to adjust our deployment template by the number of nodes manually)
./run_deployment.sh 2

- Access nodes from folder
ssh -i ../../credentials/id_rsa ocarval@ip-address
