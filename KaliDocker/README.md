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
           --security-opt seccomp=unconfined \
           -v $(pwd):/opt/Data \
           jthorpe6/kali
    }
```
