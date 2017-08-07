# pwngdb 

#gdb(){
#    bin=$1
#    binpath=$(realpath $1)
#     docker run \
#	   --rm \
#	   -it \
#	   --privileged \
#	   -v $binpath:/tmp/$bin \
#	   jthorpe6/pwndbg \
#	   /tmp/$bin
#}

FROM debian

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get -qq update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install git sudo

RUN git clone --quiet https://github.com/pwndbg/pwndbg /opt/pwndbg &&\
    cd /opt/pwndbg && ./setup.sh

ENTRYPOINT ["gdb"]
