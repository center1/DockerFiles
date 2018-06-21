FROM python:2.7-stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    git clone https://github.com/DanMcInerney/xsscrapy && \
    cd xsscrapy && \
    pip2.7 install -r ./requirements.txt

WORKDIR /xsscrapy
ENTRYPOINT ["python2.7","./xsscrapy.py"]

