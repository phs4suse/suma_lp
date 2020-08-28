#!/bin/bash
#

ERRATA_FILE=$1 # From the mk_errata.sh script
LIVE_PATCH_DATE_FILE=$2 # From the mk_lifecycle.sh script
OUTPUT_FILE=$3 # Create the output file to use with the mk_html.sh script

> $OUTPUT_FILE

while IFS= read -r ERRATA_LINE
do 
  VERSION=$(echo "$ERRATA_LINE" | awk -F, '{print $2}' )
  LP_LINE=$(grep $VERSION $LIVE_PATCH_DATE_FILE)
  ERRATA_COL1=$(echo $ERRATA_LINE | awk -F, '{print $1}' )
  EXPIRE_DATE=$(echo $LP_LINE | awk -F, '{print $2}')
  echo "$ERRATA_LINE,$EXPIRE_DATE" >> $OUTPUT_FILE
  #echo "$ERRATA_COL1,$LP_LINE" >> $OUTPUT_FILE
done < "$ERRATA_FILE"
