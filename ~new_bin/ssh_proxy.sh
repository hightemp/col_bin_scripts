#!/bin/bash

ssh -f -N -D 0.0.0.0:9900 proxy_fornex "watch ps aux"
