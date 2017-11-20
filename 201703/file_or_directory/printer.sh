#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 如果某路径不存在，则将其创建为目录；否则显示其存在，并输出其是目录还是文件
# Version Number: 1.00
# Language: bash shell
# Date: 2017-07-05  
# Author: shiyu.feng
# Email: shiyu.feng@qunar.com
# Execute: sudo -uwirelessdev ./.sh >> .log 2>&1 &
#-------------CopyRight--------------



#--------------Prepare---------------



#--------------Function--------------



#--------------Variable--------------
MY_PATH="$1"


#----------------Main----------------
if [ -f "${MY_PATH}" ]; then
    echo "${MY_PATH} is a file"
elif [ -d "${MY_PATH}" ]; then
    echo "${MY_PATH} is a directory"
else
    echo "${MY_PATH} is not exists"
    mkdir -p "${MY_PATH}"
    if [ $? -eq 0 ]; then
        echo "directory created"
    fi
fi








if [[]]