#!/bin/bash
# school.sh - find average TotalAssessedValue for "MADISON SCHOOLS" district

cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d',' -f7 | \
{
  sum=0
  count=0
  while read value; do
    if [[ "$value" =~ ^[0-9]+$ ]]; then
      sum=$((sum + value))
      count=$((count + 1))
    fi
  done
  echo "Average TotalAssessedValue for MADISON SCHOOLS: $((sum / count))"
}
