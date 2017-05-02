d=`pwd`

#for chr in `seq 1 22`;
#do
#echo "chr"$chr
#cat $d/Digest_Human_HindIII.6col_XY-4.bed | awk '{if ($1==chr) print $0}' chr="chr"$chr | perl -p -e 's/ /\t/g' >> $d/test
#done
#for chr in X Y;
#do 
#echo "chr"$chr
#cat $d/Digest_Human_HindIII.6col_XY-4.bed | awk '{if ($1==chr) print $1, $2, $3, $4, $5+4, $6}' chr="chr"$chr | perl -p -e 's/ /\t/g' >> $d/test
#done
#cat $d/test | sort -k5,5n > $d/Digest_Human_HindIII.6col.bed
#rm $d/test

for chr in `seq 1 22`;
do
echo "chr"$chr
cat $d/Enhc_Digest_Human_HindIII_ID_XY-4.bed | awk '{if ($1==chr) print $0}' chr="chr"$chr | perl -p -e 's/ /\t/g' >> $d/test
done
for chr in X Y;
do
echo "chr"$chr
cat $d/Enhc_Digest_Human_HindIII_ID_XY-4.bed | awk '{if ($1==chr) print $1, $2, $3, $4+4, $5}' chr="chr"$chr | perl -p -e 's/ /\t/g' >> $d/test
done
cat $d/test | sort -k4,4n > $d/Enhc_Digest_Human_HindIII_ID.bed
rm $d/test
