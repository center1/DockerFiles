# Other Images

Other Images i like to use 


## Nessus

```
docker run -d -p 8834:8834 infoslack/nessus
```

## Faraday

```
 docker run -t -i -p 5984:5984 -v $DATADIR:/root/.faraday/report/workspace:rw  infobyte/faraday /root/run.sh
```