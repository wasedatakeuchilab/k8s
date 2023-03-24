#! /usr/bin/env bash

set -euC
set -o pipefail

kubectl_version="1.25.0"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/v$kubectl_version/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin
echo "source <(kubectl completion bash)" >> ~/.bashrc
