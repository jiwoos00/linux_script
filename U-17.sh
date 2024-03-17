#!/bin/bash
. function.sh

CODE [U-17].rhosts,hosts.equiv 사용 금지

if command -v rsh > /dev/null && command -v rlogin > /dev/null && command -v rexec > /dev/null; then
  VULN login,shell,exec 서비스 사용
else
  OK login,shell,exec 서비스 사용하지 않음
fi


file=($(echo $HOME)/.rhosts 'hosts.equiv')

for file1 in ${file[@]}; do
  if [ -e $file1 ]; then
    FILE_CHK $file1 root 600 -le
    temp=$(grep "+" $file1)
    if [[ -n $temp ]]; then
      VULN $file1 파일 설정에 + 설정이 있는 경우
    fi
  else
    INFO $file1 파일이 존재하지 않습니다.
  fi
done
