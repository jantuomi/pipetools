#!/bin/sh

set -e

if [ -z tools ]; then
    echo "Error: tools directory not found. Run this script from the root directory."
    exit 1
fi

cd tools

# read TARGET without newline after prompt
read -p "Install to? [default:/usr/local/bin] " TARGET

if [ -z "$TARGET" ]; then
    TARGET="/usr/local/bin"
fi
TARGET="$(eval echo "$TARGET")"

(set -x; mkdir -p "$TARGET")

for file in *; do
    (set -x; ln -s "$(realpath "$file")" "$TARGET/$file") || true
done
