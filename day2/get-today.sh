#!/bin/bash

get_today() {
    date +%F
}

today=$(get_today)

echo -n "오늘날짜: "
echo "$today"