#!/bin/bash

echo Start ElasticSearch...
cd /opt/elasticsearch
bin/elasticsearch -d

sleep 10

echo Start LogStash...
cd /opt/logstash
bin/logstash agent -f logstash.conf -l /var/log/logstash.log --debug &
#bin/logstash agent -f logstash.conf --debug -e

echo Start Kibana...
cd /opt/kibana
bin/kibana
