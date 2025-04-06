# btwrap
Simple shell wrapper for btrfs snapshots (creation, cleanup, space usage polling)

This wrapper is intended to automate basic snapshot functions with these default behaviors:
* Taking snapshots of subvolumes with `.snapshots` within them
* Picking random names from a local dictionary for the snapshots to be recongnizable
* Deleting the oldest snapshot from each `.snapshots` subvolume
    
Then, options are given to fill in the gaps for whenever you need to do something else, still only requiring you to be exactly as specific as you want to be.

Otherwise, a simple systemd timer and service is able to keep a very basic rolling "backup" of whatever you need, without a config file.

Keep in mind a btrfs snapshot is not a true backup and will also be corrupted if the original data is corrupted, yada yada :)

# Installation

### Arch linux
```sh
paru -S btwrap-git
```

### Generic
```sh
cd /tmp && git clone https://github.com/Elec3137/btwrap.git && cd ./btwrap && sudo cp btwrap /usr/bin/

# to install the systemd unit files afterwards
sudo cp btwrap.timer /etc/systemd/system/ && sudo cp btwrap.service /etc/systemd/system/
```

## Post-install

IF you had snapper installed prior, you might want to remove it and its snapshots!
```sh
sudo pacman -Rns snapper

# delete the snapshots within each folder in /.snapshots
for i in $(sudo ls /.snapshots) do sudo btrfs subv del /.snapshots/${i}/snapshot; done
# then delete the /.snapshots folder (you can create one as a subvolume afterwards with btwrap -C /)
sudo rm -rf /.snapshots

# delete the config directory and its systemd timers
sudo rm -rf /etc/snapper /etc/systemd/system/timers.target.wants/snapper-cleanup.timer /etc/systemd/system/timers.target.wants/snapper-timeline.timer
```

Try it out! `btwrap -C / -S`

To load and enable example systemd service+timer:
```sh
sudo systemctl daemon-reload
sudo systemctl enable --now btwrap.timer
```


