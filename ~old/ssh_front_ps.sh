#!/bin/bash

echo `date` "START"
while true ; do
	ssh -t VM-FRONT 'watch ps aux --sort=-pcpu';
done
