#!/bin/bash   
 
set -eux
export DEBIAN_FRONTEND=noninteractive

#install basic binaries
apt-get -y update && apt-get install -y gnupg2 --allow-unauthenticated
apt-get install apt-utils -y
apt-get install dos2unix wget unzip git curl nano vim unzip -y

apt-get install python3-setuptools -y
apt-get install python3 -y
apt-get install -y curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --trusted-host=files.pythonhosted.org --trusted-host=pypi.org
rm -rf get-pip.py
apt-get install nmap -y
apt-get install masscan -y
apt-get install libpcap* -y
apt-get install wfuzz -y
pip3 install impacket

#local installations
#decompress copied folders
unzip -o installs.zip -d / && rm -rf /installs.zip
apt-get install /installs/nikto_2.1.5-1_all.deb -y
apt-get install /installs/gobuster_2.0.1-1_amd64.deb -y
apt-get install /installs/go-exploitdb_0.0_git20181130.7c961e7-1+b21_amd64.deb
chmod 755 /installs/msfinstall && /installs/msfinstall
gunzip /installs/rockyou.txt.gz
mkdir /usr/share/wordlists
mv /installs/rockyou.txt /usr/share/wordlists/ 
mkdir /installs/sqlmap
tar -xf /installs/sqlmapproject-sqlmap-1.4.9-11-ga1342e0.tar.gz -C /installs/sqlmap

pip3 install ldeep      #ldap enumeration tool    https://github.com/franc-pentest/ldeep
apt-get install -y iproute2
apt-get install -y netcat
apt-get install -y openssh-client
apt-get install -y ftp
apt-get install -y proxychains
apt-get install -y tshark
apt-get install -y tcpdump
apt-get install -y john
apt-get install -y hashcat