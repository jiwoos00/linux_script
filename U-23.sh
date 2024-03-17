#!/bin/bash
. function.sh

CODE [U-23]DoS 공격에 취약한 서비스 비활성화
SERVICE_DIS "echo discard daytime chargen ntp dns snmp"
