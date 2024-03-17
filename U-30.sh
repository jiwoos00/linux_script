#!/bin/bash
. function.sh

CODE [U-30]Sendmail 버전 점검

status=$(ps -ef | grep sendmail | grep -v grep)
if [[ -n $status ]]; then
	INFO Sendmail 서비스가 실행중입니다.
	version=$(sendmail -d0.1 -bv root | grep -i 'version')
	INFO $version 사용중입니다.
	VULN Sendmail 버전 점검을 하세요.
else
	INFO Sendmail 서비스가 실행중이 아닙니다.
fi
