#!/bin/bash
. function.sh

CODE [U-21]r 계열 서비스 비활성화

r_services=("rsh" "rlogin" "rexec" "rsync")

chk=0
for service in ${r_services[@]}; do
  status=$(systemctl is-active $service)

  if [ $status = 'active' ]; then
    VULN $service 서비스가 활성화되어 있습니다
    chk=1
  else
    OK $service 서비스가 비활성화되어 있습니다
  fi
done

if [ $chk -eq 0 ]; then
  OK 불필요한 r 계열 서비스가 비활성화 되어 있는 경우
else
  VULN  불필요한 r 계열 서비스가 활성화 되어 있는 경우
fi
