#!/bin/bash
usage () { echo "Usage: $0 "$1 for spacewalk report text file,  $2 for the errata patch file, $3 resulting CSV file output"" 1>&2; exit 1; }


spacewalk-report errata-list-all|grep "Live Patch"|grep ^SUSE- | awk -F "," '{ print $1 }' |sort >> $1
for i in `cat $1`;do spacecmd errata_details $i |grep -e Name -e kgraft -e kernel-livepatch | sed 's/kgraft-patch-//' | sed 's/kernel-livepatch-//' | sed 's/default.*/default/'; done > $2
sed 's/Name: *//g' $2 | awk '{ ORS = (NR%2 ? "," : RS) } 1' > $3
