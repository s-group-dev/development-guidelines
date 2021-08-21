#! /usr/bin/env sh

# The current version to search for
version=$1

echo "Release notes for v${version}:"

# Get the line number containing version input
line=$(grep -n "\[v$version\]" CHANGELOG.md | cut -d : -f 1)

# Remove everything up to the line with version (heading ##)
without_header=$(tail -n +${line} < CHANGELOG.md)

# Current changelog block is only up to the next heading (##) line
body=$(printf "$without_header" | tail -n +2 | sed '/^## /q' | sed '$d')

# Make sure the directory exists
mkdir -p build/release/

printf "${body}"

# Print body into file, to be consumed by GitHub Actions
printf "${body}" > build/release/body.txt
