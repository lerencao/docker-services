vagrant up
vagrant ssh

```
cd /vagrant
chmod u+x mon.sh
./mon.sh
docker ps
docker exec ceph-mon ceph -s
```

append to /etc/ceph/ceph.conf:


    osd pool default size = 1
    osd pool default min_size = 1

