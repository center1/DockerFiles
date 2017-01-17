# From base kali
FROM kalilinux/kali-linux-docker

MAINTAINER joethorpe6@openmailbox.org

# Set working dir
WORKDIR /root/

# Updates
RUN apt-get update && apt-get upgrade -y 

# Env lang
## https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# kali installs
RUN apt-get install -y \
    nmap curl sqlmap wfuzz dirb \
    exploitdb python-impacket nikto gdb gcc \
    man whatweb python-pip python-dev rubygems \
    rubygems-integration build-essential patch ruby-dev zlib1g-dev \
    liblzma-dev skipfish zsh emacs-nox git \
    openssh-client tmux bpython wordlists commix \
    libsqlite3-dev host wapiti fimap theharvester \
    python-pyx python-matplotlib python-ecdsa python3-pip python3-dev \
    tcpdump scapy libxml2-utils sslscan wpscan \
    libglib2.0-dev msfpc metasploit-framework gobuster 

RUN apt-get -y autoremove
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## PIP installs
RUN pip install \
    pwntools python-nmap requests httplib2 pyip pycrypto pyopenssl pyftpdlib

## GEM installs
RUN gem install \
    ruby-nmap net-http-persistent mechanize text-table sqlite3

## Download GooHost.sh
RUN wget https://raw.githubusercontent.com/leebaird/discover/master/mods/goohost.sh -O /opt/goohost.sh

# TMUX dotfile
COPY .tmux.conf /root/.tmux.conf

# Emacs dotfile
COPY .emacs.d/ /root/.emacs.d/

# MSF start Script
COPY msfstart.sh /opt/msfstart.sh

# ZSH
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && git clone git://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions/ \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
COPY .zshrc /root/.zshrc

## Make Data Dir
RUN mkdir -p /opt/Data/

# GitHub stuff
RUN git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/fuzzdb/
RUN git clone https://github.com/shawarkhanethicalhacker/BruteXSS /opt/brutexss/
RUN git clone https://github.com/0xsauby/yasuo /opt/yasuo/
RUN git clone https://github.com/zscproject/OWASP-ZSC /opt/owasp-zsc/
RUN git clone https://github.com/SpiderLabs/ikeforce /opt/ikeforce/

#RUN git clone https://github.com/longld/peda.git /opt/peda/ \
#    && echo "source /opt/peda/peda.py" >> /root/.gdbinit

RUN git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy/ \
    && cd /opt/xsscrapy \
    && pip install -r ./requirements.txt

RUN git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg && \
    cd /opt/pwndbg && \
    ./setup.sh

RUN git clone https://github.com/radare/radare2 /opt/radar2/ \
    && cd /opt/radar2 \
    && bash sys/install.sh

# set ZSH shell as entry point
ENTRYPOINT ["/bin/zsh"]
