docker service create \
	--name mysql \
	--replicas 3 \
	--network hadoop-net \
	--endpoint-mode dnsrr \
	--detach=true \
	-e MYSQL_ROOT_PASSWORD=123456 \
	-e MYSQL_DATABASE=hive \
	mysql:5.7