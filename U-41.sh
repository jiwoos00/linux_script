#!/bin/bash
. function.sh

CODE [U-41]웹서비스 영역의 분리

file=/etc/httpd/conf/httpd.conf
default=('"/usr/local/apache/htdocs"' '"/usr/local/apache2/htdocs"' '"/var/www/thml"')
import=("etc" "bin" "sbin" "usr")

if [ -e $file ]; then
	doc=$(cat $file | grep ^DocumentRoot | awk '{print $2}')
	
	if [[ -z $doc ]]; then
		VULN DocumentRoot를 별도의 디렉터리로 지정하세요.
	else
		check=0
		if [[ ${default[@]} =~ $doc ]]; then
			check=1
			VULN DocumentRoot를 기본 디렉터리로 지정한 경우
		fi

		
		IFS='/' read -ra dir <<< ${doc//\"}
		if [[ ${import[@]} =~ ${dir[0]} ]]; then
			check=1
			VULN DocumentRoot를 중요 디렉터리로 지정한 경우
		fi
	
		if [ $check -eq 0 ]; then
			OK DocumentRoot를 별도의 디렉터리로 지정한 경우
		fi
	
	fi	
else
	INFO Apache 웹서비스를 사용하지 않음
fi
