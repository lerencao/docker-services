#!/bin/bash

docker run -d \
       --net=host \
       --pid=host \
       --restart=always \
       --privileged=true \
       -v /etc/ceph:/etc/ceph \
       -v /var/lib/ceph:/var/lib/ceph \
       -v /dev/:/dev/ \
       -e OSD_DEVICE=/dev/sdb \
       -e OSD_TYPE=disk \
       ceph/daemon osd
