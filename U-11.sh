#!/bin/bash
. function.sh

CODE [U-11]/etc/syslog.conf 파일 소유자 및 권한 설정
FILE_CHK /etc/rsyslog.conf root 640 -le
