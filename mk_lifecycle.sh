#!/bin/bash

# Clean up data file for proper conversion and create our HTML output 
cat var/lib/lifecycle/data/sle-live-patching.lifecycle usr/share/lifecycle/data/sle-module-live-patching.lifecycle >> 12-15combined_live-patching.txt
grep -v '^#' 12-15combined_live-patching.txt >> $1

sed -i '1s/^/LivePatch\ Kernel\,Expire\ Date \n/' $1
sed -i s/\*,//g $1
sed -i s/kgraft-patch-//g $1
sed -i s/kernel-livepatch-//g $1
