@echo off
echo -------------------------------------------------------------------------------
echo                         Windows Enumeration Script
echo                         simon.j.owens.ctr@mail.mil
echo                                Simon J Owens


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt
echo Operating System Info: >> sys-info.txt
echo . >> sys-info.txt
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> sys-info.txt
hostname >> sys-info.txt
wmic share >> sys-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Query Common Vuln Info: >> sys-info.txt
echo . >> sys-info.txt
:: ms10_015 KiTrap0D if x86
echo CHECKING TO SEE IF VULNERABLE TO KiTrap0D x86 for xp, 2k, 2003, vista, 2008... >> sys-info.txt
echo Windows 7 x64, windows server 2008 R2 x64 aren't affected >> sys-info.txt
wmic qfe get HotFixID | findstr "977165" >> sys-info.txt
echo Above is find >> sys-info.txt


:: Windows 2k, Vista, XP Priv+
:: MS11-080
echo CHECKING TO SEE IF VULNERABLE TO MS11-080 for 2k, vista, and XP... >> sys-info.txt
wmic qfe get HotFixID | findstr "2592799" >> sys-info.txt
echo Above is find >> sys-info.txt




:: Windows 7 Priv+
:: MS17-017 Win 7 SP1 x86
:: MS16-032 64/86 
echo CHECKING TO SEE IF VULNERABLE TO MS17-017 for Windows 7 x86... >> sys-info.txt
echo CHECKING TO SEE IF VULENRABLE TO MS16-032 for Windows 7, 2008, 8, 10 x86/x64... >> sys-info.txt
wmic qfe get HotFixID | findstr "4013081" >> sys-info.txt
wmic qfe get HotFixID | findstr "3143141" >> sys-info.txt
echo Above is find >> sys-info.txt




:: SQL
:: MS09-004
echo CHECKING TO SEE IF VULNERABLE TO MS09-004 for SQL... >> sys-info.txt
wmic qfe get HotFixID | findstr "959420" >> sys-info.txt
echo Above is find >> sys-info.txt




:: IIS
:: MS06-034
:: IIS 4.0/5.0
echo CHECKING TO SEE IF VULNERABLE TO MS06-034 for IIS... >> sys-info.txt
wmic qfe get HotFixID | findstr "917537" >> sys-info.txt
echo Above is find >> sys-info.txt




:: IE ms10_002_aurora
echo CHECKING TO SEE IF VULNERABLE TO MS10_002_aurora for IE... >> sys-info.txt
wmic qfe get HotFixID | findstr "978207" >> sys-info.txt
echo Above is find >> sys-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Information about Users > user-info.txt
echo . >> user-info.txt
net user %USERNAME% >> user-info.txt
net user >> user-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt


echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Established Connections > connection-info.txt
echo . >> connection-info.txt
ipconfig >> connection-info.txt
arp -A >> connection-info.txt
netstat -ano >> connection-info.txt
netsh firewall show state >> connection-info.txt
echo . >> connection-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Installed Patches: > patch-info.txt
echo . >> patch-info.txt
wmic qfe get HotFixID,InstalledOn /format:texttablewsys >> patch-info.txt
echo . >> patch-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Drivers > driver-info.txt
DRIVERQUERY >> driver-info.txt
echo . >> driver-info.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Vulnerable Files: > vuln-files-info.txt
echo . >> sys-info.txt
dir /s *pass* == *cred* == *vnc* == *.config* >> vuln-files-info.txt
findstr /si password *.xml *.ini *.txt >> vuln-files-info.txt
reg query HKLM /f password /t REG_SZ /s >> vuln-files-info.txt
reg query HKCU /f password /t REG_SZ /s >> vuln-files-info.txt
echo . >> vuln-files-info.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo Software > software-query.txt
wmic PRODUCT get Description,InstallLocation,Vendor,Version >> software-query.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt




echo All running software and services with associated permissions > running-query.txt
tasklist /SVC >> running-query.txt
echo ----------------------------------------------------------------------------- >> running-query.txt
echo ----------------------------------------------------------------------------- >> running-query.txt
echo Running Windows Services >> running-query.txt
net start >> running-query.txt


echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt




echo List of all scheduled tasks > scheduled-tasks-query.txt
schtasks /query /fo LIST /v >> scheduled-tasks-query.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt




echo Weak Folder Permissions per drive > folder-perms.txt
accesschk.exe /accepteula -uwdqs Users c:\ >> folder-perms.txt
accesschk.exe /accepteula -uwdqs "Authenticated Users" c:\ >> folder-perms.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt




echo Find all weak file permissions per drive > file-perms.txt
accesschk.exe /accepteula -uwqs Users c:\ >> file-perms.txt
accesschk.exe /accepteula -uwqs "Authenticated Users" c:\ >> file-perms.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt




echo All log, sys, and maps files > log-sys-files.txt
dir /s *.log* == *map* == *.sys* >> log-sys-files.txt




echo . >> sys-info.txt
echo . >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo                   BREAK        BREAK        BREAK        BREAK        BREAK                          >> sys-info.txt
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ >> sys-info.txt
echo . >> sys-info.txt
echo . >> sys-info.txt


echo All Services > all-services.txt
accesschk.exe /accepteula -uwcqv "Authenticated Users" * >> all-services.txt




mkdir evidence
move sys-info.txt evidence
move log-sys-files.txt
move software-query.txt evidence
move connection-info.txt evidence
move patch-info.txt evidence
move driver-info.txt evidence
move vuln-files-info.txt evidence
move scheduled-tasks-query.txt evidence
move folder-perms.txt evidence
move file-perms.txt evidence
move all-services.txt evidence
move log-sys-files.txt evidence
move running-query.txt evidence
move user-info.txt evidence
