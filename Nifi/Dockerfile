FROM apache/nifi:1.26.0 AS nifi

USER root

WORKDIR /opt/nifi/nifi-current
 
RUN apt-get update -y && apt-get install -y wget

RUN cd /opt/nifi/nifi-current/lib && \
    wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar && \
    wget https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/23.2.0.0/ojdbc8-23.2.0.0.jar && \
    wget https://jdbc.postgresql.org/download/postgresql-42.6.0.jar && \
    wget https://repo1.maven.org/maven2/org/apache/nifi/nifi-kite-nar/1.15.3/nifi-kite-nar-1.15.3.nar && \
    wget https://truststore.pki.rds.amazonaws.com/sa-east-1/sa-east-1-bundle.pem && \
    cd /opt/nifi/nifi-current;

RUN echo "java.arg.8=-Duser.timezone=America/Bahia" >> /opt/nifi/nifi-current/conf/bootstrap.conf

CMD /opt/nifi/nifi-current/bin/nifi.sh run
