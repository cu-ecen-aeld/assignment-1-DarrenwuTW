#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: ./writer.sh <directory> <content_string>"
  echo " - <directory>: Path to the directory."
  echo " - <content_string>: Text string to for files."
  echo "Example: ./writer.sh /tmp/aesd/assignment1 linux"
  exit 0
fi

if [ "$#" -ne 2 ]; then
  echo "Error enter two arguement or enter --help"
  exit 1
fi

writefile=$1
writestr=$2

if mkdir -p "$(dirname "$writefile")"; then
  if echo "$writestr" > "$writefile"; then
    echo "Successfully created file $writefile with content."
  else
    echo "Could not write to file $writefile"
    exit 1
  fi
else
  echo "Could not create directory for $writefile"
  exit 1
fi
