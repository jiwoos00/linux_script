#!/bin/bash
. function.sh

CODE [U-03]계정 잠금 임계값 설정
PAM_FILE=/etc/pam.d/system-auth

if [ -f $PAM_FILE ]; then
	if ! grep -q "^auth[[:space:]]*required[[:space:]]*pam_tally2.so[[:space:]]*deny=[[:digit:]]*[[:space:]]unlock_time=[[:digit:]]*[[:space:]]no_magic_root" $PAM_FILE; then
		VULN 계정 잠금 임계값이 설정되어 있지 않은 경우
	else
		DENY_CNT=$(grep -oP "^auth[[:space:]]*required[[:space:]]*pam_tally2.so[[:space:]]*deny=\K[[:digit:]]+" $PAM_FILE)
		UNLOCK_TIME=$(grep -oP "^auth[[:space:]]*required[[:space:]]*pam_tally2.so[[:space:]]*deny=[[:digit:]]*[[:space:]]unlock_time=\K[[:digit:]]+" $PAM_FILE)

		if [ $DENY_CNT -le 10 ]; then
			OK 계정 잠금 임계값이 10회 이하의 값으로 설정되어 있는 경우
		else
			VULN 계정 잠금 임계값이 10회 이하의 값으로 설정되지 않은 경우
		fi
	fi

else
	VULN $PAM_FILE 파일이 존재하지 않습니다.
fi
