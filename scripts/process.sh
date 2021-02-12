#!/bin/bash
export SRA=$(cat acc.data)

/root/scripts/gofetch $SRA
#fastq-dump --outdir /root/data --split-files /root/ncbi/public/sra/$SRA.sra
hisat2 -x /root/genome/grch38/genome -1 $SRA\_1.fastq.gz -2 $SRA\_2.fastq.gz -S /root/$SRA.sam > /root/data/$SRA/log/hisat2.log 2>&1
rm -f $SRA\_1.fastq.gz && rm -f $SRA\_2.fastq.gz
/root/subread-2.0.1-Linux-x86_64/bin/featureCounts -a /root/genome/GCF_000001405.39_GRCh38.p13_genomic.gtf -o /root/data/$SRA/counts/$SRA\_counts.txt /root/$SRA.sam > /root/data/$SRA/log/featureCounts.log 2>&1
samtools view -bS /root/$SRA.sam > /root/data/$SRA/bam/$SRA.bam