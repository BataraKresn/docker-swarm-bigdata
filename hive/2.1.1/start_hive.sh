docker service create \
	--name hive \
	--hostname hive \
	--network hadoop-net \
	--replicas 1 \
	--constraint node.role==manager \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	adimpp7/hive:2.1.1