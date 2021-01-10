#!/bin/bash
$( speaker-test -t sine -f 500 -p 1 -l 0.5 )& pid=$! ; sleep 0.1s ; kill -9 $pid
