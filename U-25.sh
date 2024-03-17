#!/bin/bash
. function.sh

CODE [U-25]NFS 접근 통제

if systemctl -q is-active nfs-server; then
	
	share=$(exportfs -v | grep everyone)
	if [[ -n $share ]]; then
		VULN 불필요한 NFS 서비스를 사용하고 있고, everyone 공유를 제한하지 않은 경우
	else
		VULN 불필요한 NFS 서비스를 사용하고 있는 경우	
	fi
else
	OK  불필요한 NFS 서비스를 사용하지 않거나, 불가피하게 사용 시 everyone 공유를 제한한 경우
fi
