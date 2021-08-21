#!/bin/bash

source $g_envPakDir/autoscript/log.sh

function detecSys(){
	sysType=$(cat /etc/issue | tr 'A-Z' 'a-z' | grep 'ubuntu')
	if [ -z "$sysType" ]
	then
		LOG err "not Ubuntu system!"
	fi
}

function changeSource(){
	detecSys
}
