#!/bin/dash
while getopts s flag; do
    case "${flag}" in
        s) systemd=true;;
    esac
done
sudo cp btwrap /bin/

if [ "$systemd" ]; then
    sudo cp btwrap.timer /etc/systemd/system/
    sudo cp btwrap.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable --now btwrap.timer
fi
