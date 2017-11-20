#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 传递两个文本文件路径给脚本;输出两个文件中空行数较多的文件名字及其空行的个数;输出两个文件中总行数较多的文件名字及其总行数
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
FILE_A="$1"
FILE_B="$2"


#----------------Main----------------
FILE_A_BLANK_LINE=`grep '^$' | wc -l`
FILE_B_BLANK_LINE=$(cat "${FILE_B}" | grep '^$' | wc -l)

if test ${FILE_A_BLANK_LINE} -gt ${FILE_B_BLANK_LINE}; then
    echo $(basename "${FILE_A}") "${FILE_A_BLANK_LINE}"
else
    echo $(basename "${FILE_B}") "${FILE_B_BLANK_LINE}"
fi

FILE_A_ALL_LINE=$(cat "${FILE_A}" | wc -l)
FILE_B_ALL_LINE=$(cat "${FILE_B}" | wc -l)

if test ${FILE_A_ALL_LINE} -gt ${FILE_B_ALL_LINE}; then
    echo $(basename "${FILE_A}") "${FILE_A_ALL_LINE}"
else
    echo $(basename "${FILE_B}") "${FILE_B_ALL_LINE}"
fi

FILE_A_BLANK_LINE=$(sed -n '/^$/p' "${FILE_A}" | wc -l)
#FILE_B_BLANK_LINE=$(sed -n '/^$/p' "${FILE_B}" | wc -l)

FILE_A_BLANK_LINE=$(awk '{if($0=="") print}' "${FILE_A}" | wc -l)
FILE_B_BLANK_LINE=$(awk '{if($0=="") print}' "${FILE_B}" | wc -l)




