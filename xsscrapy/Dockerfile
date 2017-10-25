FROM debian
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    git \
    python-pip \
    python
RUN pip install \
    twisted==16.6.0 \
    Scrapy==1.1.0rc3 \
    pybloom==1.1 \
    requests \
    beautifulsoup \
    w3lib \
    lxml \
    six \
    cssselect \
    pyopenssl \
    cryptography \
    queuelib
RUN git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy
WORKDIR /opt/xsscrapy/
ENTRYPOINT ["/opt/xsscrapy/xsscrapy.py"]
