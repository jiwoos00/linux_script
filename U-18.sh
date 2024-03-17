#!/bin/bash
. function.sh

CODE [U-18] 접속 IP 및 포트 제한
INFO iptables 명령어를 통해 접속할 IP 및 포트 정책 추가하세요.

allow_file=/etc/hosts.allow
deny_file=/etc/hosts.deny

if [ -e $deny_file ]; then
  echo "ALL:ALL" > $deny_file
  INFO $deny_file 파일을 재설정하였습니다.
else
  VULN $deny_file 파일이 존재하지 않습니다.
  echo "ALL:ALL" > $deny_file
  INFO $deny_file 파일을 생성하였습니다. 
fi

if [ ! -e $allow_file ]; then
  VULN $allow_file is not existed. 
  INFO $allow_file 파일을 생성하였습니다.
  echo "sshd : 192.168.0.148, 192.168.0.6" > $allow_file
fi
INFO $allow_file 파일을 수정하세요.
    

