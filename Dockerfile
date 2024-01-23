FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.3



RUN elasticsearch-plugin install https://github.com/WorksApplications/elasticsearch-sudachi/releases/download/v2.1.0/analysis-sudachi-7.17.3-2.1.0.zip

RUN curl -Lo sudachi-dictionary-20240109-full.zip http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict/sudachi-dictionary-20240109-full.zip && \
    unzip sudachi-dictionary-20240109-full.zip && \
    mkdir -p /usr/share/elasticsearch/config/sudachi/ && \
    mv sudachi-dictionary-20240109/system_full.dic /usr/share/elasticsearch/config/sudachi/system_core.dic && \
    rm -rf sudachi-dictionary-20240109-full.zip sudachi-dictionary-20240109/

COPY ./sudachi.json  /usr/share/elasticsearch/config/sudachi/
# 日本語解析をするための入れます。

RUN elasticsearch-plugin install analysis-kuromoji









