#!/bin/bash
. function.sh

CODE [U-36]웹서비스 웹 프로세스 권한 제한

file=/etc/httpd/conf/httpd.conf

if [ -e $file ]; then
	apache_user=$(cat $file | grep ^User | awk '{print $2}')
	apache_group=$(cat $file | grep ^Group | awk '{print $2}')

	if [[ $apache_user == 'root' || $apache_group == 'root' ]]; then
		VULN Apache 데몬이 root 권한으로 구동되는 경우
	else
		OK  Apache 데몬이 root 권한으로 구동되지 않는 경우
	fi	

else
	INFO Apache 웹서비스를 사용하지 않음
fi
