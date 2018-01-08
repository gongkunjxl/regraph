FROM gongkunjxl/serf-dnsmasq:0.1.0

MAINTAINER gongkun <gongkunjxl@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y nfs-kernel-server gcc build-essential g++ gfortran
RUN mkdir -p /usr/local/mpich2

RUN wget http://www.mpich.org/static/downloads/3.2.1/mpich-3.2.1.tar.gz && \
    tar -xzvf mpich-3.2.1.tar.gz && \
    rm mpich-3.2.1.tar.gz
RUN cd mpich-3.2.1 && \
    ./configure -prefix=/usr/local/mpich2 && \
    make && make install

#files
COPY files/* /tmp/

#RUN mv /tmp/bashrc ~/.bashrc && \
RUN mv /tmp/mount.sh ~/mount.sh && \
    mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

RUN chmod -R 777 ~/mount.sh && \
    chmod -R 777 ~/start-ssh-serf.sh

#mount files
RUN mkdir -p /home/ReGraph
RUN echo "/home/ReGraph *(rw,sync,no_subtree_check)" >> /etc/exports

#start cp ReGraph test 
ADD ReGraph /home/ReGraph/
RUN chmod -R 777 /home/ReGraph

#the privileged
RUN chmod 644 ~/.ssh/config
#CMD [ "sh", "-c", "service ssh start; bash"]

EXPOSE 22 7373 7946 9000 8088

CMD '/root/start-ssh-serf.sh'; 'bash'


