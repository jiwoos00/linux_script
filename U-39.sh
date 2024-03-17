#!/bin/bash
. function.sh

CODE [U-39]웹서비스 링크 사용금지

file=/etc/httpd/conf/httpd.conf

if [ -e $file ]; then
	sym=$(cat $file | grep Options | grep -v '^#' | grep FollowSymLinks)
	if [[ -z $sym ]]; then
		OK 심볼릭 링크, aliases 사용을 제한한 경우
	else
		VULN 심볼릭 링크, aliases 사용을 제한하지 않은 경우
	fi
else
	INFO Apache 웹서비스를 사용하지 않음
fi
