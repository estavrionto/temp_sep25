#!/bin/bash

query_seqs=$1
genome_assembly=$2
outfile=$3

tblastn \
	-query $query_seqs \
	-subject $genome_assembly \
	-outfmt '6 std qlen' \
	-task tblastn-fast \
		| awk '$3>30 && $4>0.9*$13' > $outfile

echo "[fast] $(wc -l $outfile | cut -d' ' -f1) matches found in $genome_assembly"

# tblastn -query $query_seqs -subject $genome_assembly -outfmt '6 std qlen' | awk '$3>30 && $4>0.9*$13' > $outfile

# echo "[default] $(wc -l $outfile | cut -d' ' -f1) matches found in $genome_assembly"


# (env_biol7200_sep25) [esta@archlinux ex3]$ ./find_homologs.sh ./data/HK_domain.faa ./data/Wolbachia.fna ./temp
# [fast] 4 matches found in ./data/Wolbachia.fna
# [default] 5 matches found in ./data/Wolbachia.fna

# (env_biol7200_sep25) [esta@archlinux ex3]$ ./find_homologs.sh ./data/HK_domain.faa ./data/Escherichia_coli_K12.fna ./temp
# [fast] 102 matches found in ./data/Escherichia_coli_K12.fna
# [default] 116 matches found in ./data/Escherichia_coli_K12.fna

# (env_biol7200_sep25) [esta@archlinux ex3]$ ./find_homologs.sh ./data/HK_domain.faa ./data/Pseudomonas_aeruginosa_UCBPP-PA14.fna ./temp
# [fast] 196 matches found in ./data/Pseudomonas_aeruginosa_UCBPP-PA14.fna
# [default] 250 matches found in ./data/Pseudomonas_aeruginosa_UCBPP-PA14.fna
# (env_biol7200_sep25) [esta@archlinux ex3]$ 

# (env_biol7200_sep25) [esta@archlinux ex3]$ ./find_homologs.sh ./data/HK_domain.faa ./data/Vibrio_cholerae_N16961.fna ./temp
# [fast] 107 matches found in ./data/Vibrio_cholerae_N16961.fna
# [default] 125 matches found in ./data/Vibrio_cholerae_N16961.fna



