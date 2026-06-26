#!/bin/bash

TARGET="/"
WARN_LIMIT=80
CRIT_LIMIT=90

DISK_USAGE=$(df -h "$TARGET" | awk 'NR==2 {print $5}' | tr -d '%')

echo "대상 파일시스템: $TARGET"
echo "현재 사용률: $DISK_USAGE%"

if [ "$DISK_USAGE" -ge "$CRIT_LIMIT" ]; then
    echo "상태: CRITICAL"
elif [ "$DISK_USAGE" -ge "$WARN_LIMIT" ]; then
    echo "상태: WARNING"
else
    echo "상태: OK"
fi