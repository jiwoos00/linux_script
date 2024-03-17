#!/bin/bash
. function.sh

CODE [U-37]웹서비스 상위 디렉토리 접근 금지

file=/etc/httpd/conf/httpd.conf

if [ -e $file ]; then
	tmp=$(cat $file | egrep -v *# | grep -i 'allowoverride' | awk '{print $2}')
	not_check=0
	for check in $tmp ; do
		if [[ $check != 'AuthConfig' || $check != 'All' ]]; then
			not_check=1
			break
		fi
	done

	if [ $not_check -eq 1 ]; then
		VULN 상위 디렉터리에 이동제한을 설정하지 않은 경우
	else
		OK 상위 디렉터리에 이동제한을 설정한 경우
	fi

else
	INFO Apache 웹 서비스를 사용하지 않음
fi
