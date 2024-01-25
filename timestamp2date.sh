#!/bin/bash

# If -h or --help is passed as an argument, display the usage of the script
if [[ $1 = "-h" ]] || [[ $1 = "--help" ]]; then
    echo -e "Usage: ./timestamp2date.sh <input>"
    echo -e "<input>   a integer representing UNIX timestamp in unit of second or millisecond"
    exit 0
fi

# Check if no parameters were passed
if (($# != 1)); then
    echo -e "Usage: ./timestamp2date.sh <input>"
    echo -e "<input> should be a integer representing UNIX timestamp in unit of second or millisecond"
    exit 1
fi

# Check if parameter is a number
re="^[0-9]+([.][0-9]+)?$"
if ! [[ $1 =~ $re ]]; then
    echo "Error: Not a number" >&2
    exit 1
fi

timestamp=$1
if ((${#timestamp} > 10)); then
    # Its a millisecond timestamp
    timestamp=$(echo "$timestamp / 1000" | bc)
fi

# Convert to date
date -r $timestamp "+%Y-%m-%d %H:%M:%S"
