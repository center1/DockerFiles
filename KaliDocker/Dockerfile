# From base kali
FROM kalilinux/kali-linux-docker

MAINTAINER joethorpe6@openmailbox.org

# Set working dir
WORKDIR /root/

ENV LC_ALL C.UTF-8

# kali installs
RUN dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y && apt-get install -y \
    locales \
    nmap \
    curl \
    sqlmap \
    wfuzz \
    exploitdb \
    python-impacket \
    nikto \
    gdb \
    gcc \
    afl \
    gdb-multiarch \
    gcc-multilib \
    g++-multilib \
    libc6-dbg \
    libc6-dbg:i386 \
    lib32stdc++6 \
    man \
    aha \
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
    emacs25-nox \
    git \
    openssh-client \
    tmux \
    bpython \
    seclists \
    testssl.sh \
    commix \
    libsqlite3-dev \
    host \
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
    golang \
    wpscan \
    libglib2.0-dev \
    radare2 \
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
    capstone && \
    rm -r /root/.cache && \
    gem install \
    ruby-nmap \
    net-http-persistent \
    mechanize \
    text-table \
    sqlite3 && \
    rm -r /root/.gem \
    && wget https://raw.githubusercontent.com/leebaird/discover/master/mods/goohost.sh -O /opt/goohost.sh && \
    rm -r /root/.wget-hsts && \
    mkdir -p /opt/data/

# GitHub stuff
RUN git clone https://github.com/shawarkhanethicalhacker/BruteXSS /opt/brutexss/ && \
    git clone https://github.com/rastating/wordpress-exploit-framework /opt/wordpress-exploit-framework && \
    git clone https://github.com/0xsauby/yasuo /opt/yasuo/ && \
    git clone https://github.com/b3mb4m/shellsploit-framework /opt/shellsploit-framework && \
    git clone https://github.com/SpiderLabs/ikeforce /opt/ikeforce/ && \
    git clone https://github.com/portcullislabs/udp-proto-scanner /opt/udp-proto-scanner && \
    git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy/ && \
    git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
    git clone https://github.com/killswitch-GUI/SimplyEmail /opt/simplyemail && \
    git clone https://github.com/radare/radare2.git /opt/radare2/ && \
    cd /opt/radare2 && \
    sys/install.sh && \
    cd /opt/xsscrapy && \
    pip install -r ./requirements.txt && \
    cd /opt/pwndbg && \
    ./setup.sh && \
    cd /opt/shellsploit-framework && \
    python ./setup.py -s install && \
    cd /opt/simplyemail/setup && \
    ./Setup.sh && \
    cd /opt/wordpress-exploit-framework && \
    apt-get -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev && \
    bundle install && \
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
    
# ZSH
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    mkdir -p /root/.oh-my-zsh/custom/themes/
COPY jt.zsh-theme /root/.oh-my-zsh/custom/themes/jt.zsh-theme
COPY .zshrc /root/.zshrc

# MSF start Script
COPY msfstart.sh /opt/msfstart.sh

# set ZSH shell as entry point
ENTRYPOINT ["/bin/zsh"]
