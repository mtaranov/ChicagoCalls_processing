#!/bin/bash
in_file=$1
out_file=$2
cat $in_file | awk '{if ($1==$4) print $0}' | perl -p -e 's/ /\t/g' > $out_file
