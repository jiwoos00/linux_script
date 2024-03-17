#!/bin/bash
. function.sh

CODE [U-16]/dev에 존재하지 않는 device 점검

dev_file=$(find /dev -type f -exec ls -l {} \; | awk '{print $NF}' 2>/dev/null)

if [[ -z $dev_file ]]; then
  OK dev에 대한 파일 점검 후 존재하지 않은 device 파일을 제거한 경우
else
  for file in $dev_file ; do
    VULN $file
  done
  VULN dev에 대한 파일 미점검 또는, 존재하지 않은 device 파일을 방치한 경우
fi

