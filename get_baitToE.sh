PROJDIR='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Rds_beds_txt'
enhc_bed_file='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Enhc_Digest_Human_HindIII_ID.bed'
for day in 'D0' 'D3' 'D6';
do
contacts_file=$PROJDIR/${day}'_D2D8_merge_BaitToOther.txt' 
output_file=$PROJDIR/${day}'_D2D8_merge_BaitToE.txt'

/users/mtaranov/local/anaconda2/bin/python $PROJDIR/get_baitToE.py --enhc_bed_file $enhc_bed_file --contacts_file $contacts_file --output_file $output_file
echo "finished writing" $output_file

done
