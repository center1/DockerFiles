FROM debian
WORKDIR /root/
ENV LC_ALL C.UTF-8
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    zsh \
    git \
    tmux \
    locales \
    python-pip \
    python-dev \
    python3-pip \
    python3-dev
RUN pip install \
    pyftpdlib \
    requests \
    Scrapy==1.1.0rc3 \
    pybloom==1.1 \
    beautifulsoup \
    twisted==16.6.0 \
    w3lib \
    six \
    cssselect \
    pyopenssl \
    cryptography \
    queuelib \
    dnspython \
    tornado \
    bs4 \
    termcolor \
    terminaltables
RUN git clone https://github.com/maurosoria/dirsearch /opt/dirsearch && \
    git clone https://github.com/fuzzdb-project/fuzzdb /opt/fuzzdb && \
    git clone https://github.com/m4ll0k/Spaghetti /opt/Spaghetti && \
    git clone https://github.com/aboul3la/Sublist3r /opt/Sublist3r && \
    git clone https://github.com/swisskyrepo/Wordpresscan.git /opt/Wordpresscan && \
    git clone https://github.com/DanMcInerney/xsscrapy /opt/xsscrapy && \
    git clone https://github.com/Dionach/CMSmap /opt/CMSmap && \
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap-dev && \
    git clone https://github.com/Hadesy2k/sqliv /opt/sqliv && \
    git clone https://github.com/swisskyrepo/PayloadsAllTheThings /opt/PayloadsAllTheThings
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" && \
    ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin && \
    ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout && \
    ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc && \
    ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile && \
    ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv && \
    ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc && \
    echo "export TERM=screen-256color" >> ~/.zshrc && \
    echo "unset TMPDIR" >> ~/.zshrc && \
    echo "alias rm=rm" >> ~/.zshrc && \
    echo "alias pyhttpd='python -m SimpleHTTPServer 8080'" >> ~/.zshrc && \
    echo "alias pyftpd='python -m pyftpdlib'" >> ~/.zshrc
ENTRYPOINT ["/bin/zsh"]
