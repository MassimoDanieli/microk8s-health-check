# MicroK8s Health Report - Fri May 30 01:28:55 PM UTC 2025


## MicroK8s Status

```bash
microk8s status --wait-ready
```
microk8s is running
high-availability: no
  datastore master nodes: 127.0.0.1:19001
  datastore standby nodes: none
addons:
  enabled:
    cert-manager         # (core) Cloud native certificate management
    dashboard            # (core) The Kubernetes dashboard
    dns                  # (core) CoreDNS
    ha-cluster           # (core) Configure high availability on the current node
    helm                 # (core) Helm - the package manager for Kubernetes
    helm3                # (core) Helm 3 - the package manager for Kubernetes
    hostpath-storage     # (core) Storage class; allocates storage from host directory
    ingress              # (core) Ingress controller for external access
    metallb              # (core) Loadbalancer for your Kubernetes cluster
    metrics-server       # (core) K8s Metrics Server for API access to service metrics
    storage              # (core) Alias to hostpath-storage add-on, deprecated
  disabled:
    cis-hardening        # (core) Apply CIS K8s hardening
    community            # (core) The community addons repository
    gpu                  # (core) Alias to nvidia add-on
    host-access          # (core) Allow Pods connecting to Host services smoothly
    kube-ovn             # (core) An advanced network fabric for Kubernetes
    mayastor             # (core) OpenEBS MayaStor
    minio                # (core) MinIO object storage
    nvidia               # (core) NVIDIA hardware (GPU and network) support
    observability        # (core) A lightweight observability stack for logs, traces and metrics
    prometheus           # (core) Prometheus operator for monitoring and logging
    rbac                 # (core) Role-Based Access Control for authorisation
    registry             # (core) Private image registry exposed on localhost:32000
    rook-ceph            # (core) Distributed Ceph storage using Rook

## Node Info

```bash
microk8s kubectl get nodes -o wide
```
NAME   STATUS   ROLES    AGE    VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE       KERNEL-VERSION      CONTAINER-RUNTIME
nero   Ready    <none>   4d3h   v1.32.3   192.168.1.111   <none>        Ubuntu 25.04   6.14.0-15-generic   containerd://1.6.36

## Pods

