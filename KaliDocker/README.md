# Kali Docker Image

```
docker build -t jthorpe6/kali .
```

```
docker run --rm -ti -p 8000:8000 -v $(pwd):/opt/Data jthorpe6/kali "/bin/zsh"
```
