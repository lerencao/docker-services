#/bin/bash
if [ -z "$1" ]
  then
      echo "no interface supplied. Example: $0 eth0"
      exit
fi

interface=$1
ip=`ifconfig $interface | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
mask=`ifconfig $interface | grep 'inet addr:' | cut -d: -f4`
public_net=`ipcalc $ip/$mask | grep 'Network' | awk '{print $2}'`
echo $interface
echo $ip
echo $mask
echo $public_net

sudo docker run -d \
     --name=ceph-mon \
     --restart=always \
     --net=host \
     -v /etc/ceph:/etc/ceph \
     -v /var/lib/ceph:/var/lib/ceph \
     -e MON_NAME=$hostname \
     -e MON_IP=$ip \
     -e CEPH_PUBLIC_NETWORK=$public_net \
     ceph/daemon mon
