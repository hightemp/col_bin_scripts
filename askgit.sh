#!/bin/bash

docker run -v `pwd`:/repo:ro augmentable/askgit "$1"
