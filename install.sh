#!/bin/bash

function usage() {
    echo "$0 [-f| --file ] < kube config file path > [-u | --uninstall]"
    echo "kubeconfig file optional use ~/.kube/config by default"
}

KUBE_CONFIG="$HOME/.kube/config"
UNINSTALL=""
INSTALL_CONTAINER="ozlevka/amazon-deploy:version-1"

while [ $# -ne 0 ]; do
    arg="$1"
    case "$arg" in
    -f | --file)
        shift
        KUBE_CONFIG="$1"
        ;;
    -u | --uninstall)
        UNINSTALL="uninstall"
        ;;
    *)
        usage
        exit
        ;;
    esac
    shift
done


docker run -it -v "$KUBE_CONFIG:/home/ubuntu/.kube/config" "$INSTALL_CONTAINER" $UNINSTALL