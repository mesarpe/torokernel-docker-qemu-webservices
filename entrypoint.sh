#!/bin/bash
PATH=$PATH:/sbin:/usr/sbin

HOST_IP=192.100.200.10
HOST_NETMASK=255.255.255.0
TOROGUEST_IP=192.100.200.100
TOROGUEST_NETMASK=255.255.255.0
IMG_FOLDER=/app/img
TAP_IFACE=tap0
TOROGUEST_NET_MODEL=virtio


cd ${IMG_FOLDER} &&
mkdir -p /dev/net ;
mknod /dev/net/tun c 10 200 ;
tunctl -t ${TAP_IFACE} && 
/sbin/ifconfig ${TAP_IFACE} ${HOST_IP} netmask ${HOST_NETMASK} && 
/sbin/ifconfig ${TAP_IFACE} up &&

route add -host ${TOROGUEST_IP} dev ${TAP_IFACE}

qemu-system-x86_64 -m ${MEMORY} \
        -nographic \
        -smp ${NUMBER_OF_CPUS} \
        -drive format=raw,file=${IMG_FOLDER}/${TOROIMG_A} \
        -net nic,model=${TOROGUEST_NET_MODEL} \
        -net tap,ifname=${TAP_IFACE} \
        -drive format=raw,file=${IMG_FOLDER}/${TOROIMG_B} > /app/log_a 2> /app/log_b

cat /app/log_a
cat /app/log_b


echo $?

echo "helo"
