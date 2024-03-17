#!/bin/bash
. function.sh

CODE [U-27]RPC 서비스 확인
SERVICE_DIS "rpc-cmsd rpc-ttdbserverd sadmind rusersd walld sprayd rstatd rpc-nisd rexd rpc-pcnfsd rpc-statd rpc-ypupdated rpc-rquotad kcms_server cachefsd"
