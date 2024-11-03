#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: ./finder.sh <directory> <search_string>"
  echo " - <directory>: Path to the directory to search in."
  echo " - <search_string>: Text string to search for within files."
  echo "Example: ./finder.sh /tmp/aesd/assignment1 linux"
  exit 0
fi

if [ "$#" -ne 2 ]; then
  echo "Error enter two arguement or enter --help"
  exit 1
fi

filesdir=$1
searchstring=$2

if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir is not a valid directory"
  exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)
match=$(grep -r "$searchstring" "$filesdir" | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match"
