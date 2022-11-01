#! /usr/bin/env bash

set -euC
set -o pipefail

addons=(
    "dns"
    "dashboard"
    "ingress"
    "metallb:192.168.0.0-192.168.0.0"
    "community"
    # Community addons
    "nfs"
)

# Install addons
for addon in "${addons[@]}"; do
    microk8s enable "$addon"
    sleep 15
done

# Install dashboard-ingress
microk8s enable dashboard-ingress --hostname dashboard.k8s.local

# Set nfs storage class as default
kubectl patch storageclass nfs -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
