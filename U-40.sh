#!/bin/bash
. function.sh

CODE [U-40]웹서비스 파일 업로드 및 다운로드 제한

file=/etc/httpd/conf/httpd.conf

if [ -e $file ]; then
	size=$(cat $file | grep LimitRequestBody | grep -v '^#' | awk '{print $2}')
	if [ -z $size ]; then
		VULN 파일 업로드 및 다운로드 제한 설정을 하지 않은 경우
	elif [ $size -gt 5000000 ]; then
		VULN 파일 업로드 및 다운로드를 제한하지 않은 경우
	else
		OK 파일 업로드 및 다운로드를 제한한 경우
	fi
else
	INFO Apache 웹서비스를 사용하지 않음
fi
