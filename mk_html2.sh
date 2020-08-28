#!/bin/bash


usage() { echo "Usage: $0 "'$1 "your_input_data_file" $2 "your_output_csv" $3 "OS Version"' 1>&2; exit 1; }

# Clean up data file for proper conversion and create our HTML output 
cp $1 $2
sed -i '1s/^/Advisory\ Number,\ Kernel\ Version,\ Expire\ Date \n/' $2

cat $2 | /srv/www/htdocs/pub/lifecycle/csv_convert.sh -d "," -t "Live Patching" -h "$3 Live Patching Kernels and Dates" > $3.LivePatching.html
