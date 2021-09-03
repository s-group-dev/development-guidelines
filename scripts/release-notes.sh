#!/bin/bash
#
# Extract release notes for a given version
# from CHANGELOG.md to build/release/body.txt.
# For example, "release-notes.sh 1.0.0"

set -euo pipefail

# The current version to search for
version=$1

echo "Release notes for v${version}:"

# Get the line number containing version input
line=$(grep -n "\[v$version\]" CHANGELOG.md | cut -d : -f 1)

# Remove everything up to the line with version (heading ##)
without_header=$(tail -n +"${line}" < CHANGELOG.md)

# Current changelog block is only up to the next heading (##) line
body=$(printf "%s" "${without_header}" | tail -n +2 | sed '/^## /q' | sed '$d')

# Make sure the directory exists
mkdir -p build/release

printf "%s" "${body}"

# Print body into file, to be consumed by GitHub Actions
printf "%s" "${body}" > build/release/body.txt
