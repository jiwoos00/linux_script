#!/bin/bash
. function.sh

CODE [U-13]SUID, SGID 설정 파일점검

find / -xdev -type f \( -perm -2000 -o -perm -4000 \) -exec ls -l {} \; 2>/dev/null | awk '{ print $1 $9 }' > sbit_file

if [ $? -eq 0 ]; then
  INFO [sbit_file]에 저장되었습니다.
  VULN SUID,SGID에 대한 설정이 적절한지 점검하세요.
else
  INFO SUID, SGID 설정된 파일이 존재하지 않습니다.
fi

