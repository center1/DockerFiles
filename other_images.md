# Other Images

Other Images i like to use 


## Nessus

```
nessus(){
    docker run \
           -d \
           -p 8834:8834 \
           --name nessus \
           infoslack/nessus \
        && echo "https://localhost:8834"
    }

```

## Faraday

```
 docker run --rm -it -p 5984:5984 -v $(pwd):/root/.faraday/report/workspace:rw  infobyte/faraday /root/run.sh
```


## Spotify

```
spotify(){
    docker run --rm \
           -v /etc/localtime:/etc/localtime:ro \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           --device /dev/snd:/dev/snd \
           -v $HOME/.spotify/config:/home/spotify/.config/spotify \
           -v $HOME/.spotify/cache:/home/spotify/spotify \
           --name spotify \
           jess/spotify
    }
```

## VLC

```
vlc(){
    docker run --rm \
           -v /etc/localtime:/etc/localtime:ro \
           --device /dev/snd \
           --device /dev/dri \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           -v $HOME/Videos:/home/vlc/ \
           --name vlc \
           jess/vlc
    }
```

## Libre Office

```
libreoffice(){
    docker run --rm \
    -v $HOME/Documents:/home/libreoffice/Documents:rw \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e uid=$(id -u) \
       -e gid=$(id -g) \
       -e DISPLAY=unix$DISPLAY \
       --name libreoffice \
       chrisdaish/libreoffice
    }
```
