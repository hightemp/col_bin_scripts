#!/bin/bash

rsync \
    -v \
    --delete \
    --ignore-errors \
    -a --no-perms --no-o --no-g \
    /home/hightemp/Downloads/ \
    laptop_01:/media/storage_02_disk/__SpecFolders__/Downloads
