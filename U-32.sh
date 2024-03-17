#!/bin/bash
. function.sh

CODE [U-32]일반사용자의 Sendmail 실행 방지

service=$(ps -ef | grep sendmail | grep -v "grep")
if [[ -z $service ]]; then
	OK SMTP 서비스 미사용
else 
	q_option=$(grep -v '^ *#' /etc/mail/sendmail.cf | grep PrivacyOptions | grep restrictqrun)
	if [[ -n $q_option ]]; then
		OK 일반 사용자의 Sendmail 실행 방지가 설정된 경우
	else
		VULN SMTP 서비스 사용 및 일반 사용자의 Sendmail 실행 방지가 설정되어 있지 않은 경우
	fi
fi
