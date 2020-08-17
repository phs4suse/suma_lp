#!/bin/bash

usage() { echo "Usage: $0 "'-i "your_input_data_file" -o "your_output_csv" -S "OS Version"' 1>&2; exit 1; }

# Clean up data file for proper conversion 
cp $1 $2
sed -i '1,3d' $2
sed -i '1s/^/LivePatch\ Kernel\,Expire\ Date \n/' $2
sed -i s/\*,//g $2

# Create HTML Output
cat $2 | /srv/www/htdocs/pub/lifecycle/csv_convert.sh -d "," -t "Live Patching" -h "$3 Live Patching Kernels and Dates" > $3.LivePatching.html
