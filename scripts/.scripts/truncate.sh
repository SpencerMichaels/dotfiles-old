#!/bin/bash
# Usage: echo str | truncate len

echo $(cat) | awk -v len=$1 '{ if (length($0) > len) print substr($0, 1, len-1) "…"; else print; }'
