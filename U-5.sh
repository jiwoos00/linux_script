#!/bin/bash

. function.sh
CODE [U-05]root홈, 패스 디렉터리 권한 및 패스 설정

if [ $(id -u) -ne 0 ]; then
  VULN root계정이 아닌 일반계정에서 실행중입니다.
fi

path_var=$(echo $PATH)
if [[ $path_var == ^'::' || $path_var == ^'\.' || $path_var == ':\.:' ]]; then
  VULN PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되어 있는 경우
else
  OK PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되지 않은 경우

fi

