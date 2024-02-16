FROM adimpp7/hadoop:2.7.4

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Install Apche Hive
ENV HIVE_VER 2.3.3

RUN wget -O apache-hive.tar.gz https://archive.apache.org/dist/hive/hive-$HIVE_VER/apache-hive-$HIVE_VER-bin.tar.gz && \
tar -xzf apache-hive.tar.gz -C /usr/local/ && rm apache-hive.tar.gz

RUN ln -s /usr/local/apache-hive-$HIVE_VER-bin /usr/local/hive

# Set environment of hive
ENV HIVE_HOME /usr/local/hive
ENV PATH $PATH:$HIVE_HOME/bin

#ADD mysql-connector-java-5.1.44-bin.jar $HIVE_HOME/lib
RUN wget -P $HIVE_HOME/lib/ https://repo.maven.apache.org/maven2/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar
ADD mysql-connector-java-5.1.44-bin.jar $HIVE_HOME/lib

# Rename bootstrap script in origin image
RUN mv /etc/bootstrap.sh /etc/start_hadoop.sh

ADD bootstrap.sh /etc/bootstrap.sh
ADD init_hive.sh /etc/init_hive.sh

CMD ["/etc/bootstrap.sh", "-d"]
