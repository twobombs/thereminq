#
# this example script creates a mdadm array from 7 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 24
#

apt install -y mdadm

# clean up for setup
swapoff -a
umount /dev/md0
mdadm --stop /dev/md0

zpool destroy nvme
losetup -d /dev/loop33
killall vramfs
umount /tmp/ram

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

# create mdadm array from bcache disk array
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=7 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1

# setup and mount swap
mkswap -f /dev/md0
swapon /dev/md0
