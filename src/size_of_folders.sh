#!/bin/bash

for d in /home/hightemp/__SpecFolders__/*; do
	du -h -d 0 $d/
done
