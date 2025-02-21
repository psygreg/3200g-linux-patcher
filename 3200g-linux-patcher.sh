#!/bin/sh
# a patcher for random crashes caused by amdgpu with Ryzen 3 3200G integrated graphics.
# vars
FILE=""
N=""
# functions
nondef () {
    echo "Non-default configuration file placement. Aborting."
    sleep 5
    exit 1
}
patch () {
    sudo sed -i "${N}s/\(.*\)\(.\)/\1 amdgpu.noretry=0\2/" "$FILE"
}
finished () {
    echo "Done."
    sleep 5
    exit 0
}
# runtime
if [ -f /etc/default/grub ]; then
    echo "GRUB detected."
    FILE="/etc/default/grub"
    if [ ! -f $FILE ]; then
        nondef
    else
        N=$(grep -n 'GRUB_CMDLINE_LINUX_DEFAULT' "$FILE" | cut -d: -f1)
        patch
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        finished
    fi
elif [ -f /boot/refind_linux.conf ]; then
    echo "rEFInd detected."
    FILE="/boot/refind_linux.conf"
    if [ ! -f $FILE ]; then
        nondef
    else
        N=$(grep -n 'Boot using default options' "$FILE" | cut -d: -f1)
        patch
        finished
    fi
else
    echo "No supported boot loader found."
    sleep 5
    exit 2
fi
