#
# this example script creates a zpool from 7 NVME disks and add
# them as a compressible swap to the system with VRAM and RAM as bcache/ZFS buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 17-24
# requirement: ZFS 
#
apt install -y libfuse3-dev bcache-tools zfsutils-linux
# remove OOM watchdog
apt remove -y systemd-oomd
# clean up for setup
swapoff -a
zpool destroy nvme
losetup -d /dev/loop33
killall vramfs
umount /tmp/ram
echo 1 > /sys/block/bcache0/bcache/stop

# create ram tmpfs
mkdir /tmp/ram
mount -t tmpfs -o rw,size=6G tmpfs /tmp/ram

# create vram tmpfs
mkdir /tmp/vram
./vramfs/bin/vramfs /tmp/vram/ 22G &
sleep 10

# enter tmpfs and create block files
cd /tmp/ram
truncate -s 3G l2arc
truncate -s 3G zslog

cd /tmp/vram/
truncate -s 22G cache

# setup cache as a blockdevice
losetup /dev/loop33 /tmp/vram/cache

# wipe nvme disks
wipefs -af /dev/nvme0n1
wipefs -af /dev/nvme1n1
wipefs -af /dev/nvme2n1
wipefs -af /dev/nvme3n1
wipefs -af /dev/nvme4n1
wipefs -af /dev/nvme5n1
wipefs -af /dev/nvme6n1

sleep 5
partprobe

# create cache setup
make-bcache -B /dev/nvme0n1
make-bcache -B /dev/nvme1n1
make-bcache -B /dev/nvme2n1
make-bcache -B /dev/nvme3n1
make-bcache -B /dev/nvme4n1
make-bcache -B /dev/nvme5n1
make-bcache -B /dev/nvme6n1
make-bcache -C /dev/loop33

sleep 5

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

# enable writeback caching
echo writeback > /sys/block/bcache0/bcache/cache_mode
echo writeback > /sys/block/bcache1/bcache/cache_mode
echo writeback > /sys/block/bcache2/bcache/cache_mode
echo writeback > /sys/block/bcache3/bcache/cache_mode
echo writeback > /sys/block/bcache4/bcache/cache_mode
echo writeback > /sys/block/bcache5/bcache/cache_mode
echo writeback > /sys/block/bcache6/bcache/cache_mode

# create zfs pool from bcache disk array, add l2arc and zslog for dedicated logging
zpool create nvme -f /dev/bcache0 /dev/bcache1 /dev/bcache2 /dev/bcache3 /dev/bcache4 /dev/bcache5 /dev/bcache6
zfs create -V 1.4T -b 4096 -o compression=off -o logbias=throughput -o sync=always -o primarycache=metadata -o com.sun:auto-snapshot=false nvme/swap
zpool add nvme cache /tmp/ram/l2arc
zpool add nvme log /tmp/ram/zslog

# setup and mount swap
mkswap -f /dev/zvol/nvme/swap
swapon /dev/zvol/nvme/swap
zfs set compression=zstd-19 nvme
