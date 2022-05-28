FROM openjdk:8-jre-alpine

MAINTAINER Satoshi KAMEI "skame@nttv6.jp"

RUN apk add bash procps coreutils curl jq

#BEEEEEEEELINE
RUN mkdir /opt/beeline \
	&& curl -SL https://archive.apache.org/dist/hadoop/core/hadoop-3.0.0/hadoop-3.0.0.tar.gz \
	| tar -xzC /opt/beeline \
	&& curl -SL https://archive.apache.org/dist/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz \
	| tar -xzC /opt/beeline
ENV HADOOP_HOME /opt/beeline/hadoop-3.0.0
ENV HIVE_HOME /opt/beeline/apache-hive-2.1.1-bin
ENV PATH $PATH:$HIVE_HOME/bin
