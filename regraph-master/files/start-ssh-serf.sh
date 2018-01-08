#!/bin/bash
echo "nameserver 8.8.8.8" |  tee /etc/resolv.conf > /dev/null
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/mpich2/bin"' > /etc/environment
source /etc/environment

# start sshd
echo "start sshd..."
service ssh start

#start nfs kernel-server
echo "start rpcbind and  nfs-kernel-server..."
service rpcbind start

service nfs-kernel-server start

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members

echo -e "\nregraph-cluster-docker developed by gongkun <gongkunjxl@163.com>"
