#!/bin/bash

for d in MainProjects Projects WorkProjects SSH_Tunnels Backups bin Books ForTesting Hardware; do
  rsync \
    -v \
    --delete \
    --ignore-errors \
    -a --no-perms --no-o --no-g \
    /home/hightemp/__SpecFolders__/$d/ \
    laptop_01:/media/storage_02_disk/__SpecFolders__/$d
done
