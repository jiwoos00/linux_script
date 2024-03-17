function FILE_CHK(){
  file_name=$1
  correct_owner=$2
  correct_permissions=$3
  symbol=$4
  symbol2=""
  if [ $symbol == "-le" ]; then
    symbol2="이하"
  fi

  if [ -e $file_name ]; then
    actual_owner=$(stat -c %U $file_name)
    actual_permissions=$(stat -c %a $file_name)
    
    if [ $actual_owner == $correct_owner ] && [ $actual_permissions $symbol $correct_permissions ]; then
      OK $file_name파일의 소유자가 $correct_owner이고, 권한이 $correct_permissions $symbol2인 경우
    else
      VULN $file_name파일의 소유자가 $correct_owner가 아니거나, 권한이 $correct_permissions $symbol2가 아닌 경우
    fi 

  else
    INFO $file_name is not existed
  fi
}

function SERVICE_DIS(){
	services_to_disable=$1
  
	for service in ${services_to_disable[@]}; do
		if systemctl list-unit-files | grep -q $service; then
			if systemctl -q is-active $service; then
      				VULN $service 서비스가 활성화 되어 있는 경우
    			else
      				OK $service 서비스가 비활성화 되어 있는 경우
    			fi
		else
			INFO $service 서비스가 존재하지 않습니다
		fi
	done
}

function Banner(){
cat << EOF
--------------------------------------------------
	Linux CentOS 7 64-bit Shell Script
--------------------------------------------------
EOF
}



function F_Banner(){
cat << EOF
--------------------------------------------------
		    [ Finish ]	
--------------------------------------------------
EOF
}


OK(){
echo -e '\033[32m[양호] : '$*'\033[0m'
echo -e '\033[32m[양호] : '$*'\033[0m' >> $RESULT
}

VULN(){
echo -e '\033[31m[취약] : '$*'\033[0m'
echo -e '\033[31m[취약] : '$*'\033[0m' >> $RESULT
}

INFO(){
echo -e '\033[35m[정보] : '$*'\033[0m'
echo -e '\033[35m[정보] : '$*'\033[0m' >> $RESULT
}

CODE(){
echo -e '\033[34m'$*'\033[0m'
echo -e '\033[34m'$*'\033[0m'>> $RESULT
}

SPACE(){
echo -e ''
echo -e '' >> $RESULT
}
