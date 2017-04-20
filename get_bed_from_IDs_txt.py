import argparse
import os
import csv 


def parse_args():
    parser=argparse.ArgumentParser(description='')
    parser.add_argument('--frag_bed_file',help='Digest_Human_HindIII_file')
    parser.add_argument('--contacts_file',help='contacts_file - D0_D2D8_merge_BaitToBait.txt')
    parser.add_argument('--output_file',help='output_file - D0_D2D8_merge_BaitToBait.bed')
    return parser.parse_args()

def get_bed(frag_bed_file, contacts_file, output_file):
    frag_dict={}
    for line in open(frag_bed_file,'r'):
        words=line.rstrip().split()
        chr=words[0]
        start=words[1]
        end=words[2]
        frag_id=words[4]
        frag_dict.update({frag_id:[chr, start, end]})
    for line in open(contacts_file,'r'):
        words=line.rstrip().split()
        frag_id1=words[0]
        frag_id2=words[1]
        score=words[2]
        with open(output_file, 'a') as outcsv:
            writer = csv.writer(outcsv, delimiter='\t', quotechar='|', quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
            writer.writerow(frag_dict[frag_id1] + frag_dict[frag_id2] + [score] +[frag_id1] + [frag_id2])


def main():
    args=parse_args()
    get_bed(args.frag_bed_file, args.contacts_file, args.output_file)

if __name__=="__main__":
    main()
