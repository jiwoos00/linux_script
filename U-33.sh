#!/bin/bash
. function.sh

CODE [U-33]DNS 보안 버전 패치

dns=$(ps -ef | grep named | grep -v grep)
if [[ -z $dns ]]; then
	OK DNS 서비스를 사용하지 않는 경우
else
	version=$(named -v)
	INFO DNS 서비스를 사용 중입니다.
	VULN $version
	VULN BIND 버전 확인 후 최신버전으로 업데이트하세요.
fi

