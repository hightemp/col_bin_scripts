#!/bin/bash

for i in Backups  bin  Books  ForTesting  Hardware  MainProjects  Projects  SSH_Tunnels  WorkProjects; do
  rsync \
    -v \
    --delete\
    --ignore-errors \
    --progress \
    -a --no-perms --no-o --no-g \
    /home/hightemp/__SpecFolders__/$i/ laptop_01:/media/storage_02_disk/__SpecFolders__/$i
done
