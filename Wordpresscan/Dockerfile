FROM python:2.7-stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    git clone https://github.com/swisskyrepo/Wordpresscan && \
    cd Wordpresscan && \
    pip2.7 install -r ./requirements.txt && \
    chmod +x ./main.py

WORKDIR /Wordpresscan/
ENTRYPOINT ["python2.7","/Wordpresscan/main.py","--update"]

    
