#!/bin/bash

# This script creates a directory called "five".
# Inside "five", it makes five subdirectories: dir1 ... dir5.
# In each subdirectory, it makes four files: file1 ... file4.
# Each fileN contains N lines, and each line has the digit N.

# Create the main directory "five"
mkdir five

# Outer loop: create subdirectories dir1 ... dir5
for i in {1..5}; do
    subdir="five/dir$i"
    mkdir "$subdir"

    # Inner loop: create files file1 ... file4 inside each subdirectory
    for j in {1..4}; do
        file="$subdir/file$j"

        # Write digit j into file j times
        # Example: file2 → two lines with "2"
        for k in $(seq 1 $j); do
            echo "$j" >> "$file"
        done
    done
done

echo "Created directory structure under ./five"
