#!/bin/bash

SRA=$1

DATADIR=$PWD/data
SCRIPTDIR=$PWD/scripts
CONTAINERNAME=$1_hobot


if [ ! -d $SCRIPTDIR ]; then
	echo "The script directry does not exist"
	exit 1
fi

if [ ! -d $DATADIR ]; then
	mkdir $DATADIR
fi


udocker create --name=$CONTAINERNAME "ubuntu:18.04"
udocker run $CONTAINERNAME sh -c "echo $SRA >> acc.data"
udocker run --cpuset-cpus=1-4 --volume=$PWD/scripts:/root/scripts --volume=$DATADIR:/root/data $CONTAINERNAME sh /root/scripts/setup.sh
#prefetch_version=$(udocker run $CONTAINERNAME prefetch --version)
#r_version=$(udocker run $CONTAINERNAME R --version)

#echo $prefetch_version
#echo $r_version

udocker run --cpuset-cpus=1-4 --volume=$DATADIR:/root/data --volume=$PWD/genome:/root/genome --volume=$SCRIPTDIR:/root/scripts $CONTAINERNAME sh /root/scripts/process.sh
udocker rm $CONTAINERNAME
