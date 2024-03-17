#!/bin/bash
. function.sh

CODE [U-31]스팸 메일 릴레이 제한

service=$(ps -ef | grep sendmail | grep -v "grep")
if [[ -z $service ]]; then
	OK SMTP 서비스를 사용하지 않는 경우
else
	
	relaying_denied=$(cat /etc/mail/sendmail.cf | grep "^R$\*" | grep "Relaying denied")
	if [[ -n $relaying_denied ]]; then
		OK 릴레이 제한이 설정되어 있는 경우
	else
		VULN SMTP 서비스를 사용하며 릴레이 제한이 설정되어 있지 않은 경우
	fi
fi
