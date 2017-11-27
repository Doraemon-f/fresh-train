#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 
# Version Number: 1.00
# Language: bash shell
# Date: 2017-11-24  
# Author: shiyu.feng
# Email: shiyu.feng@qunar.com
# Execute: sudo -uwirelessdev ./.sh >> .log 2>&1 &
#-------------CopyRight--------------



#--------------Prepare---------------



#--------------Function--------------
# $1 file path
# $2 directories
function calc_md5() {
    local OUTPUT_FILE=$1
    local DIRS=$2

    find ${DIRS} -type f | xargs md5 -r > "${OUTPUT_FILE}" # "${DIRS}" ${DIRS} 区别
}

# $1 file path
function group() {
    local MD5_FILE=$1
    cut -d " " -f 1 ${MD5_FILE} | sort | uniq -d | xargs -I code sh -c "echo '分组'; grep code ${MD5_FILE}; echo" # man手册 xargs
}
#--------------Variable--------------
FILE_NAME="md5.txt"
DIRS=$* # $0 $# $@ $* 区别


#----------------Main----------------
calc_md5 "${FILE_NAME}" "${DIRS}"

if [ $? -eq 0 ]; then
    group "${FILE_NAME}"
fi