```bash
microk8s kubectl get pods -A
```
NAMESPACE        NAME                                                     READY   STATUS                        RESTARTS      AGE
argocd           argocd-application-controller-0                          1/1     Running                       0             23h
argocd           argocd-applicationset-controller-777d5b5dc7-gt8dz        0/1     Evicted                       0             3d3h
argocd           argocd-applicationset-controller-777d5b5dc7-z9xgh        1/1     Running                       0             23h
argocd           argocd-dex-server-7d8fcd845-2dt25                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-2k5ml                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-2kt7d                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-48pzv                        0/1     ContainerStatusUnknown        1             24h
argocd           argocd-dex-server-7d8fcd845-6kqqv                        0/1     Error                         0             23h
argocd           argocd-dex-server-7d8fcd845-6mxz5                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-9xm2z                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-bj9jm                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-bp5v9                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-bzdbw                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-dv4bd                        0/1     Error                         0             23h
argocd           argocd-dex-server-7d8fcd845-fl56p                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-gm9xj                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-jldf4                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-jnsz6                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-lgdhs                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-lrwf6                        0/1     Evicted                       0             23h
argocd           argocd-dex-server-7d8fcd845-mfv84                        0/1     ContainerStatusUnknown        1             24h
argocd           argocd-dex-server-7d8fcd845-mwsp5                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-nchnj                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-pks7t                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-dex-server-7d8fcd845-r429g                        1/1     Running                       0             22h
argocd           argocd-dex-server-7d8fcd845-sfdt9                        0/1     ContainerStatusUnknown        0             24h
argocd           argocd-dex-server-7d8fcd845-xvsph                        0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-notifications-controller-655df7c996-5qplb         0/1     Evicted                       0             26h
argocd           argocd-notifications-controller-655df7c996-qvjxj         1/1     Running                       0             23h
argocd           argocd-redis-574484f6db-89n5p                            1/1     Running                       0             23h
argocd           argocd-redis-574484f6db-tgcsj                            0/1     Evicted                       0             3d3h
argocd           argocd-repo-server-57449f957c-24d69                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-2kv74                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-2kzfj                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-2q4gp                      0/1     Completed                     0             24h
argocd           argocd-repo-server-57449f957c-47h2n                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-4h9j7                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-4lltd                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-54xt7                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-5dq9q                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-5qdbw                      0/1     Completed                     0             24h
argocd           argocd-repo-server-57449f957c-5wlw4                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-62p6s                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-6bn6p                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-6dp7c                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-6jffj                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-7llqf                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-8mhtn                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-8qtqd                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-92vw6                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-974mf                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-97zcg                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-9k6t2                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-b4wzl                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-b59w7                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-b88xt                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-bthpk                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-bx2b2                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-c52gc                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-c6gmh                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-ct5wn                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-cvpbv                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-ddthv                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-dg24n                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-dgpmb                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-dk47j                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-dmnw4                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-dpq9p                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-dw74k                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-fh6vc                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-fvlbh                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-g9qk7                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-gdtxk                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-gkhl6                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-glgct                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-hqfnq                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-hzj5r                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-j4wbs                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-jw5bn                      0/1     ContainerStatusUnknown        1             23h
argocd           argocd-repo-server-57449f957c-l2vgv                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-lfwbl                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-lx6cl                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-mgw6s                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-mzknp                      0/1     Completed                     0             24h
argocd           argocd-repo-server-57449f957c-n262h                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-n7s7g                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-nzxbd                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-pbhw7                      0/1     Completed                     0             24h
argocd           argocd-repo-server-57449f957c-pmw9g                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-pp9q5                      0/1     ContainerStatusUnknown        1             23h
argocd           argocd-repo-server-57449f957c-q57ws                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-qpgnq                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-qqjhp                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-rm5px                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-rv4df                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-rwlsr                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-sdhsc                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-ssz8w                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-tg58k                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-tkpjh                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-tkv6p                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-tm9jn                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-v4gzw                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-v8sht                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-v92lj                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-v9jcr                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-v9xr5                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-vbrbf                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-vch6x                      0/1     Evicted                       0             22h
argocd           argocd-repo-server-57449f957c-vcm27                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-vq7r8                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-vr2km                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-w2v88                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-w4d4t                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-wcgj4                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-wzzx6                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-x5x9q                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-x67kv                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-x72tr                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-xbg68                      1/1     Running                       0             22h
argocd           argocd-repo-server-57449f957c-zb2kt                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-repo-server-57449f957c-zjnd7                      0/1     Evicted                       0             23h
argocd           argocd-repo-server-57449f957c-zm4sv                      0/1     Init:ContainerStatusUnknown   0             24h
argocd           argocd-server-7dd4c8cf5f-8dvbb                           0/1     Evicted                       0             3d3h
argocd           argocd-server-7dd4c8cf5f-xnzsg                           1/1     Running                       0             23h
cert-manager     cert-manager-cainjector-fd9bf654b-n9jpn                  1/1     Running                       0             23h
cert-manager     cert-manager-cainjector-fd9bf654b-qcxss                  0/1     Evicted                       0             3d3h
cert-manager     cert-manager-ff4b94468-br75x                             0/1     Evicted                       0             3d3h
cert-manager     cert-manager-ff4b94468-s87t2                             1/1     Running                       0             23h
cert-manager     cert-manager-webhook-7749797f6-qttk8                     0/1     Evicted                       0             3d3h
cert-manager     cert-manager-webhook-7749797f6-vdlkd                     1/1     Running                       0             23h
guestbook        hello-max-6c876d6f6b-fvdnw                               0/1     Evicted                       0             3d1h
guestbook        hello-max-6c876d6f6b-wn7g4                               1/1     Running                       0             23h
guestbook        kustomize-guestbook-ui-f6b5b66db-5bbkx                   0/1     Evicted                       0             3d3h
guestbook        kustomize-guestbook-ui-f6b5b66db-wqzdl                   1/1     Running                       0             23h
ingress          nginx-ingress-microk8s-controller-hngcr                  1/1     Running                       0             22h
kube-system      calico-kube-controllers-5947598c79-l542f                 1/1     Running                       3             3d3h
kube-system      calico-node-mn7rd                                        1/1     Running                       3             3d3h
kube-system      coredns-79b94494c7-c5scp                                 1/1     Running                       3             3d3h
kube-system      dashboard-metrics-scraper-5bd45c9dd6-ddw67               0/1     Evicted                       0             26h
kube-system      dashboard-metrics-scraper-5bd45c9dd6-kwxgc               1/1     Running                       0             23h
kube-system      hostpath-provisioner-c778b7559-r9dx4                     1/1     Running                       1 (22h ago)   23h
kube-system      hostpath-provisioner-c778b7559-zn598                     0/1     Evicted                       0             2d16h
kube-system      kubernetes-dashboard-57bc5f89fb-4mpr6                    0/1     Evicted                       0             3d3h
kube-system      kubernetes-dashboard-57bc5f89fb-hffmc                    1/1     Running                       0             23h
kube-system      metrics-server-7dbd8b5cc9-wv5nq                          1/1     Running                       3             3d3h
metallb-system   controller-7ffc454778-2b2rv                              0/1     ContainerStatusUnknown        3             24h
metallb-system   controller-7ffc454778-79pl5                              0/1     Completed                     0             24h
metallb-system   controller-7ffc454778-w2d7z                              1/1     Running                       0             23h
metallb-system   speaker-zgrqn                                            1/1     Running                       0             22h
observability    alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running                       0             22h
observability    grafana-67c854fc76-2zpxw                                 0/1     ContainerStatusUnknown        1             23h
observability    grafana-67c854fc76-7bcr2                                 0/1     ContainerStatusUnknown        0             24h
observability    grafana-67c854fc76-7qjmr                                 0/1     ContainerStatusUnknown        1             23h
observability    grafana-67c854fc76-gp488                                 0/1     ContainerStatusUnknown        1             24h
observability    grafana-67c854fc76-tmvl6                                 1/1     Running                       0             23h
observability    grafana-67c854fc76-wpbjs                                 0/1     Completed                     0             24h
observability    grafana-67c854fc76-x55q2                                 0/1     ContainerStatusUnknown        0             24h
observability    grafana-67c854fc76-zdtjq                                 0/1     Completed                     0             24h
observability    loki-0                                                   1/1     Running                       0             23h
observability    loki-promtail-stjqr                                      1/1     Running                       0             22h
observability    prometheus-kube-prometheus-operator-6d9d668dbd-gqwls     0/1     ContainerStatusUnknown        3             24h
observability    prometheus-kube-prometheus-operator-6d9d668dbd-nvhsp     1/1     Running                       0             23h
observability    prometheus-kube-prometheus-operator-6d9d668dbd-qccsg     0/1     Completed                     0             24h
observability    prometheus-kube-state-metrics-7457555cf7-675d9           0/1     Evicted                       0             3d3h
observability    prometheus-kube-state-metrics-7457555cf7-ft8nk           1/1     Running                       0             23h
observability    prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running                       0             23h
observability    prometheus-prometheus-node-exporter-brvjg                1/1     Running                       0             22h

