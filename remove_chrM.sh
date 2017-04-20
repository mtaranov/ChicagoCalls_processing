#!/bin/bash

contact_file=$1
output_file=$2
zcat  $contact_file | awk '{if (($2 <= 837157) && ( $3 <= 837157)) print $0 }' > $output_file
gzip $output_file
#cat $contact_file | awk '{ print $2, $3, $NF}' > $output_file 
