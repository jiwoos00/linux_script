#!/bin/bash
. function.sh

CODE [U-14]사용자,시스템 시작파일 및 환경파일 소유자 및 권한 설정


own=$(whoami)
env_files=("~/.profile" "~/.kshrc" "~/.cshrc" "~/.bashrc" "~/.bash_profile" "~/.login" "~/.exrc" "~/.netrc")


for file in ${env_files[@]}; do
  file_path=$(eval echo $file)
  if [ -e $file_path ]; then
    owner=$(stat -c "%U" $file_path)
    permissions=$(stat -c "%A" $file_path)

    if [[ $owenr == "root" || $owner == $own ]] && [[ ${permissions:5:1} != "w" || ${permissions:8:1} != "w" ]]; then
      OK $file_path: 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되어 있고,홈 디렉터리 환경변수 파일에 root와 소유자만 쓰기 권한이 부여된 경우
    else
      VULN $file_path: 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되지 않고,홈 디렉터리 환경변수 파일에 root와 소유자 외에 쓰기 권한이 부여된 경우

    fi

  else
    INFO $file_path 파일이 존재하지 않습니다.
  fi
done
