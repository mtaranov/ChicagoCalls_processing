import argparse
import os
import csv 
from sets import Set

def parse_args():
    parser=argparse.ArgumentParser(description='')
    parser.add_argument('--enhc_bed_file',help='Enhc_Digest_Human_HindIII_file')
    parser.add_argument('--contacts_file',help='contacts_file - D0_D2D8_merge_BaitToOther.txt')
    parser.add_argument('--output_file',help='output_file - D0_D2D8_merge_BaitToE.txt')
    return parser.parse_args()

def get_bed(enhc_bed_file, contacts_file, output_file):
    enhc=Set([])
    not_enhc = 0
    for line in open(enhc_bed_file,'r'):
        words=line.rstrip().split()
        enhc.add(words[3])
    for line in open(contacts_file,'r'):
        words=line.rstrip().split()
        frag_id1=words[0]
        frag_id2=words[1]
        score=words[2]
        if frag_id2 in enhc:
            with open(output_file, 'a') as outcsv:
                writer = csv.writer(outcsv, delimiter='\t', quotechar='|', quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
                writer.writerow([frag_id1] + [frag_id2]+[score])
        else:
            not_enhc += 1
    print not_enhc, " bait-nonEnhancer contacts"

def main():
    args=parse_args()
    get_bed(args.enhc_bed_file, args.contacts_file, args.output_file)
if __name__=="__main__":
    main()
