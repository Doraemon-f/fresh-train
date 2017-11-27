#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 
# Version Number: 1.00
# Language: bash shell
# Date: 2017-11-20  
# Author: shiyu.feng
# Email: shiyu.feng@qunar.com
# Execute: sudo -uwirelessdev ./.sh >> .log 2>&1 &
#-------------CopyRight--------------



#--------------Prepare---------------


#--------------Function--------------
# $1 domain
# $2 username
# $3 password
# $4 cookie file path
function login() { #函数
    local DOMAIN=$1 #local
    local USERNAME=$2
    local PASSWORD=$3
    local COOKIE_FILE=$4
    local API="/graduate/api/login" # 单引号与双引号的区别
    local PARAM="username=%s&password=%s"
    local DATA=$(printf "${PARAM}" "${USERNAME}" "${PASSWORD}")
    local HEADER="Content-Type: application/x-www-form-urlencoded"
    
    if [ ! -d "$(dirname ${COOKIE_FILE})" ]; then # if命令 basename&&dirname 绝对路径&相对路径 []&&test&&[[]]&&(()) 文件&&目录是否存在
        mkdir -p "${COOKIE_FILE}"
    fi
    touch "${COOKIE_FILE}"

    echo "====================LOGIN START===================="
    local JSON=$(curl -X POST -H "${HEADER}" -d "${DATA}" -c "${COOKIE_FILE}" "${DOMAIN}${API}") # curl命令 ``&&$()&&$[]
    local CODE=$(echo "${JSON}" | jq '.code')

    if [ ${CODE} -eq 0 ]; then # 判断结果 数字&&字符串比较-eq -ge -gt -le -lt -ne = != < > ASCII字母排序
        echo "登录成功"
    else
        echo "$(echo ${JSON} | jq '.data')"
        exit 1
    fi
}

# $1 domain
# $2 name
# $3 mobile
# $4 people num
# $5 cookie file path
function submit() {
    local DOMAIN=$1
    local NAME=$2
    local MOBILE=$3
    local PEOPLE_NUM=$4
    local COOKIE_FILE=$5
    local API="/graduate/api/submit"
    local PARAM="{'name': '%s', 'mobile': '%s', 'people_num': %d}"
    local DATA=$(printf "${PARAM}" "${NAME}" "${MOBILE}" ${PEOPLE_NUM})

    echo "====================SUBMIT START===================="
    local JSON=$(curl -X POST -H "Content-Type: application/json" -d "${DATA}" -b "${COOKIE_FILE}" "${DOMAIN}${API}")

    local CODE=$(echo ${JSON} | jq '.code')

    if [ ${CODE} -eq 0 ]; then
        echo "提交成功"
    else
        echo "$(echo ${JSON} | jq '.data')"
    fi
}
#--------------Variable--------------
DOMAIN="l-live1.support.wap.dev.cn0.qunar.com:7070"
USERNAME="graduate"
PASSWORD="graduate_password"
NAME="shiyu.feng"
MOBILE="18310420801"
PEOPLE_NUM=1
COOKIE_FILE="cookie.txt"

#----------------Main----------------
# 登录
login ${DOMAIN} ${USERNAME} ${PASSWORD} ${COOKIE_FILE}

# 判断登录是否成功
if [ $? -eq 0 ]; then
    # 提交
    submit ${DOMAIN} ${NAME} ${MOBILE} ${PEOPLE_NUM} ${COOKIE_FILE}
else
    echo "登录过程出现问题"
fi