#!/bin/bash
curl $1 -so - | tr -d '\n' | grep -iPo '(?<=<title>)(.*)(?=</title>)'
