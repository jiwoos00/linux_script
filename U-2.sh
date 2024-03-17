#!/bin/bash
. function.sh

CODE [U-02]패스워드 복잡성 설정
PW_FILE=/etc/security/pwquality.conf

if [ -f "$PW_FILE" ]; then
	min_len=$(awk '/minlen/ {print $3}' "$PW_FILE")
	min_class=$(awk '/minclass/ {print $3}' "$PW_FILE")

	if [[ $min_len =~ ^[0-9]+$ ]] && [[ $min_class =~ ^[0-9]+$ ]] ; then
		if [ $min_len -ge 8 ] && [ $min_class -ge 3 ]; then
			OK 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우
		else
			VULN 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정되지 않은 경우
		fi
	else
		VULN $PW_FILE 파일 내 정책이 설정되지 않았습니다.
	fi
else
	INFO $PW_FILE 파일이 존재하지 않습니다.
fi 
