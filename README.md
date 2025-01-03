# btwrap
Simple shell wrapper for btrfs snapshots (creation, cleanup, space usage polling)

This wrapper was intended to simplify the use of basic snapshot functions with these default behaviors:
* snapshotting subvolumes based on whether or not they have a `.snapshots` subvolume within them
* using names picked from a local dictionary at random to keep track of the individual snapshots if needed
* deleting the oldest snapshot from each `.snapshots` subvolume
    
Then, options are given to fill in the gaps for whenever you need to do something else, or keep track of space usage

Otherwise, a simple systemd timer is able to keep a basic "backup" of whatever you need, without a config file

Keep in mind a btrfs snapshot is not a true backup and will be corrupted if the original data is corrupted, yada yada :)

## Installation

```sh
cd /tmp; git clone https://github.com/Elec3137/btwrap.git; cd ./btwrap
# remove the -s flag if you don't want default systemd service and timer installed
./install -s
```
