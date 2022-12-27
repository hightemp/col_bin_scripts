#!/bin/bash

if [[ "$1" == "" ]]; then
    file_name=$(basename $0)
    echo "Add dir to PATH global var"
    echo "  $file_name dir"
    exit 1
fi

PATHRC_file_path="$HOME/.pathrc"

if [ ! -f $PATHRC_file_path ]; then
    touch $PATHRC_file_path
    echo "[!] created file '$PATHRC_file_path'"
fi

new_path="$1"

if [ -d $1 ]; then
    new_path=$(realpath "$1" 2>/dev/null)
fi

if `cat $PATHRC_file_path | grep -Fq "$new_path"`; then
    echo "[-] already exists in '$PATHRC_file_path'"
else
    echo "export PATH=\"\$PATH:$new_path\"" >> $PATHRC_file_path
    echo "[+] '$new_path' added to '$PATHRC_file_path'"
fi

bashrc_file_path="$HOME/.bashrc"

if `cat $bashrc_file_path | grep -Fq "$PATHRC_file_path"`; then
    echo "[!] '$PATHRC_file_path' already added to '$bashrc_file_path'"
else
    echo "[+] '$PATHRC_file_path' added to '$bashrc_file_path'"
    echo "source $PATHRC_file_path" >> $bashrc_file_path
fi
