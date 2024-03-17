#!/bin/bash
. function.sh

CODE [U-10]/etc/xinetd.conf 파일 소유자 및 권한 설정
FILE_CHK /etc/xinetd.conf root 600 -eq 

for file in /etc/xinetd.d/*; do
  FILE_CHK $file root 600 -eq
done
