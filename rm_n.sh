#!/bin/bash

# Remove all files in a given directory whose size is larger than N bytes.
# Usage (printed to stderr if wrong): ./rm_n.sh <dir> <n>
# Notes:
#   - <dir> is a required argument: the target directory.
#   - <n>   is a required non-negative integer (bytes).
#   - Only files are removed (not directories).
#   - We use `find` with -type f and -size +Nc (c = bytes).

# --- usage helper: print to STDERR so it is for humans, not pipelines ---
usage() {
  echo "usage: $0 <dir> <n>" 1>&2
  echo "Remove files in <dir> larger than <n> bytes." 1>&2
  exit 1
}

# --- basic argument checks ---
[ $# -eq 2 ] || usage

DIR="$1"
N="$2"

# DIR must exist and be a directory
if [ ! -d "$DIR" ]; then
  echo "Error: '$DIR' is not a directory." 1>&2
  usage
fi

# N must be a non-negative integer
case "$N" in
  ''|*[!0-9]*) echo "Error: <n> must be a non-negative integer (bytes)." 1>&2; usage ;;
esac

# --- do the removal ---
# -type f : files only
# -size +Nc : strictly larger than N bytes (c means bytes)
# -print first for visibility, then delete
find "$DIR" -type f -size +"${N}"c -print -exec rm -f {} +

# Optional success message
# echo "Done."
