spark-submit \
	--master spark://spark-master:7077 \
	--deploy-mode cluster \
	--class org.apache.spark.examples.JavaSparkPi \
	./examples/jars/spark-examples*.jar 100