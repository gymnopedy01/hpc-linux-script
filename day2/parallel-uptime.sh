#!/bin/bash

LOG_DIR="./logs_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$LOG_DIR"

while read node; 
do
    {
        echo "===== $node 상태확인 ====="
        if ssh -n "$node" uptime > "$LOG_DIR/$node.out" 2> "$LOG_DIR/$node.err"
        then
            echo "OK"> "$LOG_DIR/$node.status"            
            echo "===== $node 성공 ====="
        else
            rc=$?
            echo "FAIL:$rc"> "$LOG_DIR/$node.status"
            echo "===== $node 실패 rc=$rc ====="
        fi
    } &
done < server_list.txt

wait 

echo

echo "===== 실행 결과 요약 ====="

for status_file in "$LOG_DIR"/*.status;
do
    node=$(basename "$status_file" .status)
    status=$(cat "$status_file")
    echo "$node: $status"
done