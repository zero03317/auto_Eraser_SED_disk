#!/bin/sh
echo "Please choose function"
echo "input 1 : scan sed status"
echo "input 2 : erase sed disk"
read choose
if [ $choose == 1 ] ; 
then
sedpath=$(sedutil --scan | awk '{for(i=1;i<=NF;i++){ if($i=="2"){print $1} } }')
echo $sedpath
sedstatus=$(sedutil --query $sedpath | grep Locking | sed '2q')
echo "SED status in below:"
echo $sedstatus
exit 1
fi

if [ $choose == 2 ] ; 
then
echo "Please input your sed PSID"
read PSID
sedpath=$(sedutil --scan | awk '{for(i=1;i<=NF;i++){ if($i=="2"){print $1} } }')
echo $sedpath
sedutil --yesIreallywanttoERASEALLmydatausingthePSID $PSID $sedpath


fi

echo "IF you want reboot your nas?? 1=reboot, 2=no reboot"
read reboot

if [ $reboot == 1 ];
then
sync
reboot


else

exit 1
fi

