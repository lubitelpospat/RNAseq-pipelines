#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=RT
#SBATCH --job-name=example
#SBATCH --comment="Скачивание ридов, выравнивание и подсчет каунтов"
 cd ~/RNAseq-pipelines/
 FILE="Accessions.txt"
if [! -f "$FILE"]; then 
    echo "File Accessions.txt doesn\`t exist, exiting"
    exit 1
fi

while IFS= read line
do
        # display $line or do something with $line
	echo "$line"
    srun -o "/totalLogs/$line.out"./pipe1.sh $line
done <"$FILE"


