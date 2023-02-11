#
# this example script creates a zpool from 7 NVME disks and adds it as a compressible swap to the system
#

zpool create nvme /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 -f
zfs create -V 1.4T -b 8192 -o compression=zstd-19 -o logbias=throughput -o sync=always -o primarycache=metadata -o secondarycache=none -o com.sun:auto-snapshot=false nvme/swap
mkswap -f /dev/zvol/nvme/swap
swapon /dev/zvol/nvme/swap
zfs set compression=on nvme
