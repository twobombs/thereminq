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
killall vramfs
umount /tmp/ram

sleep 5

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

# create zfs pool from bcache disk array, add l2arc and zslog for dedicated logging
zpool create nvme -f /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 
zfs create -V 1.5T -b 8192 -o compression=off -o logbias=throughput -o sync=always -o primarycache=metadata -o com.sun:auto-snapshot=false nvme/swap

# setup and mount swap
mkswap -f /dev/zvol/nvme/swap
swapon /dev/zvol/nvme/swap
zfs set compression=off nvme
