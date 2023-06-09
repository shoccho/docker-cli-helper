#!/bin/bash

interactive=false

if [[ $# -le 0 ]]; then

	interactive=true
	
else
	while [[ $# -gt 0 ]]; do
		flag="$1"
		case $flag in
		-di)
			docker rmi $(docker images | tail -n +2 | awk '{ print $3}')
			;;
		-li)
			echo "$(docker images | tail -n +2)"
			;;
		-dc)
			docker rm $(docker ps -a | tail -n +2 | awk ' { print $1 }')
			;;
		-lc)
			echo "$(docker ps -a)"
			;;
		*)
			echo "Unknown args passed $flag"
			interactive=true
			;;
		esac
		shift
	done
fi

if [ "$interactive" = true ]; then

	echo "Docker cli helper"

	while [ true ]; do
		echo "Chose an option"

		echo "1. List local docker images"
		echo "2. List running docker containers"
		echo "3. List all docker containers"
		echo "4. Stop a docker container"
		echo "5. Delete a docker container"
		echo "6. Delete a docker image"
		echo "7. Delete all docker containers"
		echo "8. Delete all docker images"
		echo "0. Exit"
		echo ""

		read -p "type 1,2,3.... and press enter  " opt

		if [[ $opt -eq 1 ]]; then
			echo "1. List local docker images"
			echo "$(docker images)"
		elif [[ $opt -eq 2 ]]; then
			echo "2. List running docker containers"
			echo "$(docker ps)"
		elif [[ $opt -eq 3 ]]; then
			echo "3. List all docker containers"
			echo "$(docker ps -a)"
		elif [[ $opt -eq 4 ]]; then
			echo "4. Stop a docker container"
			read -p "container id? " cid
			docker kill $cid
		elif [[ $opt -eq 5 ]]; then
			echo "5. Delete a docker container"
			docker ps -a
			read -p "container id? " cid
			docker rm $cid
		elif [[ $opt -eq 6 ]]; then
			echo "6. Delete a docker image"
			echo "$(docker images)"
			read -p "image id? " iid
			docker rmi $iid
		elif [[ $opt -eq 7 ]]; then
			echo "7. Delete all docker containers"
			docker rm $(docker ps -a | tail -n +2 | awk ' { print $1 }')
		elif [[ $opt -eq 8 ]]; then
			echo "8. Delete all docker images"
			docker rmi $(docker images | tail -n +2 | awk '{ print $3}')
		elif [[ $opt -eq 0 ]]; then
			exit 0
		else
			echo "wrong input"
		fi
		read -p "Press any key to continue..."
	done
else
	exit 0
fi
