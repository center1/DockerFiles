FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    metasploit-framework \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh

ENTRYPOINT [ "/start.sh" ]
