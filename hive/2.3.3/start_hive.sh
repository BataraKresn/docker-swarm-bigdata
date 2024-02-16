docker service create \
	--name hive \
	--hostname hive \
	--network hadoop-net \
	--replicas 2 \
    --constraint node.role==manager \
	--endpoint-mode dnsrr \
	adimpp7/hive:2.1.1