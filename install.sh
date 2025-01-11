#!/bin/sh
while getopts sp flag; do
    case "${flag}" in
        s) systemd=true;;
        p) preserve=true;;
    esac
done
sudo cp btwrap /bin/

if [ "$systemd" = true ]; then
    sudo cp btwrap.timer /etc/systemd/system/
    sudo cp btwrap.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable --now btwrap.timer
fi

[ ! "$preserve" = true ] && rm -rf /tmp/btwrap  # cleanup
