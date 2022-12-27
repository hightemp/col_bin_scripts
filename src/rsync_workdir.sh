#!/bin/bash

rsync \
  -v \
  --ignore-errors \
  -a --no-perms --no-o --no-g \
  /home/hightemp/__SpecFolders__/WorkProjects/ laptop_01:/media/storage_02_disk/WorkProjects
