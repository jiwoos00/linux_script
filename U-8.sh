#!/bin/bash

. function.sh
CODE [U-08]/etc/shadow 파일 소유자 및 권한 설정
FILE_CHK /etc/shadow root 400 -le
