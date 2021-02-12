#!/bin/bash
#SBATCH --ntasks=8
#SBATCH --partition=RT
#SBATCH --job-name=download_
#SBATCH --comment="Скачивание ридов, выравнивание и подсчет каунтов"
 cd ~/RNAseq-pipelines/
 FILE="Accessions.txt"
if [ ! -f "$FILE" ]; then 
    echo "File Accessions.txt doesn\`t exist, exiting"
    exit 1
fi

while IFS= read line
do
        # display $line or do something with $line
	touch "totalLogs/$line.out" 
    srun  -N1 -n1 -c1 --exclusive -o "totalLogs/$line.out" ./pipe1.sh $line
done <"$FILE"


