#!/bin/bash

A=10
B=4

RESULT=$(echo "scale=2; $A / $B" | bc)

echo "Result of $A / $B = $RESULT"