## Services (LoadBalancer)

```bash
microk8s kubectl get svc -A | grep LoadBalancer
```
argocd           argocd-server-lb                                     LoadBalancer   10.152.183.119   192.168.1.240          80:31580/TCP                                                                                                                  4d3h
ingress          nginx-ingress-microk8s-controller                    LoadBalancer   10.152.183.154   192.168.1.241          80:31371/TCP,443:32319/TCP                                                                                                    3d4h

## Ingresses

```bash
microk8s kubectl get ingress -A
```
NAMESPACE       NAME                     CLASS    HOSTS                             ADDRESS     PORTS     AGE
argocd          argocd-ingress           public   argocd.192.168.1.111.nip.io       127.0.0.1   80        4d3h
guestbook       guestbook-ingress        public   guestbook.192.168.1.241.nip.io    127.0.0.1   80, 443   3d4h
guestbook       hello-max-ingress        public   hello.192.168.1.241.nip.io        127.0.0.1   80, 443   3d1h
guestbook       kustomize-guestbook-ui   public   guestbook.192.168.1.241.nip.io    127.0.0.1   80, 443   3d3h
observability   grafana                  public   grafana.192.168.1.111.nip.io      127.0.0.1   80        4d2h
observability   loki                     public   loki.192.168.1.111.nip.io         127.0.0.1   80        18h
observability   prometheus               public   prometheus.192.168.1.111.nip.io   127.0.0.1   80        22h

