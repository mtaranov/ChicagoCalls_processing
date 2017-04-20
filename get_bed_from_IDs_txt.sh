PROJDIR='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Rds_beds_txt'
frag_bed_file='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Digest_Human_HindIII.6col.bed'
for day in 'D0' 'D3' 'D6';
do
# for bait-bait
#contacts_file=$PROJDIR/${day}'_D2D8_merge_BaitToBait.txt'  
#output_file=$PROJDIR/${day}'_D2D8_merge_BaitToBait.bed'
# for bait-other 
contacts_file=$PROJDIR/${day}'_D2D8_merge_BaitToE.txt' 
output_file=$PROJDIR/${day}'_D2D8_merge_BaitToE.bed'

/users/mtaranov/local/anaconda2/bin/python $PROJDIR/get_bed_from_IDs_txt.py --frag_bed_file $frag_bed_file --contacts_file $contacts_file --output_file $output_file
echo "finished writing" $output_file

done
