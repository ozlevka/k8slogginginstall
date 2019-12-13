#!/bin/bash

MODE="$1"

if [ "${MODE,,}" = "uninstall" ]; then 
    ansible-playbook ansible/uninstall.yaml
else
    echo "Install helm. Please wait"
    ./install-helm.sh > /dev/null 2>&1
    echo "Helm install success"

    ansible-playbook ansible/install.yaml

    echo "Click on: http://$(kubectl get service kibana-kibana  | awk '{print $4}' | tail -1):5601 to access kibana app" 
fi