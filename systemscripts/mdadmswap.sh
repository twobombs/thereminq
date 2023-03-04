#
# this example script creates a mdadm array from 7 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 24
#

apt install -y libfuse3-dev bcache-tools mdadm

# clean up for setup
swapoff -a
umount /dev/md0
mdadm --stop /dev/md0
zpool destroy nvme
losetup -d /dev/loop33
killall vramfs
umount /tmp/ram
echo 1 > /sys/block/bcache0/bcache/stop

# create ram tmpfs
#mkdir /tmp/ram
#mount -t tmpfs -o rw,size=7G tmpfs /tmp/ram

# create vram tmpfs
mkdir /tmp/vram
./vramfs/bin/vramfs /tmp/vram/ 22G &
sleep 10

# enter tmpfs and create block files
#cd /tmp/ram
#truncate -s 3G l2arc
#truncate -s 3G zslog

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

# create mdadm array from bcache disk array
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=7 /dev/bcache0 /dev/bcache1 /dev/bcache2 /dev/bcache3 /dev/bcache4 /dev/bcache5 /dev/bcache6

# setup and mount swap
mkswap -f /dev/md0
swapon /dev/md0
