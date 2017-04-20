#!/bin/bash

contact_file=$1
output_file=$2
cat $contact_file | awk '{if ($8=="TRUE") print $2, $3, $NF}' > $output_file 
#cat $contact_file | awk '{ print $2, $3, $NF}' > $output_file 
