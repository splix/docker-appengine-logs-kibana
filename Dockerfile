FROM java:8-jre

MAINTAINER Igor Artamonov <igor@artamonov.ru>

### ---- Install Elastic Search

RUN \
    mkdir /etc/service && \
    mkdir /etc/service/elasticsearch /opt/elasticsearch && \
    wget --progress=dot:mega -O - https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz \
        | tar xzf - --strip-components=1 -C "/opt/elasticsearch";

EXPOSE 9200 9300

### ---- Install Logstash

RUN \
    mkdir /etc/service/logstash /opt/logstash && \
    wget --progress=dot:mega -O - http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz \
        | tar xzf - --strip-components=1 -C "/opt/logstash";

### ---- Install Kibana

RUN \
    mkdir /etc/service/kibana /opt/kibana && \
    wget --progress=dot:mega -O - https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
        | tar xzf - --strip-components=1 -C "/opt/kibana";

EXPOSE 5601

ADD server-start.sh /usr/local/bin/
ADD logstash.conf /opt/logstash/

VOLUME /var/inputlogs
VOLUME /var/sincedb
VOLUME /opt/elasticsearch/data/elasticsearch

RUN \
    chmod +x /usr/local/bin/server-start.sh

CMD ["server-start.sh"]

