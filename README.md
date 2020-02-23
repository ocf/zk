zk
======

Configuration files for [Apache ZooKeeper](https://zookeeper.apache.org/) to run it on our Kubernetes cluster. We have a
[ZooKeeper cluster on our Mesos masters already](https://www.ocf.berkeley.edu/docs/staff/backend/mesos/zookeeper/), but why not have distributed systems within distributed systems?

The implementation is not ideal since all nodes are backed by NFS, so if NFS goes down the whole cluster does. The cluster is intended to be used for
quick prototyping and development of other services or systems within the cluster that will rely on ZooKeeper. We have 3 nodes of which one will be elected leader.

We deploy and manage Zookeeper by using the [pravega zookeeper operator](https://github.com/pravega/zookeeper-operator). The operator is installed via helm chart provided by [banzaicloud](https://github.com/banzaicloud/banzai-charts/tree/master/zookeeper-operator).
We use the `helm template` command (see the `make helm` target in the `Makefile`) to generate the proper CRDs and other yaml files for kubernetes-deploy (aka krane) to deploy for us.

Note that this just deploys the operator (`kubernetes/zk_operator.yaml`). To have the operator create a zookeeper cluster for us, we need to define a zookeeper cluster using MORE YAML
with the CRD provided. Take a look at `kubernetes/zk_kafka.yaml` as an example of a zookeeper cluster deployment designed to be used for Kafka clusters (or other things)
