#!/bin/bash

export g_homeDir="~/"
export g_envPakDir=$(cd $(dirname $0);pwd)

source ./autoscript/aptSource.sh

function initEnv(){
	changeSource
}

function main(){
	initEnv
}

main


