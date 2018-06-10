FROM python:2.7-stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    git clone https://github.com/codingo/NoSQLMap && \
    cd NoSQLMap && \
    python ./setup.py install
WORKDIR /NoSQLMap
CMD ["python", "./nosqlmap.py"]
