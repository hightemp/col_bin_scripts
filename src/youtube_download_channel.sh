#!/bin/bash

DIR_NAME="$1"
URL_CHANNEL="$2"

mkdir -p $DIR_NAME
cd $DIR_NAME
youtube-dl -f best -ciw -o "%(title)s.%(ext)s" -v "$URL_CHANNEL"