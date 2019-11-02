#!/bin/bash
for i in $(arp -n -a | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"); do echo $i $(host $i | grep -E -o "([a-zA-Z0-9._-]+)(?=.)$"); done
