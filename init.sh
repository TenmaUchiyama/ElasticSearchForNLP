/bin/sh

curl -X DELETE "http://localhost:9200/sudachi_a_index" 
curl -X DELETE "http://localhost:9200/sudachi_b_index" 
curl -X DELETE "http://localhost:9200/sudachi_c_index" 

curl -X PUT "http://localhost:9200/sudachi_a_index" -H "Content-Type: application/json" -d @sudachi_A_analyzer.json
curl -X PUT "http://localhost:9200/sudachi_b_index" -H "Content-Type: application/json" -d @sudachi_B_analyzer.json
curl -X PUT "http://localhost:9200/sudachi_c_index" -H "Content-Type: application/json" -d @sudachi_C_analyzer.json




curl -X DELETE "http://localhost:9200/kuromoji_index" 

curl -X PUT "http://localhost:9200/kuromoji_index" -H "Content-Type: application/json" -d @kuromojiMap.json

curl -H "Content-Type: application/x-ndjson" -XPOST "http://localhost:9200/kuromoji/_bulk?pretty" --data-binary @initData.jsonl

