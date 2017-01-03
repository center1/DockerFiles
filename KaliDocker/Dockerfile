# From base kali
FROM kalilinux/kali-linux-docker

# Set working dir
WORKDIR /root/

# Updates
RUN apt-get update
RUN apt-get upgrade -y 

# Env lang
## https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# kali installs
RUN apt-get install -y nmap curl sqlmap wfuzz dirb exploitdb python-impacket nikto gdb gcc man whatweb python-pip python-dev rubygems rubygems-integration build-essential patch ruby-dev zlib1g-dev liblzma-dev metasploit-framework zsh emacs-nox git openssh-client tmux bpython wordlists commix libsqlite3-dev host wapiti fimap theharvester

## Metasploit DB init
RUN msfdb init

## PIP installs
RUN pip install pwntools python-nmap requests

## GEM installs
RUN gem install ruby-nmap net-http-persistent mechanize text-table sqlite3

# TMUX dotfile
ADD .tmux.conf /root/.tmux.conf

# Emacs dotfile
ADD .emacs.d/ /root/.emacs.d/

# ZSH
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ADD .zshrc /root/.zshrc

# GitHub stuff
RUN git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/fuzzdb/
RUN git clone https://github.com/longld/peda.git /opt/peda/
RUN git clone https://github.com/shawarkhanethicalhacker/BruteXSS /opt/brutexss/
RUN git clone https://github.com/0xsauby/yasuo /opt/yaso/
RUN git clone https://github.com/zscproject/OWASP-ZSC /opt/owasp-zsc/
RUN git clone https://github.com/radare/radare2 /opt/radar2/

## Peda setup
RUN echo "source /opt/peda/peda.py" >> /root/.gdbinit

## Radar setup
RUN cd /opt/radar2 ; bash sys/install.sh

## Download GooHost.sh
RUN wget https://raw.githubusercontent.com/leebaird/discover/master/mods/goohost.sh -O /opt/goohost.sh

# Ports for python http server
EXPOSE 8000
