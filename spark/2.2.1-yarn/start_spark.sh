spark-submit \
	--master yarn \
	--deploy-mode cluster \
	--class org.apache.spark.examples.JavaSparkPi \
	./examples/jars/spark-examples*.jar 100
