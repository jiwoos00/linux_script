#!/bin/bash
. function.sh

CODE [U-20]Anonymous FTP 비활성화

ftp=$(netstat -antp | grep "ftp")
vsftp=$(netstat -antp | grep "vsftp")
vsftp_file=/etc/vsftpd/vsftpd.conf

if [[ -z $ftp ]]; then
  INFO FTP 서비스가 존재하지 않습니다.
 
else
  VULN FTP 서비스가 존재합니다.
  if [[ -n $vsftp ]]; then 
    VULN VSFTP 서비스가 동작중입니다.
    if [ -e $vsftp_file ]; then
      anonymous_enable=$(grep -i "^anonymous_enable=y" $vsftp_file)
      if [[ -n $anonymous_enable ]] ; then
        VULN Anonymous FTP 접속을 차단하지 않은 경우
      else
        OK Anonymous FTP 접속을 차단한 경우
      fi
    fi
  fi
fi
