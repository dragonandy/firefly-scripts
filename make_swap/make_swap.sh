#!/bin/bash
DIR=/mnt/
SWAPFILE=swapfile
SWAPSIZE=4096
SIZEUNIT=1M

echo -en "\\033[1;34m"
echo "run with sudo or you may have permission trouble"
echo -en "\\033[0;39m"

echo "Create a swapfile "$SWAPSIZE"*"$SIZEUNIT

dd if=/dev/zero of=$DIR$SWAPFILE bs=$SIZEUNIT count=$SWAPSIZE
mkswap $DIR$SWAPFILE
swapoff -a
chmod 0600 $DIR$SWAPFILE
swapon $DIR$SWAPFILE

if cat /etc/fstab | grep -q $DIR$SWAPFILE;then
    echo -en "\\033[1;33m"
    echo "swap mount setting will not be written to /etc/fstab"
    echo "you can manually add"
    echo $DIR$SWAPFILE "swap swap default 0 0"
    echo "to /etc/fstab"
    echo -en "\\033[0;39m"
else
    echo -en "\\033[1;33m"
    echo "Warning swap mount setting will be written to /etc/fstab"
    echo "If you prefer manually mount the swapfile,delete the line:"
    echo $DIR$SWAPFILE "swap swap default 0 0"
    echo "from the fstab file"
    echo -en "\\033[0;39m"
    echo $DIR$SWAPFILE "swap swap defaults 0 0">>/etc/fstab
fi

sysctl vm.swappiness=60
