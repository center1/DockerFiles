# Other Images

Other Images i like to use 

## Metasploit

``` bash
msfconsole() {
    docker run \
	   --rm \
	   -it \
	   -p 443:443 \
	   -p 4444:4444 \
	   -v $HOME/.msf4:/root/.msf4/ \
	   --name metasploit \
	   linuxkonsult/kali-metasploit
}
```
## Nessus

``` bash
nessus(){
     docker run \
           -d \
           -p 8834:8834 \
           --name nessus \
	   jgamblin/nessus
     echo -e "\nhttps://127.0.0.1:8834"
}
```
## Burp

``` bash
burp(){
    docker run \
	   -v /tmp/.X11-unix/:/tmp/.X11-unix \
	   -e DISPLAY=$DISPLAY \
	   -p 8080:8080  \
	   -it \
	   raesene/burp-free
}
```
## Faraday 

``` bash
faraday(){
     docker run \
           --rm \
           -it \
           -p 5984:5984 \
           -v $(pwd):/root/.faraday/report/workspace:rw \
           infobyte/faraday \
           /root/run.sh
    }
```
## Sniper

``` bash
sniper(){
     docker run \
	   --rm \
	   -ti \
	   menzo/sn1per-docker \
	   sniper $1
}
```
## Arachni

```
arachni(){
    docker run \
	   -d \
	   --name arachni \
	   -p 9292:9292 \
	   ahannigan/docker-arachni \
	   bin/arachni_web -o 0.0.0.0
    echo -e "\nhttp://127.0.0.1:9292"
    }

```

## Radare2

``` bash
r2(){
    bin=$1
    binpath=$(realpath $1)
     docker run \
	   --rm \
	   -it \
	   --privileged \
	   -v $HOME/.radare2rc:/home/r2/.radare2rc \
	   -v$binpath:/tmp/$bin \
	   radare/radare2 \
	   r2 /tmp/$bin
}
```
## LEMP stack

``` bash
lemp(){
    docker run \
	   --name=lemp \
	   -dP \
	   -v $(pwd):/var/www/html \
	   linuxconfig/lemp-php7
    docker ps -l
}

```
## Browser Bundle

``` bash
browerbundle(){
    docker run -it --rm \
  --volume /usr/local/bin:/target \
  --env BROWSER_BOX_REPO=sameersbn \
  sameersbn/browser-box:1.0.1-3 \
  tor-browser
}
```
