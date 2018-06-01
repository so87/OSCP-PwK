#!/bin/bash


BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"


echo Linux Enumeration Script
echo Simon Owens
echo simon.j.owens.ctr@mail.mil
echo Starting Numeration Script....


printf "\n"
printf "\n"


sleep 3


printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'  >> summary.txt
printf "##" >> summary.txt
printf "\n" >> summary.txt
printf "Linux Version" >>summary.txt
printf "\n">>summary.txt
printf "##">> summary.txt
printf "\n">>summary.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/bin/cat /etc/issue; > summary.txt
printf "\n" >> summary.txt
/bin/cat /etc/*-release >> summary.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "RED Kernel Info"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/bin/uname -ar >> summary.txt




printf "\n" >> summary.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> summary.txt
printf "##" >> summary.txt
printf "\n" >> summary.txt
printf "RED User Info" >> summary.txt
printf "\n" >> summary.txt
printf "##" >> summary.txt
printf "\n" >> summary.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> summary.txt
printf "\n" >> summary.txt


lslogins --user-accs -o USER,GROUP >> summary.txt


printf "\n" >> network-connections.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> network-connections.txt
printf "##" >> network-connections.txt
printf "\n" >> network-connections.txt
printf "RED Network Info" >> network-connections.txt
printf "\n" >> network-connections.txt
printf "##" >> network-connections.txt
printf "\n" >> network-connections.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> network-connections.txt
printf "\n" >> network-connections.txt




ifconfig eth0 | grep "inet " | awk '{printf $2}' >> network-connections.txt
printf "\n" >> network-connections.txt
ifconfig eth0 | grep "inet " | awk '{printf $4}' >> network-connections.txt
printf "\n" >> network-connections.txt
ifconfig eth0 | grep ether | awk '{printf $2}' >> network-connections.txt
printf "\n" >> network-connections.txt
netstat -aWee -4 -6 --ipx --ax25 --netrom --ddp --bluetooth >> network-connections.txt
printf "\n" >> network-connections.txt
netstat -ano >> network-connections.txt




printf "\n" >> summary.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> summary.txt
printf "##" >> summary.txt
printf "\n" >> summary.txt
printf "RED Finding Applicable Exploits... pls wait" >> summary.txt
printf "\n" >> summary.txt
printf "##" >> summary.txt
printf "\n" >> summary.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' >> summary.txt
printf "\n" >> network-connections.txt >> summary.txt


./check-exploits.py  >>summary.txt
printf "\n"


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "RED File System Info"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/bin/df -h > filesystem.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "RED Mounted File Systems with Pretty Output"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


mount | column -t >> filesystem.txt




printf "\n"> Scheduled-tasks.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'>> Scheduled-tasks.txt
printf "##">> Scheduled-tasks.txt
printf "\n">> Scheduled-tasks.txt
printf "RED Scheduled Tasks">> Scheduled-tasks.txt
printf "\n">> Scheduled-tasks.txt
printf "##">> Scheduled-tasks.txt
printf "\n">> Scheduled-tasks.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'>> Scheduled-tasks.txt
printf "\n">> Scheduled-tasks.txt


crontab -l >> Scheduled-tasks.txt




printf "\n"> Drivers.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'>> Drivers.txt
printf "##">> Drivers.txt
printf "\n">> Drivers.txt
printf "RED Drivers on system">> Drivers.txt
printf "\n">> Drivers.txt
printf "##">> Drivers.txt
printf "\n">> Drivers.txt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'>> Drivers.txt
printf "\n">> Drivers.txt


lsmod >> Drivers.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/etc/fstab File Contents"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/bin/cat /etc/fstab > fstab.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/etc/passwd File Contents"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/bin/cat /etc/passwd > password.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/etc/passwd File Contents"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/bin/cat /etc/shadow >> password.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Private Key Info"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
printf "\n"
cat ~/.ssh/authorized_keys > private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/identity.pub>> private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/identity>> private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/id_rsa.pub>> private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/id_rsa>> private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/id_dsa.pub>> private-key.txt
printf "\n">> private-key.txt
cat ~/.ssh/id_dsa>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_config>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/sshd_config>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_dsa_key.pub>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_dsa_key>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_rsa_key.pub>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_rsa_key>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_key.pub>> private-key.txt
printf "\n">> private-key.txt
cat /etc/ssh/ssh_host_key>> private-key.txt
printf "\n">> private-key.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/etc/group File Contents"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/bin/cat /etc/group > groups.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/etc/sudoers File Contents"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/bin/cat /etc/sudoers >> groups.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Sticky Bit Files"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/usr/bin/find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null > stick-bit.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "World Writable Directories"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/usr/bin/find / -perm -222 -type d 2>/dev/null > world-write-dirs.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "World Writable FIles"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/usr/bin/find / -type f -perm 0777 2>/dev/null >world-write-dirs.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Files Owned by Current User"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/usr/bin/find / -user $(whoami) 2>/dev/null > your-files.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "/home and /root Permissions"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/bin/ls -ahlR /home/ > home-root-dir-perms.txt
/bin/ls -ahlR /root/ >> home-root-dir-perms.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Logged on Users"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/usr/bin/w > logged-on-users.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Last Logged on Users"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


/usr/bin/last >> logged-on-users.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Processes Running as root"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"
/bin/ps -ef | /bin/grep root > process-run-as-root.txt




printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "Installed Packages for RHEL / Debian Based Systems"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


# Enumarate CentOS / Ubuntu Boxes 
# This is not a great way of ID'ing a box, but I'm being lazy




printf "\n"
/usr/bin/dpkg -l > software.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "CentOS / RHEL Services that start at Boot"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"


chkconfig --list | grep $(runlevel | awk '{ print $2}'):on > start-serv.txt
printf "\n" >> start-serv.txt
initct1 list >> start-serv.txt
systemctl list-unit-files --type=service >> start-serv.txt


printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "##"
printf "\n"
printf "List of init Scripts aka System Services"
printf "\n"
printf "##"
printf "\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'
printf "\n"




ls /etc/init.d/ > system-services.txt


printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#'


printf "\n $RED So long, and happy hunting... \n $NORMAL"


printf "\n"
