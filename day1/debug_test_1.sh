#!/bin/bash

SERVICE_NAME="httpd"

if systemctl is-active --quiet "$SERVICE_NAME"
then
	echo "$SERVICE_NAME 서비스가 실행 중입니다."
else
	echo "$SERVICE_NAME 서비스가 실행 중이 아닙니다."
fi
