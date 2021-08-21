#!/bin/bash

function LOG()
{
	logType=$1
	loginfo=$2

	if [ $1 = "err" ];then
		echo -e "\033[1;38;41m ERROR \033[0m $2"
	elif [ $1 = "info" ];then
		echo -e "\033[1m INFO \033[0m $2"
	fi
}

