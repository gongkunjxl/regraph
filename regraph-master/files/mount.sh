ip_arr=($(cat /home/ReGraph/hostfile | grep slave));
ip_len=${#ip_arr[*]};serf_log  start-ssh-serf.sh

i=0;
while [ $i -lt $ip_len ]
do
    tmp="${ip_arr[$i]}";
    ssh ${tmp} '
        ./mount.sh
        exit'
    i=$(( $i + 1 ));
done
