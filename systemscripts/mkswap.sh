mdadm --stop /dev/md127
mdadm --create --verbose /dev/md127 --level=0 --raid-devices=12 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1 /dev/nvme10n1 /dev/nvme11n1
mkfs.ext4 /dev/md127
mount /dev/md127 /media/aryan/nvmeswap
cd /media/aryan/nvmeswap/
fallocate -l 2.5T swapfile
chmod 600 swapfile
mkswap swapfile
swapon /media/aryan/nvmeswap/swapfile
