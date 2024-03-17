#!/bin/bash
. function.sh

CODE [U-22]crond 파일 소유자 및 권한 설정

crontab=/usr/bin/crontab

if [ ! -e $crontab ]; then
	INFO cron 서비스를 사용하지 않습니다.
else
	FILE_CHK $crontab root 750 -le
	
	cron_services=("/etc/crontab" "/etc/cron.hourly" "/etc/cron.daily" "/etc/cron.weekly" "/etc/cron.monthly" "/var/spool/cron" "/var/spool/crontabs" "/etc/cron.allow" "/etc/cron.deny")
	for file in ${cron_services[@]}; do
		if [ -e $file ]; then
			FILE_CHK $file root 640 -le
		fi
	done
fi
