serf members |grep master | awk -F :7946 '{print $1}' | awk '{print $2}' > tmp
master_IP=($(cat tmp))
mount -t nfs $master_IP:/home/ReGraph /home/ReGraph
