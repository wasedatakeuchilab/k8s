## Install microk8s <!-- omit in toc -->

In Takeuchi lab, we are using [Microk8s] to create a [Kubernetes] cluster.

MicroK8s is a low-ops, minimal production Kubernetes, depeloped by [Canonical Ltd], who also publishes [Ubuntu].

- [Why MicroK8s](#why-microk8s)
  - [Easy to install](#easy-to-install)
  - [Easy to create a cluster](#easy-to-create-a-cluster)
  - [Many useful addons](#many-useful-addons)
  - [Optimized for using minimal enviromnents](#optimized-for-using-minimal-enviromnents)
- [How to install MicroK8s](#how-to-install-microk8s)
- [Get access to the cluster](#get-access-to-the-cluster)
- [See also](#see-also)

## Why MicroK8s

### Easy to install

All you need is just one command `sudo snap install microk8s --classic`.

### Easy to create a cluster

Run `microk8s add-node` on a master node, then run the output command like `microk8s join <ip-address>:25000/....` on a machine that you want to join the cluster.

### Many useful addons

MicroK8s provides us a lot of addons running on the cluster, such as [dns](https://microk8s.io/docs/addon-dns), [dashboard](https://microk8s.io/docs/addon-dashboard), [ingress](https://microk8s.io/docs/ingress) and more!

It is very easy to install a addon, just running `microk8s enable <addon-name>`.

To remove the addon, run `microk8s disable <addon-name>`.

### Optimized for using minimal enviromnents

Unfortunately, our machines are kind of obsolete, just like with dual core CPU, 4GB RAM or HDD.

No worry! MicroK8s is designed for small-appliance IoT applications.

## How to install MicroK8s

Prepare an [Ubuntu] enviroment beforehand.

- Install on bare metal
- Create VMs using [Multipass] or [VirtualBox], etc.

Then, install MicroK8s with snap.

```sh
$ sudo snap install microk8s --classic
```

Finally, MicroK8s is now running.

```console
$ sudo microk8s status
microk8s is running
high-availability: no
  datastore master nodes: 127.0.0.1:19001
  datastore standby nodes: none
addons:
  enabled:
    ha-cluster           # (core) Configure high availability on the current node
    helm                 # (core) Helm - the package manager for Kubernetes
    helm3                # (core) Helm 3 - the package manager for Kubernetes
  disabled:
    cert-manager         # (core) Cloud native certificate management
    community            # (core) The community addons repository
    dashboard            # (core) The Kubernetes dashboard
    dns                  # (core) CoreDNS
    gpu                  # (core) Automatic enablement of Nvidia CUDA
    host-access          # (core) Allow Pods connecting to Host services smoothly
    hostpath-storage     # (core) Storage class; allocates storage from host directory
    ingress              # (core) Ingress controller for external access
    kube-ovn             # (core) An advanced network fabric for Kubernetes
    mayastor             # (core) OpenEBS MayaStor
    metallb              # (core) Loadbalancer for your Kubernetes cluster
    metrics-server       # (core) K8s Metrics Server for API access to service metrics
    observability        # (core) A lightweight observability stack for logs, traces and metrics
    prometheus           # (core) Prometheus operator for monitoring and logging
    rbac                 # (core) Role-Based Access Control for authorisation
    registry             # (core) Private image registry exposed on localhost:32000
    storage              # (core) Alias to hostpath-storage add-on, deprecated
```

If you want to run `microk8s` without `sudo`, run the following.

```sh
sudo usermod -aG microk8s $USER
sudo chmod -R 600 ~/.kube
newgrp microk8s
```

## Get access to the cluster

You are already available the Kubernetes cluster using `microk8s kubectl`.

```sh
$ microk8s kubectl get node
NAME       STATUS   ROLES    AGE   VERSION
microk8s   Ready    <none>   1h    v1.25.0
```

## See also

- <https://microk8s.io/docs/getting-started>

[microk8s]: https://microk8s.io/docs
[kubernetes]: https://kubernetes.io/ja/docs/home/
[canonical ltd]: https://canonical.com/
[ubuntu]: https://ubuntu.com/
[multipass]: https://multipass.run/
[virtualbox]: https://www.virtualbox.org/
