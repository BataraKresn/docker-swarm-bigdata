docker service create \
	--name spark-master \
	--hostname spark-master \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/spark:2.3.1 master