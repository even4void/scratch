#!/usr/bin/env bash

#
# Simple script to perform mapping of unaligned pair-end reads on a reference
# genome and then call genomic variants over the mapped samples.
#
# NOTE: Inspired by snakemake "short tutorial", available at:
# https://snakemake.readthedocs.io/en/stable/tutorial/short.html
#

set -o pipefail

genome=$(find . -type f -name "*.fasta")
pair_end=0

for f in *.fastq; do
	outfile="${f%%.*}".bam
	outfile_sorted="${outfile%%.*}".sorted.bam
	output="${f%%.*}".vcf
	if [ "$pair_end" = 1 ]; then
		bwa mem "$genome" "${f%%.*}"_R1.fastq "${f%%.*}"_R2.fastq | samtools view -b - >"$outfile"
	else
		bwa mem "$genome" "$f" | samtools view -b - >"$outfile"
	fi
	samtools sort -o "$outfile_sorted" "$outfile"
	bcftools mpileup -f "$genome" "$outfile_sorted" | bcftools call -mv - >"$output"
done
