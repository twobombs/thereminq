#
# this example script creates a zpool from 7 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 13
#

apt install -y libfuse3-dev bcache-tools

# clean up for setup
swapoff -a
mdadm --stop /dev/md0
zpool destroy nvme
losetup -d /dev/loop33
blockdev --flushbufs /dev/ram0

# create 22GB brd
modprobe brd rd_nr=1 rd_size=23068672

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
make-bcache -C -w 4096 --writeback --wipe-bcache /dev/ram0

sleep 5

# extract cache tmpfs block UID
bcache-super-show /dev/ram0 | grep cset | tr -s ' \t' '\n' | grep -v cset  > bdisk
bdisk=$(<bdisk)

# inject ID into cache
echo $bdisk > /sys/block/bcache0/bcache/attach
echo $bdisk > /sys/block/bcache1/bcache/attach
echo $bdisk > /sys/block/bcache2/bcache/attach
echo $bdisk > /sys/block/bcache3/bcache/attach
echo $bdisk > /sys/block/bcache4/bcache/attach
echo $bdisk > /sys/block/bcache5/bcache/attach
echo $bdisk > /sys/block/bcache6/bcache/attach

# enable writeback caching again
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
