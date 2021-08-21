#!/bin/bash

export g_homeDir="~/"
export g_envPakDir=$(cd $(dirname $0);pwd)

source ./autoscript/aptSource.sh
source ./autoscript/log.sh

function checkEnv(){
	#检查有哪些软件没装
	# vim zsh tmux
	return 0
}

function initEnv(){
	# 更换软件源
	# func in ./autoscript/aptSource.sh
	changeSource 
	if [ $? -ne 0 ];then
		LOG err "fail to change apt source!"
		exit 1
	fi


}

function main(){
	#1.环境检查：
	checkEnv
	# 2.环境准备：源替换，软件包更新
	initEnv
	
}

main


