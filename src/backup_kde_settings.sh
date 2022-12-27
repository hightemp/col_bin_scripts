#!/bin/bash

cd ~/.config; ls *plasma* | xargs -n1 -I% echo mv % %.bak
cd ~/.cache; ls *plasma* | xargs -n1 -I% echo mv % %.bak
