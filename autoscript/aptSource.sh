#!/bin/bash

source $g_envPakDir/autoscript/log.sh

Ver="error"

function detecSysType(){
	sysType=$(cat /etc/issue | tr 'A-Z' 'a-z' | grep 'ubuntu')
	if [ -z "$sysType" ]
	then
		LOG err "not Ubuntu system!"
	fi
}

function detecSysVer(){
	if [ ! -z "$(cat /etc/issue | grep "20.04")" ]; then
		Ver="20.04"
	elif [ ! -z $(cat /etc/issue | grep "18.04") ]; then
		Ver="18.04"
	else
		exit 1
	fi
}

function source18(){
	LOG info "system is Ubuntu 18.04, change source to aliMirrors!"
	cat > $g_envPakDir/sourceTmp.tmp << sour
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

sour
	sudo rm -rf /etc/apt/sources.list
	sudo cp $g_envPakDir/sourceTmp.tmp /etc/apt/sources.list
}

function source20(){
	LOG info "system is Ubuntu 20.04,change source to aliMirrors!"
	cat > $g_envPakDir/sourceTmp.tmp << sour 
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
sour
	sudo rm -rf /etc/apt/sources.list
	sudo cp $g_envPakDir/sourceTmp.tmp /etc/apt/sources.list

}

function changeSource(){
	detecSysType
	detecSysVer
	if [ $? -ne 0 ];then
		LOG err "Error Ubuntu Version!"
		exit 1
	else
		sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
	fi

	if [ $Ver == "20.04" ];
	then
		source20	
	elif [ $Ver == "18.04" ]; then
		source18
	fi
	if [ $? -ne 0 ]; then
		rm -rf $g_envPakDir/*.tmp > /dev/null
		exit 1
	fi
	rm -rf $g_envPakDir/*.tmp > /dev/null
}


