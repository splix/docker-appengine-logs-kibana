Kibana for Appengine Logs
=========================


Basic configuration of ELK (Elasticsearch,Logstash,Kibana) for Google Appengine Logs packed as Docker container

Run:
```bash
docker run -d -t \
  -p 9200:9200 -p 5601:5601 \
  -v $(pwd)/volumes/inputlogs:/var/inputlogs \
  -v $(pwd)/volumes/sincedb:/var/sincedb \
  -v $(pwd)/volumes/elastic:/opt/elasticsearch/data/elasticsearch \
  splix/appengine-logs-kibana
```

Download logs:
```
gsutil -m cp -R -n "gs://__MY_BUCKET_WITH_LOGS__/appengine.googleapis.com/request_log/" volumes/inputlogs/
```

Open Kibana at port 5601 (something like http://192.168.59.103:5601/) and setup `metadata.timestamp` as timestamp field. 

Enjoy
