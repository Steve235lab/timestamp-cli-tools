#!/bin/bash

# If -h or --help is passed as an argument, display the usage of the script
if [[ $1 = "-h" ]] || [[ $1 = "--help" ]]; then
  echo -e "Usage: ./date2timestamp.sh <input>"
  echo -e "<input>   A string representing date and time in the following formats: yyyymmdd, yyyymmddhhmmss, or yyyy-mm-dd hh:mm:ss"
  exit 0
fi

if (($# > 1)); then
  echo "Usage: ./date2timestamp.sh <input>"
  echo "<input> should be a string representing date and time in the following format: yyyymmdd, yyyymmddhhmmss, or yyyy-mm-dd hh:mm:ss"
  exit 1
fi

if [ -z "$1" ]; then
  echo "UNIX timestamp: $(date +%s)"
else
  if [[ $1 =~ ^[0-9]{8}$ ]]; then
    date_arg="$1"000000
    if ! date -j -f "%Y%m%d" "$1" >/dev/null 2>&1; then
      echo "Invalid date."
      exit 1
    fi
    date_convert=$(date -j -f "%Y%m%d%H%M%S" "$date_arg" +%s)
  elif [[ $1 =~ ^[0-9]{14}$ ]]; then
    date_arg="$1"
    if ! date -j -f "%Y%m%d%H%M%S" "$date_arg" >/dev/null 2>&1; then
      echo "Invalid date."
      exit 1
    fi
    date_convert=$(date -j -f "%Y%m%d%H%M%S" "$date_arg" +%s)
  elif [[ "$1" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]][0-9]{2}:[0-9]{2}:[0-9]{2}$ ]]; then
    date_arg="${1:0:4}${1:5:2}${1:8:2}"
    if ! date -j -f "%Y%m%d" "$date_arg" >/dev/null 2>&1; then
      echo "Invalid date."
      exit 1
    fi
    date_convert=$(date -j -f "%Y%m%d%H%M%S" "${1:0:4}${1:5:2}${1:8:2}${1:11:2}${1:14:2}${1:17:2}" +%s)
  else
    echo "Usage: ./date2timestamp.sh <input>"
    echo "<input> should be a string representing date and time in the following format: yyyymmdd, yyyymmddhhmmss, or yyyy-mm-dd hh:mm:ss"
    exit 1
  fi
  echo "UNIX timestamp: $date_convert"
fi
