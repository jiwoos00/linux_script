#!/bin/bash

. function.sh

CODE [U-09]/etc/hosts 파일 소유자 및 권한 설정
FILE_CHK /etc/hosts root 600 -le
