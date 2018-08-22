#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[32m';
COLOR_RED='\e[31m';
COLOR_GRAY='\e[90m';
COLOR_HIGHLIGHT='\e[30;47m';
COLOR_YELLOW='\e[33m';
#GrayDo=`echo -en "${COLOR_GRAY}You must do${COLOR_REST}"`
HighLightDo=`echo -en "${COLOR_HIGHLIGHT}You must do${COLOR_REST}"`
GreenOK=`echo -en "${COLOR_GREEN}--> OK${COLOR_REST}"`
RedFAIL=`echo -en "${COLOR_RED}--> Fail${COLOR_REST}"`
# ==== OS version ====
echo " ==== OS version ==== " 
uname -a 
echo " ==== Disk information ==== " 
echo " == lsblk" 
lsblk 
echo " == df -Th" 
df -Th 
echo " == cat /proc/mdstat" 
cat /proc/mdstat  

# SSHD check
SSHDCip=$(grep "Ciphers" /etc/ssh/sshd_config) 
SSHDMac=$(grep "MACs" /etc/ssh/sshd_config) 
SSHDC=$(grep "Ciphers aes128-ctr,aes192-ctr,aes256-ctr" /etc/ssh/sshd_config|wc -l) 
SSHDM=$(grep "MACs hmac-sha2-256,hmac-sha2-512" /etc/ssh/sshd_config|wc -l) 
echo " ==== SSHD Ciphers CHECK ==== " 
if [ $SSHDC == 1 ];then
echo "SSHD Ciphers Check " $GreenOK
echo $SSHDCip 
else
echo "SSHD Ciphers Check " $RedFAIL
WORD="echo \"Ciphers aes128-ctr,aes192-ctr,aes256-ctr\" >> /etc/ssh/sshd_config" 
YcanTRY="${COLOR_YELLOW}$WORD${COLOR_REST}"
echo -en "$HighLightDo : "
echo -e $YcanTRY
echo ''
fi
if [ $SSHDM == 1 ];then
echo "SSHD Macs Check" $GreenOK
echo $SSHDMac 
else
echo "SSHD Macs Check" $RedFAIL 
WORD="echo \"MACs hmac-sha2-256,hmac-sha2-512\" >> /etc/ssh/sshd_config" 
YcanTRY="${COLOR_YELLOW}$WORD${COLOR_REST}"
echo -en "$HighLightDo : "
echo -e $YcanTRY
echo ''
fi

# CR10S check
echo " ==== CR10S check ==== "
if [[ -f /etc/rc.d/init.d/pcscd ]] ;then
PCSCD=$(grep "PCSCD_OPTIONS=--critical" /etc/rc.d/init.d/pcscd)
PCSCD2=$(grep "PCSCD_OPTIONS=--critical" /etc/rc.d/init.d/pcscd|wc -l)
if [ $PCSCD2 == 1 ] ;then
echo "PCSCD Check" $GreenOK
echo $PCSCD
else
echo "Check" $RedFAIL ↓
echo $PCSCD
WORD="sed -i 's/PCSCD_OPTIONS=/PCSCD_OPTIONS=--critical/g' /etc/rc.d/init.d/pcscd "
YcanTRY="${COLOR_YELLOW}$WORD${COLOR_REST}"
echo -en "$GrayDo : "
echo -e $YcanTRY
echo ''
fi
else
WORD="PCSCD not install"
echo -e "${COLOR_RED}$WORD${COLOR_REST}"
fi

echo " ==== check finish ==== " 
exit 0
