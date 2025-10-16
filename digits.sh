#!/bin/bash

# This script finds the sum of all numbers between 1000 and 2000 (inclusive)
# whose digits are only from the set {0,1}.

# Initialize sum variable
sum=0

# Loop through numbers from 1000 to 2000
for num in {1000..2000}; do
    # Check if the number contains only digits 0 or 1
    # ^[01]+$ means "string consisting only of 0 or 1, one or more times"
    if [[ $num =~ ^[01]+$ ]]; then
        # If it matches, add it to the running sum
        sum=$((sum + num))
    fi
done

# Print the final result
echo "The sum is: $sum"
