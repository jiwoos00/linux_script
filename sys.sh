#!/bin/bash

. function.sh
CHK_ERR=error.log
>$CHK_ERR
RESULT=result.log
>$RESULT

Banner
for u_num in `seq 1 41`; do
  . U-$u_num.sh
  if [ $? -ne 0 ] ; then 
    echo 'U-'$u_num' ERROR' >> $CHK_ERR
  fi
  SPACE
done
F_Banner

