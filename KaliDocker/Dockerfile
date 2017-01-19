# From base kali
FROM kalilinux/kali-linux-docker

MAINTAINER joethorpe6@openmailbox.org

# Set working dir
WORKDIR /root/

# kali installs
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    locales \
    nmap \
    curl \
    sqlmap \
    wfuzz \
    dirb \
    exploitdb \
    python-impacket \
    nikto \
    gdb \
    gcc \
    man \
    whatweb \
    python-pip \
    python-dev \
    rubygems \
    rubygems-integration \
    build-essential \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    skipfish \
    zsh \
    emacs-nox \
    git \
    openssh-client \
    tmux \
    bpython \
    wordlists \
    commix \
    libsqlite3-dev \
    host \
    wapiti \
    fimap \
    theharvester \
    python-pyx \
    python-matplotlib \
    python-ecdsa \
    python3-pip \
    python3-dev \
    tcpdump \
    scapy \
    libxml2-utils \
    sslscan \
    wpscan \
    libglib2.0-dev \
    msfpc \
    metasploit-framework \
    gobuster && \
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    pip install \
    pwntools \
    python-nmap \
    requests \
    httplib2 \
    pyip \
    pycrypto \
    pyopenssl \
    pyftpdlib \
    && \
    gem install \
    ruby-nmap \
    net-http-persistent \
    mechanize \
    text-table \
    sqlite3 \
    && wget https://raw.githubusercontent.com/leebaird/discover/master/mods/goohost.sh -O /opt/goohost.sh && \
    mkdir -p /opt/Data/

# Env lang
## https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# GitHub stuff
RUN git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/fuzzdb/ && \
    git clone https://github.com/shawarkhanethicalhacker/BruteXSS /opt/brutexss/ && \
    git clone https://github.com/0xsauby/yasuo /opt/yasuo/ && \
    git clone https://github.com/zscproject/OWASP-ZSC /opt/owasp-zsc/ && \
    git clone https://github.com/SpiderLabs/ikeforce /opt/ikeforce/ && \
    git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy/ && \
    git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg && \
    git clone https://github.com/radare/radare2 /opt/radar2/ && \
    cd /opt/xsscrapy && \
    pip install -r ./requirements.txt && \
    cd /opt/pwndbg && \
    ./setup.sh && \
    cd /opt/radar2 &&\
    bash sys/install.sh

# ZSH
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone git://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
COPY .zshrc /root/.zshrc

# TMUX dotfile
COPY .tmux.conf /root/.tmux.conf

# Emacs dotfile
COPY .emacs.d/ /root/.emacs.d/

# MSF start Script
COPY msfstart.sh /opt/msfstart.sh

# set ZSH shell as entry point
ENTRYPOINT ["/bin/zsh"]
