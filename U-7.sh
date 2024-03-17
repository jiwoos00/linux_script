#!/bin/bash

. function.sh
CODE [U-07]/etc/passwd 파일 소유자 및 권한 설정
FILE_CHK /etc/passwd root 644 -le
