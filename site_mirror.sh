#!/bin/bash

wget \
     --mirror \
     --wait=2 \
     --limit-rate=20K \
     --page-requisites \
     --user-agent=Mozilla \
     --no-parent \
     --convert-links \
     --adjust-extension \
     --no-clobber \
     -e robots=off \
     $1
