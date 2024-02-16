docker service create \
	--name spark-slave \
	--network hadoop-net \
	--replicas 5 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/spark:2.3.1 slave spark://spark-master:7077