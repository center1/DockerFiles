```
docker build -t jthorpe6/kali-metasploit .
```

```
msfconsole(){
    docker run \
           --rm \
           -it \
           -p 443:443 \
           -p 4444:4444 \
           -v $HOME/.msf4:/root/.msf4/ \
           --name metasploit \
           jthorpe6/kali-metasploit
    }
```
