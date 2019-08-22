FROM openjdk:8-alpine
RUN apk --update add wget tar bash
RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.3-bin-hadoop2.7.tgz && \
    mv spark-2.4.3-bin-hadoop2.7 /spark && \
    rm spark-2.4.3-bin-hadoop2.7.tgz
RUN mkdir /data
COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh
RUN wget ftp://ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz && \
    gunzip  NASA_access_log_Jul95.gz
COPY topnanalysis_2.11-1.0.jar /spark/jars/topnanalysis_2.11-1.0.jar
