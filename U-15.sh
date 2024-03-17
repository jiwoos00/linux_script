#!/bin/bash
. function.sh

CODE [U-15]world writable 파일 점검

file_name="world_writable_file"
find / -type f -perm -2 -exec ls -l {} \; 2>/dev/null > $file_name

if [ -s $file_name ]; then

  INFO [$file_name]파일이 존재합니다.
  VULN 중요파일이 world writable 설정이 되었는지 확인하세요.
else
  INFO [$file_name]파일이 존재하지 않습니다.
fi
  
