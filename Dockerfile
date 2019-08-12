FROM openjdk:8-alpine
RUN apk --update add wget tar bash
RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.3-bin-hadoop2.7.tgz && \
    mv spark-2.4.3-bin-hadoop2.7 /spark && \
    rm spark-2.4.3-bin-hadoop2.7.tgz

RUN mkdir /data
COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh
COPY topnanalysis-0.0.1-SNAPSHOT.jar /spark/jars/topnanalysis-0.0.1-SNAPSHOT.jar
COPY NASA_access_log_Jul95 /data
