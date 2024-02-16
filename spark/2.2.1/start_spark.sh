docker service create \
	--name spark-slave \
	--network hadoop-net \
	--replicas 5 \
	--detach true \
	--endpoint-mode dnsrr \
	newnius/spark:2.2.1 slave spark://spark-master:7077