
curl -X DELETE "http://host.docker.internal:9200/sudachi_index" 

curl -X PUT "http://host.docker.internal:9200/sudachi_index" -H "Content-Type: application/json" -d @sudachiMap.json




curl -X DELETE "http://host.docker.internal:9200/kuromoji_index" 

curl -X PUT "http://host.docker.internal:9200/kuromoji_index" -H "Content-Type: application/json" -d @kuromojiMap.json

curl -H "Content-Type: application/x-ndjson" -XPOST "http://localhost:9200/kuromoji/_bulk?pretty" --data-binary @initData.jsonl

