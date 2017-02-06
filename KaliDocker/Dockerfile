# From base kali
FROM kalilinux/kali-linux-docker

MAINTAINER joethorpe6@openmailbox.org

# Set working dir
WORKDIR /root/

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
    gdb-multiarch \
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
    emacs-nox \
    git \
    openssh-client \
    tmux \
    bpython \
    seclists \
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

# Env lang
## https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
#RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
#    dpkg-reconfigure --frontend=noninteractive locales && \
#    update-locale LANG=en_US.UTF-8
#
#ENV LANG en_US.UTF-8

# GitHub stuff
RUN git clone https://github.com/shawarkhanethicalhacker/BruteXSS /opt/brutexss/ && \
    git clone https://github.com/0xsauby/yasuo /opt/yasuo/ && \
    git clone https://github.com/b3mb4m/shellsploit-framework /opt/shellsploit-framework && \
    git clone https://github.com/SpiderLabs/ikeforce /opt/ikeforce/ && \
    git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy/ && \
    git clone https://github.com/drwetter/testssl.sh.git /opt/testssl/ && \
    git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
    git clone https://github.com/JonathanSalwan/ROPgadget /opt/ropgadget && \
    git clone https://github.com/radare/radare2.git /opt/radare2/ && \
    cd /opt/radare2 && \
    sys/install.sh && \
    cd /opt/xsscrapy && \
    pip install -r ./requirements.txt && \
    cd /opt/pwndbg && \
    ./setup.sh && \
    cd /opt/shellsploit-framework && \
    python ./setup.py -s install && \
    cd /opt/ropgadget && \
    python setup.py install && \
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
    
# ZSH
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone git://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
COPY jt.zsh-theme /root/.oh-my-zsh/themes/jt.zsh-theme
COPY .zshrc /root/.zshrc

# TMUX dotfile
COPY .tmux.conf /root/.tmux.conf

# Emacs dotfile
COPY .emacs.d/ /root/.emacs.d/

# MSF start Script
COPY msfstart.sh /opt/msfstart.sh

# set ZSH shell as entry point
ENTRYPOINT ["/bin/zsh"]
