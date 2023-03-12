#
# this example script creates a mdadm from 11 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 13
#

apt install -y libfuse3-dev bcache-tools

# clean up for setup
swapoff -a
losetup -d /dev/loop33
echo 1 > /sys/block/bcache0/bcache/stop

# create vram tmpfs
mkdir /tmp/vram
./vramfs/bin/vramfs /tmp/vram/ 2G &
sleep 10

truncate -s 2G /tmp/vram/cache

# setup cache as a blockdevice
losetup /dev/loop33 /tmp/vram/cache

sleep 5
partprobe

# wipe nvme disks
wipefs -af /dev/sdc

sleep 10
partprobe

# create cache setup
make-bcache -B --writeback /dev/sdc
make-bcache -C --writeback --wipe-bcache /dev/loop33

sleep 5
partprobe

# extract cache tmpfs block UID
bcache-super-show /dev/loop33 | grep cset | tr -s ' \t' '\n' | grep -v cset  > bdisk
bdisk=$(<bdisk)

# inject ID into cache
echo $bdisk > /sys/block/bcache0/bcache/attach

# enable writeback caching again
echo writeback > /sys/block/bcache0/bcache/cache_mode

# create mdadm array from bcache disk array
# mdadm --create --verbose /dev/md0 --level=0 --raid-devices=11 /dev/bcache0 /dev/bcache1 /dev/bcache2 /dev/bcache3 /dev/bcache4 /dev/bcache5 /dev/bcache6 /dev/bcache7 /dev/bcache8 /dev/bcache9 /dev/bcache10

# setup and mount swap
mkswap -f /dev/bcache0
swapon /dev/bcache0

# check cache mount status
cat /sys/block/bcache0/bcache/state
