zookeeper-k8s
======

Configuration files for [Apache ZooKeeper](https://zookeeper.apache.org/) to run it on our Kubernetes cluster. We have a
[ZooKeeper cluster on our Mesos masters already](https://www.ocf.berkeley.edu/docs/staff/backend/mesos/zookeeper/), but why not have distributed systems within distributed systems?

The implementation is not ideal since all nodes are backed by NFS, so if NFS goes down the whole cluster does. The cluster is intended to be used for
quick prototyping and development of other services or systems within the cluster that will rely on ZooKeeper. We have 3 nodes of which one will be elected leader.

Within the Kubernetes cluster, you can connect to the ZooKeeper cluster at one of the following nodes:

```
zk-0.zk-hs.app-zk.svc.cluster.local:2888
zk-1.zk-hs.app-zk.svc.cluster.local:2888
zk-2.zk-hs.app-zk.svc.cluster.local:2888
```

But you'll see in most applications you want to give a ZK-string like so

```
zk-0.zk-hs.app-zk.svc.cluster.local:2888,zk-1.zk-hs.app-zk.svc.cluster.local:2888,zk-2.zk-hs.app-zk.svc.cluster.local:2888
```
