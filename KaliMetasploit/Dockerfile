FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    metasploit-framework \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY msf_autorunscript.rc /root/.msf4/msf_autorunscript.rc
COPY msfconsole.rc /root/.msf4/msfconsole.rc
COPY start.sh /start.sh

ENTRYPOINT [ "/start.sh" ]
