#!/bin/bash

SRA=$1

DATADIR=$PWD/data
SCRIPTDIR=$PWD/scripts
CONTAINERNAME=$1_hobot


if [ ! -d $SCRIPTDIR ]; then
	echo "The script directry does not exist"
	exit 1
fi

if [ -d $DATADIR ]; then
	rm -rf $DATADIR
fi

mkdir $DATADIR

udocker create --name=$CONTAINERNAME "ubuntu:18.04"
while read line; do
	udocker run $CONTAINERNAME $line
done < "$SCRIPTDIR/setup.sh"
prefetch_version=$(udocker run $CONTAINERNAME prefetch --version)
r_version=$(udocker run $CONTAINERNAME R --version)

echo $prefetch_version
echo $r_version

udocker run $CONTAINERNAME fastq-dump --split-files $SRA
#udocker rm $CONTAINERNAME
