#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=RT
#SBATCH --job-name=example
#SBATCH --comment="Скачивание ридов, выравнивание и подсчет каунтов"
cd ~/WorkingOnCluster/ && srun -o my.out ./pipe1.sh SRR934931

