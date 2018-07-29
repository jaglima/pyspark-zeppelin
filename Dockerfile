FROM ubuntu

################################################################################
# Set up OS
################################################################################

EXPOSE 8888
WORKDIR /root

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

COPY util/* /usr/local/bin/

ENV DEBIAN_FRONTEND noninteractive


RUN \
  apt-get update && \
  apt-get -y install wget \
    curl \
    tar \
    unzip \
    openjdk-8-jre

################################################################################
# Python 3
################################################################################

RUN \
  apt-get -y install python3 \
    python3-pip \
    python3-numpy \
    python3-pandas \
    python3-sklearn \
    python3-pycurl \
    python3-matplotlib && \
  pip3 install --no-cache-dir --upgrade setuptools pip && \
  echo "### Cleanup unneeded files" && \
  rm -rf /usr/lib/python3*/*/tests && \
  rm -rf /usr/lib/python3*/ensurepip && \
  rm -rf /usr/lib/python3*/idlelib && \
  rm -rf /usr/share/man/* && \
  clean-pyc-files /usr/lib/python3*



################################################################################
# Spark
################################################################################

ENV APACHE_SPARK_VERSION 2.2.2
ENV HADOOP_VERSION 2.7

RUN \
  cd /tmp && \
  wget -q http://apache.cs.utah.edu/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
  tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local && \
  rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
  cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV PATH $SPARK_HOME/bin:$PATH

RUN apt-get clean

################################################################################
# Zeppelin
################################################################################

ENV ZEPPELIN_VERSION 0.8.0

RUN \
   cd /tmp &&\
   wget -q http://www-us.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz && \
   tar xzf zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz -C /usr/local/ && \
   cd /usr/local/ && \
   cp zeppelin-${ZEPPELIN_VERSION}-bin-all/conf/zeppelin-env.sh.template zeppelin-${ZEPPELIN_VERSION}-bin-all/bin/zeppelin-env.sh && \
   rm /tmp/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz && \
   ln -s /usr/local/zeppelin-${ZEPPELIN_VERSION}-bin-all/bin/zeppelin.sh /usr/local/zeppelin-${ZEPPELIN_VERSION}-bin-all/bin/zeppelin

ENV ZEPPELIN_HOME /usr/local/zeppelin-${ZEPPELIN_VERSION}-bin-all
ENV PATH $ZEPPELIN_HOME/bin:$PATH


RUN apt-get clean
