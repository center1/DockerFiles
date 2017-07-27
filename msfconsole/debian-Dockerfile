# https://gist.github.com/jthorpe6/14a67a19e6b0976fc98f6f6d1dcd7e09

### BUILD ###

# $ docker build -t debian/msfconsole .

### RUNNING ### 

# add the following to your $HOME/.bashrc file 

# msfconsole() {
#    docker run \
#	   --rm \
#	   -it \
#	   -p 443:443 \
#	   -p 4444:4444 \
#	   -v $HOME/.msf4:/root/.msf4/ \
#	   --name msfconsole \
#	   debian/msfconsole
#}

# $ msfconsole


FROM debian

RUN apt-get update && apt-get install -y \
    sudo \
    git \
    wget \ 
    nmap \
    software-properties-common \
    build-essential \
    libreadline-dev \
    libssl-dev \
    libpq5 \
    libpq-dev \
    libreadline5 \
    libsqlite3-dev  \
    libpcap-dev \
    git-core \
    autoconf \
    postgresql \
    pgadmin3 \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    tigervnc-viewer \
    xtightvncviewer \
    libyaml-dev \
    zlib1g-dev
    
RUN cd $HOME && \
    git clone git://github.com/sstephenson/rbenv.git .rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc && \
    git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo && \
    $HOME/.rbenv/bin/rbenv install $(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - ) && \
    $HOME/.rbenv/bin/rbenv global $(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )

RUN service postgresql start && \
    sudo -u postgres createuser msf -S -R -D && \
    sudo -u postgres createdb -O msf msf && \
    sudo -u postgres psql -c "ALTER USER msf WITH PASSWORD 'msf';"

RUN git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework && \
    cd /opt/metasploit-framework/ && \
    $HOME/.rbenv/versions/$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )/bin/gem install bundler && \
    $HOME/.rbenv/versions/$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )/bin/bundle install && \
    bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

RUN echo "#!/bin/bash\nservice postgresql start\n/root/.rbenv/bin/rbenv sudo /opt/metasploit-framework/msfconsole -y /opt/metasploit-framework/config/database.yml" > /opt/runmsf.sh && \
    chmod +x /opt/runmsf.sh

RUN echo "production: " >> /opt/metasploit-framework/config/database.yml && \
    echo " adapter: postgresql" >> /opt/metasploit-framework/config/database.yml && \
    echo " database: msf" >> /opt/metasploit-framework/config/database.yml && \
    echo " username: msf" >> /opt/metasploit-framework/config/database.yml && \
    echo " password: msf" >> /opt/metasploit-framework/config/database.yml && \
    echo " host: 127.0.0.1" >> /opt/metasploit-framework/config/database.yml && \
    echo " port: 5432" >> /opt/metasploit-framework/config/database.yml && \
    echo " pool: 75" >> /opt/metasploit-framework/config/database.yml && \
    echo " timeout: 5" >> /opt/metasploit-framework/config/database.yml && \
    echo "export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml" >> /etc/profile && \
    echo "alias msfconsole='/opt/runmsf.sh'" >> $HOME/.bashrc

ENTRYPOINT ["/opt/runmsf.sh"]
