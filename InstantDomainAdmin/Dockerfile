# CME Empire DeathStar
# docker run -it --rm -p 8443:8443 -p 80:80 -p 443:443 jthorpe6/instantdomainadmin
FROM debian
WORKDIR /root/
ENV LC_ALL C.UTF-8
ENV STAGING_KEY=RANDOM
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    tmux \
    curl \
    wget \
    sudo \
    locales \
    lsb-release \
    python-pip \
    python-dev \
    python3-pip \
    python3-dev \
    python-m2crypto \
    apt-transport-https && \
    pip install crackmapexec
RUN git clone https://github.com/EmpireProject/Empire /opt/Empire && \
    git clone https://github.com/byt3bl33d3r/DeathStar /opt/DeathStar
RUN pip3 install --upgrade pip && \
    cd /opt/DeathStar && \
    pip3 install -r ./requirements.txt
RUN bash -c "cd /opt/Empire && \
    wget http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3_amd64.deb && \
    wget http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb && \
    dpkg -i libicu52_52.1-3_amd64.deb && \
    dpkg -i libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb && \
    rm libicu52_52.1-3_amd64.deb && \
    rm libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list && \
    apt-get update && \
    apt-get install -y powershell && \
    ./setup/install.sh" && \
    pip install 'pyopenssl==17.2.0' && \
    sed -i "s/ssl.PROTOCOL_TLSv1/ssl.PROTOCOL_TLS/g" /opt/Empire/empire
COPY launcher.sh /root/launcher.sh
EXPOSE 80 443 8443
ENTRYPOINT ["/root/launcher.sh"]

