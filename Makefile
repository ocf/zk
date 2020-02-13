ZK_RELEASE_NAME = "zk-0"
ZK_NAMESPACE = "app-zk"
ZK_OPERATOR_VERSION = "0.2.2"


cook-image:
	echo "Nothing to cook!"

push-image:
	echo "Nothing to push!"

test:
	echo "Nothing to test!"

helm:
	helm template ${ZK_RELEASE_NAME} banzaicloud-stable/zookeeper-operator -n ${ZK_NAMESPACE} --set image.tag=${ZK_OPERATOR_VERSION} > kubernetes/zk_operator.yaml


.PHONY: cook-image push-image test helm
