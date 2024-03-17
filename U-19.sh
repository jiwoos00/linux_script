#!/bin/bash
. function.sh

CODE [U-19]Finger 서비스 비활성화

finger_service=$(systemctl list-unit-files | grep "finger.socket")

if [[ -z $finger_service ]]; then
	INFO finger 서비스가 설치 되어 있지 않습니다.
else
	finger_status=$(systemctl is-active finger.socket)
        if [[ $finger_status = "active" ]]; then
		VULN Finger 서비스가 활성화 되어 있는 경우
	else
		OK Finger 서비스가 비활성화 되어 있는 경우
	fi
fi
