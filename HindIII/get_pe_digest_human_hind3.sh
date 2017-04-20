d=`pwd`
cat $d/PromoterCapture_Digest_Human_HindIII_baits_ID.bed | awk '{print $1, $2, $3, $4, "P"}' > $d/temp_pe.bed
cat Enhc_Digest_Human_HindIII_ID.bed | awk '{print $1, $2, $3, $4, "E"}' >> $d/temp_pe.bed
cat $d/temp_pe.bed | sort -k4,4n | perl -p -e 's/ /\t/g' > $d/PE_Digest_Human_HindIII_ID.bed
rm $d/temp_pe.bed
