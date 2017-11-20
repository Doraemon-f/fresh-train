#!/bin/bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 将指定目录下大于10K的文件转移到/tmp目录下. 提示: 可以使用find命令完成
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
URL="$1"
TARGET_PATH="./tmp/"

#----------------Main----------------
#while read line; do
#    echo -n -e "${LINE}" > xxx.tzt
#    cp "${LINE}" "${TARGET_PATH}"
#done <<< "$(find "${URL}" -size +10k)"

#find "${URL}" -size +10k -size -20k
read -p "input " path
if [ ! -d $path ]
then
echo "xxxx"
elif [ ! -x $path ]
then
echo "ssss"
else
while read line
do
echo $line
done <<< "$(find $path -size +10k)"
fi