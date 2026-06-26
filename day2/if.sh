#!/bin/bash

user="root"

if [ "$user" = "root" ]; then
	echo "관리자"
else
	echo "일반"
fi
