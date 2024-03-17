#!/bin/bash
. function.sh

CODE [U-28]NIS, NIS+ 점검
status=$(ps -ef | grep "ypserv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated" | grep -v grep)

INFO 'ypserv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated 서비스 구동 확인'
if [[ -n $status ]]; then
	VULN NIS 서비스가 활성화 되어 있는 경우
else
	OK NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우
fi
	


