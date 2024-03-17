#!/bin/bash

. function.sh
CODE [U-06]파일 및 디렉터리 소유자 설정

nouser=$(find / -nouser 2>/dev/null)
nogroup=$(find / -nogroup 2>/dev/null)

if [ ! -z $nouser ]; then
  VULN 소유자가 존재하지 않는 파일이 존재하는 경우
  VULN $nouser
else
  OK 소유자가 존재하지 않는 파일이 존재하지 않는 경우
fi

if [ ! -z $nogroup ]; then
  VULN 소유자가 존재하지 않은 디렉터리가 존재하는 경우
  VULN $nogroup
else
  OK 소유자가 존재하지 않는 디렉터리가 존재하지 않는 경우
fi

