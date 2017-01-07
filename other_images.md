# Other Images

Other Images i like to use 


## Nessus

```
nessus(){
    docker run \
           --rm \
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
