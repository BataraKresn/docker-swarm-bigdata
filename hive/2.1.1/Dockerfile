# Use the base Hadoop image
FROM newnius/hadoop:2.7.4

# Set the maintainer
MAINTAINER Newnius <newnius.cn@gmail.com>

# Switch to root user
USER root

# Install Apache Hive
ENV HIVE_VER 2.1.1
RUN wget -O apache-hive.tar.gz https://archive.apache.org/dist/hive/hive-$HIVE_VER/apache-hive-$HIVE_VER-bin.tar.gz && \
    tar -xzf apache-hive.tar.gz -C /usr/local/ && \
    rm apache-hive.tar.gz

# Create a symbolic link to the Hive installation directory
RUN ln -s /usr/local/apache-hive-$HIVE_VER-bin /usr/local/hive

# Set environment variables
ENV HIVE_HOME /usr/local/hive
ENV PATH $PATH:$HIVE_HOME/bin

# Download MySQL Connector/J JAR
# RUN wget --no-check-certificate -P $HIVE_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar
# RUN wget -P $HIVE_HOME/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar
COPY mysql-connector-java-5.1.44.jar $HIVE_HOME/lib/
# Copy the hive-site.xml configuration file
COPY hive-site.xml $HIVE_HOME/conf/

# Copy the bootstrap script
COPY bootstrap.sh /etc/bootstrap.sh

# Set the working directory
WORKDIR $HIVE_HOME

# Run the bootstrap script in daemon mode
CMD ["/etc/bootstrap.sh", "-d"]