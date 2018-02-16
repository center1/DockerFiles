FROM debian
ENV LC_ALL C.UTF-8
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    sudo \
    zsh \
    git \
    tmux \
    curl \
    locales \
    python-pip \
    python-dev \
    python3-pip \
    python3-dev \
    python-pycurl \
    libcurl4-openssl-dev \
    libssl-dev
RUN useradd -ms /bin/zsh bughunter && \
    usermod -g sudo bughunter && \
    echo "bughunter ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/bughunter
USER bughunter
RUN pip install \
    httplib2==0.10.3 \
    colorlog==2.10.0 \
    protobuf==3.2.0rc2 \
    google==1.9.3 \
    wfuzz \
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
    mechanize \
    prettytable \
    progressbar \
    colorama \
    terminaltables \
    termcolor \
    coloredlogs \
    lxml
RUN pip3 install \
    docopt \
    bs4 \
    boto3==1.4.8 \
    botocore==1.8.2 \
    certifi==2017.11.5 \
    certstream==1.8 \
    chardet==3.0.4 \
    docutils==0.14 \
    idna==2.6 \
    jmespath==0.9.3 \
    multidict==3.3.2 \
    pipdeptree==0.10.1 \
    pyaml==17.10.0 \
    python-dateutil==2.6.1 \
    PyYAML==3.12 \
    requests==2.18.4 \
    requests-file==1.4.2 \
    s3transfer==0.1.11 \
    six==1.11.0 \
    termcolor==1.1.0 \
    tldextract==2.2.0 \
    urllib3==1.22 \
    websocket-client==0.44.0
RUN git clone https://github.com/maurosoria/dirsearch ~/dirsearch && \
    git clone https://github.com/fuzzdb-project/fuzzdb ~/fuzzdb && \
    git clone https://github.com/aboul3la/Sublist3r ~/Sublist3r && \
    git clone https://github.com/m4ll0k/Spaghetti ~/Spaghetti && \
    git clone https://github.com/m4ll0k/WPSeku ~/WPSeku && \
    git clone https://github.com/Dionach/CMSmap ~/CMSmap && \
    git clone https://github.com/DanMcInerney/xsscrapy ~/xsscrapy && \
    git clone https://github.com/ekultek/pybelt ~/pybelt && \
    git clone https://github.com/eth0izzle/bucket-stream ~/bucket-stream && \
    git clone https://github.com/AzizDammak/DorkScan ~/DorkScan && \
    git clone https://github.com/ropnop/xxetimes ~/xxetimes && \
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/sqlmap-dev && \
    git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/PayloadsAllTheThings
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
    echo "alias pyhttpd='python -m SimpleHTTPServer'" >> ~/.zshrc && \
    echo "alias pyftpd='python -m pyftpdlib'" >> ~/.zshrc
ENTRYPOINT ["/bin/zsh"]
