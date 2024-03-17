#!/bin/bash
. function.sh

CODE [U-12]/etc/services 파일 소유자 및 권한 설정
FILE_CHK /etc/services root 644 -le
