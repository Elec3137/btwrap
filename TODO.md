
### Features

* option to create rw snapshots (is this useful?)

* consider adding interactive confirmation (since this can delete important data with a mistake), integrate with -q

* possibly remove '-m', ~~'-n'~~ operations; not useful for the simple management this project is made for (if needed, using btrfs-progs alone to do this would be easy?)

* ~~consider adding an action to run update-grub after others (to trigger grub-btrfs)~~

* more logic for -D action, to preserve snapshots or delete newest instead?


### Semantic

* check whether path is a subvolume for some actions (is this needed?)

* add $dict_path logic or replacement
