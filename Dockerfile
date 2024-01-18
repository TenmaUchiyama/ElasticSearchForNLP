FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.3

RUN elasticsearch-plugin install https://github.com/WorksApplications/elasticsearch-sudachi/releases/download/v2.1.0/analysis-sudachi-7.10.1-2.1.0.zip
RUN curl -Lo sudachi-dictionary-20201223-core.zip http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict/sudachi-dictionary-20201223-core.zip && \
    unzip sudachi-dictionary-20201223-core.zip && \
    mkdir -p /usr/share/elasticsearch/config/sudachi/ && \
    mv sudachi-dictionary-20201223/system_core.dic /usr/share/elasticsearch/config/sudachi/ && \
    rm -rf sudachi-dictionary-20201223-core.zip sudachi-dictionary-20201223/

RUN bin/elasticsearch-plugin install analysis-icu
RUN bin/elasticsearch-plugin install analysis-kuromoji

COPY sudachi.json  /usr/share/elasticsearch/config/sudachi/
