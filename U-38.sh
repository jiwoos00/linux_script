#!/bin/bash
. function.sh

CODE [U-38]웹서비스 불필요한 파일 제거

file=/etc/httpd
check=1

ls -ld $file/htdocs/manual 2>/dev/null
if [ $? -eq 0 ]; then
	check=0
	VULN 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되지 않은 경우[$file/htdocs/manual]
fi

ls -ld $file/manual 2>/dev/null
if [ $? -eq 0 ]; then
	check=0
	VULN 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되지 않은 경우[$file/manual]
fi

if [ $check == 1 ]; then
	OK 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되어 있는 경우
fi

