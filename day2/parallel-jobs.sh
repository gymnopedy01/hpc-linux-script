#!/bin/bash

MAX_JOBS=4

for i in {1..10}
do
    {
        echo "작업 $i 시작"
        sleep 3
        echo "작업 $i 완료"
    } &
    
    while [ $(jobs -rp | wc -l) -ge $MAX_JOBS ]; do
        sleep 0.2
    done

done

wait

echo "모든 작업 완료"