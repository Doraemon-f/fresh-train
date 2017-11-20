#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 分析网站日志，找出所有在一分钟请求次数超过60次的ip.
# Version Number: 1.00
# Language: bash shell
# Date: 2017-07-07  
# Author: shiyu.feng
# Email: shiyu.feng@qunar.com
# Execute: sudo -uwirelessdev ./.sh >> .log 2>&1 &
#-------------CopyRight--------------



#--------------Prepare---------------



#--------------Function--------------



#--------------Variable--------------
LOG="./sample_access.log"


#----------------Main----------------
awk '{split($4, a, ":"); print $1, a[2]":"a[3]}' "${LOG}" | sort | uniq -c | awk '{if($1 > 60) print $2}' | uniq