#!/usr/bin/env bash

#-------------CopyRight--------------  
# Name: 
# Annotation: 使用crontab, 实现在工作日(周一到周五)，从早上10点到晚上七点，每个两小时提示休息。 注: Ubuntu桌面下可以使用notify-send 发送通知消息。
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



#----------------Main----------------
/usr/local/bin/terminal-notifier -message "Please have a rest" -title "Message"
