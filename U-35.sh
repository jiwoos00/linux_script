#!/bin/bash
. function.sh

CODE [U-35]웹서비스 디렉토리 리스팅 제거

file=/etc/httpd/conf/httpd.conf
if [ -e $file ]; then
	dir_listing=$(cat /etc/httpd/conf/httpd.conf | grep -v ^# | egrep -i "options indexes followsymlinks")
	if [[ -z $dir_listing ]]; then
		OK 디렉터리 검색 기능을 사용하지 않는 경우
	else
		VULN  디렉터리 검색 기능을 사용하는 경우
	fi
else
	INFO Apache 웹 서비스를 사용하지 않음
fi

		
