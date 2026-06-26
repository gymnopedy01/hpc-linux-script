#!/bin/bash

name="global"

change_name() {
    local name="local"
    echo "Inside function: $name"
}

change_name

echo "Outside function: $name"