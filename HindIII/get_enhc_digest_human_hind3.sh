Digest_Human_HindIII='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Digest_Human_HindIII.6col.bed'
# original files at: /mnt/lab_data/kundaje/projects/skin/data/bds/processed.chipseq.2017-01-23.histones 
H3K4me1_file='/mnt/lab_data/kundaje/mtaranov/chipseq_skin_new/primary_keratinocyte-d0.GGR.Stanford_Snyder.ChIP-seq_H3K4me1/peak/macs2/overlap/primary_keratinocyte-d0.GGR.Stanford_Snyder.ChIP-seq_H3K4me1.b1.t1.ACAGTG.1.PE2SE.nodup_pooled.tagAlign_x_ChIP-seq_input_H3K4me1.b1.1.PE2SE.nodup_pooled.tagAlign.naive_overlap.filt.narrowPeak.gz'
H3K27ac_file='/mnt/lab_data/kundaje/mtaranov/chipseq_skin_new/primary_keratinocyte-d0.GGR.Stanford_Snyder.ChIP-seq_H3K27ac/peak/macs2/overlap/primary_keratinocyte-d0.GGR.Stanford_Snyder.ChIP-seq_H3K27ac.b1.t1.ACAGTG.1.PE2SE.nodup_pooled.tagAlign_x_ChIP-seq_input_H3K27ac.b1.1.PE2SE.nodup_pooled.tagAlign.naive_overlap.filt.narrowPeak.gz'
PromoterCapture_file='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/PromoterCapture_Digest_Human_HindIII_baits_ID.bed'
output_Enhc_Digest_Human_HindIII_file='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/Enhc_Digest_Human_HindIII_ID.bed'
tmp='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/tmp.bed'

/software/miniconda3/bin/bedtools intersect -wa -a $Digest_Human_HindIII -b $H3K4me1_file $H3K27ac_file | sort -k5,5n| uniq | perl -p -e 's/ /\t/g' > $tmp
/software/miniconda3/bin/bedtools intersect -wa -a $tmp -b $PromoterCapture_file -v | awk '{print $1, $2, $3, $5, "1"}' | perl -p -e 's/ /\t/g' > $output_Enhc_Digest_Human_HindIII_file

