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
    log_msg "Checking service status..."

    for svc in httpd sshd crond
    do
        check_service "$svc"
    done

    log_msg "Service status check completed."
}

main