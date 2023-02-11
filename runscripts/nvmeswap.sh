#
# this example script creates a zpool from 7 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 13
#

apt install -y libfuse3-dev bcache-tools

swapoff -a
zpool destroy nvme

mkdir /tmp/vram
./vramfs/bin/vramfs /tmp/vram/ 8G &
sleep 5

cd /tmp/vram/
truncate -s 6G cache
losetup /dev/loop33 /tmp/vram/cache 

wipefs -a /dev/nvme0n1
wipefs -a /dev/nvme1n1
wipefs -a /dev/nvme2n1
wipefs -a /dev/nvme3n1
wipefs -a /dev/nvme4n1
wipefs -a /dev/nvme5n1
wipefs -a /dev/nvme6n1

make-bcache -B /dev/nvme0n1
make-bcache -B /dev/nvme1n1
make-bcache -B /dev/nvme2n1
make-bcache -B /dev/nvme3n1
make-bcache -B /dev/nvme4n1
make-bcache -B /dev/nvme5n1
make-bcache -B /dev/nvme6n1
make-bcache -C /dev/loop33

bcache-super-show /dev/loop33 | grep cset | tr -s ' \t' '\n' | grep -v cset  > bdisk
bdisk=$(<bdisk)

echo $bdisk > /sys/block/bcache0/bcache/attach
echo $bdisk > /sys/block/bcache1/bcache/attach
echo $bdisk > /sys/block/bcache2/bcache/attach
echo $bdisk > /sys/block/bcache3/bcache/attach
echo $bdisk > /sys/block/bcache4/bcache/attach
echo $bdisk > /sys/block/bcache5/bcache/attach
echo $bdisk > /sys/block/bcache6/bcache/attach

echo writeback > /sys/block/bcache0/bcache/cache_mode
echo writeback > /sys/block/bcache1/bcache/cache_mode
echo writeback > /sys/block/bcache2/bcache/cache_mode
echo writeback > /sys/block/bcache3/bcache/cache_mode
echo writeback > /sys/block/bcache4/bcache/cache_mode
echo writeback > /sys/block/bcache5/bcache/cache_mode
echo writeback > /sys/block/bcache6/bcache/cache_mode

zpool create nvme /dev/bcache0 /dev/bcache1 /dev/bcache2 /dev/bcache3 /dev/bcache4 /dev/bcache5 /dev/bcache6
zfs create -V 1.4T -b 8192 -o compression=zstd-19 -o logbias=throughput -o sync=always -o primarycache=metadata -o secondarycache=none -o com.sun:auto-snapshot=false nvme/swap

mkswap -f /dev/zvol/nvme/swap
swapon /dev/zvol/nvme/swap
zfs set compression=on nvme
