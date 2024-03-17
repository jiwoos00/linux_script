#!/bin/bash
. function.sh

CODE [U-34]DNS Zone Transfer 설정

dns=$(ps -ef | grep named | grep -v grep)
zone_transfer=$(cat /etc/named.conf | grep 'allow-transfer')

if [[ -z $dns ]]; then
	OK DNS 서비스를 사용 중이 아닙니다.
else
	INFO DNS 서비스를 사용 중입니다.
	
	if [[ -z $zone_transfer ]]; then
		VULN DNS 서비스를 사용하며 Zone Transfer를 모든 사용자에게 허용한 경우
	else
		INFO $zone_transfer
		INFO Zone Transfer를 허가된 사용자에게만 허용하였는지 확인하세요.
	fi
fi
