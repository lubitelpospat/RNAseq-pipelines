apt-get -o APT::Sandbox::User=root update 
apt-get -o APT::Sandbox::User=root install -y gcc build-essential sra-toolkit wget hisat2 samtools
export DEBIAN_FRONTEND=noninteractive 
ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime
wget https://downloads.sourceforge.net/project/subread/subread-2.0.1/subread-2.0.1-Linux-x86_64.tar.gz
tar -xvzf subread-2.0.1-Linux-x86_64.tar.gz 
export SRA=$(cat acc.data)
mkdir /root/data/$SRA
mkdir /root/data/$SRA/log
mkdir /root/data/$SRA/counts
mkdir /root/data/$SRA/bam





