#!/bin/bash

check_httpd() {
    systemctl is-active --quiet httpd
}

check_httpd

echo "종류 상태값: $?"