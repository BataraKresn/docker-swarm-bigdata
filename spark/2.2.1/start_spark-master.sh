docker service create \
	--name spark-master \
	--hostname spark-master \
	--network hadoop-net \
	--replicas 1 \
	--detach true \
	--endpoint-mode dnsrr \
	adimpp7/spark:2.2.1 master