apt-get update 
apt-get install -y gcc build-essential sra-toolkit wget
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
#apt-get update
export DEBIAN_FRONTEND=noninteractive 
ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime
#apt-get install -y r-base
#R -e "install.packages('BiocManager'); library('BiocManager'); BiocManager::install('Rsubread', ask=FALSE, update=TRUE)"
apt-get install -y hisat2

wget 'https://d3gcli72yxqn2z.cloudfront.net/connect_latest/v4/bin/ibm-aspera-connect-3.11.1.58-linux-g2.12-64.tar.gz'

tar -xvzf ibm-aspera-connect-3.11.1.58-linux-g2.12-64.tar.gz 
./ibm-aspera-connect-3.11.1.58-linux-g2.12-64.sh

