#
# this example script creates a mdadm array from 1 NVME disks and add
# them as a compressible swap to the system with VRAM as bcache buffer
# data on all VRAM/NVME disks will be destroyed. vram requirement in line 24
#

apt install -y mdadm

# clean up for setup
swapoff -a
umount /dev/md100
mdadm --stop /dev/md100

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
wipefs -af /dev/nvme11n1
wipefs -af /dev/nvme12n1
wipefs -af /dev/nvme13n1
wipefs -af /dev/nvme14n1
sleep 5
partprobe

# create mdadm array from bcache disk array
mdadm --create --verbose /dev/md100 --level=0 --raid-devices=15 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1 /dev/nvme10n1  /dev/nvme11n1  /dev/nvme12n1  /dev/nvme13n1  /dev/nvme14n1

# setup and mount swap
mkswap -f /dev/md100
swapon /dev/md100
