#!/bin/bash
. function.sh

CODE [U-01]root 계정 원격 접속 제한

SECURETTY=/etc/securetty
SSHD=/etc/ssh/sshd_config
ch=0

# telnet
if [ -f "$SECURETTY" ]; then
	grep ^pts $SECURETTY > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		ch=1
		VULN $SECURETTY 파일 내 pts/x 관련 설정이 존재합니다.
	fi
else
	INFO $SECURETTY 파일이 존재하지 않습니다.
fi

# ssh
if [ -f "$SSHD" ]; then
	grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config 
	if [ $? -eq 0 ]; then
		ch=1
		VULN $SSHD 파일 내 root 로그인 접속이 허용되어 있습니다.
	fi
else
	INFO $SSHD 파일이 존재하지 않습니다.
fi 


if [ $ch -eq 1 ]; then
	VULN 원격 터미널 사용 시 root 직접 접속을 허용한 경우
else
	OK 원격 터미널 서비스를 사용하지 않거나, 사용 시 root 직접 접속을 차단한 경우
fi