## Persistent Volumes and Claims

```bash
microk8s kubectl get pvc -A
```
```bash
microk8s kubectl get pv
```

## StorageClass

```bash
microk8s kubectl get storageclass
```
NAME                          PROVISIONER            RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
microk8s-hostpath (default)   microk8s.io/hostpath   Delete          WaitForFirstConsumer   false                  4d3h

## Pod Restarts

```bash
microk8s kubectl get pods -A | awk '$5 > 0'
```
NAMESPACE        NAME                                                     READY   STATUS                        RESTARTS      AGE
argocd           argocd-dex-server-7d8fcd845-48pzv                        0/1     ContainerStatusUnknown        1             24h
argocd           argocd-dex-server-7d8fcd845-mfv84                        0/1     ContainerStatusUnknown        1             24h
argocd           argocd-repo-server-57449f957c-jw5bn                      0/1     ContainerStatusUnknown        1             23h
argocd           argocd-repo-server-57449f957c-pp9q5                      0/1     ContainerStatusUnknown        1             23h
kube-system      calico-kube-controllers-5947598c79-l542f                 1/1     Running                       3             3d3h
kube-system      calico-node-mn7rd                                        1/1     Running                       3             3d3h
kube-system      coredns-79b94494c7-c5scp                                 1/1     Running                       3             3d3h
kube-system      hostpath-provisioner-c778b7559-r9dx4                     1/1     Running                       1 (22h ago)   23h
kube-system      metrics-server-7dbd8b5cc9-wv5nq                          1/1     Running                       3             3d3h
metallb-system   controller-7ffc454778-2b2rv                              0/1     ContainerStatusUnknown        3             24h
observability    grafana-67c854fc76-2zpxw                                 0/1     ContainerStatusUnknown        1             23h
observability    grafana-67c854fc76-7qjmr                                 0/1     ContainerStatusUnknown        1             23h
observability    grafana-67c854fc76-gp488                                 0/1     ContainerStatusUnknown        1             24h
observability    prometheus-kube-prometheus-operator-6d9d668dbd-gqwls     0/1     ContainerStatusUnknown        3             24h

## DNS Test

```bash
microk8s kubectl run -i --tty dnsutils --image=busybox --restart=Never --rm -- nslookup kubernetes.default
```
Server:		10.152.183.10
Address:	10.152.183.10:53

** server can't find kubernetes.default: NXDOMAIN

** server can't find kubernetes.default: NXDOMAIN

pod "dnsutils" deleted

## Prometheus Targets

```bash
curl -s http://prometheus.192.168.1.111.nip.io/api/v1/targets | jq '.data.activeTargets[] | {instance, health, lastError}'
```
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}
{
  "instance": null,
  "health": "up",
  "lastError": ""
}

## Loki Health

```bash
curl -s http://loki.192.168.1.111.nip.io/loki/api/v1/ready
```
404 page not found

## Snap Refresh Status

```bash
snap refresh --time | grep microk8s
```
