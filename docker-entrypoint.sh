#!/bin/bash
set -e

# read /app/conf/smppsim.env line by line, then eval it to recreate app/conf/smppsim.props file
while IFS= read -r line; do 
    if [[ $line == \#* ]]; then 
        echo "$line"; 
    else
        eval "echo \"$line\""; 
    fi; 
done < /app/conf/smppsim.env > /app/conf/smppsim.props

echo 'Starting Smppsimulator'
exec "$@"
