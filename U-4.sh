#!/bin/bash

. function.sh
CODE [U-04]패스워드 파일 보호

SHADOW_FILE=/etc/shadow
PASSWD_FILE=/etc/passwd

if [ -e $PASSWD_FILE ]; then
  enc_pass=$(grep "^root" $PASSWD_FILE | awk -F: '{print $2}')
  
  if [ $enc_pass = "x" ]; then
    if [ -e $SHADOW_FILE ]; then
      shadow_pass=$(grep "^root" $SHADOW_FILE | awk -F: '{print $2}')
        if [ $shadow_pass != "" ]; then
          OK 쉐도우 패스워드를 사용하거나, 패스워드를 암호화하여 저장하는 경우
        else
          VULN 쉐도우 패스워드 사용하지 않음
        fi
    else
      VULN $SHADOW_FILE 파일이 존재하지 않습니다.
    fi

  else
    VULN 패스워드 암호화하지 않음
  fi
  
else
  INFO $PASSWD_FILE 파일이 존재하지 않습니다.
fi
