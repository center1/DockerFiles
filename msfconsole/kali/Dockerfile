### BUILD ###

# $ docker build -t kali/msfconsole .

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
#	   kali/msfconsole
#}

# $ msfconsole

FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get install -y metasploit-framework

RUN echo "#!/bin/bash\nservice postgresql start\nmsfdb init\nmsfconsole" >/startmsf.sh && \
    chmod +x /startmsf.sh

ENTRYPOINT ["/startmsf.sh"]
