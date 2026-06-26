#!/bin/bash

log_msg() {
    local msg="$1"
    echo "[$(date +%F\ %T)] $msg"
}

check_service() {
    local service_name="$1"
    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name : running."
        return 0
    else
        echo "$service_name : stopped."
        return 1
    fi
}

main() {
    local fail_count=0
    log_msg "Checking service status..."

    for svc in httpd sshd crond
    do
        if ! check_service "$svc"; then
            fail_count=$((fail_count + 1))
        fi
    done

    log_msg "Service status check completed."
    log_msg "Number of failed services: $fail_count"
}

main