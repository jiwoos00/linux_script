#!/bin/bash
. function.sh

CODE [U-29]tftp, talk 서비스 비활성화

service=("tftp" "talk" "ntalk")

for s in ${service[@]}; do
	if [ ! -e /etc/xinetd.d/$s ]; then
		INFO $s 서비스가 존재하지 않습니다.
	else
		status=$(grep -i 'disable' /etc/xinetd.d/$s | grep -i 'no' 2>/dev/null)
		if [[ -n $status ]]; then			
			VULN $s 서비스가 활성화 되어 있는 경우
		else
			OK $s 서비스가 비활성화 되어 있는 경우
		fi
	fi
done
