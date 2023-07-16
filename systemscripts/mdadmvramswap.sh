#!/bin/bash

#
# this example script creates a mdadm from 11 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 13
#
apt install -y libfuse3-dev bcache-tools

# clean up for setup
swapoff -a
mdadm --stop /dev/md0
losetup -d /dev/loop33
echo 1 > /sys/block/bcache0/bcache/stop
sysctl vm.swappiness=0

# create vram tmpfs
mkdir /tmp/vram
./vramfs /tmp/vram/ 23G &
sleep 10
truncate -s 23G /tmp/vram/cache

# setup cache as a blockdevice
losetup /dev/loop33 /tmp/vram/cache

sleep 5
partprobe

# wipe nvme disks
wipefs -af /dev/nvme0n1
wipefs -af /dev/nvme1n1
wipefs -af /dev/nvme2n1
wipefs -af /dev/nvme3n1
wipefs -af /dev/nvme4n1
wipefs -af /dev/nvme5n1
wipefs -af /dev/nvme6n1
wipefs -af /dev/nvme7n1
wipefs -af /dev/nvme8n1
wipefs -af /dev/nvme9n1
wipefs -af /dev/nvme10n1

sleep 10
partprobe

# create cache setup
make-bcache -B --writeback /dev/nvme0n1
make-bcache -B --writeback /dev/nvme1n1
make-bcache -B --writeback /dev/nvme2n1
make-bcache -B --writeback /dev/nvme3n1
make-bcache -B --writeback /dev/nvme4n1
make-bcache -B --writeback /dev/nvme5n1
make-bcache -B --writeback /dev/nvme6n1
make-bcache -B --writeback /dev/nvme7n1
make-bcache -B --writeback /dev/nvme8n1
make-bcache -B --writeback /dev/nvme9n1
make-bcache -B --writeback /dev/nvme10n1

make-bcache -C --writeback --wipe-bcache /dev/loop33

sleep 5
partprobe

# extract cache tmpfs block UID
bcache-super-show /dev/loop33 | grep cset | tr -s ' \t' '\n' | grep -v cset  > bdisk
bdisk=$(<bdisk)

# inject ID into cache
echo $bdisk > /sys/block/bcache0/bcache/attach
echo $bdisk > /sys/block/bcache1/bcache/attach
echo $bdisk > /sys/block/bcache2/bcache/attach
echo $bdisk > /sys/block/bcache3/bcache/attach
echo $bdisk > /sys/block/bcache4/bcache/attach
echo $bdisk > /sys/block/bcache5/bcache/attach
echo $bdisk > /sys/block/bcache6/bcache/attach
echo $bdisk > /sys/block/bcache7/bcache/attach
echo $bdisk > /sys/block/bcache8/bcache/attach
echo $bdisk > /sys/block/bcache9/bcache/attach
echo $bdisk > /sys/block/bcache10/bcache/attach

# enable writeback caching again
echo writeback > /sys/block/bcache0/bcache/cache_mode
echo writeback > /sys/block/bcache1/bcache/cache_mode
echo writeback > /sys/block/bcache2/bcache/cache_mode
echo writeback > /sys/block/bcache3/bcache/cache_mode
echo writeback > /sys/block/bcache4/bcache/cache_mode
echo writeback > /sys/block/bcache5/bcache/cache_mode
echo writeback > /sys/block/bcache6/bcache/cache_mode
echo writeback > /sys/block/bcache7/bcache/cache_mode
echo writeback > /sys/block/bcache8/bcache/cache_mode
echo writeback > /sys/block/bcache9/bcache/cache_mode
echo writeback > /sys/block/bcache10/bcache/cache_mode

# create mdadm array from bcache disk array
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=11 /dev/bcache0 /dev/bcache1 /dev/bcache2 /dev/bcache3 /dev/bcache4 /dev/bcache5 /dev/bcache6 /dev/bcache7 /dev/bcache8 /dev/bcache9 /dev/bcache10

# setup and mount swap
mkswap -f /dev/md0
swapon /dev/md0

# check cache mount status
cat /sys/block/bcache0/bcache/state
