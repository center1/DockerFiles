# Kali Docker Image

```
docker build -t jthorpe6/kali .
```

```
kali(){
    docker run \
           --rm \
           -it \
           -p 8000:8000 \
           -p 2121:2121 \
           --name kali \
           --privileged \
           --security-opt seccomp=unconfined \
           -e "TERM=xterm-256color" \
           -v $HOME/.emacs.d/:/root/.emacs.d \
           -v $HOME/.tmux.conf:/root/.tmux.conf \
           -v $(pwd):/opt/data \
           jthorpe6/kali
}
```
