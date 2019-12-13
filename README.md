# Elasticsearch, flebeat logs collection installation:
Package manager is Helm

Installation orchestartor is Ansible (k8s and helm modules)

Solution is fully dockerized for reduce configuration collisitons


## Installation Instructions
1. This code tested on cluster created into AWS cloud by [rancher](https://rancher.com/products/rancher).
2. If you not use [EKS](https://aws.amazon.com/eks) please be sure to provide [cluster cloud provider](https://kubernetes.io/docs/concepts/cluster-administration/cloud-providers/). Without this setting statefulset are failed during deploy.
3. After create cluster be sure to update ```~/.kube/config```.
4. Please be sure to install [docker](https://docs.docker.com/install) on your machine.
5. Installtion script tested on Ubuntu 18.04.
6. For deploy clone this repository and just run ```./install.sh``` script. For detailed usage information please run ```./install.sh --help```
7. After infrastructure are created link to kibana loadbalancer link will be printed to your command line. Be sure open 5601 port in security group.
8. For uninstall tested stack please run ```./install.sh -u```

