#!/bin/bash

echo "순차처리 시작"

for i in {1..5}
do
    echo "순차처리: $i 시작"
    sleep 3
    echo "순차처리: $i 완료"
done

echo "순차처리 완료"