#!/bin/bash

sudo chmod 777 /dev/$1
VBoxManage internalcommands createrawvmdk -filename "$1.vmdk" -rawdisk /dev/$1
sudo chmod 777 "$1.vmdk"
