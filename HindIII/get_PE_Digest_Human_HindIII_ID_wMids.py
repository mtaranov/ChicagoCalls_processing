pe_file='/mnt/lab_data/kundaje/mtaranov/ChicagoCalls/PE_Digest_Human_HindIII_ID.bed'

for line in open(pe_file,'r'):
    words=line.rstrip().split()
    mids=(int(words[1])+int(words[2]))/2
    with open('./PE_Digest_Human_HindIII_ID_wMids.bed', 'a') as f1:
        f1.write(str(words[0])+'\t'+str(words[1])+'\t'+str(words[2])+'\t'+str(words[3])+'\t'+str(words[4])+'\t'+str(mids)+'\n')
    
