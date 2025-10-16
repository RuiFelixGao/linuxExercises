#!/bin/bash

usage="usage: ./mean.sh <column> [file.csv]"

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "$usage" >&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin}  

cut -d',' -f"$column" "$file" | tail -n +2 | {

    sum=0
    count=0

    while read value; do
        if [[ "$value" =~ ^[0-9.+-]+$ ]]; then
            sum=$(echo "$sum + $value" | bc -l)
            count=$((count + 1))
        fi
    done

    if [ "$count" -gt 0 ]; then
        mean=$(echo "$sum / $count" | bc -l)
        echo "$mean"
    else
        echo "No numeric data found in column $column" >&2
        exit 1
    fi
}
